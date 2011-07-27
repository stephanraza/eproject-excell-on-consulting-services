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

public partial class HRManager_DisplayEmployee : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private AccountBusiness AB;
    private DepartmentBusiness DB;
    private Guid employeeId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        AB = new AccountBusiness();
        DB = new DepartmentBusiness();

        GetRouteData();
        if (!IsPostBack)
            loadData();
        else
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
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

        if (!String.IsNullOrEmpty(id))
        {
            employeeId = new Guid(id);
        }
    }
    private void loadData()
    {
        try
        {
            Employee employee = EB.GetEmployee(employeeId);
            Account account = AB.GetAccountOfEmployee(employeeId);
            Department department = DB.GetDepartment(employee.Department_Id);

            imgDisplayAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
            lblDisplayFName.Text = employee.Employee_FirtName + " " + employee.Employee_LastName;
            if (employee.Employee_Gender)
                lblDisplayGender.Text = "Male";
            else
                lblDisplayGender.Text = "Female";
            lblDisplayDOB.Text = employee.Employee_DateOfBirth.ToShortDateString();
            lblDisplayAddress.Text = employee.Employee_Address;
            lblDisplayPhoneNumber.Text = employee.Employee_PhoneNumber;
            lblDisplayEmail.Text = employee.Employee_Email;

            if (AB.IsAdmin(Page.User.Identity.Name))
                lnkAccount.Visible = true;
            else
                lnkAccount.Visible = false;
            if (account != null)
            {
                if (account.Account_IsDelete)
                {
                    lblDisplayAccount.Text = "";
                    lnkAccount.Text = "Restore the account for this employee";
                    lnkAccount.PostBackUrl = "";
                }
                else
                {
                    lblDisplayAccount.Text = account.Account_UserName;
                    lnkAccount.Text = "View account's detail";
                    lnkAccount.PostBackUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Display/" + account.Account_Id.ToString();
                }
            }
            else
            {
                lblDisplayAccount.Text = "";
                lnkAccount.Text = "Create an account for this employee";
                lnkAccount.PostBackUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Create/" + employeeId.ToString();
            }
            lblDisplayDepartment.Text = department.Department_Name;

            hplnkDisplayModifyEmployee.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Modify/" + employeeId.ToString();
        }
        catch (Exception ex)
        {
            if (Session["return"] == null)
                Session.Add("return", "null");
            else
                Session["return"] = "null";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage");
        }
    }
    protected void lnkAccount_Click(object sender, EventArgs e)
    {
        try
        {
            Account account = AB.GetAccountOfEmployee(employeeId);

            AB.RestoreAccount(account.Account_Id);
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "An account has been restored successfully.";
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
    protected void lnkDepartment_Click(object sender, EventArgs e)
    {
        Employee employee = EB.GetEmployee(employeeId);
        Department department = DB.GetDepartment(employee.Department_Id);
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Display/" + department.Department_Id.ToString());
    }
}
