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

public partial class ServiceEmployee_CreateCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    Customer customer = new Customer();

    CustomerBLL customerBll = new CustomerBLL();

    protected Customer GetDataForm()
    {
        Customer customer = new Customer();
        if (!string.IsNullOrEmpty(txtName.Text))
        {
            customer.Customer_FulName = txtName.Text;
        }
        else
        {
            return null;
        }
        customer.Customer_Phone = txtPhoneNumber.Text;
        customer.Customer_Address = txtAddress.Text;
        string filePath = "";
        return customer;
    }

    protected void ResetForm()
    {
        txtName.Text = "";
        txtPhoneNumber.Text = "";
        txtAddress.Text = "";
    }

    private void PreviewForm(Customer customer)
    {
        ltrName.Text = customer.Customer_FulName;
        ltrPhone.Text = customer.Customer_Phone;
        ltrAddress.Text = customer.Customer_Address;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (GetDataForm() == null)
        {
            pnlRed.Visible = true;
            lblError.Text = "Please check data.";
            return;
        }
        Customer entity = GetDataForm();
        if (customerBll.Customer_Insert(entity) == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }
        pnlRed.Visible = false;
        pnlGreen.Visible = true;
        lblSuccess.Text = "Create new a customer successfully!";
        pnlPreviewCustomer.Visible = true;
        PreviewForm(entity);
        ResetForm();
    }
}
