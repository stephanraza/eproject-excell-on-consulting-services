using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class CustomerOfCompanyBLL
    {
        CustomerOfCompanyDAL customer = new CustomerOfCompanyDAL();
        /// <summary>
        /// Insert a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool CustomerOfCompany_Insert(CustomerOfCompany entity)
        {
            return customer.CustomerOfCompany_Insert(entity) > 0;
        }

        /// <summary>
        /// Get DataTable 
        /// </summary>
        /// <returns></returns>
        public DataTable CustomerOfCompany_ShowAllDisplay()
        {
            return customer.CustomerOfCompany_ShowAllDisplay();
        }

        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int CustomerOfCompany_Update(CustomerOfCompany entity)
        {
            return customer.CustomerOfCompany_Update(entity);
        }

        /// <summary>
        /// Update isDelete
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <param name="CustomerOfCompany_IsDelete"></param>
        /// <returns></returns>
        public int CustomerOfCompany_UpdateStatus(string Company_Id, string Customer_Id, bool CustomerOfCompany_IsDelete)
        {
            return customer.CustomerOfCompany_UpdateStatus(Company_Id, Customer_Id, CustomerOfCompany_IsDelete);
        }

        /// <summary>
        /// Delete a row
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <returns></returns>
        public int CustomerOfCompany_Delete(string Company_Id, string Customer_Id)
        {
            return customer.CustomerOfCompany_Delete(Company_Id, Customer_Id);
        }

        /// <summary>
        /// Get a row
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <returns></returns>
        public DataRow CustomerOfCompany_ShowOnewDisplay(string Company_Id, string Customer_Id)
        {
            return customer.CustomerOfCompany_ShowOnewDisplay(Company_Id, Customer_Id);
        }

        /// <summary>
        /// Check
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <returns></returns>
        public bool CustomerOfCompany_Check(string Company_Id, string Customer_Id)
        {
            return customer.CustomerOfCompany_Check(Company_Id, Customer_Id) > 0;
        }

        public DataRow CustomerOfCompany_ShowOne(string Customer_Id)
        {
            return customer.CustomerOfCompany_ShowOne(Customer_Id);
        }
    }
}
