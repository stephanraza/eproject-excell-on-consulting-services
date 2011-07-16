using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Eproject.ECS.Entities;
using Eproject.ECS.Bll;
using System.IO;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Url.ToString().Contains(".aspx"))
        {
            Response.Redirect(WebHelper.Instance.GetURL() + "Login");
        }
    }
    protected void LoginStatus_LoggedOut(object sender, EventArgs e)
    {
        DirectoryInfo di = new DirectoryInfo(WebHelper.Instance.GetWebsitePath() + @"Temp\");
        foreach (FileInfo item in di.GetFiles())
        {
            item.Delete();
        }
    }
}
