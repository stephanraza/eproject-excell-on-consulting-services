using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{

    public class AccountEntity
    {
        #region Private Member     
        private string account_id;
        private string employee_id;
        private string role_name;
        private string account_user_name;
        private string account_password;
        private bool account_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string AccountId
        {
            get { return account_id; }
            set { account_id = value; }
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
        public string RoleName
        {
            get { return role_name; }
            set { role_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string AccountUserName
        {
            get { return account_user_name; }
            set { account_user_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string AccountPassword
        {
            get { return account_password; }
            set { account_password = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool AccountIsDelete
        {
            get { return account_is_delete; }
            set { account_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public AccountEntity()
        {
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="accountId"></param>
        /// <param name="employeeId"></param>
        /// <param name="roleName"></param>
        /// <param name="accountUserName"></param>
        /// <param name="accountPassword"></param>
        /// <param name="accountIsDelete"></param>
        public AccountEntity(string accountId, string employeeId, string roleName, string accountUserName, string accountPassword, bool accountIsDelete)
        {
            account_id = accountId;
            employee_id = employeeId;
            role_name = roleName;
            account_user_name = accountUserName;
            account_password = accountPassword;
            account_is_delete = accountIsDelete;
        }

        #endregion
    }


}
