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
            List<Role> roles = RB.GetAllRoles();

            foreach (Role item in roles)
            {
                DropDownList1.Items.Add(item.Role_Name);
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Account acc = new Account();
        acc.Role_Name = DropDownList1.Text;
        acc.Account_UserName = TextBox4.Text.Trim();
        acc.Account_Password = TextBox5.Text.Trim();

        AccountBusiness AB = new AccountBusiness();
        if (AB.CreateAccount(acc))
            Label1.Text = "Create successfully!";
        else
            Label1.Text = "Create error";
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
}
