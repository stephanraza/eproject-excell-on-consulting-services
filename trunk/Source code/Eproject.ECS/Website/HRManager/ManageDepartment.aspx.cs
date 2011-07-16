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
        loadData();
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }

    private void loadData()
    {
        List<Department> listDepartment = DB.SearchDepartment(txtSearch.Text.Trim(), false);
        grvManage.DataSource = listDepartment;
        //lblCurrentPage.Text = grvManage.PageIndex.ToString();
        //lblTotalPage.Text = grvManage.PageCount.ToString();
        //grvManage.PageSize = Int32.Parse(ddlPagesize.SelectedValue);
        grvManage.DataBind();
    }

    protected void grvManage_SelectedIndexChanged(object sender, EventArgs e)
    {
        frmManage.ChangeMode(FormViewMode.Edit);
        Label lblId = (Label)grvManage.Rows[grvManage.SelectedIndex].FindControl("lblId");
        Department department = DB.GetDepartment(new Guid(lblId.Text.Trim()));

        List<Department> list = new List<Department>();
        list.Add(department);
        frmManage.DataSource = list;
        frmManage.DataBind();
        frmManage.PageIndex = 1;
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                TextBox txtDescription = (TextBox)frmManage.FindControl("Department_DescriptionTextBox");
                Label lblName = (Label)frmManage.FindControl("Department_NameLabel");
                Label lblId = (Label)grvManage.Rows[grvManage.SelectedIndex].FindControl("lblId");

                DB.UpdateDepartment(new Guid(lblId.Text), lblName.Text, txtDescription.Text, false);

                pnlGreen.Visible = true;
                lblSuccess.Text = "A department has been modified successfully.";
                loadData();
                frmManage.ChangeMode(frmManage.DefaultMode);
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }
        }
    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                TextBox txtName = (TextBox)frmManage.FindControl("Department_NameTextBox");
                TextBox txtDescription = (TextBox)frmManage.FindControl("Department_DescriptionTextBox");

                if (DB.IsExist(txtName.Text.Trim()))
                {
                    pnlRed.Visible = true;
                    lblError.Text = "This department with the name '" + txtName.Text.Trim() + "' existed.";
                    return;
                }

                DB.CreateDepartment(Guid.NewGuid(), txtName.Text.Trim(), txtDescription.Text.Trim());

                pnlGreen.Visible = true;
                lblSuccess.Text = "A new department has been created successfully.";
                loadData();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }
        }
    }

    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            e.Cancel = true;
            frmManage.ChangeMode(frmManage.DefaultMode);
            Label lblId = (Label)grvManage.Rows[e.RowIndex].FindControl("lblId");

            DB.RemoveDepartment((new Guid(lblId.Text)));

            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been removed successfully, this data could be restored from Trash.";
            loadData();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        List<Department> listSearch = DB.SearchDepartment(txtSearch.Text.Trim(), false);
        grvManage.DataSource = listSearch;
        grvManage.DataBind();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.", txtSearch.Text.Trim());
        }
    }
    protected void frmManage_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        e.Cancel = true;
        frmManage.ChangeMode(frmManage.DefaultMode);
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
        grvManage.PageIndex = 0;
        grvManage.DataBind();
    }
    protected void imgbtnLast_Click(object sender, ImageClickEventArgs e)
    {
        grvManage.PageIndex = grvManage.PageCount - 1;
        grvManage.DataBind();
    }
    protected void imgbtnBack_Click(object sender, ImageClickEventArgs e)
    {
        if (grvManage.PageIndex > 0)
        {
            grvManage.PageIndex = grvManage.PageIndex - 1;
            grvManage.DataBind();
        }
    }
    protected void imgbtnNext_Click(object sender, ImageClickEventArgs e)
    {
        if (grvManage.PageIndex < grvManage.PageCount - 1)
        {
            grvManage.PageIndex = grvManage.PageIndex + 1;
            grvManage.DataBind();
        }
    }
}
