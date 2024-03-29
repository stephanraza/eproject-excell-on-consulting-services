﻿using System;
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

public partial class HRManager_TrashDepartment : System.Web.UI.Page
{
    private DepartmentBusiness DB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        DB = new DepartmentBusiness();

        loadData();
        if (IsPostBack)
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
    }

    private void loadData()
    {
        List<Department> listDepartment = DB.SearchDepartment(txtSearch.Text.Trim(), true);
        grvManage.DataSource = listDepartment;
        grvManage.DataBind();
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

    }
    protected void imgbtnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnNext_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnLast_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibDelete = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibDelete.FindControl("hfDepartmentId");

            DB.DeleteDepartment(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been deleted successfully.";
            hplnkGreen.Text = "Close and continue.";
            hplnkGreen.NavigateUrl = "";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void imgbtnRestore_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton ibRestore = (ImageButton)sender;
            HiddenField hf = (HiddenField)ibRestore.FindControl("hfDepartmentId");

            DB.RestoreDepartment(new Guid(hf.Value));
            loadData();
            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been restored successfully.";
            hplnkGreen.Text = "Go to Manage panel.";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage";
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue.";
            hplnkRed.NavigateUrl = "";
        }
    }
}
