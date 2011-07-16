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

public partial class ServiceEmployee_ModifyCompany : System.Web.UI.Page
{
    CompanyBLL companyBll = new CompanyBLL();
    private DataRow dataRow;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["id"] != null)
            {
                String id = RouteCollectionExtensions.RouteData.Values["id"] as String;
                if (string.IsNullOrEmpty(id))
                {
                    Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Manage/null");
                }
                else
                {
                    dataRow = companyBll.Company_ShowOnewDisplay(id);
                    if (dataRow == null)
                    {
                        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Manage/null");
                    }
                    else
                    {
                        if (!IsPostBack)
                        {
                            FillData(dataRow);
                        }

                    }
                }
            }
            else
            {
                Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Manage/null");
            }
        }
    }

    private void FillData(DataRow row)
    {
        //imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(row["Company_Logo"].ToString(), 128, 128, false);
        String urlCompany = "";
        if (string.IsNullOrEmpty(row["Company_Logo"].ToString()))
            urlCompany = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
        else
            urlCompany = WebHelper.Instance.GetImageURL(row["Company_Logo"].ToString(), 128, 128, false);
        imgLogo.ImageUrl = urlCompany;
        txtCompanyNameEdit.Text = row["Company_Name"].ToString();
        txtCompanyEmail.Text = row["Company_Email"].ToString();
        txtCompanyAddress.Text = row["Company_Address"].ToString();
        txtCompanyPhoneEdit.Text = row["Company_Phone"].ToString();
        txtCompanyDescription.Text = row["Company_Description"].ToString();
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        Company entity = new Company();
        if (companyBll.Company_CheckName(txtCompanyNameEdit.Text))
        {
            pnlRed.Visible = true;
            lblError.Text = "Name is Exitst !!!";
            return;
        }
        if (companyBll.Company_CheckEmail((txtCompanyEmail.Text)))
        {
            pnlRed.Visible = true;
            lblError.Text = "Email is Exitst !!!";
            return;
        }
        string CompanyId = dataRow["Company_Id"].ToString();
        entity.Company_Id = new Guid(CompanyId);
        entity.Company_Name = txtCompanyNameEdit.Text;
        entity.Company_Email = txtCompanyEmail.Text;
        entity.Company_Address = txtCompanyAddress.Text;
        entity.Company_Description = txtCompanyDescription.Text;
        entity.Company_Phone = txtCompanyPhoneEdit.Text;
        string filePath = "";
        System.Drawing.Image image;
        if (fuLogoEdit.HasFile)
        {
            image = System.Drawing.Image.FromStream(fuLogoEdit.PostedFile.InputStream);
        }
        else
        {
            filePath = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
            image = System.Drawing.Image.FromFile(filePath);
        }
        String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
        entity.Company_Logo = data;
        if (companyBll.Company_Update(entity) < 1)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }
        pnlRed.Visible = false;
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Manage/success");
    }
    protected void UpdateCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Manage/null");
    }
}
