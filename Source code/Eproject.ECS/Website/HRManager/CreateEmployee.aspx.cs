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
using System.IO;

public partial class HRManager_CreateEmployee : System.Web.UI.Page
{
    private DepartmentBusiness DB;
    private EmployeeBusiness EB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;
        CompareValidator1.ValueToCompare = DateTime.Now.Date.ToShortDateString();
        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();

        if (!IsPostBack)
        {
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
                String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
                
                EmployeeBusiness EB = new EmployeeBusiness();

                if (EB.IsExist(txtEmail.Text.Trim()))
                {
                    pnlRed.Visible = true;
                    lblError.Text = "This email have already used.";
                    Reset();
                    return;
                }

                String filePath = "";
                System.Drawing.Image image;
                if (fuAvatar.HasFile)
                {
                    image = System.Drawing.Image.FromStream(fuAvatar.PostedFile.InputStream);
                }
                else
                {
                    if (radListGender.Text.Equals("Male"))
                        filePath = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/male.png";
                    else if (radListGender.Text.Equals("Female"))
                        filePath = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/female.png";

                    image = System.Drawing.Image.FromFile(filePath);
                }

                String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
                EB.CreateEmployee(Guid.NewGuid(), ddlDepartment.Text.Trim(), txtFirstName.Text.Trim(), txtLastName.Text.Trim(), radListGender.Text, txtDOB.Text.Trim(), txtAddress.Text.Trim(), txtPhoneNumber.Text.Trim(), txtEmail.Text.Trim(), data);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new an employee successfully.";

                loadPreview(txtEmail.Text.Trim());
                
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                Reset();
            }

        }
    }

    private void loadPreview(String email)
    {
        pnlPreview.Visible = true;
        String emailSelected = email;
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

    public void Reset()
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
}
