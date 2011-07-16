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

public partial class ServiceEmployee_CreateOrder : System.Web.UI.Page
{
    private ServiceBusiness SB;
    private AccountBusiness AB;
    private EmployeeBusiness EB;
    private DepartmentBusiness DB;
    private CompanyBLL CB;
    private OrderBusiness OB;

    protected void Page_Load(object sender, EventArgs e)
    {
        //In my content page PageLoad()
        MasterPage mstrPg = this.Master as MasterPage;
        if (mstrPg != null)
        {
            //mstrPg.BodyTag.Attributes.Add("onload", "getInfo()");
            //mstrPg.BodyTag.Attributes.Add("onprerender", "showDialog('gfdghfghf')");
        }

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

        
        cvBillDate.ValueToCompare = DateTime.Now.Date.ToShortDateString();
        if (!IsPostBack)
            loadData();
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    private void loadData()
    {
        List<Service> listService = SB.GetServices(false);
        ddlService.Items.Clear();
        ddlService.Items.Add("Select service");
        foreach (Service item in listService)
        {
            ddlService.Items.Add(item.Service_Name);
        }

        Department department = DB.GetDepartment("Service", false);
        List<Employee> listEmployee = EB.GetEmployees(department.Department_Id, false);
        List<Account> lisAccount = AB.GetAccountsOfEmployees(listEmployee);
        ddlAccount.Items.Clear();
        ddlAccount.Items.Add("Select account");
        foreach (Account item in lisAccount)
        {
            ddlAccount.Items.Add(item.Account_UserName);
        }

        DataTable dataTable = CB.Company_ShowAllDisplay();
        ddlCompanyName.Items.Clear();
        ddlCompanyName.Items.Add("Select company");
        for (int i = 0; i < dataTable.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = dataTable.Rows[i]["Company_Name"].ToString();
            item.Value = dataTable.Rows[i]["Company_Id"].ToString();
            ddlCompanyName.Items.Add(item);
        }
        CreateOrderMode();
    }
    protected String GetURL(Object data)
    {
        return WebHelper.Instance.GetImageURL(data.ToString(), 128, 128, false);
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

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

    private void PreviewMode()
    {
        try
        {
            if (Session["order"] != null)
            {
                Order order = (Order)Session["order"];
                DataRow company = CB.Company_ShowOnewDisplay(order.Company_Id.ToString());
                Account account = AB.GetAccountOfEmployee(order.Employee_Id);
                Employee employee = EB.GetEmployee(order.Employee_Id);

                String urlCompany = "";
                if (company["Company_Logo"].ToString().Equals(""))
                    urlCompany = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
                else
                    urlCompany = WebHelper.Instance.GetImageURL(company["Company_Logo"].ToString(), 128, 128, false);
                imgbtnCompany.ImageUrl = urlCompany;
                lblPreviewName.Text = company["Company_Name"].ToString();
                lblPreviewPhone.Text = company["Company_Phone"].ToString();
                lblPreviewEmail.Text = company["Company_Email"].ToString();
                lblPreviewAddress.Text = company["Company_Address"].ToString();
                lblPreviewDescription.Text = company["Company_Description"].ToString();

                imgbtnEmployee.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
                lblPreviewEmployeeName.Text = employee.Employee_FirtName + " " + employee.Employee_LastName;
                lblPreviewAccount.Text = account.Account_UserName;
                lblPreviewEmployeeEmail.Text = employee.Employee_Email;

                lblBillDate.Text = order.OrderOfService_BillDate.ToShortDateString();
                lblPaymentdate.Text = order.OrderOfService_PaymentDate.ToShortDateString();
                lblPreviewDescription.Text = order.OrderOfService_Description;
            }
            if (Session["listOrderDetail"] != null)
            {
                List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetail"];

                lblTotalService.Text = listOrderDetail.Count.ToString();
                int totalPrice = 0;
                foreach (OrderDetail item in listOrderDetail)
                {
                    int price = Int32.Parse(item.OrderOfServiceDetail_Price);
                    totalPrice += price;
                }
                lblTotalCharge.Text = "$ " + totalPrice.ToString();

                grvPrevew.DataSource = listOrderDetail;
                grvPrevew.DataBind();
            }
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }

    private void CreateOrderMode()
    {
        try
        {
            if (Session["order"] == null)
            {
                Session.Add("order", new Order());
                ddlCompanyName.SelectedIndex = 0;
                ddlAccount.SelectedIndex = 0;
                ddlPaymentMethod.SelectedIndex = 0;
                txtBillDate.Text = "";
                txtPaymentDate.Text = "";
                ddlStatus.SelectedIndex = 0;
                txtDescription.Text = "";
            }
            else
            {
                Order order = (Order)Session["order"];
                DataRow company = CB.Company_ShowOnewDisplay(order.Company_Id.ToString());
                Account account = AB.GetAccountOfEmployee(order.Employee_Id);

                ddlCompanyName.SelectedValue = company["Company_Id"].ToString();
                ddlAccount.Text = account.Account_UserName;
                ddlPaymentMethod.Text = order.OrderOfService_PaymentMethod;
                txtBillDate.Text = order.OrderOfService_BillDate.ToShortDateString();
                txtPaymentDate.Text = order.OrderOfService_PaymentDate.ToShortDateString();
                txtDescription.Text = order.OrderOfService_Description;
                if(order.OrderOfService_Status.Equals("Pending"))
                    ddlStatus.SelectedIndex = 0;
                else if(order.OrderOfService_Status.Equals("In Progress"))
                    ddlStatus.SelectedIndex = 1;
                else if(order.OrderOfService_Status.Equals("Resolved"))
                    ddlStatus.SelectedIndex = 2;
            }
        }
        catch (Exception ex)
        {

        }
    }
    private void SelectServicesMode()
    {
        if (Session["listOrderDetail"] == null)
            Session.Add("listOrderDetail", new List<OrderDetail>());
        List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetail"];

        grvManage.DataSource = listOrderDetail;
        grvManage.DataBind();

        //Fix image
        if (ddlService.SelectedIndex != 0)
        {
            Service service = SB.GetService(ddlService.Text);
            imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
        }
    }
    protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlService.SelectedIndex == 0)
            {
                ResetPanel();
            }
            else
            {
                Service service = SB.GetService(ddlService.Text);
                imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(service.Service_Image, 128, 128, false);
                lblServiceName.Text = service.Service_Name;
                lblCharge.Text = SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true);
                lblDescription.Text = service.Service_Description;
                pnlInfo.Visible = true;

                List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetail"];
                foreach (OrderDetail item in listOrderDetail)
                {
                    if (item.Service_Name.Equals(service.Service_Name))
                    {
                        btnAdd.Visible = false;
                        btnRemove.Visible = true;
                        txtFromDate.Text = item.OrderOfServiceDetail_FromDate.ToShortDateString();
                        txtToDate.Text = item.OrderOfServiceDetail_ToDate.ToShortDateString();
                        txtNumberEmployee.Text = item.OrderOfServiceDetail_NumberOfEmployee.ToString();
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
        }
    }

    private void ResetForm()
    {
        txtFromDate.Text = "";
        txtToDate.Text = "";
        txtNumberEmployee.Text= "";
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
                orderDetail.OrderOfServiceDetail_FromDate = DateTime.Parse(txtFromDate.Text.Trim());
                orderDetail.OrderOfServiceDetail_ToDate = DateTime.Parse(txtToDate.Text.Trim());
                orderDetail.OrderOfServiceDetail_NumberOfEmployee = Int32.Parse(txtNumberEmployee.Text.Trim());

                double days = (orderDetail.OrderOfServiceDetail_ToDate - orderDetail.OrderOfServiceDetail_FromDate).TotalDays;
                int charge = Int32.Parse(SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true));
                int employee = orderDetail.OrderOfServiceDetail_NumberOfEmployee;
                double price = days * charge * employee;

                orderDetail.OrderOfServiceDetail_Price = price.ToString();
                List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetail"];
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
            }
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        RemoveService(ddlService.Text);
    }

