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
                
                EmployeeBusiness EB = new EmployeeBusiness();

                if (EB.IsExist(txtEmail.Text.Trim()))
                {
                    pnlRed.Visible = true;
                    lblError.Text = "This email have already used.";
                    return;
                }

                String filePath = "";
                if (fuAvatar.HasFile)
                {
                    filePath = fuAvatar.PostedFile.FileName;
                }
                else
                {
                    if (radListGender.Text.Equals("Male"))
                        filePath = WebHelper.Instance.GetWebsitePath(Server.MapPath("")) + "App_Themes/images/other/male.png";
                    else if (radListGender.Text.Equals("Female"))
                        filePath = WebHelper.Instance.GetWebsitePath(Server.MapPath("")) + "App_Themes/images/other/female.png";
                 }

                System.Drawing.Image image = System.Drawing.Image.FromFile(filePath);
                String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);

                EB.CreateEmployee(ddlDepartment.Text.Trim(), txtFirstName.Text.Trim(), txtLastName.Text.Trim(), radListGender.Text, txtDOB.Text.Trim(), txtAddress.Text.Trim(), txtPhoneNumber.Text.Trim(), txtEmail.Text.Trim(), data);

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
