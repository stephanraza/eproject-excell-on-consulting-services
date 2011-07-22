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

public partial class HRManager_DisplayDepartment : System.Web.UI.Page
{
    private DepartmentBusiness DB;
    private Guid departmentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        DB = new DepartmentBusiness();

        GetRouteData();
        if (!IsPostBack)
            loadData();
        else
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
    }
    private void GetRouteData()
    {
        String id = "";
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["id"] != null)
            {
                id = RouteCollectionExtensions.RouteData.Values["id"] as String;
            }
        }

        if (!String.IsNullOrEmpty(id))
        {
            departmentId = new Guid(id);
        }
    }
    private void loadData()
    {
        try
        {
            Department department = DB.GetDepartment(departmentId);
            int numberEmployee = DB.GetNumberOfEmployees(departmentId, false);

            lblName.Text = department.Department_Name;
            lblDisplayDescription.Text = department.Department_Description;
            if (numberEmployee > 0)
                lnkNumber.Visible = true;
            else
                lnkNumber.Visible = false;
            lblNumberEmployee.Text = numberEmployee.ToString();

            hplnkDisplayModifyDepartment.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Modify/" + departmentId.ToString();
        }
        catch (Exception ex)
        {
            if (Session["return"] == null)
                Session.Add("return", "null");
            else
                Session["return"] = "null";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage");
        }
    }
    protected void lblRemove_Click(object sender, EventArgs e)
    {
        try
        {
            DB.RemoveDepartment(departmentId);
            if (Session["return"] == null)
                Session.Add("return", "remove");
            else
                Session["return"] = "remove";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage");
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void lnkNumber_Click(object sender, EventArgs e)
    {
        Department dep = DB.GetDepartment(departmentId);
        if (Session["search"] == null)
            Session.Add("search", dep.Department_Name);
        else
            Session["search"] = dep.Department_Name;
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage");
    }
}
