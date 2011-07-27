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
using System.Collections.Generic;

public partial class ServiceManager_TrashService : System.Web.UI.Page
{
    private ServiceBusiness SB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        SB = new ServiceBusiness();
        loadData();
        if (IsPostBack)
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
    }
    protected String GetURL(Object data)
    {
        return WebHelper.Instance.GetImageURL(data.ToString(), 87, 87, false);
    }
    private void loadData()
    {
        List<Service> list = SB.SearchService(txtSearch.Text.Trim(), true);
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
    private String ToCurrency(double value)
    {
        return value.ToString("c").Split('.').GetValue(0).ToString();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        loadData();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
        }
    }
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRemove = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRemove.FindControl("hfServiceId");

            SB.DeleteService(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "A service has been deleted successfully.";
            hplnkGreen.Text = "Close and continue.";
            hplnkGreen.NavigateUrl = "";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void imgbtnRestore_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRestore = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRestore.FindControl("hfServiceId");

            SB.RestoreService(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "A service has been restored successfully.";
            hplnkGreen.Text = "Go to Manage panel.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Service/Manage";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
}
