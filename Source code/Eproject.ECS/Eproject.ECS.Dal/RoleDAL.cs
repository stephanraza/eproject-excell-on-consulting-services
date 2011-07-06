// -----------------------------------------------------------------------
// <copyright file="RoleDAL.cs">
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
    /// The RoleDAL class is responsible for interacting with the database to retrieve and store information
    /// about Role objects.
    /// </summary>
    public class RoleDAL
    {
        /// <summary>
        /// Get a role by role name.
        /// </summary>
        /// <param name="roleName">Name of role that you want to get.</param>
        /// <returns>A role.</returns>
        public Role GetRole(String roleName)
        {
            return (Role)DBHelper.Instance.SelectFirst("Role", String.Format("Role_Name = '{0}'", roleName));
        }
        /// <summary>
        /// Get list of roles and its size that you could choose.
        /// </summary>
        /// <param name="pageIndex">Index of page.</param>
        /// <param name="pageSize">Size of page that you want to get.</param>
        /// <returns>List of roles.</returns>
        public List<Role> GetRoles(int pageIndex, int pageSize)
        {
            List<Role> listRole = new List<Role>();

            List<Object> listObj = DBHelper.Instance.Select("Role", null, null, pageIndex, pageSize);
            if (listObj.Count != 0)
            {
                foreach (Object item in listObj)
                {
                    Role role = (Role)item;
                    listRole.Add(role);
                }
            }
            return listRole;
        }
        /// <summary>
        /// Get all roles in database.
        /// </summary>
        /// <returns>List of roles.</returns>
        public List<Role> GetRoles()
        {
            List<Role> listRole = new List<Role>();
            List<Object> listObj = DBHelper.Instance.Select("Role", null, null, -1, -1);

            if (listObj.Count != 0)
            {
                foreach (Object item in listObj)
                {
                    Role role = (Role)item;
                    listRole.Add(role);
                }
            }
            return listRole;
        }
        /// <summary>
        /// Create new a role.
        /// </summary>
        /// <param name="role">Role that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int CreateRole(Role role)
        {
            return DBHelper.Instance.Insert(role);
        }
        /// <summary>
        /// Update a role.
        /// </summary>
        /// <param name="role">Role that you want to update.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int UpdateRole(Role role)
        {
            return DBHelper.Instance.Update(role);
        }
        /// <summary>
        /// Delete a role
        /// </summary>
        /// <param name="roleName">name of the role that you want to delete.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteRole(String roleName)
        {
            return DBHelper.Instance.Delete("Role", String.Format("Role_Name = '{0}'", roleName));
        }
    }
}
