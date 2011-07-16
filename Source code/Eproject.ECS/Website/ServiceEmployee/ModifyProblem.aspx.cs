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

public partial class ServiceEmployee_ModifyProblem : System.Web.UI.Page
{
    ProblemBLL problemBll = new ProblemBLL();
    private DataRow dataRow;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["id"] != null)
            {
                String id = RouteCollectionExtensions.RouteData.Values["id"] as String;
                if (string.IsNullOrEmpty(id))
                {
                    Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Problem/Manage/null");
                }
                else
                {
                    DataTable dataTable = problemBll.Problem_ShowOnewDisplay(id);
                    dataRow = dataTable.Rows[0];
                    if (dataRow == null)
                    {
                        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Problem/Manage/null");
                    }
                    else
                    {
                        if (!IsPostBack)
                        {
                            FillData(dataRow);
                        }

                    }
                }
            }
            else
            {
                Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Problem/Manage/null");
            }
        }
    }

    private void FillData(DataRow row)
    {
        lblCompany.Text = row["Company_Name"].ToString();
        Customer_NameLabel.Text = row["Customer_FulName"].ToString();
        ProblemContentTextBox1.Text = row["Problem_Content"].ToString();
        ProblemTitleTextBox1.Text = row["Problem_Title"].ToString();
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        Problem problem = new Problem();
        string problemId = dataRow["Problem_Id"].ToString();
        problem.Problem_Id = new Guid(problemId);
        problem.Problem_Content = ProblemContentTextBox1.Text;
        problem.Problem_Title = ProblemTitleTextBox1.Text;

        if (problemBll.Problem_Update(problem) < 1)
        {
            pnlRed.Visible = true;
            lblError.Text = "Do not successful ";
            return;
        }
        pnlRed.Visible = false;
        pnlGreen.Visible = true;
        lblSuccess.Text = "Edit successfully!";
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Problem/Manage/success");
    }
    protected void UpdateCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageService/Problem/Manage/null");
    }
}
