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
using Eproject.ECS.Dal;
using System.Collections.Generic;
using Eproject.ECS.Entities;
using System.Reflection;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DBHelper db = DBHelper.Instance;

        //List<Object> list = db.GetAllRecordsFromTable(TableType.Account, DeleteType.No);

        //List<Account> listAcc = new List<Account>();

        //foreach (object item in list)
        //{
        //    Account acc1 = (Account)item;
        //    listAcc.Add(acc1);
        //}

        //Account acc = listAcc[0];
        //Label1.Text = acc.Account_Id + " " + acc.Employee_Id + " " + acc.Role_Name + " " + acc.Account_UserName + " " + acc.Account_Password + acc.Account_IsDelete;

        DBHelper db = DBHelper.Instance;
        db.Select("Account", null, null, 0, 0);
       

        //Account acc = new Account();
        //Label1.Text = typeof().ToString();
        //Assembly assembly = Assembly.LoadFrom(Server.MapPath("") + @"\Bin\Eproject.ECS.Entities.dll");
        //Label1.Text = assembly.GetType("Eproject.ECS.Entities.Account").ToString();
        //Label1.Text = assembly.GetName().Name;
    }
}
