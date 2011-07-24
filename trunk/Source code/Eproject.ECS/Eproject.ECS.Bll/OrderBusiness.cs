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
using System.Data;

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
        /// Get an order by order's id.
        /// </summary>
        /// <param name="id">Id of order.</param>
        /// <returns>An order object.</returns>
        public Order GetOrder(Guid id)
        {
            try
            {
                Order order = new Order();

                OrderOfService orderService = OD.GetOrder(id);
                FillDataToOrder(order, orderService);

                return order;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void FillDataToOrder(Order order, OrderOfService orderService)
        {
            order.OrderOfService_Id = orderService.OrderOfService_Id;
            order.Company_Id = orderService.Company_Id;
            order.Employee_Id = orderService.Employee_Id;
            order.OrderOfService_BillDate = orderService.OrderOfService_BillDate.ToShortDateString();
            order.OrderOfService_Description = orderService.OrderOfService_Description;
            order.OrderOfService_IsDelete = orderService.OrderOfService_IsDelete;
            order.OrderOfService_PaymentDate = orderService.OrderOfService_PaymentDate.ToShortDateString();
            order.OrderOfService_PaymentMethod = orderService.OrderOfService_PaymentMethod;
            switch (orderService.OrderOfService_Status)
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
                default: break;
            }

            CompanyBLL CB = new CompanyBLL();
            DataRow company = CB.Company_ShowOnewDisplay(orderService.Company_Id.ToString());
            order.Company_Name = company["Company_Name"].ToString();

            AccountBusiness AB = new AccountBusiness();
            Account account = AB.GetAccountOfEmployee(orderService.Employee_Id);
            order.Account_UserName = account.Account_UserName;

            CalculateServicesAndCharges(order, order.OrderOfService_IsDelete);
        }
        /// <summary>
        /// Get all orders in database by employee's id.
        /// </summary>
        /// <param name="isDelete">True if these oders is deleted, false otherwise.</param>
        /// <param name="id">Id of employee.</param>
        /// <returns>A list object of order type.</returns>
        public List<Order> GetOrdersByEmployeeId(Guid id, bool isDelete)
        {
            try
            {
                List<Order> listOrder = new List<Order>();
                List<OrderOfService> list = OD.GetOrders(id, "Employee", isDelete);
                if (list.Count > 0)
                {
                    foreach (OrderOfService item in list)
                    {
                        Order order = new Order();
                        FillDataToOrder(order, item);
                        listOrder.Add(order);
                    }
                }
                return listOrder;
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
        public List<Order> GetOrdersByCompanyId(Guid id, bool isDelete)
        {
            try
            {
                List<Order> listOrder = new List<Order>();
                List<OrderOfService> list = OD.GetOrders(id, "Company", isDelete);
                if (list.Count > 0)
                {
                    foreach (OrderOfService item in list)
                    {
                        Order order = new Order();
                        FillDataToOrder(order, item);
                        listOrder.Add(order);
                    }
                }
                return listOrder;
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
        public List<OrderDetail> GetOrderDetailsByOrderId(Guid orderID, bool isDelete)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}' AND ";
                if (orderID != null)
                    where = String.Format(where, orderID.ToString());
                else
                    where = "";

                List<OrderOfServiceDetail> listDetail = OD.GetOrderDetails(where, isDelete);

                List<OrderDetail> list = new List<OrderDetail>();
                foreach (OrderOfServiceDetail item in listDetail)
                {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderOfService_Id = item.OrderOfService_Id;
                    orderDetail.OrderOfServiceDetail_FromDate = item.OrderOfServiceDetail_FromDate.ToShortDateString();
                    orderDetail.OrderOfServiceDetail_IsDelete = item.OrderOfServiceDetail_IsDelete;
                    orderDetail.OrderOfServiceDetail_NumberOfEmployee = item.OrderOfServiceDetail_NumberOfEmployee;
                    orderDetail.OrderOfServiceDetail_ToDate = item.OrderOfServiceDetail_ToDate.ToShortDateString();

                    ServiceBusiness SB = new ServiceBusiness();
                    Service service = SB.GetService(item.Service_Id);
                    orderDetail.Service_Charge = service.Service_Charge;
                    orderDetail.Service_Description = service.Service_Description;
                    orderDetail.Service_Id = service.Service_Id;
                    orderDetail.Service_Image = service.Service_Image;
                    orderDetail.Service_IsDelete = service.Service_IsDelete;
                    orderDetail.Service_Name = service.Service_Name;

                    DateTime toDate = DateTime.Parse(orderDetail.OrderOfServiceDetail_ToDate);
                    DateTime fromDate = DateTime.Parse(orderDetail.OrderOfServiceDetail_FromDate);
                    double days = (toDate - fromDate).TotalDays;
                    double charge = Double.Parse(SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true));
                    int employee = orderDetail.OrderOfServiceDetail_NumberOfEmployee;
                    double price = days * charge * employee;

                    orderDetail.OrderOfServiceDetail_Price = price.ToString();

                    list.Add(orderDetail);
                }
                return list;
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
        /// Remove an order.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        public void RemoveOrder(Guid orderId)
        {
            try
            {
                // Remove order's details.
                RemoveOrderDetails(orderId);

                OrderOfService order = OD.GetOrder(orderId);
                order.OrderOfService_IsDelete = true;
                int result = OD.UpdateOrder(order);
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
        /// Restore an order.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        public void RestoreOrder(Guid orderId)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}'";
                if (orderId != null)
                    where = String.Format(where, orderId.ToString());
                else
                    where = "";

                OrderOfService order = OD.GetOrder(orderId);
                order.OrderOfService_IsDelete = false;
                int result = OD.UpdateOrder(order);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }

                // Restore order details.
                RestoreOrderDetails(orderId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Update an order.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        /// <param name="description">Description of the order.</param>
        /// <param name="method">Payment method of the order.</param>
        /// <param name="paymentDate">Payment date of the order.</param>
        /// <param name="billDate">Bill date of the order.</param>
        /// <param name="status">Status of the order.</param>
        public void UpdateOrder(Guid orderId, String description, String method, String paymentDate, String billDate, int status)
        {
            OrderOfService order = OD.GetOrder(orderId);
            if (description != null)
                order.OrderOfService_Description = description;
            if (method != null)
                order.OrderOfService_PaymentMethod = method;
            if (paymentDate != null)
                order.OrderOfService_PaymentDate = DateTime.Parse(paymentDate);
            if (billDate != null)
                order.OrderOfService_BillDate = DateTime.Parse(billDate);
            order.OrderOfService_Status = status;

            int result = OD.UpdateOrder(order);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
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
                        OD.DeleteOrderDetail(orderId.ToString(), null);
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
        /// Remove order's details
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        private void RemoveOrderDetails(Guid orderId)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}'";
                if (orderId != null)
                    where = String.Format(where, orderId.ToString());
                else
                    where = "";

                List<OrderOfServiceDetail> listDetail = OD.GetAllOrderDetails(where);
                if (listDetail.Count > 0)
                {
                    foreach (OrderOfServiceDetail item in listDetail)
                    {
                        item.OrderOfServiceDetail_IsDelete = true;
                        int result = OD.UpdateOrderDetail(item);
                        if (result == -1)
                        {
                            throw new Exception("An error occurred while executing this operation.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Restore order's details
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        private void RestoreOrderDetails(Guid orderId)
        {
            try
            {
                String where = "OrderOfService_Id = '{0}'";
                if (orderId != null)
                    where = String.Format(where, orderId.ToString());
                else
                    where = "";

                List<OrderOfServiceDetail> listDetail = OD.GetAllOrderDetails(where);
                if (listDetail.Count > 0)
                {
                    foreach (OrderOfServiceDetail item in listDetail)
                    {
                        item.OrderOfServiceDetail_IsDelete = false;
                        int result = OD.UpdateOrderDetail(item);
                        if (result == -1)
                        {
                            throw new Exception("An error occurred while executing this operation.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Update order's detail.
        /// </summary>
        /// <param name="orderId">Id of the order.</param>
        /// <param name="serviceId">Id of the service in order.</param>
        /// <param name="fromDate">The date begin use service.</param>
        /// <param name="toDate">The date end use service.</param>
        /// <param name="number">Number of employee support service.</param>
        public void UpdateOrderDetail(Guid orderId, Guid serviceId, String fromDate, String toDate, int number)
        {
            OrderOfServiceDetail orderDetail = OD.GetOrderDetail(orderId, serviceId);
            if (fromDate != null)
                orderDetail.OrderOfServiceDetail_FromDate = DateTime.Parse(fromDate);
            if (toDate != null)
                orderDetail.OrderOfServiceDetail_ToDate = DateTime.Parse(toDate);
            orderDetail.OrderOfServiceDetail_NumberOfEmployee = number;

            int result = OD.UpdateOrderDetail(orderDetail);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Delete order's details by order's id.
        /// </summary>
        /// <param name="orderId">Id of order.</param>
        /// <param name="orderId">Id of service.</param>
        public void DeleteOrderDetail(String orderId, String serviceId)
        {
            try
            {
                int result = OD.DeleteOrderDetail(orderId, serviceId);
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
        /// Searching order
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="serviceId">Id of the service.</param>
        /// <param name="paymentDateFrom">Payment date begin.</param>
        /// <param name="paymentDateTo">Payment date end.</param>
        /// <param name="billDateFrom">Bill date begin.</param>
        /// <param name="billDateTo">Bill date end.</param>
        /// <param name="status">Status for searching.</param>
        /// <param name="isDelete">True if these orders are deleted, false otherwise.</param>
        /// <returns>List of order.</returns>
        public List<Order> SearchOrder(String content, String serviceId, String paymentDateFrom, String paymentDateTo, String billDateFrom, String billDateTo, String status, bool isDelete)
        {
            try
            {
                String where = " AND (c.Company_Name LIKE N'%{0}%'"
                               + " OR a.Account_UserName LIKE N'%{0}%'"
                               + " OR oos.OrderOfService_Description LIKE N'%{0}%'"
                               + " OR oos.OrderOfService_PaymentMethod LIKE N'%{0}%')";
                content = content.Replace("'", " ");
                where = String.Format(where, content);

                String conditionService = " AND oos.OrderOfService_Id IN ("
                                          + " SELECT oosd.OrderOfService_Id FROM OrderOfServiceDetail oosd,[Service] s WHERE"
                                          + " oosd.Service_Id = s.Service_Id AND"
                                          + " s.Service_Id = '{0}')";
                if (!String.IsNullOrEmpty(serviceId))
                    conditionService = String.Format(conditionService, serviceId);
                else
                    conditionService = "";

                String conditionPaymentDate = " AND oos.OrderOfService_PaymentDate BETWEEN '{0}' AND '{1}'";
                if (!String.IsNullOrEmpty(paymentDateFrom) && !String.IsNullOrEmpty(paymentDateTo))
                    conditionPaymentDate = String.Format(conditionPaymentDate, paymentDateFrom, paymentDateTo);
                else if (!String.IsNullOrEmpty(paymentDateFrom))
                    conditionPaymentDate = String.Format(" AND oos.OrderOfService_PaymentDate >= '{0}'", paymentDateFrom);
                else if (!String.IsNullOrEmpty(paymentDateTo))
                    conditionPaymentDate = String.Format(" AND oos.OrderOfService_PaymentDate <= '{0}'", paymentDateTo);
                else
                    conditionPaymentDate = "";

                String conditionBillDate = " AND oos.OrderOfService_BillDate BETWEEN '{0}' AND '{1}'";
                if (!String.IsNullOrEmpty(billDateFrom) && !String.IsNullOrEmpty(billDateTo))
                    conditionBillDate = String.Format(conditionBillDate, billDateFrom, billDateTo);
                else if (!String.IsNullOrEmpty(billDateFrom))
                    conditionBillDate = String.Format(" AND oos.OrderOfService_BillDate >= '{0}'", billDateFrom);
                else if (!String.IsNullOrEmpty(billDateTo))
                    conditionBillDate = String.Format(" AND oos.OrderOfService_BillDate <= '{0}'", billDateTo);
                else
                    conditionBillDate = "";

                String conditionStatus = " AND oos.OrderOfService_Status = {0}";
                if (!String.IsNullOrEmpty(status))
                    conditionStatus = String.Format(conditionStatus, Int32.Parse(status));
                else
                    conditionStatus = "";

                where = where + conditionService + conditionPaymentDate + conditionBillDate + conditionStatus;

                List<Order> list = OD.SearchOrder(where, isDelete);

                if (list.Count > 0)
                {
                    foreach (Order order in list)
                    {
                        CalculateServicesAndCharges(order, isDelete);
                    }
                }
                return list;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void CalculateServicesAndCharges(Order order, bool isDelete)
        {
            List<OrderOfServiceDetail> listOrderDetail = OD.GetOrderDetails(String.Format("OrderOfService_Id = '{0}' AND ", order.OrderOfService_Id.ToString()), isDelete);

            if (listOrderDetail.Count == 1)
                order.Total_Service = "1 service";
            else if (listOrderDetail.Count > 1)
                order.Total_Service = listOrderDetail.Count.ToString() + " services";

            double totalPrice = 0;
            ServiceBusiness SB = new ServiceBusiness();
            foreach (OrderOfServiceDetail item in listOrderDetail)
            {
                Service service = SB.GetService(item.Service_Id);
                double days = (item.OrderOfServiceDetail_ToDate - item.OrderOfServiceDetail_FromDate).TotalDays;
                double charge = Double.Parse(SecurityHelper.Instance.DecryptCryptography(service.Service_Charge, true));
                int employee = item.OrderOfServiceDetail_NumberOfEmployee;
                double price = days * charge * employee;

                totalPrice += price;
            }
            order.Total_Charge = totalPrice.ToString();
        }

    }
}
