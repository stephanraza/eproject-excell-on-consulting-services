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
using System.Collections.Generic;
using Eproject.ECS.Bll;
using System.Globalization;

public partial class Statistic : System.Web.UI.Page
{
    private OrderBusiness OB;
    private EmployeeBusiness EB;
    private CompanyBLL CB;

    protected void Page_Load(object sender, EventArgs e)
    {
        OB = new OrderBusiness();
        EB = new EmployeeBusiness();
        CB = new CompanyBLL();

        loadData();
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    private void loadData()
    {
        LoadPanelRightNow();
        LoadChart();
        LoadPanelLatePayments();
        LoadPanelBestServices();
        LoadPanelVipClients();
    }
    private void LoadPanelRightNow()
    {
        int numberOrder = OB.GetOrders(false).Count;
        if (numberOrder == 0 || numberOrder == 1)
            hplnkNumberOrder.Text = numberOrder.ToString() + " order";
        else
            hplnkNumberOrder.Text = numberOrder.ToString() + " orders";
        hplnkNumberOrder.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Order/Manage";

        int numberEmployee = EB.GetEmployees(false).Count;
        if (numberEmployee == 0 || numberEmployee == 1)
            hplnkNumberEmployee.Text = numberEmployee.ToString() + " employee";
        else
            hplnkNumberEmployee.Text = numberEmployee.ToString() + " employees";
        hplnkNumberEmployee.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Employee/Manage";

        int numberCompany = CB.Company_ShowAllDisplay("").Rows.Count;
        if (numberCompany == 0 || numberCompany == 1)
            hplnkNumberCompany.Text = numberCompany.ToString() + " client";
        else
            hplnkNumberCompany.Text = numberCompany.ToString() + " clients";
        hplnkNumberCompany.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Company/Manage";

        String paymentFromDate = DateTime.Now.Month + "/1/" + DateTime.Now.Year;
        String paymentToDate = DateTime.Now.Month + "/" + DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month) + "/" + DateTime.Now.Year;
        List<Order> listOrder = OB.SearchOrder("", "", paymentFromDate, paymentToDate, "", "", "1", false);
        double payment = 0;
        foreach (Order order in listOrder)
        {
            payment += Double.Parse(order.Total_Charge);
        }
        hplnkPayment.Text = ToCurrency(payment);
        hplnkPayment.NavigateUrl = WebHelper.Instance.GetURL() + "ManageService/Order/Manage";

        lblProfit.Text = ToCurrency(payment);
    }
    private void LoadChart()
    {
        DataTable tbl = OB.GetStatisticProfitOfYear(DateTime.Now.Year);

        grvDataTable.DataSource = tbl;
        grvDataTable.DataBind();
    }
    private String ToCurrency(double value)
    {
        return value.ToString("c").Split('.').GetValue(0).ToString();
    }
    private void LoadPanelLatePayments()
    {
        List<Order> list = OB.GetOrdersLatePayments(5);
        foreach (Order order in list)
        {
            order.Total_Charge = ToCurrency(Double.Parse(order.Total_Charge));
        }
        grvLatePayments.DataSource = list;
        grvLatePayments.DataBind();
    }
    private void LoadPanelBestServices()
    {
        DataTable table = OB.GetBestServices(5);
        foreach (DataRow row in table.Rows)
        {
            row["Service_Charge"] = ToCurrency(Double.Parse(row["Service_Charge"].ToString()));
        }
        grvBestService.DataSource = table;
        grvBestService.DataBind();
    }
    private void LoadPanelVipClients()
    {
        DataTable table = OB.GetVIPClients(5);
        foreach (DataRow row in table.Rows)
        {
            row["Payment"] = ToCurrency(Double.Parse(row["Payment"].ToString()));
        }
        
        DataView dv = table.DefaultView;
        dv.Sort = "PaymentValue DESC";
        grvVIPClients.DataSource = dv;
        grvVIPClients.DataBind();
    }
    protected String GetCompanyLPUrl(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageService/Company/Display/" + data.ToString();
        return url;
    }
    protected String GetServiceBSUrl(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageService/Service/Display/" + data.ToString();
        return url;
    }
    protected void lnkLP_Click(object sender, EventArgs e)
    {
        if (Session["search"] == null)
            Session.Add("search", "latePayments");
        else
            Session["search"] = "latePayments";
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Order/Manage");
    }
    protected void lnkBS_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Order/Manage");
    }
}
