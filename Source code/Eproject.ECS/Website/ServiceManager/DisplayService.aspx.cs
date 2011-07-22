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

public partial class ServiceManager_DisplayService : System.Web.UI.Page
{
    private ServiceBusiness SB;
    private Guid serviceId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        SB = new ServiceBusiness();

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
            serviceId = new Guid(id);
        }
    }
    private void loadData()
    {
        try
        {
            Service service = SB.GetService(serviceId);
            imgDisplay.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
            lblDisplayName.Text = service.Service_Name;
            lblDisplayDescription.Text = service.Service_Description;
            String charge = SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true);
            lblDisplayCharge.Text = "$ " + charge + " (per day/ per employee)";

            hplnkDisplayModifyService.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Service/Modify/" + serviceId.ToString();
        }
        catch (Exception ex)
        {
            if (Session["return"] == null)
                Session.Add("return", "null");
            else
                Session["return"] = "null";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Service/Manage");
        }
    }
    protected void lnkNumber_Click(object sender, EventArgs e)
    {
        if (Session["search"] == null)
            Session.Add("search", serviceId.ToString());
        else
            Session["search"] = serviceId.ToString();
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Manage");
    }
}
