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

public partial class ServiceEmployee_ManageCompany : System.Web.UI.Page
{
    CompanyBLL companyBll = new CompanyBLL();
    private string SessionId
    {
        get { return (null != Session["SessionId"] ? (Session["SessionId"].ToString()) : ""); }
        set { Session["SessionId"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataToGrid(txtSearch.Text);
        }
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["return"] != null)
            {
                String value = RouteCollectionExtensions.RouteData.Values["return"] as String;
                if (value.Equals("null"))
                {
                    pnlYellow.Visible = true;
                    lblMessage.Text = "You must choose a company to modify.";
                }
                else if (value.Equals("success"))
                {
                    pnlGreen.Visible = true;
                    lblSuccess.Text = "Edit successfully!";
                }
            }
        }
    }

    protected void BindDataToGrid(string keySearch)
    {
        // imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
        grvManage.DataSource = companyBll.Company_ShowAllDisplay(keySearch);
        grvManage.DataKeyNames = new string[] { "Company_Id" };
        grvManage.DataBind();
    }

    protected string FormatLogo(object obj)
    {
        if (obj == null)
        {
            return "";
        }
        return WebHelper.Instance.GetImageURL(obj.ToString(), 128, 128, false);
    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (grvManage != null)
        {
            if (grvManage.DataKeys[e.RowIndex] != null)
            {

                string CompanyId = grvManage.DataKeys[e.RowIndex].Value.ToString();
                if (!companyBll.Company_UpdateStatusRemove(CompanyId))
                {

                    pnlRed.Visible = true;
                    lblError.Text = "Do not remove successfully";
                    return;
                }
            }
            pnlGreen.Visible = true;
            lblSuccess.Text = "A comapny has been removed successfully, this data could be restored from Trash.";
            BindDataToGrid("");
        }
    }
    protected void grvManage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        if (grvManage.DataKeys[e.NewSelectedIndex] != null)
        {
            string companyId = grvManage.DataKeys[e.NewSelectedIndex].Value.ToString();
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Modify/" + companyId);
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        BindDataToGrid(txtSearch.Text);
    }
    protected void grvManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvManage.PageIndex = e.NewPageIndex;
        BindDataToGrid(txtSearch.Text);
    }
}