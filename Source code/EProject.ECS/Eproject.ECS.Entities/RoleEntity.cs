using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class RoleEntity
    {
        #region Private member

        private string role_name;
        private bool role_is_delete;

        #endregion

        #region Properties
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
        public bool RoleIsDelete
        {
            get { return role_is_delete; }
            set { role_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
         public RoleEntity()
         {
         }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="roleIsDelete"></param>
        public RoleEntity(string roleName, bool roleIsDelete)
        {
            role_name = roleName;
            role_is_delete = roleIsDelete;
        }

        #endregion
    }
}
