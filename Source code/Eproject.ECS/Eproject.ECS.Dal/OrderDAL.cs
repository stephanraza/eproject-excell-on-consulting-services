// -----------------------------------------------------------------------
// <copyright file="OrderDAL.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
using System.Data.SqlClient;
using System.Data;

namespace Eproject.ECS.Dal
{
    /// <summary>
    /// The OrderDAL class is responsible for interacting with the database to retrieve and store information
    /// about Order objects.
    /// </summary>
    public class OrderDAL
    {
        /// <summary>
        /// Create an order.
        /// </summary>
        /// <param name="order">The object of order that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int CreateOrder(OrderOfService order)
        {
            return DBHelper.Instance.Insert(order);
        }
        /// <summary>
        /// Create detail of order.
        /// </summary>
        /// <param name="orderDetail">The object of detail that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int CreateOrderDetail(OrderOfServiceDetail orderDetail)
        {
            return DBHelper.Instance.Insert(orderDetail);
        }
        /// <summary>
        /// Get an order's detail.
        /// </summary>
        /// <param name="orderId">Id of order's detail.</param>
        /// <param name="serviceId">Id of service.</param>
        /// <returns>An order's detail.</returns>
        public OrderOfServiceDetail GetOrderDetail(Guid orderId, Guid serviceId)
        {
            return (OrderOfServiceDetail)DBHelper.Instance.SelectFirst("OrderOfServiceDetail", String.Format("OrderOfService_Id = '{0}' AND Service_Id = '{1}'", orderId, serviceId));
        }
        /// <summary>
        /// Get an order by id.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        /// <returns>An object of order type.</returns>
        public OrderOfService GetOrder(Guid orderId)
        {
            return (OrderOfService)DBHelper.Instance.SelectFirst("OrderOfService", String.Format("OrderOfService_Id = '{0}'", orderId));
        }
        /// <summary>
        /// Get all orders in database.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <returns>A list object of order type.</returns>
        public List<OrderOfService> GetOrders(bool isDelete)
        {
            List<OrderOfService> list = new List<OrderOfService>();
            List<Object> listObj = DBHelper.Instance.Select("OrderOfService", String.Format("OrderOfService_IsDelete = '{0}'", isDelete), null, -1, -1);
            foreach (Object item in listObj)
            {
                OrderOfService oos = (OrderOfService)item;
                list.Add(oos);
            }
            return list;
        }
        /// <summary>
        /// Get all orders in database by id.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <param name="type">Type of id.</param>
        /// <returns>A list object of order type.</returns>
        public List<OrderOfService> GetOrders(Guid id, String type, bool isDelete)
        {
            String content = "{0}_Id = '{1}' AND";
            if (id != null && !String.IsNullOrEmpty(type))
                content = String.Format(content, type, id);
            else
                content = "";
            List<OrderOfService> list = new List<OrderOfService>();
            List<Object> listObj = DBHelper.Instance.Select("OrderOfService", String.Format("{0} OrderOfService_IsDelete = '{1}'", content, isDelete), null, -1, -1);
            foreach (Object item in listObj)
            {
                OrderOfService oos = (OrderOfService)item;
                list.Add(oos);
            }
            return list;
        }
        /// <summary>
        /// Get a list details of 1 order by filter.
        /// </summary>
        /// <param name="where">Condition to get the order's details.</param>
        /// <param name="isDelete">True if these details of oder is deleted, false otherwise.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetOrderDetails(String where, bool isDelete)
        {
            List<OrderOfServiceDetail> list = new List<OrderOfServiceDetail>();
            List<Object> listObj = DBHelper.Instance.Select("OrderOfServiceDetail", String.Format("{0} OrderOfServiceDetail_IsDelete = '{1}'", where, isDelete), null, -1, -1);
            foreach (Object item in listObj)
            {
                OrderOfServiceDetail oosd = (OrderOfServiceDetail)item;
                list.Add(oosd);
            }
            return list;
        }
        /// <summary>
        /// Get the services were best used.
        /// </summary>
        /// <returns>Table of data related services.</returns>
        public DataTable GetBestServices()
        {
            String query = " SELECT oosd.Service_Id, s.[Service_Name], s.Service_Charge, COUNT(oosd.Service_Id)AS Orders"
                         + " FROM OrderOfServiceDetail oosd, [Service] s"
                         + " WHERE oosd.Service_Id=s.Service_Id"
                         + " GROUP BY oosd.Service_Id, s.[Service_Name],s.Service_Charge"
                         + " ORDER BY Orders DESC";
            DBHelper.Instance.OpenConnection();
            SqlDataReader reader = DBHelper.Instance.ExecuteReaderSQL(query);

            DataTable newDataTable = new DataTable();
            newDataTable.Columns.Add("Service_Id", typeof(Guid));
            newDataTable.Columns.Add("Service_Name", typeof(string));
            newDataTable.Columns.Add("Service_Charge", typeof(string));
            newDataTable.Columns.Add("Orders", typeof(string));
            while (reader.Read())
            {
                DataRow dr = newDataTable.NewRow();
                dr["Service_Id"] = reader.GetGuid(0);
                dr["Service_Name"] = reader.GetString(1);
                dr["Service_Charge"] = reader.GetString(2);
                int count = reader.GetInt32(3);
                if (count == 0 || count == 1)
                    dr["Orders"] = count + " order";
                else if (count > 1)
                    dr["Orders"] = count + " orders";
                newDataTable.Rows.Add(dr);
            }
            DBHelper.Instance.CloseConnection();

            return newDataTable;
        }
        /// <summary>
        /// Get the VIP clients.
        /// </summary>
        /// <returns>Table of data related clients.</returns>
        public DataTable GetVIPClients()
        {
            String query = " SELECT c.Company_Id, c.Company_Name, COUNT(c.Company_Id)AS Orders"
                         + " FROM OrderOfService oos, Company c"
                         + " WHERE oos.Company_Id=c.Company_Id"
                         + " GROUP BY c.Company_Id, c.Company_Name";
            DBHelper.Instance.OpenConnection();
            SqlDataReader reader = DBHelper.Instance.ExecuteReaderSQL(query);

            DataTable newDataTable = new DataTable();
            newDataTable.Columns.Add("Company_Id", typeof(Guid));
            newDataTable.Columns.Add("Company_Name", typeof(string));
            newDataTable.Columns.Add("Orders", typeof(string));
            while (reader.Read())
            {
                DataRow dr = newDataTable.NewRow();
                dr["Company_Id"] = reader.GetGuid(0);
                dr["Company_Name"] = reader.GetString(1);
                int count = reader.GetInt32(2);
                if (count == 0 || count == 1)
                    dr["Orders"] = count + " order";
                else if (count > 1)
                    dr["Orders"] = count + " orders";
                newDataTable.Rows.Add(dr);
            }
            DBHelper.Instance.CloseConnection();

            return newDataTable;
        }
        /// <summary>
        /// Get all details of 1 order.
        /// </summary>
        /// <param name="where">Condition to get the order's details.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetAllOrderDetails(String where)
        {
            List<OrderOfServiceDetail> list = new List<OrderOfServiceDetail>();
            List<Object> listObj = DBHelper.Instance.Select("OrderOfServiceDetail", String.Format("{0}", where), null, -1, -1);
            foreach (Object item in listObj)
            {
                OrderOfServiceDetail oosd = (OrderOfServiceDetail)item;
                list.Add(oosd);
            }
            return list;
        }
        /// <summary>
        /// Delete an order.
        /// </summary>
        /// <param name="orderId">Id of order.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteOrder(Guid orderId)
        {
            return DBHelper.Instance.Delete("OrderOfService", String.Format("OrderOfService_Id = '{0}'", orderId));
        }
        /// <summary>
        /// Delete order's detail.
        /// </summary>
        /// <param name="orderId">Id of order.</param>
        /// <param name="serviceId">Id of service.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteOrderDetail(String orderId, String serviceId)
        {
            String where = "";
            String order = "OrderOfService_Id = '{0}'";
            String service = "Service_Id = '{0}'";
            if (!String.IsNullOrEmpty(orderId))
                order = String.Format(order, orderId);
            else
                order = "";
            if (!String.IsNullOrEmpty(serviceId))
                service = String.Format(service, serviceId);
            else
                service = "";

            if (!String.IsNullOrEmpty(order) && !String.IsNullOrEmpty(service))
                where = order + " AND " + service;
            else if (!String.IsNullOrEmpty(order))
                where = order;
            else if (!String.IsNullOrEmpty(service))
                where = service;
            else
                return -1;
            return DBHelper.Instance.Delete("OrderOfServiceDetail", where);
        }
        /// <summary>
        /// Update order's information.
        /// </summary>
        /// <param name="order">The order be updated.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int UpdateOrder(OrderOfService order)
        {
            return DBHelper.Instance.Update(order, String.Format("OrderOfService_Id = '{0}'", order.OrderOfService_Id.ToString()));
        }
        /// <summary>
        /// Update order detail's information.
        /// </summary>
        /// <param name="orderDetail">The order's detail be updated.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int UpdateOrderDetail(OrderOfServiceDetail orderDetail)
        {
            return DBHelper.Instance.Update(orderDetail, String.Format("OrderOfService_Id = '{0}' AND Service_Id = '{1}'", orderDetail.OrderOfService_Id.ToString(), orderDetail.Service_Id.ToString()));
        }
        /// <summary>
        /// Searching order by condition.
        /// </summary>
        /// <param name="where">Condition for searching.</param>
        /// <param name="isDelete">True if these orders of oder is deleted, false otherwise.</param>
        /// <returns>List object of order type.</returns>
        public List<Order> SearchOrder(String where, bool isDelete)
        {
            String query = "SELECT oos.OrderOfService_Id, oos.Company_Id,"
                           + " oos.Employee_Id, a.Account_UserName, c.Company_Name,"
                           + " oos.OrderOfService_Description,oos.OrderOfService_PaymentMethod,"
                           + " oos.OrderOfService_PaymentDate,oos.OrderOfService_BillDate,"
                           + " oos.OrderOfService_Status,oos.OrderOfService_IsDelete"
                           + " FROM Account a JOIN Employee e ON e.Employee_Id = a.Employee_Id"
                           + " JOIN OrderOfService oos ON oos.Employee_Id = e.Employee_Id"
                           + " JOIN Company c ON c.Company_Id = oos.Company_Id"
                           + " WHERE oos.OrderOfService_IsDelete = '{0}' {1}";

            query = String.Format(query, isDelete, where);
            DBHelper.Instance.OpenConnection();
            SqlDataReader reader = DBHelper.Instance.ExecuteReaderSQL(query);

            List<Order> list = new List<Order>();

            while (reader.Read())
            {
                Order order = new Order();
                order.OrderOfService_Id = reader.GetGuid(0);
                order.Company_Id = reader.GetGuid(1);
                order.Employee_Id = reader.GetGuid(2);
                order.Account_UserName = reader.GetString(3);
                order.Company_Name = reader.GetString(4);
                order.OrderOfService_Description = reader.GetString(5);
                order.OrderOfService_PaymentMethod = reader.GetString(6);
                order.OrderOfService_PaymentDate = reader.GetDateTime(7).ToShortDateString();
                order.OrderOfService_BillDate = reader.GetDateTime(8).ToShortDateString();
                switch (reader.GetInt32(9))
                { 
                    case 0:
                        order.OrderOfService_Status = "Pending";
                        break;
                    case 99:
                        order.OrderOfService_Status = "In Progress";
                        break;
                    case 1:
                        order.OrderOfService_Status = "Resolved";
                        break;
                    default:
                        order.OrderOfService_Status = "";
                        break;
                }

                list.Add(order);
            }
            DBHelper.Instance.CloseConnection();

            return list;
        }
    }
}
