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

public partial class ServiceEmployee_ManageOrder : System.Web.UI.Page
{
    private OrderBusiness OB;
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        OB = new OrderBusiness();
        loadData();
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    private void loadData()
    {
        //List<Order> listDepartment = DB.SearchDepartment(txtSearch.Text.Trim(), false);
        //grvManage.DataSource = listDepartment;
        //grvManage.DataBind();
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void grvManage_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
}
