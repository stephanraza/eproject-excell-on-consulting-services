using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class OrderOfServiceDetail
    {


        #region Private member
        private string order_service_id;
        private string servive_id;
        private DateTime order_service_detail_from_date;
        private DateTime order_service_detail_to_date;
        private int order_service_detail_number_of_employee;
        private string order_service_detail_price;
        private bool order_service_detail_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string OrderServiceId
        {
            get { return order_service_id; }
            set { order_service_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ServiveId
        {
            get { return servive_id; }
            set { servive_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime OrderServiceDetailFromDate
        {
            get { return order_service_detail_from_date; }
            set { order_service_detail_from_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime OrderServiceDetailToDate
        {
            get { return order_service_detail_to_date; }
            set { order_service_detail_to_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int OrderServiceDetailNumberOfEmployee
        {
            get { return order_service_detail_number_of_employee; }
            set { order_service_detail_number_of_employee = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrderServiceDetailPrice
        {
            get { return order_service_detail_price; }
            set { order_service_detail_price = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool OrderServiceDetailIsDelete
        {
            get { return order_service_detail_is_delete; }
            set { order_service_detail_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
         public OrderOfServiceDetail()
         {
         }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="orderServiceId"></param>
        /// <param name="serviveId"></param>
        /// <param name="orderServiceDetailFromDate"></param>
        /// <param name="orderServiceDetailToDate"></param>
        /// <param name="orderServiceDetailNumberOfEmployee"></param>
        /// <param name="orderServiceDetailPrice"></param>
        /// <param name="orderServiceDetailIsDelete"></param>
        public OrderOfServiceDetail(string orderServiceId, string serviveId, DateTime orderServiceDetailFromDate, DateTime orderServiceDetailToDate, int orderServiceDetailNumberOfEmployee, string orderServiceDetailPrice, bool orderServiceDetailIsDelete)
        {
            order_service_id = orderServiceId;
            servive_id = serviveId;
            order_service_detail_from_date = orderServiceDetailFromDate;
            order_service_detail_to_date = orderServiceDetailToDate;
            order_service_detail_number_of_employee = orderServiceDetailNumberOfEmployee;
            order_service_detail_price = orderServiceDetailPrice;
            order_service_detail_is_delete = orderServiceDetailIsDelete;
        }

        #endregion

    }
}
