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

public partial class Controls_MenuControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String userName = this.Page.User.Identity.Name;
        AccountBusiness AB = new AccountBusiness();
        String role = AB.GetRole(userName);

        Control myUserControl = new Control();
        plcMenu.Controls.Clear();

        if (role != null)
        {
            if (role.Equals("Administrator"))
            {
                myUserControl = (Control)Page.LoadControl("~/Controls/AdminControl.ascx");
            }
            else if (role.Equals("HR Manager"))
            {
                myUserControl = (Control)Page.LoadControl("~/Controls/HRManagerControl.ascx");
            }
            else if (role.Equals("Service Manager"))
            {
                myUserControl = (Control)Page.LoadControl("~/Controls/ServiceManagerControl.ascx");
            }
            else if (role.Equals("Service Employee"))
            {
                myUserControl = (Control)Page.LoadControl("~/Controls/ServiceEmployeeControl.ascx");
            }
            else if (role.Equals("Employee"))
            {
                myUserControl = (Control)Page.LoadControl("~/Controls/EmployeeControl.ascx");
            }
            else
            {
                return;
            }

            plcMenu.Controls.Add(myUserControl);
        }
    }
}
