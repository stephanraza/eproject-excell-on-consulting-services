// -----------------------------------------------------------------------
// <copyright file="EmployeeDAL.cs">
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
    /// The EmployeeDAL class is responsible for interacting with the database to retrieve and store information
    /// about Employee objects.
    /// </summary>
    public class EmployeeDAL
    {
        /// <summary>
        /// Get an employee's infomartion by Id.
        /// </summary>
        /// <param name="employeeId">Id of the employee that you want to get.</param>
        /// <returns>A object of employee.</returns>
        public Employee GetEmployee(Guid employeeId)
        {
            return (Employee)DBHelper.Instance.SelectFirst("Employee", String.Format("Employee_Id = '{0}'", employeeId.ToString()));
        }
        /// <summary>
        /// Get an employee's infomartion by email.
        /// </summary>
        /// <param name="email">Email of the employee that you want to get.</param>
        /// <returns>A object of employee.</returns>
        public Employee GetEmployee(String email)
        {
            return (Employee)DBHelper.Instance.SelectFirst("Employee", String.Format("Employee_Email = '{0}'", email));
        }
        /// <summary>
        /// Get list of employees and its size that you could choose.
        /// </summary>
        /// <param name="pageIndex">Index of page.</param>
        /// <param name="pageSize">Size of page that you want to get.</param>
        /// <returns>List of employees.</returns>
        public List<Employee> GetEmployees(int pageIndex, int pageSize)
        {
            List<Employee> listEmployee = new List<Employee>();
            List<Object> listObject = DBHelper.Instance.Select("Employee", null, null, pageIndex, pageSize);

            foreach (Object item in listObject)
            {
                Employee employee = (Employee)item;
                listEmployee.Add(employee);
            }
            return listEmployee;
        }
        /// <summary>
        /// Get all employees in database.
        /// </summary>
        /// <returns>List of employees.</returns>
        public List<Employee> GetEmployees()
        {
            List<Employee> listEmployee = new List<Employee>();
            List<Object> listObject = DBHelper.Instance.Select("Employee", null, null, -1, -1);

            foreach (Object item in listObject)
            {
                Employee employee = (Employee)item;
                listEmployee.Add(employee);
            }
            return listEmployee;
        }
        /// <summary>
        /// Create new an employee.
        /// </summary>
        /// <param name="employee">Employee that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int CreateEmployee(Employee employee)
        {
            return DBHelper.Instance.Insert(employee);
        }
        /// <summary>
        /// Update an employee.
        /// </summary>
        /// <param name="employee">Employee that you want to update.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int UpdateEmployee(Employee employee)
        {
            return DBHelper.Instance.Update(employee, String.Format("Employee_Id = '{0}'", employee.Employee_Id.ToString()));
        }
        /// <summary>
        /// Delete an employee.
        /// </summary>
        /// <param name="employee">Employee that you want to delete.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int DeleteDepartment(Employee employee)
        {
            return DBHelper.Instance.Delete("Employee", String.Format("Employee_Id = '{0}'", employee.Employee_Id.ToString()));
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Object> GetEmployeesNotRegister()
        {
            return DBHelper.Instance.Select("Employee", "Employee_Id NOT IN(SELECT Employee_Id FROM Account)", null, -1, -1);
        }
    }
}
