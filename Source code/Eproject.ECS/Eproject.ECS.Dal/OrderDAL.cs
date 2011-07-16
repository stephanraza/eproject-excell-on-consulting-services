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
        /// Get all details of 1 order.
        /// </summary>
        /// <param name="orderID">Id of the order.</param>
        /// <param name="isDelete">True if these details of oder is deleted, false otherwise.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetOrderDetails(Guid orderID, bool isDelete)
        {
            List<OrderOfServiceDetail> list = new List<OrderOfServiceDetail>();
            List<Object> listObj = DBHelper.Instance.Select("OrderOfServiceDetail", String.Format("OrderOfService_Id = '{0}' AND OrderOfServiceDetail_IsDelete = '{1}'",orderID.ToString(), isDelete), null, -1, -1);
            foreach (Object item in listObj)
            {
                OrderOfServiceDetail oosd = (OrderOfServiceDetail)item;
                list.Add(oosd);
            }
            return list;
        }
    }
}
