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
    private Account accountModify;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            pnlRed.Visible = false;
            pnlGreen.Visible = false;
            pnlYellow.Visible = false;
            pnlBlue.Visible = false;

            EB = new EmployeeBusiness();
            RB = new RoleBusiness();
            AB = new AccountBusiness();
            DB = new DepartmentBusiness();

            if (RouteCollectionExtensions.RouteData != null)
            {
                if (RouteCollectionExtensions.RouteData.Values["id"] != null)
                {
                    String id = RouteCollectionExtensions.RouteData.Values["id"] as String;
                    if (id.Equals("")) throw new Exception();
                    accountModify = AB.GetAccount(new Guid(id));
                }
            }
            else
            {
                throw new Exception();
            }

            if (!IsPostBack)
            {
                loadData();
            }
        }
        catch (Exception ex)
        {
            String message = "You must select a record to modify.";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Account/Manage/" + SecurityHelper.Instance.EncryptCryptography(message, true));
        }
    }

    private void loadData()
    {
        List<String> listRole = RB.GetRoleNames();
        ddlRole.Items.Add("Select role");
        foreach (String item in listRole)
        {
            ddlRole.Items.Add(item);
        }

        ddlRole.Text = accountModify.Role_Name;
        DisplayPanelPreview(accountModify);
    }

    private void DisplayPanelPreview(Account account)
    {
        EB = new EmployeeBusiness();
        Employee employee = EB.GetEmployee(account.Employee_Id);
        DB = new DepartmentBusiness();
        Department department = DB.GetDepartment(employee.Department_Id);

        imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
        lblUserName.Text = account.Account_UserName;
        lblRole.Text = account.Role_Name;
        hplnkModifyAccount.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Account/Modify/" + account.Account_Id.ToString();
        lblFirstName.Text = employee.Employee_FirtName;
        lblLastName.Text = employee.Employee_LastName;
        lblEmail.Text = employee.Employee_Email;
        lblAddress.Text = employee.Employee_Address;
        lblPhoneNumber.Text = employee.Employee_PhoneNumber;
        if (employee.Employee_DateOfBirth.ToShortDateString().Equals("1/1/1900"))
            lblDOB.Text = "";
        else
            lblDOB.Text = employee.Employee_DateOfBirth.ToShortDateString();
        if (employee.Employee_Gender)
            lblGender.Text = "Male";
        else
            lblGender.Text = "Female";
        lblDepartmentName.Text = department.Department_Name;
        lblDescription.Text = department.Department_Description;
    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {

    }

    protected void btnChangeRole_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                AB.UpdateAccount(accountModify.Account_Id, accountModify.Account_Password, ddlRole.Text.Trim(), accountModify.Account_IsLocked, accountModify.Account_IsDelete);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Role has been changed successfully.";
                DisplayPanelPreview(accountModify);
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                DisplayPanelPreview(accountModify);
            }
        }
    }
}
