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

public partial class ServiceEmployee_DisplayOrder : System.Web.UI.Page
{
    private OrderBusiness OB;
    private Guid orderId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        OB = new OrderBusiness();

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
            orderId = new Guid(id);
        }
    }
    private void loadData()
    {
        try
        {
            Order order = OB.GetOrder(orderId);
            lnkCompany.Text = order.Company_Name;
            lblDisplayAccount.Text = order.Account_UserName;
            lblDisplayBillDate.Text = order.OrderOfService_BillDate;
            lblDisplayPaymentDate.Text = order.OrderOfService_PaymentDate;
            lblDisplayMethod.Text = order.OrderOfService_PaymentMethod;
            lblDisplayDescription.Text = order.OrderOfService_Description;
            lblDisplayStatus.Text = order.OrderOfService_Status;
            lblDisplayTotalCharges.Text = "$ " + order.Total_Charge;
            lblDisplayTotalServices.Text = order.Total_Service;

            List<OrderDetail> listOrderDetail = OB.GetOrderDetailsByOrderId(orderId, order.OrderOfService_IsDelete);

            grvPrevew.DataSource = listOrderDetail;
            grvPrevew.DataBind();

            if (order.OrderOfService_IsDelete)
            {
                lnkRestore.Visible = true;
                pnlLink.Visible = false;
            }
            else
            {
                lnkRestore.Visible = false;
                pnlLink.Visible = true;
                hplnkDisplayModifyOrder.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Order/Modify/" + orderId.ToString();
            }
        }
        catch (Exception ex)
        {
            if (Session["return"] == null)
                Session.Add("return", "null");
            else
                Session["return"] = "null";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Order/Manage");
        }
    }
    protected String GetURL(Object data)
    {
        return WebHelper.Instance.GetImageURL(data.ToString(), 128, 128, false);
    }
    protected void lnkCompany_Click(object sender, EventArgs e)
    {
        Order order = OB.GetOrder(orderId);
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Company/Display/" + order.Company_Id.ToString());
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void lnkRestore_Click(object sender, EventArgs e)
    {
        try
        {
            OB.RestoreOrder(orderId);
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
}
