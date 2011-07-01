using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class CustomerOfCompany
    {

        #region private Memember
        private string customer_id;
        private string company_id;
        private bool customer_of_company_is_delete;
        #endregion
        
        #region properties 
        /// <summary>
        /// 
        /// </summary>
        public string CustomerId
        {
            get { return customer_id; }
            set { customer_id = value; }
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
        public bool CustomerOfCompanyIsDelete
        {
            get { return customer_of_company_is_delete; }
            set { customer_of_company_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public CustomerOfCompany()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerId"></param>
        /// <param name="companyId"></param>
        /// <param name="customerOfCompanyIsDelete"></param>
        public CustomerOfCompany(string customerId, string companyId, bool customerOfCompanyIsDelete)
        {
            customer_id = customerId;
            company_id = companyId;
            customer_of_company_is_delete = customerOfCompanyIsDelete;
        }

        #endregion

    }
}
