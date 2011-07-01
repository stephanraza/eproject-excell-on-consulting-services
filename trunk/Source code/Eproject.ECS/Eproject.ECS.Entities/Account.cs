using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{

    public class Account
    {
        #region Private Member     
        private string account_Id;
        private string employee_Id;
        private string role_Name;
        private string account_UserName;
        private string account_Password;
        private bool account_IsDelete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string Account_Id
        {
            get { return account_Id; }
            set { account_Id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Employee_Id
        {
            get { return employee_Id; }
            set { employee_Id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string RoleName
        {
            get { return role_Name; }
            set { role_Name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Account_UserName
        {
            get { return account_UserName; }
            set { account_UserName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Account_Password
        {
            get { return account_Password; }
            set { account_Password = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool Account_IsDelete
        {
            get { return account_IsDelete; }
            set { account_IsDelete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public Account()
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
        public Account(string accountId, string employeeId, string roleName, string accountUserName, string accountPassword, bool accountIsDelete)
        {
            account_Id = accountId;
            employee_Id = employeeId;
            role_Name = roleName;
            account_UserName = accountUserName;
            account_Password = accountPassword;
            account_IsDelete = accountIsDelete;
        }

        #endregion
    }


}
