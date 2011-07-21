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

public partial class HRManager_ModifyEmployee : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private DepartmentBusiness DB;
    private Guid employeeId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();

        GetRouteData();
        if (!IsPostBack)
            loadData();
        else
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
        CompareValidator.ValueToCompare = DateTime.Now.Date.ToShortDateString();
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
            imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
            txtFName.Text = employee.Employee_FirtName;
            txtLName.Text = employee.Employee_LastName;
            if (employee.Employee_Gender)
                radGender.SelectedIndex = 0;
            else
                radGender.SelectedIndex = 1;
            txtDOB.Text = employee.Employee_DateOfBirth.ToShortDateString();
            txtAddress.Text = employee.Employee_Address;
            txtPhoneNumber.Text = employee.Employee_PhoneNumber;
            txtEmail.Text = employee.Employee_Email;

            List<Department> list = DB.GetDepartments(false);
            ddlDepartment.Items.Add("Select department");
            foreach (Department dp in list)
            {
                ListItem item = new ListItem();
                item.Text = dp.Department_Name;
                item.Value = dp.Department_Id.ToString();
                ddlDepartment.Items.Add(item);
            }
            Department department = DB.GetDepartment(employee.Department_Id);
            ddlDepartment.SelectedValue = department.Department_Id.ToString();
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
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                Employee employee = EB.GetEmployee(employeeId);
                if (EB.IsExist(txtEmail.Text.Trim()) && !employee.Employee_Email.Equals(txtEmail.Text.Trim()))
                {
                    pnlRed.Visible = true;
                    lblError.Text = "This email have already used.";
                    return;
                }

                String data = "";
                if (fuAvatar.HasFile)
                {
                    System.Drawing.Image image = System.Drawing.Image.FromStream(fuAvatar.PostedFile.InputStream);
                    data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
                }
                else
                {
                    String gender = "";
                    if (employee.Employee_Gender)
                        gender = "Male";
                    else
                        gender = "Female";

                    if (!gender.Equals(radGender.Text.Trim()))
                    {
                        // Picture male default
                        String filePathMale = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/male.png";
                        System.Drawing.Image imageM = System.Drawing.Image.FromFile(filePathMale);
                        String dataMale = WebHelper.Instance.ImageToBase64(imageM, System.Drawing.Imaging.ImageFormat.Png);

                        // Picture female default
                        String filePathFemale = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/female.png";
                        System.Drawing.Image imageF = System.Drawing.Image.FromFile(filePathFemale);
                        String dataFemale = WebHelper.Instance.ImageToBase64(imageF, System.Drawing.Imaging.ImageFormat.Png);

                        if (employee.Employee_Avatar.Equals(dataMale))
                            data = dataFemale;
                        else if (employee.Employee_Avatar.Equals(dataFemale))
                            data = dataMale;
                        else
                            data = null;
                    }
                    else
                        data = null;
                }
                EB.UpdateEmployee(employee.Employee_Id, new Guid(ddlDepartment.SelectedValue), txtFName.Text.Trim(), txtLName.Text.Trim(), txtEmail.Text.Trim(), txtAddress.Text.Trim(), txtPhoneNumber.Text.Trim(), radGender.Text, txtDOB.Text.Trim(), data);
                if (Session["return"] == null)
                    Session.Add("return", "Emodify");
                else
                    Session["return"] = "Emodify";
                Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage/" + employee.Employee_Id.ToString());
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                Employee employee = EB.GetEmployee(employeeId);
                imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage");
    }
}
