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
        if (IsPostBack)
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
    }
    protected String GetURL(Object data)
    {
        return WebHelper.Instance.GetImageURL(data.ToString(), 48, 48, true);
    }
    private void loadData()
    {
        List<EmployeeDetail> list = EB.SearchEmployee(txtSearch.Text.Trim(), "Employee", ddlAdvancedGender.Text, txtAdvancedFromDate.Text, txtAdvancedToDate.Text, true);
        grvManage.DataSource = list;
        grvManage.DataBind();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        loadData();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
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
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibDelete = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibDelete.FindControl("hfEmployeeId");

            EB.DeleteEmployee(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "An employee has been deleted successfully.";
            hplnkGreen.Text = "Close and continue.";
            hplnkGreen.NavigateUrl = "";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void imgbtnRestore_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRestore = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRestore.FindControl("hfEmployeeId");

            EB.RestoreEmployee(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "An employee has been restored successfully.";
            hplnkGreen.Text = "Go to Manage panel.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    private void SearchByEmployee()
    {
        try
        {
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void ddlAdvancedGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchByEmployee();
    }
    protected void txtAdvancedFromDate_TextChanged(object sender, EventArgs e)
    {
        SearchByEmployee();
    }
    protected void txtAdvancedToDate_TextChanged(object sender, EventArgs e)
    {
        SearchByEmployee();
    }
}
