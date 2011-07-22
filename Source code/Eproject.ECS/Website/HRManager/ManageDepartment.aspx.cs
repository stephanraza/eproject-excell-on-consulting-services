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

public partial class HRManager_ManageDepartment : System.Web.UI.Page
{
    private DepartmentBusiness DB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        DB = new DepartmentBusiness();
        GetRouteData();
        loadData();
        if (IsPostBack)
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

        String value = "";
        if (Session["return"] != null)
            value = Session["return"].ToString();

        if (!String.IsNullOrEmpty(value))
        {
            if (value.Equals("null"))
            {
                pnlYellow.Visible = true;
                lblMessage.Text = "You must choose an department to modify or view details.";
                hplnkYellow.NavigateUrl = "";
                hplnkYellow.Text = "Close and continue.";
            }
            else if (value.Equals("modify"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "Department's information has been modified successfully.";
                hplnkGreen.Text = "View detail.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Display/" + id;
            }
            else if (value.Equals("remove"))
            {
                pnlGreen.Visible = true;
                lblSuccess.Text = "A department has been removed successfully, this data could be restored from Trash.";
                hplnkGreen.Text = "Go to trash.";
                hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Trash";
            }
            Session.Remove("return");
        }
    }
    private void loadData()
    {
        List<Department> listDepartment = DB.SearchDepartment(txtSearch.Text.Trim(), false);
        grvManage.DataSource = listDepartment;
        grvManage.DataBind();
    }
    protected String GetDepartmentURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageSystem/Department/Display/" + data.ToString();
        return url;
    }
    protected String GetDepartmentModifyURL(Object data)
    {
        String url = WebHelper.Instance.GetURL() + "ManageSystem/Department/Modify/" + data.ToString();
        return url;
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        loadData();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
        }
    }
    protected void grvManage_Sorting(object sender, GridViewSortEventArgs e)
    {
        List<Department> list = (List<Department>)grvManage.DataSource;
        DataTable dataTable = BusinessHelper.GenericListToDataTable(list);

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            grvManage.DataSource = dataView;
            grvManage.DataBind();
        }
    }
    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;

        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "DESC";
                break;

            case SortDirection.Descending:
                newSortDirection = "ASC";
                break;
        }

        return newSortDirection;
    }
    protected void imgbtnFirst_Click(object sender, ImageClickEventArgs e)
    {
        //grvManage.PageIndex = 0;
        //grvManage.DataBind();
    }
    protected void imgbtnLast_Click(object sender, ImageClickEventArgs e)
    {
        //grvManage.PageIndex = grvManage.PageCount - 1;
        //grvManage.DataBind();
    }
    protected void imgbtnBack_Click(object sender, ImageClickEventArgs e)
    {
        //if (grvManage.PageIndex > 0)
        //{
        //    grvManage.PageIndex = grvManage.PageIndex - 1;
        //    grvManage.DataBind();
        //}
    }
    protected void imgbtnNext_Click(object sender, ImageClickEventArgs e)
    {
        //if (grvManage.PageIndex < grvManage.PageCount - 1)
        //{
        //    grvManage.PageIndex = grvManage.PageIndex + 1;
        //    grvManage.DataBind();
        //}
    }
    protected void imgbtnRemove_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRemove = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRemove.FindControl("hfDepartmentId");

            DB.RemoveDepartment(new Guid(hf.Value));

            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been removed successfully, this data could be restored from Trash.";
            hplnkGreen.Text = "Go to trash.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Trash";
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void imgbtnEditDepartment_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibEdit = (ImageButton)sender;
        HiddenField hf = (HiddenField)ibEdit.FindControl("hfDepartmentId");

        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Modify/" + hf.Value);        
    }
}
