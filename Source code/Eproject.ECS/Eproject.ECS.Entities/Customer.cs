using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Customer
    {
        #region Private Member
        private string customer_id;
        private string customer_ful_name;
        private string customer_phone;
        private string customer_address;
        private bool customer_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string CustomerId
        {
            get { return customer_id; }
            set { customer_id = value; }
        }
        /// <summary>
        /// /
        /// </summary>
        public string CustomerFulName
        {
            get { return customer_ful_name; }
            set { customer_ful_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CustomerPhone
        {
            get { return customer_phone; }
            set { customer_phone = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CustomerAddress
        {
            get { return customer_address; }
            set { customer_address = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool CustomerIsDelete
        {
            get { return customer_is_delete; }
            set { customer_is_delete = value; }
        }

        #endregion

        #region Constructor

        public Customer()
        {
        }
        /// <summary>
        /// /
        /// </summary>
        /// <param name="customerId"></param>
        /// <param name="customerFulName"></param>
        /// <param name="customerPhone"></param>
        /// <param name="customerAddress"></param>
        /// <param name="customerIsDelete"></param>
        public Customer(string customerId, string customerFulName, string customerPhone, string customerAddress, bool customerIsDelete)
        {
            customer_id = customerId;
            customer_ful_name = customerFulName;
            customer_phone = customerPhone;
            customer_address = customerAddress;
            customer_is_delete = customerIsDelete;
        }

        #endregion
    }
}
