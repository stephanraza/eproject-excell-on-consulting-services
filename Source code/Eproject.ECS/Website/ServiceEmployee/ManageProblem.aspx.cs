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

public partial class ServiceEmployee_ManageProblem : System.Web.UI.Page
{
    #region Member
    ProblemBLL problemBll = new ProblemBLL();

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;
        if (!IsPostBack)
        {
            BinDataToGird(txtSearch.Text);
        }
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["return"] != null)
            {
                String value = RouteCollectionExtensions.RouteData.Values["return"] as String;
                if (value.Equals("null"))
                {
                    pnlYellow.Visible = true;
                    lblMessage.Text = "You must choose a problem to modify.";
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
    #region Function
    public void BinDataToGird(string key)
    {
        DataTable dataTable = problemBll.Problem_ShowAllDisplay(key);
        grvManage.DataSource = dataTable;
        grvManage.DataKeyNames = new string[] { "Problem_Id" };
        grvManage.DataBind();
    }

    #endregion

    #region Action
    protected void grvManage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

        if (grvManage.DataKeys[e.NewSelectedIndex] != null)
        {
            string ProblemId = grvManage.DataKeys[e.NewSelectedIndex].Value.ToString();

            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Problem/Modify/" + ProblemId);
        }

    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (grvManage.DataKeys[e.RowIndex] != null)
        {
            string ProblemId = grvManage.DataKeys[e.RowIndex].Value.ToString();
            if (!problemBll.Problem_DeleteRemove(ProblemId))
            {

                pnlRed.Visible = true;
                lblError.Text = "do not remove .";
                BinDataToGird("");

            }
            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been remove successfully";
            BinDataToGird("");

        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        BinDataToGird(txtSearch.Text);
    }
    protected void grvManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvManage.PageIndex = e.NewPageIndex;
        BinDataToGird(txtSearch.Text);
    }
    #endregion

}
