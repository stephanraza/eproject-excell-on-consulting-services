// -----------------------------------------------------------------------
// <copyright file="OrderBusiness.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
using Eproject.ECS.Dal;

namespace Eproject.ECS.Bll
{
    /// <summary>
    /// The OrderBusiness class is responsible for managing Eproject.ECS.Entities.Order objects in the system.
    /// </summary>
    public class OrderBusiness
    {
        OrderDAL OD = new OrderDAL();
        /// <summary>
        /// Create an order.
        /// </summary>
        /// <param name="order">The object of order that you want to create.</param>
        public void CreateOrder(Guid OrderOfService_Id, Guid Company_Id, Guid Employee_Id, String OrderOfService_Description, String OrderOfService_PaymentMethod, DateTime OrderOfService_PaymentDate, DateTime OrderOfService_BillDate, int OrderOfService_Status)
        {
            try
            {
                OrderOfService order = new OrderOfService();
                order.Company_Id = Company_Id;
                order.Employee_Id = Employee_Id;
                order.OrderOfService_BillDate = OrderOfService_BillDate;
                order.OrderOfService_Description = OrderOfService_Description;
                order.OrderOfService_Id = OrderOfService_Id;
                order.OrderOfService_PaymentDate = OrderOfService_PaymentDate;
                order.OrderOfService_PaymentMethod = OrderOfService_PaymentMethod;
                order.OrderOfService_Status = OrderOfService_Status;

                int result = OD.CreateOrder(order);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Create detail of order.
        /// </summary>
        /// <param name="orderDetail">The object of detail that you want to create.</param>
        public void CreateOrderDetail(Guid OrderOfService_Id, Guid Service_Id, DateTime OrderOfServiceDetail_FromDate, DateTime OrderOfServiceDetail_ToDate, int OrderOfServiceDetail_NumberOfEmployee)
        {
            try
            {
                OrderOfServiceDetail oosd = OD.GetOrderDetail(OrderOfService_Id, Service_Id);
                if (oosd != null)
                    throw new Exception("Information of this order has been created.");
                OrderOfServiceDetail newOrderDetail = new OrderOfServiceDetail();
                newOrderDetail.OrderOfService_Id = OrderOfService_Id;
                newOrderDetail.OrderOfServiceDetail_FromDate = OrderOfServiceDetail_FromDate;
                newOrderDetail.OrderOfServiceDetail_NumberOfEmployee = OrderOfServiceDetail_NumberOfEmployee;
                newOrderDetail.OrderOfServiceDetail_ToDate = OrderOfServiceDetail_ToDate;
                newOrderDetail.Service_Id = Service_Id;

                int result = OD.CreateOrderDetail(newOrderDetail);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all orders in database.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <returns>A list object of order type.</returns>
        public List<OrderOfService> GetOrders(bool isDelete)
        {
            try
            {
                return OD.GetOrders(isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all orders in database by order's id.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <param name="id">Id of order.</param>
        /// <returns>A list object of order type.</returns>
        public List<OrderOfService> GetOrdersByOrderId(Guid id, bool isDelete)
        {
            try
            {
                return OD.GetOrders(id, "OrderOfService", isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all orders in database by employee's id.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <param name="id">Id of employee.</param>
        /// <returns>A list object of order type.</returns>
        public List<OrderOfService> GetOrdersByEmployeeId(Guid id, bool isDelete)
        {
            try
            {
                return OD.GetOrders(id, "Employee", isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all orders in database by company's id.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <param name="id">Id of company.</param>
        /// <returns>A list object of order type.</returns>
        public List<OrderOfService> GetOrdersByCompanyId(Guid id, bool isDelete)
        {
            try
            {
                return OD.GetOrders(id, "Company", isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all details of 1 order.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetAllOrderDetailsByOrderId(Guid orderId)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}'";
                if (orderId != null)
                    where = String.Format(where, orderId.ToString());
                else
                    where = "";

                return OD.GetAllOrderDetails(where);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all details of 1 order.
        /// </summary>
        /// <param name="serviceId">Id of the service.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetAllOrderDetailsByServiceId(Guid serviceId)
        {
            try
            {
                String where = "Service_Id = '{0}'";
                if (serviceId != null)
                    where = String.Format(where, serviceId.ToString());
                else
                    where = "";

                return OD.GetAllOrderDetails(where);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all details of 1 order by order's id.
        /// </summary>
        /// <param name="orderID">Id of the order.</param>
        /// <param name="isDelete">True if these details of oder is deleted, false otherwise.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetOrderDetailsByOrderId(Guid orderID, bool isDelete)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}' AND ";
                if (orderID != null)
                    where = String.Format(where, orderID.ToString());
                else
                    where = "";

                return OD.GetOrderDetails(where, isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all details of 1 order by service's id.
        /// </summary>
        /// <param name="serviceID">Id of the service.</param>
        /// <param name="isDelete">True if these details of oder is deleted, false otherwise.</param>
        /// <returns>A list object of order's detail type.</returns>
        public List<OrderOfServiceDetail> GetOrderDetailsByServiceId(Guid serviceID, bool isDelete)
        {
            try
            {
                String where = "Service_Id = '{0}' AND ";
                if (serviceID != null)
                    where = String.Format(where, serviceID.ToString());
                else
                    where = "";

                return OD.GetOrderDetails(where, isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Delete an order.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        public void DeleteOrder(Guid orderId)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}'";
                if (orderId != null)
                    where = String.Format(where, orderId.ToString());
                else
                    where = "";

                // Delete order details.
                List<OrderOfServiceDetail> listDetail = OD.GetAllOrderDetails(where);
                if (listDetail.Count > 0)
                {
                    foreach (OrderOfServiceDetail item in listDetail)
                    {
                        OD.DeleteOrderDetailByOrderId(orderId);
                    }
                }

                int result = OD.DeleteOrder(orderId);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Delete order's details by order's id.
        /// </summary>
        /// <param name="orderId">Id of order.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public void DeleteOrderDetailByOrderId(Guid orderId)
        {
            try
            {
                int result = OD.DeleteOrderDetailByOrderId(orderId);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Delete order's details by service's id.
        /// </summary>
        /// <param name="serviceId">Id of service.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public void DeleteOrderDetailByServiceId(Guid serviceId)
        {
            try
            {
                int result = OD.DeleteOrderDetailByServiceId(serviceId);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
