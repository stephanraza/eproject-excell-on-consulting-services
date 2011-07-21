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

public partial class Administrator_DisplayAccount : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private AccountBusiness AB;
    private Guid accountId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        AB = new AccountBusiness();

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
            accountId = new Guid(id);
        }
    }
    private void loadData()
    {
        try
        {
            Account account = AB.GetAccount(accountId);
            Employee employee = EB.GetEmployee(account.Employee_Id);

            lblDisplayRole.Text = account.Role_Name;
            lblDisplayName.Text = account.Account_UserName;
            if (account.Account_IsLocked)
                lblDisplayStatus.Text = "Locked";
            else
                lblDisplayStatus.Text = "Unlocked";
            lblDisplayEmployeeName.Text = employee.Employee_FirtName + " " + employee.Employee_LastName;
            lblDisplayEmployeeEmail.Text = employee.Employee_Email;

            if (AB.IsAdmin(Page.User.Identity.Name))
            {
                pnlLink.Visible = true;
                hplnkDisplayModifyAccount.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Modify/" + accountId;
            }
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
    protected void lnkViewDetail_Click(object sender, EventArgs e)
    {
        Account account = AB.GetAccount(accountId);
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Modify/" + account.Employee_Id.ToString());
    }
}
