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
using System.Globalization;

public partial class ServiceEmployee_ModifyOrder : System.Web.UI.Page
{
    private ServiceBusiness SB;
    private AccountBusiness AB;
    private EmployeeBusiness EB;
    private DepartmentBusiness DB;
    private CompanyBLL CB;
    private OrderBusiness OB;
    private Guid orderId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        SB = new ServiceBusiness();
        AB = new AccountBusiness();
        EB = new EmployeeBusiness();
        DB = new DepartmentBusiness();
        CB = new CompanyBLL();
        OB = new OrderBusiness();

        GetRouteData();
        cvBillDate.ValueToCompare = DateTime.Now.Date.ToShortDateString();
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
            List<Service> listService = SB.GetServices(false);
            ddlService.Items.Clear();
            ddlService.Items.Add("Select service");
            foreach (Service item in listService)
            {
                ddlService.Items.Add(item.Service_Name);
            }

            ddlPaymentMethod.Items.Clear();
            ddlPaymentMethod.Items.Add("Select method");
            ddlPaymentMethod.Items.Add("Cash");
            ddlPaymentMethod.Items.Add("Card");
            ddlPaymentMethod.Items.Add("Online");

            ddlStatus.Items.Clear();
            ddlStatus.Items.Add("Pending");
            ddlStatus.Items.Add("In Progress");
            ddlStatus.Items.Add("Resolved");

            if (Session["orderModify"] != null)
                Session.Remove("orderModify");
            if (Session["listOrderDetailModify"] != null)
                Session.Remove("listOrderDetailModify");

            if (OB.GetOrder(orderId) != null)
                CreateOrderMode();
            else
            {
                if (Session["return"] == null)
                    Session.Add("return", "null");
                else
                    Session["return"] = "null";
                Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Order/Manage");
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
    private String ToCurrency(double value)
    {
        return value.ToString("c").Split('.').GetValue(0).ToString();
    }
    protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlService.SelectedIndex == 0)
            {
                ResetPanel();
                SelectServicesMode();
            }
            else
            {
                Service service = SB.GetService(ddlService.Text);
                imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
                lblServiceName.Text = service.Service_Name;
                lblCharge.Text = SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true);
                lblCharge.Text = ToCurrency(Double.Parse(lblCharge.Text));
                lblDescription.Text = service.Service_Description;
                pnlInfo.Visible = true;

