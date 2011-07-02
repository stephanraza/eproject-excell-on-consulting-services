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
        AccountDAL DB = new AccountDAL();

        public bool ValidateUser(string username, string password)
        {
            username = HttpUtility.HtmlEncode(username);
            password = HttpUtility.HtmlEncode(password);

            Account Acc = DB.GetAccount(username);

            if (Acc.Account_Password == password)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
