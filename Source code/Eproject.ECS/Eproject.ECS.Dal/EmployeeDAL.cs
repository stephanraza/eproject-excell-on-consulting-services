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
using System.Data.SqlClient;

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
        /// Get all employees in department.
        /// </summary>
        /// <returns>List of employees.</returns>
        public List<Employee> GetEmployees(String departmentId, bool isDelete)
        {
            List<Employee> listEmployee = new List<Employee>();
            List<Object> listObject = DBHelper.Instance.Select("Employee", String.Format("Department_Id='{0}' AND Employee_IsDelete='{1}'", departmentId, isDelete), null, -1, -1);

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
        public int DeleteEmployee(Employee employee)
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
        /// <summary>
        /// Search employees by anything.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <returns>List of employee.</returns>
        public List<EmployeeOfDepartment> Search(String content, bool isDelete)
        {
            String query = "SELECT Employee.Employee_Id,Employee.Department_Id, Employee.Employee_FirtName,"
                           + "Employee.Employee_LastName, Employee.Employee_Gender,"
                           + "Employee.Employee_DateOfBirth, Employee.Employee_Address,"
                           + "Employee.Employee_PhoneNumber, Employee.Employee_Email,"
                           + "Employee.Employee_Avatar, Employee.Employee_IsDelete,"
                           + "Department.Department_Name, Department.Department_Description,"
                           + "Department.Department_IsDelete FROM Employee, Department "
                           + " WHERE Employee.Department_Id = Department.Department_Id"
                           + " AND ( Employee_FirtName LIKE N'%{0}%' OR Employee_LastName LIKE N'%{0}%'"
                           + " OR Employee_Address LIKE N'%{0}%' OR Employee_PhoneNumber LIKE N'%{0}%'"
                           + " OR Employee_Email LIKE N'%{0}%' OR Department_Name LIKE N'%{0}%'"
                           + " OR Department_Description LIKE N'%{0}%' ) "
                           + " AND Employee_IsDelete = '{1}'";
            if (!isDelete)
                query += " AND Department_IsDelete = '{1}'";
            query = String.Format(query, content, isDelete);
            DBHelper.Instance.OpenConnection();
            SqlDataReader reader = DBHelper.Instance.ExecuteReaderSQL(query);

            List<EmployeeOfDepartment> list = new List<EmployeeOfDepartment>();

            while (reader.Read())
            {
                EmployeeOfDepartment eod = new EmployeeOfDepartment();
                eod.Employee_Id = reader.GetGuid(0);
                eod.Employee_FirtName = reader.GetString(2);
                eod.Employee_LastName = reader.GetString(3);
                eod.Employee_Gender = reader.GetBoolean(4);
                eod.Employee_DateOfBirth = DateTime.Parse(reader.GetDateTime(5).ToShortDateString());
                eod.Employee_Address = reader.GetString(6);
                eod.Employee_PhoneNumber = reader.GetString(7);
                eod.Employee_Email = reader.GetString(8);
                eod.Employee_Avatar = reader.GetString(9);
                eod.Employee_IsDelete = reader.GetBoolean(10);

                eod.Department_Id = reader.GetGuid(1);
                eod.Department_Name = reader.GetString(11);
                eod.Department_Description = reader.GetString(12);
                eod.Department_IsDelete = reader.GetBoolean(13);

                list.Add(eod);
            }
            DBHelper.Instance.CloseConnection();

            return list;
        }
    }
}