                List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];
                foreach (OrderDetail item in listOrderDetail)
                {
                    if (item.Service_Name.Equals(service.Service_Name))
                    {
                        btnAdd.Visible = false;
                        btnRemove.Visible = true;
                        txtFromDate.Text = item.OrderOfServiceDetail_FromDate;
                        txtToDate.Text = item.OrderOfServiceDetail_ToDate;
                        txtNumberEmployee.Text = item.OrderOfServiceDetail_NumberOfEmployee.ToString();
                        SelectServicesMode();
                        return;
                    }
                }
            }
            ResetForm();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Please try again.";
            hplnkRed.NavigateUrl = "";
        }
    }
    private void ResetForm()
    {
        txtFromDate.Text = "";
        txtToDate.Text = "";
        txtNumberEmployee.Text = "";
        btnAdd.Visible = true;
        btnRemove.Visible = false;
    }
    private void ResetPanel()
    {
        imgAvatar.ImageUrl = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
        lblCharge.Text = "";
        lblServiceName.Text = "";
        lblDescription.Text = "";
        pnlInfo.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                Service service = SB.GetService(ddlService.Text);
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.Service_Id = service.Service_Id;
                orderDetail.Service_Name = service.Service_Name;
                orderDetail.Service_Image = service.Service_Image;
                orderDetail.OrderOfServiceDetail_FromDate = txtFromDate.Text.Trim();
                orderDetail.OrderOfServiceDetail_ToDate = txtToDate.Text.Trim();
                orderDetail.OrderOfServiceDetail_NumberOfEmployee = Int32.Parse(txtNumberEmployee.Text.Trim());

                DateTime toDate = DateTime.Parse(orderDetail.OrderOfServiceDetail_ToDate);
                DateTime fromDate = DateTime.Parse(orderDetail.OrderOfServiceDetail_FromDate);
                double days = (toDate - fromDate).TotalDays;
                double charge = Double.Parse(SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true));
                int employee = orderDetail.OrderOfServiceDetail_NumberOfEmployee;
                double price = days * charge * employee;

                orderDetail.OrderOfServiceDetail_Price = ToCurrency(price);
                List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];
                listOrderDetail.Add(orderDetail);

                grvManage.DataSource = listOrderDetail;
                grvManage.DataBind();
                ddlService.SelectedIndex = 0;
                ResetForm();
                ResetPanel();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
                hplnkRed.Text = "Please try again.";
                hplnkRed.NavigateUrl = "";
            }
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        RemoveService(ddlService.Text);
    }
    private void RemoveService(String name)
    {
        List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];

        foreach (OrderDetail item in listOrderDetail)
        {
            if (item.Service_Name.Equals(name))
            {
                listOrderDetail.Remove(item);
                break;
            }
        }
        if (ddlService.Text.Equals(name))
        {
            btnAdd.Visible = true;
            btnRemove.Visible = false;
        }
        grvManage.DataSource = listOrderDetail;
        grvManage.DataBind();
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void btnChangeOrder_Click(object sender, EventArgs e)
    {
        wizardCreate.ActiveStepIndex = 0;
    }
    protected void wizardCreate_ActiveStepChanged(object sender, EventArgs e)
    {
        int index = wizardCreate.ActiveStepIndex;
        switch (index)
        {
            case 0: CreateOrderMode(); break;
            case 1: SelectServicesMode(); break;
            case 2: PreviewMode(); break;
            default: break;
        }
    }
    private void CreateOrderMode()
    {
        try
        {
            Order order;
            if (Session["orderModify"] == null)
            {
                order = OB.GetOrder(orderId);
            }
            else
            {
                order = (Order)Session["orderModify"];
            }
            lblCompanyName.Text = order.Company_Name;
            lblAccount.Text = order.Account_UserName;
            ddlPaymentMethod.Text = order.OrderOfService_PaymentMethod;
            txtBillDate.Text = order.OrderOfService_BillDate;
            txtPaymentDate.Text = order.OrderOfService_PaymentDate;
            txtDescription.Text = order.OrderOfService_Description;
            if (order.OrderOfService_Status.Equals("Pending"))
                ddlStatus.SelectedIndex = 0;
            else if (order.OrderOfService_Status.Equals("In Progress"))
                ddlStatus.SelectedIndex = 1;
            else if (order.OrderOfService_Status.Equals("Resolved"))
                ddlStatus.SelectedIndex = 2;
        }
        catch (Exception ex)
        {

        }
    }
    private void SelectServicesMode()
    {
        if (Session["listOrderDetailModify"] == null)
        {
            Session.Add("listOrderDetailModify", new List<OrderDetail>());
            List<OrderDetail> listOrderDetailSelected = OB.GetOrderDetailsByOrderId(orderId, false);
            List<OrderDetail> listOrderDetailTemp = (List<OrderDetail>)Session["listOrderDetailModify"];
            foreach (OrderDetail item in listOrderDetailSelected)
            {
                item.OrderOfServiceDetail_Price = ToCurrency(Double.Parse(item.OrderOfServiceDetail_Price));
                listOrderDetailTemp.Add(item);
            }
        }

        List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];

        grvManage.DataSource = listOrderDetail;
        grvManage.DataBind();

        //Fix image
        if (ddlService.SelectedIndex != 0)
        {
            Service service = SB.GetService(ddlService.Text);
            imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
        }
    }
    private void PreviewMode()
    {
        try
        {
            Order order;
            if (Session["orderModify"] == null)
            {
                order = OB.GetOrder(orderId);
            }
            else
            {
                order = (Order)Session["orderModify"];
            }
            DataRow company = CB.Company_ShowOnewDisplay(order.Company_Id.ToString());
            Account account = AB.GetAccountOfEmployee(order.Employee_Id);
            Employee employee = EB.GetEmployee(order.Employee_Id);

            String urlCompany = "";
            if (company["Company_Logo"].ToString().Equals(""))
                urlCompany = WebHelper.Instance.GetURL() + "App_Themes/images/other/no_image.png";
            else
                urlCompany = WebHelper.Instance.GetImageURL(company["Company_Logo"].ToString(), 128, 128, false);
            imgCompany.ImageUrl = urlCompany;
            lblPreviewName.Text = company["Company_Name"].ToString();
            lblPreviewPhone.Text = company["Company_Phone"].ToString();
            lblPreviewEmail.Text = company["Company_Email"].ToString();
            lblPreviewAddress.Text = company["Company_Address"].ToString();
            lblPreviewDescription.Text = company["Company_Description"].ToString();

            imgEmployee.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
            lblPreviewEmployeeName.Text = employee.Employee_FirtName + " " + employee.Employee_LastName;
            lblPreviewAccount.Text = account.Account_UserName;
            lblPreviewEmployeeEmail.Text = employee.Employee_Email;

            lblBillDate.Text = order.OrderOfService_BillDate;
            lblPaymentdate.Text = order.OrderOfService_PaymentDate;
            lblPreviewDescription.Text = order.OrderOfService_Description;

            List<OrderDetail> listOrderDetail;
            if (Session["listOrderDetailModify"] == null)
            {
                listOrderDetail = OB.GetOrderDetailsByOrderId(orderId, false);
            }
            else
            {
                listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];
            }

            if (listOrderDetail.Count == 1)
                lblTotalService.Text = "1 service";
            else if (listOrderDetail.Count > 1)
                lblTotalService.Text = listOrderDetail.Count.ToString() + " services";
            else
                lblTotalService.Text = "";
            double totalPrice = 0;
            foreach (OrderDetail item in listOrderDetail)
            {
                double price = Double.Parse(item.OrderOfServiceDetail_Price, NumberStyles.Currency);
                totalPrice += price;
                item.OrderOfServiceDetail_Price = ToCurrency(price);
            }
            lblTotalCharge.Text = ToCurrency(totalPrice);

            grvPrevew.DataSource = listOrderDetail;
            grvPrevew.DataBind();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Please try again.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void wizardCreate_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        try
        {
            Order order = (Order)Session["orderModify"];
            int status = 0;
            if (order.OrderOfService_Status.Equals("Pending"))
                status = 0;
            else if (order.OrderOfService_Status.Equals("In Progress"))
                status = 99;
            else if (order.OrderOfService_Status.Equals("Resolved"))
                status = 1;
            OB.UpdateOrder(orderId, order.OrderOfService_Description, order.OrderOfService_PaymentMethod, order.OrderOfService_PaymentDate, order.OrderOfService_BillDate, status);

            // Delete all order's details.
            List<OrderOfServiceDetail> list = OB.GetAllOrderDetailsByOrderId(orderId);
            foreach (OrderOfServiceDetail od in list)
            {
                OB.DeleteOrderDetail(od.OrderOfService_Id.ToString(), od.Service_Id.ToString());
            }
            // Create again.
            List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];
            foreach (OrderDetail item in listOrderDetail)
            {
                OB.CreateOrderDetail(orderId, item.Service_Id, DateTime.Parse(item.OrderOfServiceDetail_FromDate), DateTime.Parse(item.OrderOfServiceDetail_ToDate), item.OrderOfServiceDetail_NumberOfEmployee);
            }

            if (Session["orderModify"] != null)
                Session.Remove("orderModify");
            if (Session["listOrderDetailModify"] != null)
                Session.Remove("listOrderDetailModify");

            pnlGreen.Visible = true;
            if (Session["return"] == null)
                Session.Add("return", "modify");
            else
                Session["return"] = "modify";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Order/Manage/" + orderId.ToString());
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Please try again.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void wizardCreate_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        switch (wizardCreate.ActiveStepIndex)
        {
            case 0:
                {
                    if (Session["orderModify"] == null)
                        Session.Add("orderModify", new Order());
                    Order order = (Order)Session["orderModify"];
                    Order orderSelected = OB.GetOrder(orderId);
                    order.Company_Id = orderSelected.Company_Id;
                    order.Employee_Id = orderSelected.Employee_Id;
                    order.OrderOfService_PaymentMethod = ddlPaymentMethod.Text;
                    order.OrderOfService_BillDate = txtBillDate.Text.Trim();
                    order.OrderOfService_PaymentDate = txtPaymentDate.Text.Trim();
                    order.OrderOfService_Description = txtDescription.Text;
                    order.OrderOfService_Status = ddlStatus.Text;
                } break;
            case 1:
                {
                    List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetailModify"];

                    if (listOrderDetail.Count == 0)
                    {
                        pnlRed.Visible = true;
                        lblError.Text = "You must choose at least 1 service to create new order.";
                        hplnkRed.Text = "Please try again.";
                        hplnkRed.NavigateUrl = "";
                        e.Cancel = true;
                    }
                }
                break;
            case 2: break;
            default: break;
        }
    }
    protected void wizardCreate_CancelButtonClick(object sender, EventArgs e)
    {
        if (Session["orderModify"] != null)
            Session.Remove("orderModify");
        if (Session["listOrderDetailModify"] != null)
            Session.Remove("listOrderDetailModify");
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Order/Manage");
    }
    protected void imgbtnRemove_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ib = (ImageButton)sender;
        HiddenField hf = (HiddenField)ib.FindControl("hfServiceName");

        RemoveService(hf.Value);
    }
}
