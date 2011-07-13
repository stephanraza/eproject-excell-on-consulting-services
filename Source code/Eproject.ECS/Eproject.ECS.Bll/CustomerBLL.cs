using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class CustomerBLL
    {
        CustomerDAL customer = new CustomerDAL();
        public int Customer_Insert(Customer entity)
        {
            return customer.Customer_Insert(entity);
        }

        public int Customer_Update(Customer entity)
        {
            return customer.Customer_Update(entity);
        }

        public DataTable Customer_ShowAllDisplay()
        {
            return customer.Customer_ShowAllDisplay();
        }

        public DataRow Customer_ShowOnewDisplay(string Customer_Id)
        {
            return customer.Customer_ShowOnewDisplay(Customer_Id);
        }

        public int Customer_UpdateStatus(string Customer_Id, bool Customer_IsDelete)
        {
            return customer.Customer_UpdateStatus(Customer_Id, Customer_IsDelete);
        }

        public int Customer_Delete(string Customer_Id)
        {
            return customer.Customer_Delete(Customer_Id);
        }

    }
}
