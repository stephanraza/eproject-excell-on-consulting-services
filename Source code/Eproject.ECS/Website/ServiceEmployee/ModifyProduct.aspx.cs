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

public partial class ServiceEmployee_ModifyProduct : System.Web.UI.Page
{
    ProductBLL productBll = new ProductBLL();
    CategoryBLL categoryBll = new CategoryBLL();
    CompanyBLL companyBll = new CompanyBLL();
    private DataRow dataRow;
    protected void Page_Load(object sender, EventArgs e)
    {

        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["id"] != null)
            {
                String id = RouteCollectionExtensions.RouteData.Values["id"] as String;
                if (string.IsNullOrEmpty(id))
                {
                    Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Product/Manage/null");
                }
                else
                {
                    dataRow = productBll.Product_ShowOnewDisplay(id);
                    if (dataRow == null)
                    {
                        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Product/Manage/null");
                    }
                    else
                    {
                        if (!IsPostBack)
                        {
                            BindDataToDropdownList();
                            FillData(dataRow);
                        }

                    }
                }
            }
            else
            {
                Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Product/Manage/null");
            }
        }
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);

    }
    protected void BindDataToDropdownList()
    {
        DataTable table = categoryBll.Category_ShowAllDisplay();
        ddlCategory.Items.Clear();
        ddlCategory.Items.Add(new ListItem("Choose Name", "0"));
        for (int i = 0; i < table.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = table.Rows[i]["Category_Name"].ToString();
            item.Value = table.Rows[i]["Category_Id"].ToString();
            ddlCategory.Items.Add(item);
        }

        DataTable dataTable = companyBll.Company_ShowAllDisplay("");
        ddlCompany.Items.Clear();
        ddlCompany.Items.Add(new ListItem("Choose Name", "0"));
        for (int i = 0; i < dataTable.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = dataTable.Rows[i]["Company_Name"].ToString();
            item.Value = dataTable.Rows[i]["Company_Id"].ToString();
            ddlCompany.Items.Add(item);
        }
    }

    private void FillData(DataRow dataRow)
    {

        //String urlCompany = "";
        //if (string.IsNullOrEmpty(dataRow["Product_Image"].ToString()))
        //    urlCompany = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
        //else
        //    urlCompany = WebHelper.Instance.GetImageURL(dataRow["Company_Logo"].ToString(), 128, 128, false);

        ddlCategory.SelectedValue = dataRow["Category_Id"].ToString();
        ddlCompany.SelectedValue = dataRow["Company_Id"].ToString();
        txtProductPrice.Text = dataRow["Product_Price"].ToString();
        txtProductName.Text = dataRow["Product_Name"].ToString();
        txtManufactureDate.Text = dataRow["Product_ManufactureDate"].ToString();
        txtExpiryDate.Text = dataRow["Product_ExpiryDate"].ToString();
        txtDescription.Text = dataRow["Product_Description"].ToString();
        ddlProductType.SelectedValue = dataRow["Product_Type"].ToString();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ProductID = dataRow["Product_Id"].ToString();
        DataRow rows = productBll.Product_ShowOnewDisplay(ProductID);
        Product product = new Product();
        product.Product_Id = new Guid(rows["Product_Id"].ToString());
        product.Category_Id = new Guid(ddlCategory.SelectedValue);
        product.Company_Id = new Guid(ddlCompany.SelectedValue);
        product.Product_Description = txtDescription.Text;
        product.Product_ExpiryDate = DateTime.Parse(txtExpiryDate.Text);
        product.Product_ManufactureDate = DateTime.Parse(txtManufactureDate.Text);                
        product.Product_Name = txtProductName.Text;
        product.Product_Price = txtProductPrice.Text;
        product.Product_Type = ddlProductType.SelectedValue;
          string filePath = "";
        System.Drawing.Image image;
        if (fuImage.HasFile)
        {
            image = System.Drawing.Image.FromStream(fuImage.PostedFile.InputStream);
        }
        else
        {
            filePath = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
            image = System.Drawing.Image.FromFile(filePath);
        }
        String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
        product.Product_Image = data;
        if (productBll.Product_Update(product)<1)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }
        pnlRed.Visible = false;
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Product/Manage/success");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Product/Manage/null");
    }
}
