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
using System.Threading;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.OnClientClick = "process('" + panel1.ClientID + "')";
        if (!IsPostBack)
        {
            ddl.Items.Add("A");
            ddl.Items.Add("B");
            ddl.Items.Add("C");
            ddl.Items.Add("D");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        panel1.Visible = false;
        Thread.Sleep(3000);
        Label1.Text = TextBox1.Text;
        panel1.Visible = true;
        
    }
    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = ((DropDownList)sender).Text;
    }
    protected void ddl_TextChanged(object sender, EventArgs e)
    {
        TextBox1.Text = ((DropDownList)sender).Text;
    }
}
