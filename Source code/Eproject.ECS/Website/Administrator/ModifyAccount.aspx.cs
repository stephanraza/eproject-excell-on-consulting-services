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

public partial class Administrator_ModifyAccount : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private RoleBusiness RB;
    private AccountBusiness AB;
    private DepartmentBusiness DB;
    private Guid accountId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();
        AB = new AccountBusiness();
        RB = new RoleBusiness();

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
            List<String> listRole = RB.GetRoleNames();
            ddlRole.Items.Add("Select role");
            foreach (String item in listRole)
            {
                ddlRole.Items.Add(item);
            }

            ddlRole.Text = account.Role_Name;
            lblName.Text = account.Account_UserName;
            if (account.Account_IsLocked)
            {
                lblStatus.Text = "Locked";
                lnkStatus.Text = "Unlock";
            }
            else
            {
                lblStatus.Text = "Unlocked";
                lnkStatus.Text = "Lock";
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
    protected void lnkReset_Click(object sender, EventArgs e)
    {
        if (lblPassword.Visible)
        {
            lnkReset.Text = "Reset password";
            lblPassword.Text = "";
            lblPassword.Visible = false;
            return;
        }
        else
        {
            lnkReset.Text = "Cancel";
            lblPassword.Visible = true;
            lblPassword.Text = "123456";
            return;
        }
    }
    protected void lnkStatus_Click(object sender, EventArgs e)
    {
        if(lblStatus.Text.Equals("Locked"))
        {
            lblStatus.Text="Unlocked";
            lnkStatus.Text = "Lock";
        }
        else if (lblStatus.Text.Equals("Unlocked"))
        {
            lblStatus.Text = "Locked";
            lnkStatus.Text = "Unlock";
        }
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        try
        {
            String password = null;
            if (lblPassword.Visible && lblPassword.Text.Equals("123456"))
                password = lblPassword.Text;
            bool isLocked = false;
            if (lblStatus.Text.Equals("Locked"))
                isLocked = true;
            else if (lblStatus.Text.Equals("Unlocked"))
                isLocked = false;

            AB.UpdateAccount(accountId, password, ddlRole.Text, isLocked, false);
            if (Session["return"] == null)
                Session.Add("return", "Amodify");
            else
                Session["return"] = "Amodify";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage/" + accountId.ToString());
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage");
    }
    protected void lblRemove_Click(object sender, EventArgs e)
    {
        try
        {
            AB.RemoveAccount(accountId);
            if (Session["return"] == null)
                Session.Add("return", "Aremove");
            else
                Session["return"] = "Aremove";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage");
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue";
            hplnkRed.NavigateUrl = "";
        }
    }
}
