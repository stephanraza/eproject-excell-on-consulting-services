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
using System.Collections.Generic;

public partial class HRManager_TrashEmployee : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private DepartmentBusiness DB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();

        loadData();
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }
    private void loadData()
    {
        List<EmployeeOfDepartment> listEmployee = EB.SearchEmployee(txtSearch.Text.Trim(), true);
        grvManage.DataSource = listEmployee;
        grvManage.DataBind();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        List<EmployeeOfDepartment> listSearch = EB.SearchEmployee(txtSearch.Text.Trim(), true);
        grvManage.DataSource = listSearch;
        grvManage.DataBind();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
        }
    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblId = (Label)grvManage.Rows[e.RowIndex].FindControl("lblId");

            EB.DeleteEmployee(new Guid(lblId.Text.Trim()));

            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been deleted successfully.";
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    protected void grvManage_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Label lblId = (Label)grvManage.Rows[grvManage.SelectedIndex].FindControl("lblId");

            EB.RestoreEmployee(new Guid(lblId.Text.Trim()));

            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been restored successfully.";
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void imgbtnFirst_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnNext_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnLast_Click(object sender, ImageClickEventArgs e)
    {

    }
}
