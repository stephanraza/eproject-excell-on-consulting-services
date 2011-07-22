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
using System.IO;
using Eproject.ECS.Entities;
using Eproject.ECS.Bll;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
            Response.Redirect("Account");
    }
    protected void frmLogin_LoggedIn(object sender, EventArgs e)
    {
        DirectoryInfo di = new DirectoryInfo(WebHelper.Instance.GetWebsitePath() + @"Temp\");
        foreach (FileInfo item in di.GetFiles())
        {
            item.Delete();
        }
    }
}
