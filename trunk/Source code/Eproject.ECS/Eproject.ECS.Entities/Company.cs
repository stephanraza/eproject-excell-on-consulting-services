using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Company
    {
        #region Private Member
        private string company_id;
        private string company_name;
        private string company_logo;
        private string company_description;
        private string company_phone;
        private string company_email;
        private string company_address;
        private bool company_is_delete;
        #endregion

        #region Properties
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
        public string CompanyName
        {
            get { return company_name; }
            set { company_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyLogo
        {
            get { return company_logo; }
            set { company_logo = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyDescription
        {
            get { return company_description; }
            set { company_description = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyPhone
        {
            get { return company_phone; }
            set { company_phone = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyEmail
        {
            get { return company_email; }
            set { company_email = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyAddress
        {
            get { return company_address; }
            set { company_address = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool CompanyIsDelete
        {
            get { return company_is_delete; }
            set { company_is_delete = value; }
        }

        #endregion

        #region Constructor

        public Company()
        {
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="companyId"></param>
        /// <param name="companyName"></param>
        /// <param name="companyLogo"></param>
        /// <param name="companyDescription"></param>
        /// <param name="companyPhone"></param>
        /// <param name="companyEmail"></param>
        /// <param name="companyAddress"></param>
        /// <param name="companyIsDelete"></param>
        public Company(string companyId, string companyName, string companyLogo, string companyDescription, string companyPhone, string companyEmail, string companyAddress, bool companyIsDelete)
        {
            company_id = companyId;
            company_name = companyName;
            company_logo = companyLogo;
            company_description = companyDescription;
            company_phone = companyPhone;
            company_email = companyEmail;
            company_address = companyAddress;
            company_is_delete = companyIsDelete;
        }

        #endregion

    }
}
