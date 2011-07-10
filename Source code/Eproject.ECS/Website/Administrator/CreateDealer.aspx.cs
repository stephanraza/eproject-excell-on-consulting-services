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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected Dealer GetDataForm()
    {
        Dealer dealer = new Dealer();
        if (!string.IsNullOrEmpty(txtName.Text))
        {
            dealer.Dealer_Name = txtName.Text;
        }
        dealer.Dealer_Phone = txtPhoneNumber.Text;
        dealer.Dealer_Email = txtEmail.Text;
        dealer.Dealer_Address = txtAddress.Text;
        if (ddlCompany != null)
        {
            dealer.Company_Id = new Guid(ddlCompany.SelectedValue);
        }
        return dealer;
    }

    protected void BindDataDropDownList()
    {
         
        //DataTable table =c 
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
}
