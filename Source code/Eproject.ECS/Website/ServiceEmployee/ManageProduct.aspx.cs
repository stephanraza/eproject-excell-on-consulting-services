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

public partial class ServiceEmployee_ManageProduct : System.Web.UI.Page
{
    ProductBLL productBll = new ProductBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

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
                    lblMessage.Text = "You must choose a product to modify.";
                }
                else if (value.Equals("success"))
                {
                    pnlGreen.Visible = true;
                    lblSuccess.Text = "Edit successfully!";
                }
            }
        }

        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    protected string FormatLogo(object obj)
    {
        if (obj == null)
        {
            return "";
        }
        return WebHelper.Instance.GetImageURL(obj.ToString(), 128, 128, false);
    }

    protected void BindDataToGrid(string key)
    {
        grvManage.DataSource = productBll.Product_ShowAllDisplay(key);
        grvManage.DataKeyNames = new string[] { "Product_Id" };
        grvManage.DataBind();
    }
    protected void grvManage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        if (grvManage.DataKeys[e.NewSelectedIndex] != null)
        {
            string ProductId = grvManage.DataKeys[e.NewSelectedIndex].Value.ToString();
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Product/Modify/" + ProductId);
        }
    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (grvManage != null)
        {
            if (grvManage.DataKeys[e.RowIndex] != null)
            {

                string ProductId = grvManage.DataKeys[e.RowIndex].Value.ToString();
                if (!productBll.Product_UpdateStatusRemove(ProductId))
                {

                    pnlRed.Visible = true;
                    lblError.Text = "Do not remove successfully";
                    return;
                }
            }
            pnlGreen.Visible = true;
            lblSuccess.Text = "A product has been removed successfully, this data could be restored from Trash.";
            BindDataToGrid("");
        }
    }
    protected void grvManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvManage.PageIndex = e.NewPageIndex;
        BindDataToGrid(txtSearch.Text);
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        BindDataToGrid(txtSearch.Text);
    }
}
