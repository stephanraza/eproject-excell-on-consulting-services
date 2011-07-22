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
using System.Collections.Generic;

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
            loadData();
        }
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    private void loadData()
    {
        List<Department> list = DB.GetDepartments(false);
        ddlDepartment.Items.Clear();
        ddlDepartment.Items.Add("Select department");
        foreach (Department dep in list)
        {
            ListItem item = new ListItem();
            item.Text = dep.Department_Name;
            item.Value = dep.Department_Id.ToString();
            ddlDepartment.Items.Add(item);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {                
                EmployeeBusiness EB = new EmployeeBusiness();

                if (EB.IsExist(txtEmail.Text.Trim()))
                {
                    pnlRed.Visible = true;
                    lblError.Text = "This email have already used.";
                    hplnkRed.Text = "Please try again.";
                    hplnkRed.NavigateUrl = "";
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
                EB.CreateEmployee(Guid.NewGuid(), new Guid(ddlDepartment.SelectedValue), txtFirstName.Text.Trim(), txtLastName.Text.Trim(), radListGender.Text, txtDOB.Text.Trim(), txtAddress.Text.Trim(), txtPhoneNumber.Text.Trim(), txtEmail.Text.Trim(), data);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new an employee successfully.";
                hplnkGreen.Text = "Go to Manage panel.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage";
                Reset();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                hplnkRed.Text = "Please try again.";
                hplnkRed.NavigateUrl = "";
            }

        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private void Reset()
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        radListGender.SelectedIndex = 0;
        txtDOB.Text = "";
        txtAddress.Text = "";
        txtPhoneNumber.Text = "";
        txtEmail.Text = "";
        ddlDepartment.SelectedIndex = 0;
    }
    protected void Page_PreRender(object sender, System.EventArgs e)
    {
        this.ScriptManager1.RegisterPostBackControl(btnSubmit);
    }
}
