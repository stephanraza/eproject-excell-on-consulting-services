using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Eproject.ECS.Bll;
using Eproject.ECS.Entities;

public partial class ServiceEmployee_CreateProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataToDropdownList();
            LoadPreview();
        }
    }

    CategoryBLL categoryBll = new CategoryBLL();
    CompanyBLL companyBll = new CompanyBLL();
    ProductBLL productBll = new ProductBLL();

    protected void BindDataToDropdownList()
    {
        DataTable table = categoryBll.Category_ShowAllDisplay();
        ddlCategory.Items.Clear();
        ListItem items = new ListItem();
        items.Text = "New category";
        items.Value = "0";
        ddlCategory.Items.Add(items);
        for (int i = 0; i < table.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = table.Rows[i]["Category_Name"].ToString();
            item.Value = table.Rows[i]["Category_Id"].ToString();
            ddlCategory.Items.Add(item);
        }

        DataTable dataTable = companyBll.Company_ShowAllDisplay();
        ddlCompany.Items.Clear();
        // ddlCategory.Items.Add("New category");
        for (int i = 0; i < dataTable.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = dataTable.Rows[i]["Company_Name"].ToString();
            item.Value = dataTable.Rows[i]["Company_Id"].ToString();
            ddlCompany.Items.Add(item);
        }
        ddlCategory.SelectedIndex = 1;
        txtCategory.Visible = false;
    }

    protected void ResetForm()
    {
        txtCategory.Text = "";
        txtProductPrice.Text = "";
        txtManufactureDate.Text = "";
        txtExpiryDate.Text = "";
        txtDescription.Text = "";
        BindDataToDropdownList();
    }

    private Product CreateProduct()
    {
        Product product = new Product();
        if (string.IsNullOrEmpty(ddlCompany.SelectedValue))
        {
            pnlRed.Visible = true;
            lblError.Text = "Company name is null.";
            return null;
        }
        product.Company_Id = new Guid(ddlCompany.SelectedValue);
        if (string.IsNullOrEmpty(txtProductName.Text))
        {
            pnlRed.Visible = true;
            lblError.Text = "product name is null.";
            return null;
        }
        product.Product_Name = txtProductName.Text;
        if (string.IsNullOrEmpty(txtProductPrice.Text))
        {
            pnlRed.Visible = true;
            lblError.Text = "product price is null.";
            return null;
        }
        product.Product_Price = txtProductPrice.Text;
        if (string.IsNullOrEmpty(ddlProductType.Text))
        {
            pnlRed.Visible = true;
            lblError.Text = "product type is null.";
            return null;
        }
        product.Product_Type = ddlProductType.SelectedValue;
        if (!string.IsNullOrEmpty(txtManufactureDate.Text))
        {
            product.Product_ManufactureDate = DateTime.Parse(txtManufactureDate.Text);
        }
        else
        {
            product.Product_ManufactureDate = DateTime.Now;
        }
        if (!string.IsNullOrEmpty(txtExpiryDate.Text))
        {
            product.Product_ExpiryDate = DateTime.Parse(txtExpiryDate.Text);
        }
        else
        {
            product.Product_ExpiryDate = DateTime.Now;
        }
        product.Product_Description = txtDescription.Text;

        string filePath = "";
        System.Drawing.Image image;
        if (fuImage.HasFile)
        {
            image = System.Drawing.Image.FromStream(fuImage.PostedFile.InputStream);
        }
        else
        {
            filePath = WebHelper.Instance.GetWebsitePath(Server.MapPath("")) + "App_Themes/images/other/no_image.png";
            image = System.Drawing.Image.FromFile(filePath);
        }
        String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
        product.Product_Image = data;
        return product;
    }

    protected void GetDataForm()
    {
        if (ddlCategory.SelectedValue == "0")
        {
            txtCategory.Visible = true;
            Category category = new Category();
            if (string.IsNullOrEmpty(txtCategory.Text))
            {
                pnlRed.Visible = true;
                lblError.Text = "Category is null.";
                return;
            }
            category.Category_Id = Guid.NewGuid();
            category.Category_Name = txtCategory.Text;
            if (categoryBll.Category_CheckName(category.Category_Name))
            {
                pnlRed.Visible = false;
                pnlRed.Visible = true;
                lblError.Text = "This category name have already used..";
                return;
            }
            if (!categoryBll.Category_Insert(category))
            {
                pnlRed.Visible = false;
                pnlRed.Visible = true;
                lblError.Text = "Do not success category.";
                return;
            }
            Product product = CreateProduct();

            product.Category_Id = category.Category_Id;
            if (!productBll.Product_Insert(product))
            {
                pnlGreen.Visible = false;
                pnlRed.Visible = true;
                lblError.Text = "Do not success.";
                return;
            }
            pnlRed.Visible = false;
            pnlGreen.Visible = true;
            lblSuccess.Text = "Have a Success";
            return;
        }
        else
        {
            Product product = CreateProduct();
            if (string.IsNullOrEmpty(ddlCategory.SelectedValue))
            {
                pnlRed.Visible = true;
                lblError.Text = "category name is null.";
                return;
            }
            product.Category_Id = new Guid(ddlCategory.SelectedValue);
            if (!productBll.Product_Insert(product))
            {
                pnlGreen.Visible = false;
                pnlRed.Visible = true;
                lblError.Text = "Do not success.";
                return;
            }
            pnlGreen.Visible = true;
            pnlRed.Visible = false;
            lblSuccess.Text = "Have a Success";
            return;
        }
    }

    protected void LoadPreview()
    {
        string id = ddlCategory.SelectedValue;
        DataRow row = categoryBll.Category_ShowOnewDisplay(id);
        ltrName.Text = row["Category_Name"].ToString();
        ltrPhone.Text = "No";
        ltrAddress.Text = "No";
        string idcom = ddlCompany.SelectedValue;
        DataRow rows = companyBll.Company_ShowOnewDisplay(idcom);
        ltrNameCom.Text = rows["Company_Name"].ToString();
        ltrPhoneCom.Text = rows["Company_Phone"].ToString();
        ltrAddressCom.Text = rows["Company_Address"].ToString();
        pnlPreviewCustomer.Visible = true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GetDataForm();
        ResetForm();
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCategory.SelectedValue == "0")
        {
            txtCategory.Visible = true;
            ltrName.Text = "No";
            ltrPhone.Text = "No";
            ltrAddress.Text = "No";
        }
        else
        {
            txtCategory.Visible = false;
            string id = ddlCategory.SelectedValue;
            DataRow row = categoryBll.Category_ShowOnewDisplay(id);
            ltrName.Text = row["Category_Name"].ToString();
            ltrPhone.Text = "No";
            ltrAddress.Text = "No";
            pnlPreviewCustomer.Visible = true;
        }

    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idcom = ddlCompany.SelectedValue;
        DataRow rows = companyBll.Company_ShowOnewDisplay(idcom);
        ltrNameCom.Text = rows["Company_Name"].ToString();
        ltrPhoneCom.Text = rows["Company_Phone"].ToString();
        ltrAddressCom.Text = rows["Company_Address"].ToString();
        pnlPreviewCustomer.Visible = true;
    }
}
