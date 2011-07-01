using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class OrderOfService
    {

        #region Private member
        private string order_of_service_id;
        private string company_id;
        private string employee_id;
        private int order_service_total_services;
        private string order_service_total_charges;
        private string order_service_description;
        private string order_service_payment_method;
        private DateTime order_service_payment_date;
        private DateTime order_service_bill_date;
        private int order_service_status;
        private bool order_service_is_delete;

        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string OrderOfServiceId
        {
            get { return order_of_service_id; }
            set { order_of_service_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyId
        {
            get { return company_id; }
            set { company_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string EmployeeId
        {
            get { return employee_id; }
            set { employee_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int OrderServiceTotalServices
        {
            get { return order_service_total_services; }
            set { order_service_total_services = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrderServiceTotalCharges
        {
            get { return order_service_total_charges; }
            set { order_service_total_charges = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrderServiceDescription
        {
            get { return order_service_description; }
            set { order_service_description = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrderServicePaymentMethod
        {
            get { return order_service_payment_method; }
            set { order_service_payment_method = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime OrderServicePaymentDate
        {
            get { return order_service_payment_date; }
            set { order_service_payment_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime OrderServiceBillDate
        {
            get { return order_service_bill_date; }
            set { order_service_bill_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int OrderServiceStatus
        {
            get { return order_service_status; }
            set { order_service_status = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool OrderServiceIsDelete
        {
            get { return order_service_is_delete; }
            set { order_service_is_delete = value; }
        }
        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public OrderOfService()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="orderOfServiceId"></param>
        /// <param name="companyId"></param>
        /// <param name="employeeId"></param>
        /// <param name="orderServiceTotalServices"></param>
        /// <param name="orderServiceTotalCharges"></param>
        /// <param name="orderServiceDescription"></param>
        /// <param name="orderServicePaymentMethod"></param>
        /// <param name="orderServicePaymentDate"></param>
        /// <param name="orderServiceBillDate"></param>
        /// <param name="orderServiceStatus"></param>
        /// <param name="orderServiceIsDelete"></param>
        public OrderOfService(string orderOfServiceId, string companyId, string employeeId, int orderServiceTotalServices, string orderServiceTotalCharges, string orderServiceDescription, string orderServicePaymentMethod, DateTime orderServicePaymentDate, DateTime orderServiceBillDate, int orderServiceStatus, bool orderServiceIsDelete)
        {
            order_of_service_id = orderOfServiceId;
            company_id = companyId;
            employee_id = employeeId;
            order_service_total_services = orderServiceTotalServices;
            order_service_total_charges = orderServiceTotalCharges;
            order_service_description = orderServiceDescription;
            order_service_payment_method = orderServicePaymentMethod;
            order_service_payment_date = orderServicePaymentDate;
            order_service_bill_date = orderServiceBillDate;
            order_service_status = orderServiceStatus;
            order_service_is_delete = orderServiceIsDelete;
        }

        #endregion

    }
}
