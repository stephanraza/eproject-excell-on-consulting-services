﻿// -----------------------------------------------------------------------
// <copyright file="AccountBusiness.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;
using System.Web;

namespace Eproject.ECS.Bll
{
    /// <summary>
    /// The AccountBusiness class is responsible for managing Eproject.ECS.Entities.Account objects in the system.
    /// </summary>
    public class AccountBusiness
    {
        AccountDAL AD = new AccountDAL();
        /// <summary>
        /// Check the validity of the accounts are logging.
        /// </summary>
        /// <param name="username">Use name of the account.</param>
        /// <param name="password">Password of the account.</param>
        /// <returns>Return true if the account is valid, otherwise false.</returns>
        public bool ValidateUser(String userName, String password)
        {
            userName = HttpUtility.HtmlEncode(userName);
            password = HttpUtility.HtmlEncode(password);

            Account acc = GetAccount(userName);
            if (SecurityHelper.Instance.VerifyMd5Hash(password, acc.Account_Password))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// Get role of the account by its user name.
        /// </summary>
        /// <param name="userName">User name of the account.</param>
        /// <returns>Return role of the account if it has, null otherwise.</returns>
        public String GetRole(String userName)
        {
            userName = HttpUtility.HtmlEncode(userName);

            Account account = GetAccount(userName);
            return account.Role_Name;
        }
        /// <summary>
        /// Get an account's information.
        /// </summary>
        /// <param name="userName">User name of the account.</param>
        /// <returns>Return an account if it exists, null otherwise.</returns>
        public Account GetAccount(String userName)
        {
            Account account = AD.GetAccount(userName);
            if (account == null)
            {
                throw new Exception("This account is not existed.");
            }
            else
            {
                return account;
            }
        }
        /// <summary>
        /// Get an account's information.
        /// </summary>
        /// <param name="accountId">Id of the account.</param>
        /// <returns>Return an account if it exists, null otherwise.</returns>
        public Account GetAccount(Guid accountId)
        {
            Account account = AD.GetAccount(accountId);
            if (account == null)
            {
                throw new Exception("This account is not existed.");
            }
            else
            {
                return account;
            }
        }
        /// <summary>
        /// Create an new account.
        /// </summary>
        /// <param name="emId">Id of employee who use this account.</param>
        /// <param name="UserName">User name of this account.</param>
        /// <param name="password">Password of this account.</param>
        /// <param name="roleName">Role of this account.</param>
        public void CreateAccount(String emId, String UserName, String password, String roleName)
        {
            Account newAcc = new Account();
            newAcc.Account_Id = new Guid();
            newAcc.Employee_Id = new Guid(emId);
            newAcc.Account_UserName = UserName;
            newAcc.Account_Password = SecurityHelper.Instance.GetMd5Hash(password);
            newAcc.Role_Name = roleName;
            newAcc.Account_IsLocked = false;
            newAcc.Account_IsDelete = false;

            // Check Employee_Id exists

            // Check user name is unique
            if (AD.GetAccount(newAcc.Account_UserName) != null)
            {
                throw new Exception("This user name is existed.");
            }

            int result = AD.CreateAccount(newAcc);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Update an account.
        /// </summary>
        /// <param name="accId">Id of the account that you want to update.</param>
        /// <param name="password">Password of this account.</param>
        /// <param name="roleName">Role of this account.</param>
        /// <param name="isLocked">True if you want to lock this account, false otherwise.</param>
        /// <param name="IsDelete">True if you want to remove this account, false otherwise.</param>
        public void UpdateAccount(Guid accId, String password, String roleName, bool isLocked, bool IsDelete)
        {
            Account updateAcc = GetAccount(accId);
            updateAcc.Role_Name = roleName;
            updateAcc.Account_Password = password;
            updateAcc.Account_IsLocked = isLocked;
            updateAcc.Account_IsDelete = IsDelete;

            int result = AD.UpdateAccount(updateAcc);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Delete permanently an account.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to delete.</param>
        public void DeleteAccount(Guid accountId)
        {
            Account deleteAcc = GetAccount(accountId);
            int result = AD.DeleteAccount(deleteAcc.Account_Id);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Remove an account to trash.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to remove.</param>
        public void RemoveAccount(Guid accountId)
        {
            Account removeAcc = GetAccount(accountId);
            UpdateAccount(removeAcc.Account_Id, removeAcc.Account_Password, removeAcc.Role_Name, removeAcc.Account_IsLocked, true);
        }
        /// <summary>
        /// Restore an account from trash.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to restore.</param>
        public void RestoreAccount(Guid accountId)
        {
            Account restoreAcc = GetAccount(accountId);
            UpdateAccount(restoreAcc.Account_Id, restoreAcc.Account_Password, restoreAcc.Role_Name, restoreAcc.Account_IsLocked, false);
        }
        /// <summary>
        /// Lock an account.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to lock.</param>
        public void LockAccount(Guid accountId)
        {
            Account lockAcc = GetAccount(accountId);
            UpdateAccount(lockAcc.Account_Id, lockAcc.Account_Password, lockAcc.Role_Name, true, lockAcc.Account_IsDelete);
        }
        /// <summary>
        /// Unlock an account.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to unlock.</param>
        public void UnlockAccount(Guid accountId)
        {
            Account unlockAcc = GetAccount(accountId);
            UpdateAccount(unlockAcc.Account_Id, unlockAcc.Account_Password, unlockAcc.Role_Name, false, unlockAcc.Account_IsDelete);
        }
    }
}
