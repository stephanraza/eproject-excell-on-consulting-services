using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class ProblemOfCustomer
    {

        #region Private member
        private string problem_of_customer_id;
        private string customer_id;
        private string company_id;
        private string problem_id;
        private DateTime problem_of_customer_date;
        private bool problem_of_customer_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string ProblemOfCustomerId
        {
            get { return problem_of_customer_id; }
            set { problem_of_customer_id = value; }
        }
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
        public string ProblemId
        {
            get { return problem_id; }
            set { problem_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ProblemOfCustomerDate
        {
            get { return problem_of_customer_date; }
            set { problem_of_customer_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool ProblemOfCustomerIsDelete
        {
            get { return problem_of_customer_is_delete; }
            set { problem_of_customer_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
         public ProblemOfCustomer()
         {
         }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="problemOfCustomerId"></param>
        /// <param name="customerId"></param>
        /// <param name="companyId"></param>
        /// <param name="problemId"></param>
        /// <param name="problemOfCustomerDate"></param>
        /// <param name="problemOfCustomerIsDelete"></param>
        public ProblemOfCustomer(string problemOfCustomerId, string customerId, string companyId, string problemId, DateTime problemOfCustomerDate, bool problemOfCustomerIsDelete)
        {
            problem_of_customer_id = problemOfCustomerId;
            customer_id = customerId;
            company_id = companyId;
            problem_id = problemId;
            problem_of_customer_date = problemOfCustomerDate;
            problem_of_customer_is_delete = problemOfCustomerIsDelete;
        }

        #endregion

    }
}
