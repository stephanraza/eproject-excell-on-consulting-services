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

public partial class HRManager_CreateDepartment : System.Web.UI.Page
{
    private DepartmentBusiness DB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        DB = new DepartmentBusiness();

        String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            if (DB.IsExist(txtName.Text.Trim()))
            {
                pnlRed.Visible = true;
                lblError.Text = "This department with the name '" + txtName.Text.Trim() + "' existed.";
                hplnkRed.Text = "Please try again.";
                hplnkRed.NavigateUrl = "";
                return;
            }

            DB.CreateDepartment(Guid.NewGuid(), txtName.Text.Trim(), txtDescription.Text.Trim());

            pnlGreen.Visible = true;
            lblSuccess.Text = "A new department has been created successfully.";
            hplnkGreen.Text = "Go to Manage panel";
            hplnkGreen.NavigateUrl = WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage";
            Reset();
        }
    }

    private void Reset()
    {
        txtName.Text = "";
        txtDescription.Text = "";
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
}
