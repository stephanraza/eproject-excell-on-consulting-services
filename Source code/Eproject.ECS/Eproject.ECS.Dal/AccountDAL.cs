// -----------------------------------------------------------------------
// <copyright file="AccountDAL.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
using System.Data.SqlClient;

namespace Eproject.ECS.Dal
{
    /// <summary>
    /// The AccountDAL class is responsible for interacting with the database to retrieve and store information
    /// about Account objects.
    /// </summary>
    public class AccountDAL
    {
        /// <summary>
        /// Get account by user name.
        /// </summary>
        /// <param name="userName">User name of the account.</param>
        /// <returns>Return an account if it exists, null otherwise.</returns>
        public Account GetAccount(String userName)
        {
            return (Account)DBHelper.Instance.SelectFirst("Account", String.Format("Account_UserName = '{0}'", userName));
        }
        /// <summary>
        /// Get account by id.
        /// </summary>
        /// <param name="accId">Id of the account.</param>
        /// <returns>Return an account if it exists, null otherwise.</returns>
        public Account GetAccount(Guid accountId)
        {
            return (Account)DBHelper.Instance.SelectFirst("Account", String.Format("Account_Id = '{0}'", accountId.ToString()));
        }
        /// <summary>
        /// Get list of account and its size that you could choose.
        /// </summary>
        /// <param name="pageIndex">Index of page.</param>
        /// <param name="pageSize">Size of page that you want to get.</param>
        /// <returns>List of accounts.</returns>
        public List<Account> GetAccounts(int pageIndex, int pageSize)
        {
            List<Account> listAccount = new List<Account>();
            List<Object> listObj = DBHelper.Instance.Select("Account",null , null, pageIndex, pageSize);
            
            if (listObj.Count != 0)
            {
                foreach (Object item in listObj)
                {
                    Account acc = (Account)item;
                    listAccount.Add(acc);
                }
            }
            return listAccount;
        }
        /// <summary>
        /// Get all accounts in database.
        /// </summary>
        /// <returns>List of accounts.</returns>
        public List<Account> GetAccounts()
        {
            List<Account> listAccount = new List<Account>();
            List<Object> listObj = DBHelper.Instance.Select("Account", null , null, -1, -1);

            if (listObj.Count != 0)
            {
                foreach (Object item in listObj)
                {
                    Account acc = (Account)item;
                    listAccount.Add(acc);
                }
            }
            return listAccount;
        }
        /// <summary>
        /// Create new an account.
        /// </summary>
        /// <param name="account">Account that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int CreateAccount(Account account)
        {
            return DBHelper.Instance.Insert(account);
        }
        /// <summary>
        /// Update an account.
        /// </summary>
        /// <param name="account">Account that you want to update.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int UpdateAccount(Account account)
        {
            return DBHelper.Instance.Update(account);
        }
        /// <summary>
        /// Delete an account
        /// </summary>
        /// <param name="account">Account that you want to delete.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteAccount(Guid accountId)
        {
            return DBHelper.Instance.Delete("Account", String.Format("Account_Id = '{0}'", accountId.ToString()));
        }
    }
}
