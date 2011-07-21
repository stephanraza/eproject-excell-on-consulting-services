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

public partial class Controls_PersonalInfoControl : System.Web.UI.UserControl
{
    private AccountBusiness AB;
    private Account account;
    private EmployeeBusiness EB;
    private Employee employee;
    private DepartmentBusiness DB;
    private Department department;


    protected void Page_Load(object sender, EventArgs e)
    {
        loadInfoPreview();
    }

    private void loadInfoPreview()
    {
        AB = new AccountBusiness();
        account = AB.GetAccount(Page.User.Identity.Name);
        EB = new EmployeeBusiness();
        employee = EB.GetEmployee(account.Employee_Id);
        DB = new DepartmentBusiness();
        department = DB.GetDepartment(employee.Department_Id);

        imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
        imgAvatar.PostBackUrl = WebHelper.Instance.GetURL() + "Account";
        lblUserName.Text = account.Account_UserName;
        lblRole.Text = account.Role_Name;
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
        hplnkModifyProfile.NavigateUrl = WebHelper.Instance.GetURL() + "Account";
        lblDepartmentName.Text = department.Department_Name;
        lblDescription.Text = department.Department_Description;
        hplnkModifyDepartment.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage/" + department.Department_Id;
    }
}
