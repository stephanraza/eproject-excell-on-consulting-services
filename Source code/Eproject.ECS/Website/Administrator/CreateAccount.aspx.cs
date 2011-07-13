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
using System.Collections.Generic;
using Eproject.ECS.Entities;

public partial class Administrator_CreateAccount : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private RoleBusiness RB;
    private AccountBusiness AB;
    private DepartmentBusiness DB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        RB = new RoleBusiness();
        AB = new AccountBusiness();
        DB = new DepartmentBusiness();

        if (!IsPostBack)
        {
            loadData();
        }
    }

    private void loadData()
    {
        List<String> listEmail = EB.GetEmailNotRegister();
        ddlEmployeeEmail.Items.Add("Select email");
        foreach (String item in listEmail)
        {
            ddlEmployeeEmail.Items.Add(item);
        }

        List<String> listRole = RB.GetRoleNames();
        ddlRole.Items.Add("Select role");
        foreach (String item in listRole)
        {
            ddlRole.Items.Add(item);
        }
    }

    protected void ddlEmployeeEmail_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (((DropDownList)sender).SelectedIndex != 0)
        {
            String emailSelected = ((DropDownList)sender).Text;
            DisplayPanelPreview(emailSelected);
        }
        else
        {
            ResetPanelPreview();
        }
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    private void DisplayPanelPreview(String emailSelected)
    {
        try
        {
            pnlPreview.Visible = true;
            Employee employee = EB.GetEmployee(emailSelected);

            imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
            imgAvatar.PostBackUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Modify/" + employee.Employee_Id;
            lblFirstName.Text = employee.Employee_FirtName;
            lblLastName.Text = employee.Employee_LastName;
            if (employee.Employee_Gender)
                lblGender.Text = "Male";
            else
                lblGender.Text = "Female";
            if (employee.Employee_DateOfBirth.ToShortDateString().Equals("1/1/1900"))
                lblDOB.Text = "";
            else
                lblDOB.Text = employee.Employee_DateOfBirth.ToShortDateString();
            lblAddress.Text = employee.Employee_Address;
            lblPhoneNumber.Text = employee.Employee_PhoneNumber;
            lblEmail.Text = employee.Employee_Email;

            Department department = DB.GetDepartment(employee.Department_Id);
            lblDepartmentName.Text = department.Department_Name;
            lblDescription.Text = department.Department_Description;
        }
        catch (NullReferenceException nre)
        {
            ResetPanelPreview();
        }
    }

    private void ResetPanelPreview()
    {
        imgAvatar.ImageUrl = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
        imgAvatar.PostBackUrl = "";
        lblFirstName.Text = "";
        lblLastName.Text = "";
        lblGender.Text = "";
        lblDOB.Text = "";
        lblAddress.Text = "";
        lblPhoneNumber.Text = "";
        lblEmail.Text = "";
        lblDepartmentName.Text = "";
        lblDescription.Text = "";
        pnlPreview.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);

                AB.CreateAccount(Guid.NewGuid(), EB.GetEmployee(ddlEmployeeEmail.Text).Employee_Id, txtUserName.Text.Trim(), txtPassword.Text.Trim(), ddlRole.Text.Trim());
                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new an account successfully.";
                ResetPanelPreview();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                ckbDefaultPassword.Checked = false;
                DisplayPanelPreview(ddlEmployeeEmail.Text);
            }
        }
    }
}
