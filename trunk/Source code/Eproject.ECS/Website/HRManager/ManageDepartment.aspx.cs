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
        setEventForDeleteButton();
    }

    protected void grvManage_SelectedIndexChanged(object sender, EventArgs e)
    {
        frmManage.PageIndex = grvManage.SelectedIndex;
        frmManage.ChangeMode(FormViewMode.Edit);
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
                grvManage.DataBind();
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
                grvManage.DataBind();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }
        }
    }

    private void setEventForDeleteButton()
    {
        for (int i = 0; i < grvManage.Rows.Count; i++)
        {
            foreach (GridViewRow row in grvManage.Rows)
            {
                ImageButton lnkRemove = (ImageButton)row.FindControl("imgbtnRemove");
                lnkRemove.Attributes.Add("onclick", "return confirmRemove();");
            }
        }

    }
    protected void grvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            e.Cancel = true;
            Label lblId = (Label)grvManage.Rows[e.RowIndex].FindControl("lblId");

            DB.UpdateDepartment(new Guid(lblId.Text), null, null, true);

            pnlGreen.Visible = true;
            lblSuccess.Text = "A department has been removed successfully, this data could be restored from Trash.";
            grvManage.DataBind();
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = DB.SearchDepartment(txtSearch.Text.Trim(), grvManage.PageIndex, grvManage.PageSize, false);
        grvManage.DataBind();
        if (grvManage.Rows.Count == 0)
        {
            pnlRed.Visible = true;
            lblError.Text = String.Format("Can not find data related to the '{0}', you should try again.",txtSearch.Text.Trim());
        }
        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }
}
