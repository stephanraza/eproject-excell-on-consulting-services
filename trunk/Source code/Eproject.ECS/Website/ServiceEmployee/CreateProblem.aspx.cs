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

public partial class ServiceEmployee_CreateProblem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataDropDownList();
            
        }
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    #region  Private  Member
    private ProblemBLL problem = new ProblemBLL();
    private CustomerBLL customer = new CustomerBLL();
    private CompanyBLL company = new CompanyBLL();
    private CustomerOfCompanyBLL customerOfCompanyBll = new CustomerOfCompanyBLL();
    private ProblemOfCustomerBLL problemOfCustomerBll = new ProblemOfCustomerBLL();
    #endregion

    #region Function
    protected Problem GetDataForm()
    {
        Problem problem = new Problem();
        problem.Problem_Id = Guid.NewGuid();
        if (!string.IsNullOrEmpty(txtTitle.Text))
        {
            problem.Problem_Title = txtTitle.Text;
        }
        else
        {
            return null;
        }
        problem.Problem_Content = txtContent.Text;
        return problem;
    }
    protected void BindDataDropDownList()
    {

        DataTable table = customer.Customer_ShowAllDisplay();
        ddlCustomer.Items.Clear();
        for (int i = 0; i < table.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = table.Rows[i]["Customer_FulName"].ToString();
            item.Value = table.Rows[i]["Customer_Id"].ToString();
            ddlCustomer.Items.Add(item);
        }

        DataTable dataTable = company.Company_ShowAllDisplay("");
        ddlCompany.Items.Clear();
        for (int i = 0; i < dataTable.Rows.Count; i++)
        {
            ListItem items = new ListItem();
            items.Text = dataTable.Rows[i]["Company_Name"].ToString();
            items.Value = dataTable.Rows[i]["Company_Id"].ToString();
            ddlCompany.Items.Add(items);
        }
    }
   
  
    protected void ResetForm()
    {
        txtTitle.Text = "";
        txtContent.Text = "";

    }
    #endregion

    #region Action
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (GetDataForm() == null)
        {
            pnlRed.Visible = true;
            lblError.Text = "Please check data.";
            return;
        }

        Problem entity = GetDataForm();
        if (problem.Problem_Insert(entity) == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }

        ProblemOfCustomer problemOfCustomer = new ProblemOfCustomer();
        problemOfCustomer.Company_Id = new Guid(ddlCompany.SelectedValue);
        problemOfCustomer.Customer_Id = new Guid(ddlCustomer.SelectedValue);
        if (string.IsNullOrEmpty(txtDate.Text))
        {
            problemOfCustomer.ProblemOfCustomer_Date = DateTime.Now;
        }
        else
        {
            problemOfCustomer.ProblemOfCustomer_Date = DateTime.Parse(txtDate.Text);
        }
        problemOfCustomer.Problem_Id = entity.Problem_Id;
        if (!problemOfCustomerBll.ProblemOfCustomer_Insert(problemOfCustomer))
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }

        if (customerOfCompanyBll.CustomerOfCompany_Check(problemOfCustomer.Company_Id.ToString(), problemOfCustomer.Customer_Id.ToString()))
        {
            pnlRed.Visible = false;
            pnlGreen.Visible = true;
            lblSuccess.Text = "Create successfully!";
            BindDataDropDownList();
        }
        CustomerOfCompany customerOfCompany = new CustomerOfCompany();
        customerOfCompany.Customer_Id = problemOfCustomer.Customer_Id;
        customerOfCompany.Company_Id = problemOfCustomer.Company_Id;
        if (customerOfCompanyBll.CustomerOfCompany_Check(customerOfCompany.Company_Id.ToString(), customerOfCompany.Customer_Id.ToString()))
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not Insert CustomerOfCompany";
            return;
        }
        customerOfCompanyBll.CustomerOfCompany_Insert(customerOfCompany);      
        pnlRed.Visible = false;
        pnlGreen.Visible = true;
        lblSuccess.Text = "Create successfully!";       
        ResetForm();
        BindDataDropDownList();
    }  
    #endregion
}
