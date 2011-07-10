using System;
using System.Drawing;
using System.IO;
using Eproject.ECS.Bll;
using Eproject.ECS.Entities;
using System.Diagnostics;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Process p = Process.GetCurrentProcess();
        //ProcessModule pm = p.MainModule;
        //string s = pm.ModuleName;

        //Response.Write(Path.GetFullPath(s)+"<br/>"
        //            + Path.GetFileName(s)+"<br/>"
        //            + Path.GetFileNameWithoutExtension(s)+"<br/>"
        //            + Path.GetDirectoryName(Directory.GetCurrentDirectory())+"<br/>"
        //            + Path.GetPathRoot(Directory.GetCurrentDirectory())+"<br/>"
        //            + Path.GetTempPath()+"<br/>"
        //            + Path.GetTempFileName()+"<br/>"
        //            + Path.GetFullPath(@"Image"));

        try
        {
            EmployeeBusiness EB = new EmployeeBusiness();
            Employee em = EB.GetEmployee("em_ko_chat@yahoo.com");

            Image image = WebHelper.Instance.Base64ToImage(em.Employee_Avatar);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}
