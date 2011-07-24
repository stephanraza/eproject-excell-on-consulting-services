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
using System.Collections.Generic;
using Eproject.ECS.Entities;

public partial class ServiceEmployee_TrashOrder : System.Web.UI.Page
{
    private OrderBusiness OB;
    private ServiceBusiness SB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        OB = new OrderBusiness();
        SB = new ServiceBusiness();

        if (IsPostBack)
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
        else
        {
            List<Service> listService = SB.GetServices();
            ddlService.Items.Clear();
            ListItem item = new ListItem("All", "");
            ddlService.Items.Add(item);
            foreach (Service service in listService)
            {
                item = new ListItem();
                item.Text = service.Service_Name;
                item.Value = service.Service_Id.ToString();
                ddlService.Items.Add(item);
            }
            ddlService.SelectedIndex = 0;

            ddlStatus.Items.Clear();
            ListItem itemStatus = new ListItem("All", "");
            ddlStatus.Items.Add(itemStatus);
            itemStatus = new ListItem("Pending", "0");
            ddlStatus.Items.Add(itemStatus);
            itemStatus = new ListItem("In Progress", "99");
            ddlStatus.Items.Add(itemStatus);
            itemStatus = new ListItem("Resolved", "1");
            ddlStatus.Items.Add(itemStatus);
            ddlStatus.SelectedIndex = 0;
        }
        loadData();
    }
    private void loadData()
    {
        try
        {
            String selectedFrom = ddlFrom.SelectedItem.Value;
            String selectedTo = ddlTo.SelectedItem.Value;

            List<Order> list = OB.SearchOrder(txtSearch.Text.Trim(), ddlService.SelectedItem.Value, txtPaymentFromDate.Text.Trim(), txtPaymentToDate.Text.Trim(), txtBillFromDate.Text.Trim(), txtBillToDate.Text.Trim(), ddlStatus.SelectedItem.Value, true);
            List<Order> listFilter = new List<Order>();
            if (list.Count > 0)
            {
                foreach (Order item in list)
                {
                    double chargeValue = Double.Parse(item.Total_Charge);
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
    protected String GetTotalServiceURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageService/Order/Display/" + data.ToString();
        return url;
    }
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRemove = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRemove.FindControl("hfOrderOfServiceId");

            OB.DeleteOrder(new Guid(hf.Value));

            pnlGreen.Visible = true;
            lblSuccess.Text = "An order has been deleted successfully.";
            hplnkGreen.Text = "Close and continue.";
            hplnkGreen.NavigateUrl = "";
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
    protected void imgbtnRestore_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRestore = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRestore.FindControl("hfOrderOfServiceId");

            OB.RestoreOrder(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "An order has been restored successfully.";
            hplnkGreen.Text = "Go to Manage panel.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Order/Manage";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        loadData();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void ddlFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void ddlTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void txtBillFromDate_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void txtBillToDate_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void txtPaymentFromDate_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void txtPaymentToDate_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
}
