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

public partial class Administrator_CreateDealer : System.Web.UI.Page
{
    CompanyBLL company = new CompanyBLL();
    DealerBLL dealerBll = new DealerBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataDropDownList();
        }
    }

    #region Function
    protected Dealer GetDataForm()
    {
        Dealer dealer = new Dealer();
        if (!string.IsNullOrEmpty(txtName.Text))
        {
            dealer.Dealer_Name = txtName.Text;
        }
        else
        {
            return null;
        }
        dealer.Dealer_Phone = txtPhoneNumber.Text;
        dealer.Dealer_Email = txtEmail.Text;
        dealer.Dealer_Address = txtAddress.Text;
        if (ddlCompany != null)
        {
            dealer.Company_Id = new Guid(ddlCompany.SelectedValue);
        }
        else
        {
            return null;
        }
        return dealer;
    }

    protected void ResetForm()
    {
        txtName.Text = "";
        txtPhoneNumber.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";

    }

    private void PreviewForm(Dealer dealer)
    {
        ltrName.Text = dealer.Dealer_Name;
        ltrPhoneNumber.Text = dealer.Dealer_Phone;
        ltrAddress.Text = dealer.Dealer_Address;
        ltrEmail.Text = dealer.Dealer_Email;
        string companyId = dealer.Company_Id.ToString();
        DataRow dataRow = company.Company_ShowOnewDisplay(companyId);
        ltrCompanyName.Text = dataRow["Company_Name"].ToString();
        ltrDescription.Text = dataRow["Company_Description"].ToString();
    }

    #endregion

    protected void BindDataDropDownList()
    {

        DataTable table = company.Company_ShowAllDisplay("");
        ddlCompany.Items.Clear();
        for (int i = 0; i < table.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = table.Rows[i]["Company_Name"].ToString();
            item.Value = table.Rows[i]["Company_Id"].ToString();
            ddlCompany.Items.Add(item);
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (GetDataForm() == null)
        {
            pnlRed.Visible = true;
            lblError.Text = "Please check data.";
            return;
        }

        Dealer entity = GetDataForm();

        if (dealerBll.Dealer_Insert(entity) == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not success !!!";
            return;
        }
        pnlRed.Visible = false;
        pnlGreen.Visible = true;
        lblSuccess.Text = "Create new a dealer successfully!";
        pnlPreviewCustomer.Visible = true;
        PreviewForm(entity);
        ResetForm();
    }


}
