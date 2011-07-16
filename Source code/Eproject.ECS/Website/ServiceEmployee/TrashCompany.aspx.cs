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

public partial class ServiceEmployee_TrashCompany : System.Web.UI.Page
{
    CompanyBLL companyBll = new CompanyBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataToGrid(txtSearch.Text);
        }
    }

    protected string FormatLogo(object obj)
    {
        if (obj == null)
        {
            return "";
        }
        return obj.ToString();
    }

    protected void BindDataToGrid(string keySearch)
    {
        // imgAvatar.ImageUrl = WebHelper.Instance.GetImageURL(employee.Employee_Avatar, 128, 128, false);
        grvManage.DataSource = companyBll.Company_ShowAllDisplayRemove(keySearch);
        grvManage.DataKeyNames = new string[] { "Company_Id" };
        grvManage.DataBind();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        BindDataToGrid(txtSearch.Text);
    }
    protected void grvManage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        if (grvManage.DataKeys[e.NewSelectedIndex] != null)
        {
            string id = grvManage.DataKeys[e.NewSelectedIndex].Value.ToString();
            companyBll.Company_UpdateStatus(id);
            pnlGreen.Visible = true;
            lblSuccess.Text = "This data restored successfully";
            BindDataToGrid(txtSearch.Text);
        }
    }

    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (grvManage.DataKeys[e.RowIndex] != null)
        {
            string id = grvManage.DataKeys[e.RowIndex].Value.ToString();
            if (companyBll.Company_Delete(id))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Delete successfully";
                BindDataToGrid(txtSearch.Text);
            }
            pnlRed.Visible = true;
            lblError.Text = "This company's data is also related to some other data. It could be not deleted.";
            BindDataToGrid(txtSearch.Text);
        }
    }
}
