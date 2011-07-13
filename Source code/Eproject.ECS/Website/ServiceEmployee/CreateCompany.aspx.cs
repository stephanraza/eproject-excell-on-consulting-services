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

public partial class ServiceEmployee_CreateCompany : System.Web.UI.Page
{
    CompanyBLL companyBll = new CompanyBLL();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected Company GetDataForm()
    {
        Company company = new Company();
        if (!string.IsNullOrEmpty(txtName.Text))
        {
            company.Company_Name = txtName.Text;
        }
        else
        {
            return null;
        }
        company.Company_Phone = txtPhoneNumber.Text;
        company.Company_Email = txtEmail.Text;
        company.Company_Address = txtAddress.Text;
        company.Company_Description = txtDescription.Text;
        string filePath = "";
        System.Drawing.Image image;
        if (fuLogo.HasFile)
        {
            image = System.Drawing.Image.FromStream(fuLogo.PostedFile.InputStream);
        }
        else
        {
            filePath = WebHelper.Instance.GetWebsitePath(Server.MapPath("")) + "App_Themes/images/other/no_image.png";
            image = System.Drawing.Image.FromFile(filePath);
        }
        String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
        company.Company_Logo = data;
        return company;
    }

    protected void ResetForm()
    {
        txtName.Text = "";
        txtPhoneNumber.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";
        txtDescription.Text = "";
    }

    private void PreviewForm(Company company)
    {
        ltrName.Text = company.Company_Name;
        ltrPhone.Text = company.Company_Phone;
        ltrAddress.Text = company.Company_Address;
        ltrEmail.Text = company.Company_Email;
        ltrDescription.Text = company.Company_Description;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (GetDataForm() == null)
        {
            pnlRed.Visible = true;
            lblError.Text = "Please check data.";
            return;
        }

        Company entity = GetDataForm();

        if (companyBll.Company_CheckName(entity.Company_Name))
        {
            pnlRed.Visible = true;
            lblError.Text = "Company name early exists.";
            return;
        }
        if (companyBll.Company_CheckEmail(entity.Company_Email))
        {
            pnlRed.Visible = true;
            lblError.Text = "Company email early exists.";
            return;
        }
        if (companyBll.Company_Insert(entity) == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }
        pnlRed.Visible = false;
        pnlGreen.Visible = true;
        lblSuccess.Text = "Create new a dealer successfully!";
        pnlPreviewCustomer.Visible = true;
        PreviewForm(entity);
        ResetForm();
    }
}