    private void RemoveService(String name)
    {
        List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetail"];
        foreach (OrderDetail  item in listOrderDetail)
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
    protected void wizardCreate_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        switch (wizardCreate.ActiveStepIndex)
        {
            case 0:
                {
                    if (Session["order"] == null)
                        Session.Add("order", new Order());
                    Order order = (Order)Session["order"];
                    Account account = AB.GetAccount(ddlAccount.Text);
                    order.Company_Id = new Guid(ddlCompanyName.SelectedValue);
                    order.Employee_Id = account.Employee_Id;
                    order.OrderOfService_PaymentMethod = ddlPaymentMethod.Text;
                    order.OrderOfService_BillDate = DateTime.Parse(txtBillDate.Text);
                    order.OrderOfService_PaymentDate = DateTime.Parse(txtPaymentDate.Text);
                    order.OrderOfService_Description = txtDescription.Text;
                    order.OrderOfService_Status = ddlStatus.Text;
                } break;
            case 1:
                if (Session["listOrderDetail"] == null || ((List<OrderDetail>)Session["listOrderDetail"]).Count == 0)
                {
                    pnlRed.Visible = true;
                    lblError.Text = "You must choose at least 1 service to create new order.";
                    e.Cancel = true;
                }
                break;
            case 2: break;
            default: break;
        }
    }
    protected void grvManage_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblName = (Label)grvManage.Rows[grvManage.SelectedIndex].FindControl("lblName");
        RemoveService(lblName.Text);
    }
    protected void wizardCreate_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        try
        {
            Guid orderId = Guid.NewGuid();
            Order order = (Order)Session["order"];
            int status = 0;
            if (order.OrderOfService_Status.Equals("Pending"))
                status = 0;
            else if (order.OrderOfService_Status.Equals("In Progress"))
                status = 99;
            else if (order.OrderOfService_Status.Equals("Resolved"))
                status = 1;
            OB.CreateOrder(orderId, order.Company_Id, order.Employee_Id, order.OrderOfService_Description, order.OrderOfService_PaymentMethod, order.OrderOfService_PaymentDate, order.OrderOfService_BillDate, status);
            
            List<OrderDetail> listOrderDetail = (List<OrderDetail>)Session["listOrderDetail"];
            foreach (OrderDetail item in listOrderDetail)
            {
                OB.CreateOrderDetail(orderId, item.Service_Id, item.OrderOfServiceDetail_FromDate, item.OrderOfServiceDetail_ToDate, item.OrderOfServiceDetail_NumberOfEmployee);
            }

            if (Session.Count > 0)
                Session.RemoveAll();
            wizardCreate.ActiveStepIndex = 0;
            pnlGreen.Visible = true;
            lblSuccess.Text = "An order has been already created successfully.";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    protected void btnChangeCompany_Click(object sender, EventArgs e)
    {
        wizardCreate.ActiveStepIndex = 0;
    }
    protected void btnChangeEmployee_Click(object sender, EventArgs e)
    {
        wizardCreate.ActiveStepIndex = 0;
    }
    protected void btnChangeOrder_Click(object sender, EventArgs e)
    {
        wizardCreate.ActiveStepIndex = 0;
    }
}
