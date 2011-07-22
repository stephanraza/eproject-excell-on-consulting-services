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

public partial class ServiceManager_ModifyService : System.Web.UI.Page
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

            imgService.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
            txtServiceName.Text = service.Service_Name;
            txtCharge.Text = SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true);
            txtDescription.Text = service.Service_Description;
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
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                String data = "";
                if (fileUploadImage.HasFile)
                {
                    System.Drawing.Image image = System.Drawing.Image.FromStream(fileUploadImage.PostedFile.InputStream);
                    data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
                }
                SB.UpdateService(serviceId, txtServiceName.Text.Trim(), txtDescription.Text.Trim(), txtCharge.Text.Trim(), data);
                if (Session["return"] == null)
                    Session.Add("return", "modify");
                else
                    Session["return"] = "modify";
                Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Service/Manage/" + serviceId.ToString());
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                hplnkRed.Text = "Please try again.";
                hplnkRed.NavigateUrl = "";
                Service service = SB.GetService(serviceId);
                imgService.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Service/Manage");
    }
    protected void lblRemove_Click(object sender, EventArgs e)
    {
        try
        {
            SB.RemoveService(serviceId);
            if (Session["return"] == null)
                Session.Add("return", "remove");
            else
                Session["return"] = "remove";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Service/Manage");
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue";
            hplnkRed.NavigateUrl = "";
        }
    }
}
