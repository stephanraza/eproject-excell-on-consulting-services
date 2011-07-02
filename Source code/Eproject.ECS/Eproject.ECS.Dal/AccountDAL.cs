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

namespace Eproject.ECS.Dal
{
    /// <summary>
    /// The AccountDAL class is responsible for interacting with the database to retrieve and store information
    /// about Account objects.
    /// </summary>
    public class AccountDAL
    {
        public Account GetAccount(String UserName)
        {
            return (Account) DBHelper.Instance.SelectFirst("Account", String.Format("Account_UserName = '{0}' and Account_IsDelete = 0", UserName));
        }

        
    }
}
