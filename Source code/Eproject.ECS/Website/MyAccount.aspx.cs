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

public partial class MyAccount : System.Web.UI.Page
{
    private AccountBusiness AB;
    private Account account;
    private EmployeeBusiness EB;
    private Employee employee;
    private DepartmentBusiness DB;
    private Department department;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            pnlBlue.Visible = false;
            pnlGreen.Visible = false;
            pnlRed.Visible = false;
            pnlYellow.Visible = false;
            cvBirthday.ValueToCompare = DateTime.Now.Date.ToShortDateString();
            loadInfoPreview();
            if (!IsPostBack)
            {
                loadInfoModify();
            }
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }

    private void loadInfoModify()
    {
        txtFirstName.Text = employee.Employee_FirtName;
        txtLastName.Text = employee.Employee_LastName;
        txtEmail.Text = employee.Employee_Email;
        txtAddress.Text = employee.Employee_Address;
        txtPhoneNumber.Text = employee.Employee_PhoneNumber;
        if (employee.Employee_DateOfBirth.ToShortDateString().Equals("1/1/1900"))
            txtBirthday.Text = "";
        else
            txtBirthday.Text = employee.Employee_DateOfBirth.ToShortDateString();
        if (employee.Employee_Gender)
            radGender.SelectedIndex = 0;
        else
            radGender.SelectedIndex = 1;
    }

    private void loadInfoPreview()
    {
        AB = new AccountBusiness();
        account = AB.GetAccount(User.Identity.Name);
        EB = new EmployeeBusiness();
        employee = EB.GetEmployee(account.Employee_Id);
        DB = new DepartmentBusiness();
        department = DB.GetDepartment(employee.Department_Id);

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
    protected void btnChangeName_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                EB.UpdateEmployee(employee.Employee_Id,employee.Department_Id, txtFirstName.Text.Trim(), txtLastName.Text.Trim(), null, null, null, null, null, null);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Infomartion of name has been modified successfully.";
                loadInfoPreview();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                loadInfoModify();
            }
        }
    }
    protected void btnChangeEmail_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            if (!employee.Employee_Email.Equals(txtEmail.Text.Trim()) && EB.IsExist(txtEmail.Text.Trim()))
            {
                pnlRed.Visible = true;
                lblError.Text = "There is an existing account associated with this email address.";
                loadInfoModify();
                return;
            }
            try
            {
                EB.UpdateEmployee(employee.Employee_Id, employee.Department_Id, null, null, txtEmail.Text.Trim(), txtAddress.Text.Trim(), txtPhoneNumber.Text.Trim(), null, null, null);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Infomartion of contact has been modified successfully.";
                loadInfoPreview();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                loadInfoModify();
            }
        }
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try 
            {
                AB.ChangePassword(account.Account_UserName, txtOldPassword.Text.Trim(), txtNewPassword.Text.Trim());

                pnlGreen.Visible = true;
                lblSuccess.Text = "Infomartion of password has been modified successfully.";
                loadInfoPreview();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                loadInfoModify();                
            }
            

        }
    }
    protected void btnChangeGender_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
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

                    String data = "";
                    if (employee.Employee_Avatar.Equals(dataMale))
                        data = dataFemale;
                    else if (employee.Employee_Avatar.Equals(dataFemale))
                        data = dataMale;
                    else
                        data = null;

                    EB.UpdateEmployee(employee.Employee_Id,employee.Department_Id , null, null, null, null, null, radGender.Text.Trim(), null, data);

                    pnlGreen.Visible = true;
                    lblSuccess.Text = "Infomartion of gender has been modified successfully.";
                    loadInfoPreview();
                }
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                loadInfoModify();
            }
        }
    }
    protected void btnChangeBirthday_Click(object sender, EventArgs e)
    {
        try
        {
            if (IsValid)
            {
                EB.UpdateEmployee(employee.Employee_Id, employee.Department_Id, null, null, null, null, null, null, txtBirthday.Text.Trim(), null);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Infomartion of date of birth has been modified successfully.";
                loadInfoPreview();
            }
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            loadInfoModify();
        }
    }
    protected void btnChangeAvatar_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                if (fuAvatar.HasFile)
                {
                    System.Drawing.Image image = System.Drawing.Image.FromStream(fuAvatar.PostedFile.InputStream);
                    String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);

                    EB.UpdateEmployee(employee.Employee_Id, employee.Department_Id, null, null, null, null, null, null, null, data);

                    pnlGreen.Visible = true;
                    lblSuccess.Text = "Infomartion of avatar has been modified successfully.";
                    loadInfoPreview();
                }
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                loadInfoModify();
            }
        }
    }
}
