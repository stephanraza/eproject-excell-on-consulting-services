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
        /// <returns>List of department.</returns>
        public List<Department> SearchDepartment(String content, bool isDelete)
        {
            try
            {
                return DD.Search(content, isDelete);
            }
            catch (Exception ex)
            {
                return new List<Department>();
            }
        }
        /// <summary>
        /// Get all department.
        /// </summary>
        /// <param name="isDelete">True if department is deleted, false otherwise.</param>
        /// <returns>List of department.</returns>
        public List<Department> GetDepartments(bool isDelete)
        {
            try
            {
                return DD.GetDepartments(isDelete);
            }
            catch (Exception ex)
            {
                return new List<Department>();
            }
        }
        /// <summary>
        /// Get number of employees in department.
        /// </summary>
        /// <param name="departmentId">Id of the department.</param>
        /// <param name="isDelete">True if list of employee is deleted, false otherwise.</param>
        /// <returns>Number of employees.</returns>
        public int GetNumberOfEmployees(Guid departmentId, bool isDelete)
        {
            EmployeeBusiness EB = new EmployeeBusiness();
            List<Employee> listEmployee = EB.GetEmployees(departmentId, isDelete);
            return listEmployee.Count;
        }
        /// <summary>
        /// Delete permanently a department.
        /// </summary>
        /// <param name="departmentId">Id of the department that you want to delete.</param>
        public void DeleteDepartment(Guid departmentId)
        {
            try
            {
                if (GetNumberOfEmployees(departmentId, false) == 0)
                {
                    EmployeeBusiness EB = new EmployeeBusiness();
                    List<Employee> listEmployee = EB.GetEmployees(departmentId, true);
                    if (listEmployee.Count > 0)
                    {
                        foreach (Employee item in listEmployee)
                        {
                            EB.DeleteEmployee(item.Employee_Id);
                        }
                    }

                    Department department = DD.GetDepartment(departmentId);
                    int result = DD.DeleteDepartment(department);
                    if (result == -1)
                    {
                        throw new Exception("An error occurred while executing this operation.");
                    }
                }
                else
                {
                    throw new Exception(String.Format("Remaining {0} employees in this department. You could not delete it.", GetNumberOfEmployees(departmentId,false)));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Remove an department to trash.
        /// </summary>
        /// <param name="departmentId">Id of the department that you want to remove.</param>
        public void RemoveDepartment(Guid departmentId)
        {
            try
            {
                Department department = GetDepartment(departmentId);
                int numberEmployee = GetNumberOfEmployees(departmentId, false);
                if (numberEmployee == 0)
                {
                    department.Department_IsDelete = true;
                    int result = DD.UpdateDepartment(department);
                    if (result == -1)
                    {
                        throw new Exception("An error occurred while executing this operation.");
                    }
                }
                else
                {
                    throw new Exception(String.Format("Remaining {0} employees in this department. You could not delete it.", numberEmployee));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Restore an department from trash.
        /// </summary>
        /// <param name="departmentId">Id of the department that you want to restore.</param>
        public void RestoreDepartment(Guid departmentId)
        {
            try
            {
                Department department = GetDepartment(departmentId);
                //Restore department first.
                department.Department_IsDelete = false;
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
    }
}
