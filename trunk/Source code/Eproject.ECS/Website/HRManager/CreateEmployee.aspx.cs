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

public partial class HRManager_CreateEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;
        CompareValidator1.ValueToCompare = DateTime.Now.Date.ToShortDateString();

        if (!IsPostBack)
        {
            DepartmentBusiness DB = new DepartmentBusiness();
            ddlDepartment.Items.Add("Select department");
            foreach (String item in DB.GetDepartmentNames())
            {
                ddlDepartment.Items.Add(item);
            }
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

                if (ddlDepartment.SelectedIndex == 0)
                {
                    pnlRed.Visible = true;
                    lblError.Text = "You must select department for new employee.";
                    return;
                }

                // Create an employee
                String avatar = "";
                if (fuAvatar.HasFile)
                {
                    avatar = WebHelper.Instance.ByteArrayToStr(fuAvatar.FileBytes);
                }
                EmployeeBusiness EB = new EmployeeBusiness();
                EB.CreateEmployee(ddlDepartment.Text.Trim(), txtFirstName.Text.Trim(), txtLastName.Text.Trim(), radListGender.Text, txtDOB.Text.Trim(), txtAddress.Text.Trim(), txtPhoneNumber.Text.Trim(), txtEmail.Text.Trim(), avatar);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new an employee successfully.";

            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }

        }
    }
}
