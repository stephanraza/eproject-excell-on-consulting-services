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
            foreach (Object  item in listObj)
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
            List<Object> listObj = DBHelper.Instance.Select("OrderOfServiceDetail", String.Format("{0} OrderOfServiceDetail_IsDelete = '{1}'",where, isDelete), null, -1, -1);
            foreach (Object item in listObj)
            {
                OrderOfServiceDetail oosd = (OrderOfServiceDetail)item;
                list.Add(oosd);
            }
            return list;
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
        /// Delete order's details by order's id.
        /// </summary>
        /// <param name="orderId">Id of order.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteOrderDetailByOrderId(Guid orderId)
        {
            return DBHelper.Instance.Delete("OrderOfServiceDetail", String.Format("OrderOfService_Id = '{0}'", orderId));
        }
        /// <summary>
        /// Delete order's details by service's id.
        /// </summary>
        /// <param name="serviceId">Id of service.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteOrderDetailByServiceId(Guid serviceId)
        {
            return DBHelper.Instance.Delete("OrderOfServiceDetail", String.Format("Service_Id = '{0}'", serviceId));
        }
    }
}
