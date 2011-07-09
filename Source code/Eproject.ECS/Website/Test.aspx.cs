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
using System.Data.SqlClient;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DBHelper db = DBHelper.Instance;
        //Account acc = new Account();
        //acc.Account_Id = new Guid();
        //acc.Employee_Id = new Guid("71801c3f-5a51-45c4-a6db-0b3220677b85");
        //acc.Account_UserName = "aaaa";
        //acc.Account_Password = "123123";
        //acc.Role_Name = "Employee";
        //acc.Account_IsDelete = false;

        //SqlCommand Command = new SqlCommand();
        //Command.Connection = new SqlConnection(AppConfiguration.ConnectionString);

        //String query = "Delete from {0} where {2}";

        //String TableName = acc.GetType().ToString().Split('.')[3];
        //String ParametersString = "";
        //PropertyInfo pi = (PropertyInfo)acc.GetType().GetProperties().GetValue(0);
        //String Where = pi.Name + " = " + pi.GetValue(acc, null);

        //foreach (PropertyInfo property in acc.GetType().GetProperties())
        //{
        //    String ParameterName = "@" + property.Name;
        //    ParametersString += property.Name + " = " + ParameterName + ",";
        //    Command.Parameters.AddWithValue(ParameterName, property.GetValue(acc, null));
        //}

        //ParametersString = ParametersString.Substring(0, ParametersString.Length - 1);

        //Command.CommandText = String.Format(query, TableName, Where);

        //Label1.Text = Command.CommandText;
    }
}
