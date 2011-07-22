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
using Eproject.ECS.Entities;
using Eproject.ECS.Bll;
using System.Collections.Generic;

public partial class HRManager_ManageEmployee : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private DepartmentBusiness DB;
    private AccountBusiness AB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();
        AB = new AccountBusiness();

        GetRouteData();
        loadData();
        Search();
        if (IsPostBack)
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
        else
        {
            ddlSearchBy.Items.Clear();
            ddlSearchBy.Items.Add("All");
            if (IsAdmin())
                ddlSearchBy.Items.Add("Account");
            ddlSearchBy.Items.Add("Employee");
            ddlSearchBy.Items.Add("Department");
        }
    }

    private void GetRouteData()
    {
        String id = "";

        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["id"] != null)
            {
                id = RouteCollectionExtensions.RouteData.Values["id"] as String;
            }
        }

        String value = "";
        if (Session["return"] != null)
            value = Session["return"].ToString();

        if (!String.IsNullOrEmpty(value))
        {
            if (value.Equals("null"))
            {
                pnlYellow.Visible = true;
                lblMessage.Text = "You must choose an employee to modify or view details.";
                hplnkYellow.NavigateUrl = "";
                hplnkYellow.Text = "Close and continue.";
            }
            else if (value.Equals("Emodify"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Employee's information has been modified successfully.";
                hplnkGreen.Text = "View detail.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Display/" + id;
            }
            else if (value.Equals("Amodify"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Account's information has been modified successfully.";
                hplnkGreen.Text = "View detail.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Display/" + id;
            }
            else if (value.Equals("Eremove"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "An employee has been removed successfully, this data could be restored from Trash.";
                hplnkGreen.Text = "Go to trash.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Trash";
            }
            else if (value.Equals("Aremove"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "An account has been removed successfully, this data could be restored from Trash.";
                hplnkGreen.Text = "Go to trash.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Trash";
            }
            Session.Remove("return");
        }
    }
    private void Search()
    {
        String search = "";
        if (Session["search"] != null)
            search = Session["search"].ToString();

        if (!String.IsNullOrEmpty(search))
        {
            List<EmployeeDetail> listEmployee = EB.SearchEmployee(search, "Department", false);
            grvManage.DataSource = listEmployee;
            grvManage.DataBind();
        }
        Session.Remove("search");
    }
    protected bool IsAdmin()
    {
        return AB.IsAdmin(Page.User.Identity.Name);
    }
    protected String GetURL(Object data)
    {
        return WebHelper.Instance.GetImageURL(data.ToString(), 48, 48, true);
    }
    protected String GetAccountURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageSystem/Account/Display/" + data.ToString();
        return url;
    }
    protected String GetEmployeeURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Display/" + data.ToString();
        return url;
    }
    protected String GetDepartmentURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageSystem/Department/Display/" + data.ToString();
        return url;
    }
    protected String GetEmployeeModifyURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Modify/" + data.ToString();
        return url;
    }
    private void loadData()
    {
        List<EmployeeDetail> listEmployee = EB.SearchEmployee(txtSearch.Text.Trim(), ddlSearchBy.Text, false);
        grvManage.DataSource = listEmployee;
        grvManage.DataBind();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        if (ddlSearchBy.SelectedItem.Text.Equals("Account"))
        {
            SearchByStatus();
        }
        else if (ddlSearchBy.SelectedItem.Text.Equals("Employee"))
        {
            SearchByEmployee();
        }
        else
        {
            loadData();
        }
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
    protected void imgbtnRemove_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRemove = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRemove.FindControl("hfEmployeeId");

            EB.RemoveEmployee(new Guid(hf.Value));

            pnlGreen.Visible = true;
            lblSuccess.Text = "An employee has been removed successfully, this data could be restored from Trash.";
            hplnkGreen.Text = "Go to trash.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Trash";
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
    protected void imgbtnEditAccount_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibRemove = (ImageButton)sender;
        HiddenField hf = (HiddenField)ibRemove.FindControl("hfEmployeeId");

        Account account = AB.GetAccountOfEmployee(new Guid(hf.Value));
        Account accountLoggedIn = AB.GetAccount(Page.User.Identity.Name);
        if (account != null)
        {
            if (account.Account_Id == accountLoggedIn.Account_Id)
            {
                pnlRed.Visible = true;
                lblError.Text = "You don't have permission to execute this task.";
                hplnkYellow.NavigateUrl = "";
                hplnkYellow.Text = "Close and continue.";
                return;
            }
            if (account.Account_IsDelete)
            {
                pnlYellow.Visible = true;
                lblMessage.Text = "This account has been removed. You could restore it from Trash.";
                hplnkYellow.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Trash";
                hplnkYellow.Text = "Go to Trash.";
                return;
            }
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Account/Modify/" + account.Account_Id);
        }
        else
        {
            pnlYellow.Visible = true;
            lblMessage.Text = "This employee has not registered an account.";
            hplnkYellow.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Create/" + hf.Value;
            hplnkYellow.Text = "Create account.";
            return;
        }
    }
    protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        if (ddl.Text.Equals("Account"))
        {
            pnlSearchByAccount.Visible = true;
            HiddenPanelEmployee();
        }
        else if (ddl.Text.Equals("Employee"))
        {
            HiddenPanelAccount();
            pnlSearchByEmployee.Visible = true;
        }
        else
        {
            HiddenPanelAccount();
            HiddenPanelEmployee();
        }

    }
    private void HiddenPanelAccount()
    {
        ddlAdvanvedStatus.SelectedIndex = 0;
        pnlSearchByAccount.Visible = false;
    }
    private void HiddenPanelEmployee()
    {
        ddlAdvancedGender.SelectedIndex = 0;
        txtAdvancedFromDate.Text = "";
        txtAdvancedToDate.Text = "";
        pnlSearchByEmployee.Visible = false;
    }
    protected void ddlAdvanvedStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchByStatus();
    }

    private void SearchByStatus()
    {
        try
        {
            List<EmployeeDetail> list = EB.SearchEmployee(txtSearch.Text.Trim(), ddlSearchBy.Text, ddlAdvanvedStatus.Text, false);
            grvManage.DataSource = list;
            grvManage.DataBind();
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
    private void SearchByEmployee()
    {
        try
        {
            List<EmployeeDetail> list = EB.SearchEmployee(txtSearch.Text.Trim(), ddlSearchBy.Text, ddlAdvancedGender.Text, txtAdvancedFromDate.Text, txtAdvancedToDate.Text, false);
            grvManage.DataSource = list;
            grvManage.DataBind();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
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
