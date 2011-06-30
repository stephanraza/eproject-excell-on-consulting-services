using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class DepartmentEntity
    {

        #region Private member
        private string Department_Id;
        private string Department_Name;
        private string Department_Description;
        private bool Department_IsDelete;
        #endregion

        #region properties
        /// <summary>
        /// 
        /// </summary>
        public string DepartmentId
        {
            get { return Department_Id; }
            set { Department_Id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DepartmentName
        {
            get { return Department_Name; }
            set { Department_Name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DepartmentDescription
        {
            get { return Department_Description; }
            set { Department_Description = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool DepartmentIsDelete
        {
            get { return Department_IsDelete; }
            set { Department_IsDelete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public DepartmentEntity()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="departmentId"></param>
        /// <param name="departmentName"></param>
        /// <param name="departmentDescription"></param>
        /// <param name="departmentIsDelete"></param>
        public DepartmentEntity(string departmentId, string departmentName, string departmentDescription, bool departmentIsDelete)
        {
            Department_Id = departmentId;
            Department_Name = departmentName;
            Department_Description = departmentDescription;
            Department_IsDelete = departmentIsDelete;
        }

        #endregion

    }
}
