using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class DealerEntity
    {

        #region Private member
        private string dealer_id;
        private string company_id;
        private string dealer_name;
        private string dealer_address;
        private string dealer_phone;
        private string dealer_email;
        private bool dealer_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string DealerId
        {
            get { return dealer_id; }
            set { dealer_id = value; }
        }
        /// <summary>
        /// /
        /// </summary>
        public string CompanyId
        {
            get { return company_id; }
            set { company_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DealerName
        {
            get { return dealer_name; }
            set { dealer_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DealerAddress
        {
            get { return dealer_address; }
            set { dealer_address = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DealerPhone
        {
            get { return dealer_phone; }
            set { dealer_phone = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DealerEmail
        {
            get { return dealer_email; }
            set { dealer_email = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool DealerIsDelete
        {
            get { return dealer_is_delete; }
            set { dealer_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public DealerEntity()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dealerId"></param>
        /// <param name="companyId"></param>
        /// <param name="dealerName"></param>
        /// <param name="dealerAddress"></param>
        /// <param name="dealerPhone"></param>
        /// <param name="dealerEmail"></param>
        /// <param name="dealerIsDelete"></param>
        public DealerEntity(string dealerId, string companyId, string dealerName, string dealerAddress, string dealerPhone, string dealerEmail, bool dealerIsDelete)
        {
            dealer_id = dealerId;
            company_id = companyId;
            dealer_name = dealerName;
            dealer_address = dealerAddress;
            dealer_phone = dealerPhone;
            dealer_email = dealerEmail;
            dealer_is_delete = dealerIsDelete;
        }

        #endregion

    }
}
