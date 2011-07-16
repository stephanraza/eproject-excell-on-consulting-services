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

public partial class ServiceEmployee_TrashProblem : System.Web.UI.Page
{
    ProblemBLL problemBll = new ProblemBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinDataToGird(txtSearch.Text);
        }
    }

    public void BinDataToGird(string key)
    {
        DataTable dataTable = problemBll.Problem_ShowAllDisplayRemove(key);
        grvManage.DataSource = dataTable;
        grvManage.DataKeyNames = new string[] { "Problem_Id" };
        grvManage.DataBind();
    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (grvManage.DataKeys[e.RowIndex] != null)
        {
            string id = grvManage.DataKeys[e.RowIndex].Value.ToString();

            if (!problemBll.Problem_Delete(id))
            {
                pnlRed.Visible = true;
                lblError.Text = "Do not delete";
                return;
            }
            pnlGreen.Visible = true;
            lblSuccess.Text = "Delete success!";
            BinDataToGird(txtSearch.Text);
        }
    }
    protected void grvManage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        if (grvManage.DataKeys[e.NewSelectedIndex] != null)
        {
            string id = grvManage.DataKeys[e.NewSelectedIndex].Value.ToString();

            if (problemBll.Problem_UpdateStatus(id) < 1)
            {
                pnlRed.Visible = true;
                lblError.Text = "Donot restore";
                return;
            }
            pnlGreen.Visible = true;
            lblSuccess.Text = "restore success!";
            BinDataToGird(txtSearch.Text);
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
}
