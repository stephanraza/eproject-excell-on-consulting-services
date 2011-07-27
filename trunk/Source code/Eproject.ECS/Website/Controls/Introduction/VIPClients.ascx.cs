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

public partial class Controls_Introduction_VIPClients : System.Web.UI.UserControl
{
    private OrderBusiness OB;
    private CompanyBLL CB;

    protected void Page_Load(object sender, EventArgs e)
    {
        OB = new OrderBusiness();
        CB = new CompanyBLL();

        DataTable dtCompany = CB.Company_ShowAllDisplay("");
        dtCompany.Columns.Add("Payment", typeof(double));
        foreach (DataRow item in dtCompany.Rows)
        {
            Guid comId = new Guid(item["Company_Id"].ToString());
            double companyPayment = 0;
            List<Order> listOrder = OB.GetOrdersByCompanyId(comId, false);
            foreach (Order order in listOrder)
            {
                companyPayment += Double.Parse(order.Total_Charge);
            }
            listOrder = OB.GetOrdersByCompanyId(comId, true);
            foreach (Order order in listOrder)
            {
                companyPayment += Double.Parse(order.Total_Charge);
            }
            item["Payment"] = companyPayment;
        }

        DataView dv = dtCompany.DefaultView;
        dv.Sort = "Payment DESC";

        dtCompany = dv.Table;
        //for (int i = 0; i < newDataTable.Rows.Count; i++)// change 'newDataTable.Rows.Count' by a prametter.
        //{
        //}
        DataRow dr = dtCompany.Rows[0];
        imgCompany1.ImageUrl = WebHelper.Instance.GetImageURL(dr["Company_Logo"].ToString(), 50, 50, false);
        lnkCompanyName1.Text = dr["Company_Name"].ToString();
        lblAddress1.Text = dr["Company_Address"].ToString();

        dr = dtCompany.Rows[1];
        imgCompany2.ImageUrl = WebHelper.Instance.GetImageURL(dr["Company_Logo"].ToString(), 50, 50, false);
        lnkCompanyName2.Text = dr["Company_Name"].ToString();
        lblAddress2.Text = dr["Company_Address"].ToString();

        dr = dtCompany.Rows[2];
        imgCompany3.ImageUrl = WebHelper.Instance.GetImageURL(dr["Company_Logo"].ToString(), 50, 50, false);
        lnkCompanyName3.Text = dr["Company_Name"].ToString();
        lblAddress3.Text = dr["Company_Address"].ToString();
    }
}
