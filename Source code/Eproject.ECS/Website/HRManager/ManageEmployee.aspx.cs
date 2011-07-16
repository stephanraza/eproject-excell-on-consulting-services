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
using Eproject.ECS.Entities;
using Eproject.ECS.Bll;
using System.Collections.Generic;

public partial class HRManager_ManageEmployee : System.Web.UI.Page
{
    private EmployeeBusiness EB;
    private DepartmentBusiness DB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        loadData();
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }
    private void loadData()
    {
        List<EmployeeOfDepartment> listEmployee = EB.SearchEmployee(txtSearch.Text.Trim(), false);
        grvManage.DataSource = listEmployee;
        grvManage.DataBind();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        List<EmployeeOfDepartment> listSearch = EB.SearchEmployee(txtSearch.Text.Trim(), false);
        grvManage.DataSource = listSearch;
        grvManage.DataBind();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
        }
    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            e.Cancel = true;
            frmManage.ChangeMode(frmManage.DefaultMode);
            Label lblId = (Label)grvManage.Rows[e.RowIndex].FindControl("lblId");

            EB.RemoveEmployee(new Guid(lblId.Text));

            pnlGreen.Visible = true;
            lblSuccess.Text = "An employee has been removed successfully, this data could be restored from Trash.";
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    protected void grvManage_SelectedIndexChanged(object sender, EventArgs e)
    {
        frmManage.ChangeMode(FormViewMode.Edit);
        Label lblId = (Label)grvManage.Rows[grvManage.SelectedIndex].FindControl("lblId");
        Employee employee = EB.GetEmployee(new Guid(lblId.Text.Trim()));
        Department department = DB.GetDepartment(employee.Department_Id);

        EmployeeOfDepartment eod = new EmployeeOfDepartment();
        eod.Employee_Id = employee.Employee_Id;
        eod.Employee_FirtName = employee.Employee_FirtName;
        eod.Employee_LastName = employee.Employee_LastName;
        eod.Employee_Gender = employee.Employee_Gender;
        eod.Employee_DateOfBirth = employee.Employee_DateOfBirth;
        eod.Employee_Address = employee.Employee_Address;
        eod.Employee_PhoneNumber = employee.Employee_PhoneNumber;
        eod.Employee_Email = employee.Employee_Email;
        eod.Employee_Avatar = employee.Employee_Avatar;
        eod.Employee_IsDelete = employee.Employee_IsDelete;

        eod.Department_Id = department.Department_Id;
        eod.Department_Name = department.Department_Name;
        eod.Department_Description = department.Department_Description;
        eod.Department_IsDelete = department.Department_IsDelete;

        List<EmployeeOfDepartment> list = new List<EmployeeOfDepartment>();
        list.Add(eod);
        frmManage.DataSource = list;
        frmManage.DataBind();
        frmManage.PageIndex = 1;
        RadioButtonList radModifyGender = (RadioButtonList)frmManage.FindControl("radModifyGender");
        DropDownList ddlDepartment = (DropDownList)frmManage.FindControl("ddlModifyDepartment");
        TextBox txtDate = (TextBox)frmManage.FindControl("txtModifyDOB");
        ImageButton imgbtn = (ImageButton)frmManage.FindControl("imgAvatar");

        if (eod.Employee_Gender)
            radModifyGender.SelectedIndex = 0;
        else
            radModifyGender.SelectedIndex = 1;
        imgbtn.ImageUrl = WebHelper.Instance.GetImageURL(eod.Employee_Avatar, 128, 128, false);
        ddlDepartment.Text = eod.Department_Name;
        txtDate.Text = eod.Employee_DateOfBirth.ToShortDateString();
        
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void imgbtnFirst_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnNext_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnLast_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                EmployeeBusiness EB = new EmployeeBusiness();
                TextBox txtEmail = (TextBox)frmManage.FindControl("txtModifyEmail");
                FileUpload fuAvatar = (FileUpload)frmManage.FindControl("fuModifyAvatar");
                RadioButtonList radListGender = (RadioButtonList)frmManage.FindControl("radModifyGender");
                DropDownList ddlDepartment = (DropDownList)frmManage.FindControl("ddlModifyDepartment");
                TextBox txtFirstName = (TextBox)frmManage.FindControl("txtFName");
                TextBox txtLastName = (TextBox)frmManage.FindControl("txtLName");
                TextBox txtDOB = (TextBox)frmManage.FindControl("txtModifyDOB");
                TextBox txtAddress = (TextBox)frmManage.FindControl("txtModifyAddress");
                TextBox txtPhoneNumber = (TextBox)frmManage.FindControl("txtModifyPhoneNumber");

                Label lblId = (Label)grvManage.Rows[grvManage.SelectedIndex].FindControl("lblId");
                Employee employee = EB.GetEmployee(new Guid(lblId.Text.Trim()));
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
                    data = employee.Employee_Avatar;
                }
                EB.UpdateEmployee(employee.Employee_Id, txtFirstName.Text.Trim(), txtLastName.Text.Trim(),txtEmail.Text.Trim(),txtAddress.Text.Trim(),txtPhoneNumber.Text.Trim(), radListGender.Text, txtDOB.Text.Trim(), data);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new an employee successfully.";
                frmManage.ChangeMode(frmManage.DefaultMode);
                loadData();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                EmployeeBusiness EB = new EmployeeBusiness();
                TextBox txtEmail = (TextBox)frmManage.FindControl("txtEmail");
                FileUpload fuAvatar = (FileUpload)frmManage.FindControl("fuAvatar");
                RadioButtonList radListGender = (RadioButtonList)frmManage.FindControl("radListGender");
                DropDownList ddlDepartment = (DropDownList)frmManage.FindControl("ddlDepartment");
                TextBox txtFirstName = (TextBox)frmManage.FindControl("txtFirstName");
                TextBox txtLastName = (TextBox)frmManage.FindControl("txtLastName");
                TextBox txtDOB = (TextBox)frmManage.FindControl("txtDOB");
                TextBox txtAddress = (TextBox)frmManage.FindControl("txtAddress");
                TextBox txtPhoneNumber = (TextBox)frmManage.FindControl("txtPhoneNumber");

                if (EB.IsExist(txtEmail.Text.Trim()))
                {
                    pnlRed.Visible = true;
                    lblError.Text = "This email have already used.";
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
                loadData();
                Reset();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }

        }
    }
    private void Reset()
    {
        TextBox txtEmail = (TextBox)frmManage.FindControl("txtEmail");
        RadioButtonList radListGender = (RadioButtonList)frmManage.FindControl("radListGender");
        DropDownList ddlDepartment = (DropDownList)frmManage.FindControl("ddlDepartment");
        TextBox txtFirstName = (TextBox)frmManage.FindControl("txtFirstName");
        TextBox txtLastName = (TextBox)frmManage.FindControl("txtLastName");
        TextBox txtDOB = (TextBox)frmManage.FindControl("txtDOB");
        TextBox txtAddress = (TextBox)frmManage.FindControl("txtAddress");
        TextBox txtPhoneNumber = (TextBox)frmManage.FindControl("txtPhoneNumber");

        txtEmail.Text = "";
        radListGender.SelectedIndex = 0;
        ddlDepartment.SelectedIndex = 0;
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDOB.Text = "";
        txtAddress.Text = "";
        txtPhoneNumber.Text = "";
    }
    protected override void OnInit(EventArgs e)
    {
        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();

        frmManage.ItemCreated += new EventHandler(frmManage_ItemCreated);
        base.OnInit(e);
    }
    void frmManage_ItemCreated(object sender, EventArgs e)
    {
        if (frmManage.CurrentMode == FormViewMode.Insert)
        {
            lblTextBoxId.Text = ((TextBox)frmManage.FindControl("txtDOB")).ClientID;
            CompareValidator cv = (CompareValidator)frmManage.FindControl("CompareValidator1");
            DropDownList ddlDepartment = (DropDownList)frmManage.FindControl("ddlDepartment");

            cv.ValueToCompare = DateTime.Now.Date.ToShortDateString();
            ddlDepartment.Items.Add("Select department");
            foreach (String item in DB.GetDepartmentNames())
            {
                ddlDepartment.Items.Add(item);
            }
        }
        else if (frmManage.CurrentMode == FormViewMode.Edit)
        {
            lblTextBoxId.Text = ((TextBox)frmManage.FindControl("txtModifyDOB")).ClientID;
            CompareValidator cv = (CompareValidator)frmManage.FindControl("CompareValidator");
            DropDownList ddlDepartment = (DropDownList)frmManage.FindControl("ddlModifyDepartment");

            cv.ValueToCompare = DateTime.Now.Date.ToShortDateString();
            ddlDepartment.Items.Add("Select department");
            foreach (String item in DB.GetDepartmentNames())
            {
                ddlDepartment.Items.Add(item);
            }
        }
    }
    protected void frmManage_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        e.Cancel = true;
        frmManage.ChangeMode(frmManage.DefaultMode);
    }
}
