// -----------------------------------------------------------------------
// <copyright file="DepartmentDAL.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
using System.Data.SqlClient;

namespace Eproject.ECS.Dal
{
    /// <summary>
    /// The DepartmentDAL class is responsible for interacting with the database to retrieve and store information
    /// about Department objects.
    /// </summary>
    public class DepartmentDAL
    {
        /// <summary>
        /// Get a department's infomartion by Id.
        /// </summary>
        /// <param name="departmentId">Id of the department that you want to get.</param>
        /// <returns>A object of department.</returns>
        public Department GetDepartment(Guid departmentId)
        {
            return (Department)DBHelper.Instance.SelectFirst("Department", String.Format("Department_Id = '{0}'", departmentId.ToString()));
        }
        /// <summary>
        /// Get a department's infomartion by name.
        /// </summary>
        /// <param name="departmentName">Name of the department that you want to get.</param>
        /// <returns>A object of department.</returns>
        public Department GetDepartment(String departmentName)
        {
            return (Department)DBHelper.Instance.SelectFirst("Department", String.Format("Department_Name = '{0}'", departmentName));
        }
        /// <summary>
        /// Get list of departments and its size that you could choose.
        /// </summary>
        /// <param name="pageIndex">Index of page.</param>
        /// <param name="pageSize">Size of page that you want to get.</param>
        /// <returns>List of departments.</returns>
        public List<Department> GetDepartments(int pageIndex, int pageSize)
        {
            List<Department> listDepartment = new List<Department>();
            List<Object> listObject = DBHelper.Instance.Select("Department", null, null, pageIndex, pageSize);

            foreach (Object item in listObject)
            {
                Department depratment = (Department)item;
                listDepartment.Add(depratment);
            }
            return listDepartment;
        }
        /// <summary>
        /// Get all departments in database.
        /// </summary>
        /// <returns>List of departments.</returns>
        public List<Department> GetDepartments(bool isDelete)
        {
            List<Department> listDepartment = new List<Department>();
            List<Object> listObject = DBHelper.Instance.Select("Department", String.Format("Department_IsDelete = '{0}'", isDelete), null, -1, -1);

            foreach (Object item in listObject)
            {
                Department depratment = (Department)item;
                listDepartment.Add(depratment);
            }
            return listDepartment;
        }
        /// <summary>
        /// Create new a department.
        /// </summary>
        /// <param name="isDelete">True if department is removed, false otherwise.</param>
        /// <param name="department">Department that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int CreateDepartment(Department department)
        {
            return DBHelper.Instance.Insert(department);
        }
        /// <summary>
        /// Update a department.
        /// </summary>
        /// <param name="department">Department that you want to update.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int UpdateDepartment(Department department)
        {
            return DBHelper.Instance.Update(department, String.Format("Department_Id = '{0}'", department.Department_Id.ToString()));
        }
        /// <summary>
        /// Delete a department.
        /// </summary>
        /// <param name="department">Department that you want to delete.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteDepartment(Department department)
        {
            return DBHelper.Instance.Delete("Department", String.Format("Department_Id = '{0}'", department.Department_Id.ToString()));
        }
        /// <summary>
        /// Search departments by anything.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <returns>List of department.</returns>
        public List<Department> Search(String content, bool isDelete)
        {
            List<Department> listDepartment = new List<Department>();
            List<Object> listObject = DBHelper.Instance.Select("Department", String.Format("(Department_Name LIKE N'%{0}%' OR Department_Description LIKE N'%{0}%') AND Department_IsDelete = '{1}'",content, isDelete), null, -1, -1);

            foreach (Object item in listObject)
            {
                Department depratment = (Department)item;
                listDepartment.Add(depratment);
            }
            return listDepartment;
        }
    }
}
