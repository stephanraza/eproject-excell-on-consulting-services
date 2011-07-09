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
using System.Collections.Generic;
using Eproject.ECS.Bll;

public partial class TestForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RoleBusiness RB = new RoleBusiness();
            List<String> roles = RB.GetRoleNames();

            foreach (String item in roles)
            {
                DropDownList1.Items.Add(item);
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            AccountBusiness AB = new AccountBusiness();
            AB.CreateAccount(TextBox2.Text.Trim(), TextBox4.Text.Trim(), TextBox5.Text.Trim(), DropDownList1.Text);
            Label1.Text = "Create successfull";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox7.Text = SecurityHelper.Instance.GetMd5Hash(TextBox6.Text);
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if(SecurityHelper.Instance.VerifyMd5Hash("4500", TextBox7.Text))
            Label2.Text="Match";
        else
            Label2.Text = "Noooooooooooooooo Match";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox8.Text = SecurityHelper.Instance.DecryptCryptography(TextBox6.Text, true);
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        TextBox6.Text = SecurityHelper.Instance.EncryptCryptography(TextBox6.Text, true);
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        try
        {
            AccountBusiness AB = new AccountBusiness();
            Account acc = AB.GetAccount(TextBox1.Text.Trim());
            Label1.Text = "";
            TextBox2.Text = acc.Employee_Id.ToString();
            DropDownList1.Text = acc.Role_Name;
            TextBox4.Text = acc.Account_UserName;
            TextBox5.Text = acc.Account_Password;
            CheckBox1.Checked = acc.Account_IsLocked;
            CheckBox2.Checked = acc.Account_IsDelete;
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
            TextBox2.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        try
        {
            AccountBusiness AB = new AccountBusiness();
            Account acc = AB.GetAccount(TextBox1.Text.Trim());
            AB.UpdateAccount(acc.Account_Id, TextBox5.Text, DropDownList1.Text, CheckBox1.Checked, CheckBox2.Checked);
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        try
        {
            AccountBusiness AB = new AccountBusiness();
            Account acc = AB.GetAccount(TextBox1.Text.Trim());
            AB.RemoveAccount(acc.Account_Id);
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        try
        {
            AccountBusiness AB = new AccountBusiness();
            Account acc = AB.GetAccount(TextBox1.Text.Trim());
            AB.DeleteAccount(acc.Account_Id);
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        try
        {
            AccountBusiness AB = new AccountBusiness();
            Account acc = AB.GetAccount(TextBox1.Text.Trim());
            AB.RestoreAccount(acc.Account_Id);
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void RequiredFieldValidator1_DataBinding(object sender, EventArgs e)
    {
        TextBox4.CssClass = "inp-form-error";
    }
}
