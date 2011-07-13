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
using System.Data;
using System.Data.SqlClient;

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

                foreach (Department item in DD.GetDepartments(isDelete))
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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="departmentId"></param>
        /// <returns></returns>
        public Department GetDepartment(Guid departmentId)
        {
            try
            {
                Department department = DD.GetDepartment(departmentId);
                return department;
            }
            catch (NullReferenceException nre)
            {
                throw new Exception("The department is not exists.");
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool IsExist(String name)
        {
            Department department = DD.GetDepartment(name);
            if (department != null)
                return true;
            else
                return false;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="departmentId"></param>
        /// <param name="name"></param>
        /// <param name="description"></param>
        public void CreateDepartment(Guid departmentId, String name, String description)
        {
            try
            {
                Department department = new Department();
                department.Department_Id = departmentId;
                department.Department_Name = name;
                department.Department_Description = description;
                department.Department_IsDelete = false;

                int result = DD.CreateDepartment(department);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="description"></param>
        /// <param name="isDelete"></param>
        public void UpdateDepartment(Guid id, String name, String description, bool isDelete)
        {
            try
            {
                Department department = DD.GetDepartment(id);
                if (name != null)
                    department.Department_Name = name;
                if (description != null)
                    department.Department_Description = description;
                department.Department_IsDelete = isDelete;

                int result = DD.UpdateDepartment(department);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// Search departments by anything.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="pageIndex">Index of page.</param>
        /// <param name="pageSize">Size of page.</param>
        /// <returns>String to search.</returns>
        public String SearchDepartment(String content, int pageIndex, int pageSize, bool isDelete)
        {
            return DD.Search(content, pageIndex, pageSize, isDelete);
        }

        public List<Department> GetDepartments(bool isDelete)
        {
            return DD.GetDepartments(isDelete);
        }
    }
}
