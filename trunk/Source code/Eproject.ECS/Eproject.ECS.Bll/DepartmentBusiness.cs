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
    /// The DepartmentBusiness class is responsible for managing Eproject.ECS.Entities.Department objects in the system.
    /// </summary>
    public class DepartmentBusiness
    {
        DepartmentDAL DD = new DepartmentDAL();
        /// <summary>
        /// Get all names of departments.
        /// </summary>
        /// <returns>List names of departments.</returns>
        public List<String> GetDepartmentNames()
        {
            return GetNames(false);
        }
        /// <summary>
        /// Get all names of departments in trash.
        /// </summary>
        /// <returns>List names of departments.</returns>
        public List<String> GetDepartmentNamesTrash()
        {
            return GetNames(true);
        }
        /// <summary>
        /// Get all names of departments.
        /// </summary>
        /// <param name="isDelete">True if the department is deleted, false otherwise.</param>
        /// <returns>List names of departments.</returns>
        public List<String> GetNames(bool isDelete)
        {
            try
            {
                List<String> listName = new List<String>();

                foreach (Department item in DD.GetDepartments())
                {
                    if (item.Department_IsDelete == isDelete)
                    {
                        listName.Add(item.Department_Name);
                    }
                }

                return listName;
            }
            catch (NullReferenceException nre)
            {
                return new List<String>();
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="departmentName"></param>
        /// <param name="isDelete"></param>
        /// <returns></returns>
        public Department GetDepartment(String departmentName, bool isDelete)
        {
            try
            {
                Department department = DD.GetDepartment(departmentName);
                if (department.Department_IsDelete == isDelete)
                    return department;
                else
                    if (isDelete)
                        throw new Exception("The department is not deleted");
                    else
                        throw new Exception("The department is deleted");
            }
            catch (NullReferenceException nre)
            {
                throw new Exception("The department is not exists.");
            }
        }
    }
}
