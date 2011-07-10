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
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        if (!IsPostBack)
        {
            loadData();
        }
    }

    private void loadData()
    {
        EmployeeBusiness EB = new EmployeeBusiness();
        List<String> listEmail = EB.GetEmailNotRegister();
        ddlEmployeeEmail.Items.Add("Select email");
        foreach (String item in listEmail)
        {
            ddlEmployeeEmail.Items.Add(item);
        }

        RoleBusiness RB = new RoleBusiness();
        List<String> listRole = RB.GetRoleNames();
        ddlRole.Items.Add("Select role");
        foreach (String item in listRole)
        {
            ddlRole.Items.Add(item);
        }
    }

    protected void ddlEmployeeEmail_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (((DropDownList)sender).SelectedIndex != 0)
            {
                pnlPreview.Visible = true;
                String emailSelected = ((DropDownList)sender).Text;
                EmployeeBusiness EB = new EmployeeBusiness();
                Employee employee = EB.GetEmployee(emailSelected);

                String url = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
                if (url != null)
                {
                    imgAvatar.ImageUrl = WebHelper.Instance.GetURL() + url;
                    imgAvatar.PostBackUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Modify/" + employee.Employee_Id;
                }
                lblFirstName.Text = employee.Employee_FirtName;
                lblLastName.Text = employee.Employee_LastName;
                if (employee.Employee_Gender)
                    lblGender.Text = "Male";
                else
                    lblGender.Text = "Female";
                lblDOB.Text = employee.Employee_DateOfBirth.ToShortDateString();
                lblAddress.Text = employee.Employee_Address;
                lblPhoneNumber.Text = employee.Employee_PhoneNumber;
                lblEmail.Text = employee.Employee_Email;
            }
            else
            {
                imgAvatar.ImageUrl = WebHelper.Instance.GetWebsitePath(Server.MapPath("")+ "App_Themes/images/other/no_image.png");
                imgAvatar.PostBackUrl = "";
                lblFirstName.Text = "";
                lblLastName.Text = "";
                lblGender.Text = "";
                lblDOB.Text = "";
                lblAddress.Text = "";
                lblPhoneNumber.Text = "";
                lblEmail.Text = "";
                pnlPreview.Visible = false;
            }
            String script = WebHelper.Instance.GetJqueryScript(Server.MapPath(""), "App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
        catch (NullReferenceException nre)
        {
            pnlRed.Visible = true;
            lblError.Text = "Information of this employee not found !"; 
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                String script = WebHelper.Instance.GetJqueryScript(Server.MapPath(""), "App_Themes/js/jquery/custom_jquery.js");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);

                AccountBusiness AB = new AccountBusiness();
                EmployeeBusiness EB = new EmployeeBusiness();
                String emID = EB.GetEmployee(ddlEmployeeEmail.Text).Employee_Id.ToString();

                AB.CreateAccount(emID, txtUserName.Text.Trim(), txtPassword.Text.Trim(), ddlRole.Text.Trim());
                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new an account successfully.";
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }
        }
    }
}
