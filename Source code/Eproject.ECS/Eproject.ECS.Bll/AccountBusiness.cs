// -----------------------------------------------------------------------
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

            Account acc = AD.GetAccount(userName);
            if (acc!=null && SecurityHelper.Instance.VerifyMd5Hash(password, acc.Account_Password))
            {
                if (acc.Account_IsDelete || acc.Account_IsLocked)
                    return false;
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
        /// Get an account's information.
        /// </summary>
        /// <param name="employeeId">Id of the employee.</param>
        /// <returns>Return an account if it exists, null otherwise.</returns>
        public Account GetAccountOfEmployee(Guid employeeId)
        {
            try
            {
                Account account = AD.GetAccountOfEmployee(employeeId);
                return account;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get accounts of employees.
        /// </summary>
        /// <returns>List of accounts.</returns>
        public List<Account> GetAccountsOfEmployees(List<Employee> listEmployee)
        {
            try
            {
                return AD.GetAccountsOfEmployees(listEmployee);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Create an new account.
        /// </summary>
        /// <param name="emId">Id of employee who use this account.</param>
        /// <param name="UserName">User name of this account.</param>
        /// <param name="password">Password of this account.</param>
        /// <param name="roleName">Role of this account.</param>
        public void CreateAccount(Guid accountId,Guid emId, String UserName, String password, String roleName)
        {
            Account newAcc = new Account();
            newAcc.Account_Id = accountId;
            newAcc.Employee_Id = emId;
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
            if (roleName != null)
                updateAcc.Role_Name = roleName;
            if (password != null)
                updateAcc.Account_Password = SecurityHelper.Instance.GetMd5Hash(password);
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
            int result = AD.DeleteAccount(deleteAcc);
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
            removeAcc.Account_IsDelete = true;
            int result = AD.UpdateAccount(removeAcc);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Restore an account from trash.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to restore.</param>
        public void RestoreAccount(Guid accountId)
        {
            Account restoreAcc = GetAccount(accountId);
            restoreAcc.Account_IsDelete = false;
            int result = AD.UpdateAccount(restoreAcc);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Lock an account.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to lock.</param>
        public void LockAccount(Guid accountId)
        {
            Account lockAcc = GetAccount(accountId);
            lockAcc.Account_IsLocked = true;
            int result = AD.UpdateAccount(lockAcc);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Unlock an account.
        /// </summary>
        /// <param name="accountId">Id of the account that you want to unlock.</param>
        public void UnlockAccount(Guid accountId)
        {
            Account unlockAcc = GetAccount(accountId);
            unlockAcc.Account_IsLocked = false;
            int result = AD.UpdateAccount(unlockAcc);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Change password for account.
        /// </summary>
        /// <param name="userName">User name of the account.</param>
        /// <param name="oldPass">Old password.</param>
        /// <param name="newPass">New password.</param>
        public void ChangePassword(String userName,String oldPass, String newPass)
        {
            try
            {
                if (!ValidateUser(userName, oldPass))
                    throw new Exception("Your old password is incorrect.");
                else
                {
                    Account account = AD.GetAccount(userName);
                    account.Account_Password = SecurityHelper.Instance.GetMd5Hash(newPass);

                    int result = AD.UpdateAccount(account);
                    if (result == -1)
                    {
                        throw new Exception("An error occurred while executing this operation.");
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Check role of the account is administrator or not.
        /// </summary>
        /// <param name="userName">User name of the account.</param>
        /// <returns>True if role is administrator, false otherwise.</returns>
        public bool IsAdmin(String userName)
        {
            Account account = AD.GetAccount(userName);
            if (account != null && account.Role_Name.Equals("Administrator"))
                    return true;
            return false;
        }
        /// <summary>
        /// Advance search for searching accounts.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="status">Status of these accounts for searching.</param>
        /// <param name="isDelete">True if these accounts are deleted, false otherwise.</param>
        /// <returns>List of accounts.</returns>
        public List<Account> SearchAccount(String content, String status, bool isDelete)
        {
            try
            {
                String conditionStatus = " AND Account_IsLocked = '{0}'";
                if (status.Equals("Locked"))
                    conditionStatus = String.Format(conditionStatus, true);
                else if (status.Equals("Unlocked"))
                    conditionStatus = String.Format(conditionStatus, false);
                else
                    conditionStatus = "";

                String searchByAccount = "(Role_Name LIKE N'%{0}%'"
                                   + " OR Account_UserName LIKE N'%{0}%')";

                content = content.Replace("'", " ");
                searchByAccount = String.Format(searchByAccount, content);
                String where = searchByAccount + conditionStatus + " AND ";
                return AD.Search(where, isDelete);
            }
            catch (Exception ex)
            {
                return new List<Account>();
            }
        }
    }
}
