using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    /// <summary>
    /// The RoleBusiness class is responsible for managing Eproject.ECS.Entities.Role objects in the system.
    /// </summary>
    public class RoleBusiness
    {
        RoleDAL RD = new RoleDAL();
        /// <summary>
        /// Get a role by role name.
        /// </summary>
        /// <param name="roleName">Name of the role that you want to get.</param>
        /// <returns>Return a role if it exists, null otherwise.</returns>
        public Role GetRole(String roleName)
        {
            Role role = RD.GetRole(roleName);
            if (role == null)
            {
                throw new Exception("This role is not existed.");
            }
            else
            {
                return role;
            }
        }
        /// <summary>
        /// Get list of all roles.
        /// </summary>
        /// <returns>List of all roles.</returns>
        public List<Role> GetRoles()
        {
            return RD.GetRoles();
        }
        /// <summary>
        /// Create a new role.
        /// </summary>
        /// <param name="role">Role that you want to create.</param>
         public void CreateRole(String roleName)
        {
            Role newRole = new Role();
            newRole.Role_Name = roleName;
            newRole.Role_IsDelete = false;

            //Check role name is exists.
            if (RD.GetRole(newRole.Role_Name) != null)
            {
                throw new Exception("This role is existed.");
            }
            int result = RD.CreateRole(newRole);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Delete a role
        /// </summary>
         /// <param name="roleName">Name of role that you want to delete.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public void DeleteRole(String roleName)
        {
            Role deleteRole = GetRole(roleName);
            int result = RD.DeleteRole(deleteRole.Role_Name);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Remove a role to trash.
        /// </summary>
        /// <param name="roleName">Name of role that you want to remove.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int RemoveRole(String roleName)
        {
            Role removeRole = GetRole(roleName);
            removeRole.Role_IsDelete = true;
            return RD.UpdateRole(removeRole);
        }
        /// <summary>
        /// Restore an role from trash.
        /// </summary>
        /// <param name="roleName">Name of role that you want to restore.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int RestoreRole(String roleName)
        {
            Role restoreRole = GetRole(roleName);
            restoreRole.Role_IsDelete = false;
            return RD.UpdateRole(restoreRole);
        }
    }
}
