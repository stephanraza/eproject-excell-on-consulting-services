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

public partial class ServiceEmployee_TrashProduct : System.Web.UI.Page
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

        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    protected void BindDataToGrid(string key)
    {
        grvManage.DataSource = productBll.Product_ShowAllDisplayRemove(key);
        grvManage.DataKeyNames = new string[] { "Product_Id" };
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

    protected void grvManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvManage.PageIndex = e.NewPageIndex;
        BindDataToGrid("");
    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (grvManage.DataKeys[e.RowIndex] != null)
        {
            string productId = grvManage.DataKeys[e.RowIndex].Value.ToString();
            if (productBll.Product_Delete(productId) > 0)
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Delete success!";
                BindDataToGrid(txtSearch.Text);
                pnlRed.Visible = false;
                return;
            }
            pnlRed.Visible = true;
            lblError.Text = "Do not delete";
            return;
        }
    }
    protected void grvManage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        if (grvManage.DataKeys[e.NewSelectedIndex] != null)
        {
            string productId = grvManage.DataKeys[e.NewSelectedIndex].Value.ToString();
            if (productBll.Product_UpdateStatus(productId) > 0)
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Restore success!";
                BindDataToGrid(txtSearch.Text);
                pnlRed.Visible = false;
                return;
            }
            pnlRed.Visible = true;
            lblError.Text = "Do not restore";
            return;
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        BindDataToGrid(txtSearch.Text);
    }
}
