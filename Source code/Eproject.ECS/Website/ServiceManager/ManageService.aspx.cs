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
using System.Collections.Generic;

public partial class ServiceManager_ManageService : System.Web.UI.Page
{
    private ServiceBusiness SB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        SB = new ServiceBusiness();
        GetRouteData();
        loadData();
        if (IsPostBack)
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

        String value = "";
        if (Session["return"] != null)
            value = Session["return"].ToString();

        if (!String.IsNullOrEmpty(value))
        {
            if (value.Equals("null"))
            {
                pnlYellow.Visible = true;
                lblMessage.Text = "You must choose a service to modify or view details.";
                hplnkYellow.NavigateUrl = "";
                hplnkYellow.Text = "Close and continue.";
            }
            else if (value.Equals("modify"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Service's information has been modified successfully.";
                hplnkGreen.Text = "View detail.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Service/Display/" + id;
            }
            else if (value.Equals("remove"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "A service has been removed successfully, this data could be restored from Trash.";
                hplnkGreen.Text = "Go to trash.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Service/Trash";
            }
            Session.Remove("return");
        }
    }
    private void loadData()
    {
        List<Service> list = SB.SearchService(txtSearch.Text.Trim(), false);
        if (list.Count > 0)
        {
            foreach (Service item in list)
            {
                item.Service_Charge = SecurityHelper.Instance.DecryptCryptography(item.Service_Charge, true);
                item.Service_Charge = ToCurrency(Double.Parse(item.Service_Charge));
            }
        }
        grvManage.DataSource = list;
        grvManage.DataBind();
    }
    protected String GetURL(Object data)
    {
        return WebHelper.Instance.GetImageURL(data.ToString(), 87, 87, false);
    }
    private String ToCurrency(double value)
    {
        return value.ToString("c").Split('.').GetValue(0).ToString();
    }
    protected String GetServiceURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageService/Service/Display/" + data.ToString();
        return url;
    }
    protected String GetServiceModifyURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageService/Service/Modify/" + data.ToString();
        return url;
    }
    protected void imgbtnRemove_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRemove = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRemove.FindControl("hfServiceId");

            SB.RemoveService(new Guid(hf.Value));

            pnlGreen.Visible = true;
            lblSuccess.Text = "A service has been removed successfully, this data could be restored from Trash.";
            hplnkGreen.Text = "Go to trash.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Service/Trash";
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibEdit = (ImageButton)sender;
        HiddenField hf = (HiddenField)ibEdit.FindControl("hfServiceId");

        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Service/Modify/" + hf.Value); 
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        SearchByCharge();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    private void SearchByCharge()
    {
        try
        {
            String selectedFrom = ddlFrom.SelectedItem.Value;
            String selectedTo = ddlTo.SelectedItem.Value;

            List<Service> list = SB.SearchService(txtSearch.Text.Trim(), false);
            List<Service> listFilter = new List<Service>();
            if (list.Count > 0)
            {
                foreach (Service item in list)
                {
                    String charge = SecurityHelper.Instance.DecryptCryptography(item.Service_Charge, true);
                    double chargeValue = Double.Parse(charge);
                    if (selectedTo.Equals("max"))
                    {
                        double selectedFromValue = Double.Parse(selectedFrom);
                        if (chargeValue >= selectedFromValue)
                            listFilter.Add(item);
                    }
                    else
                    {
                        double selectedFromValue = Double.Parse(selectedFrom);
                        double selectedToValue = Double.Parse(selectedTo);
                        if (chargeValue >= selectedFromValue && chargeValue <= selectedToValue)
                            listFilter.Add(item);
                    }
                }
                if (listFilter.Count > 0)
                {
                    foreach (Service item in listFilter)
                    {
                        item.Service_Charge = SecurityHelper.Instance.DecryptCryptography(item.Service_Charge, true);
                    }
                }
            }
            grvManage.DataSource = listFilter;
            grvManage.DataBind();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void ddlFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchByCharge();
    }
    protected void ddlTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchByCharge();
    }
}
