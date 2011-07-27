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
        /// Get all employees in database.
        /// </summary>
        /// <returns>List of employees.</returns>
        public List<Employee> GetEmployees(bool isDelete)
        {
            List<Employee> listEmployee = new List<Employee>();
            List<Object> listObject = DBHelper.Instance.Select("Employee", String.Format("Employee_IsDelete='{0}'", isDelete), null, -1, -1);

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
        public List<Object> GetEmployeesNotRegistered()
        {
            return DBHelper.Instance.Select("Employee", "Employee_Id NOT IN(SELECT Employee_Id FROM Account) AND Employee_IsDelete = 'False'", null, -1, -1);
        }
        /// <summary>
        /// Search employees by anything.
        /// </summary>
        /// <param name="where">Condition for searching.</param>
        /// <returns>List of employee.</returns>
        public List<EmployeeDetail> Search(String where, bool isDelete)
        {
            String query = "SELECT e.Employee_Id, e.Department_Id, a.Account_Id,"
                           + " e.Employee_FirtName, e.Employee_LastName,"
                           + " e.Employee_Gender, e.Employee_DateOfBirth,"
                           + " e.Employee_Address, e.Employee_PhoneNumber,"
                           + " e.Employee_Email, e.Employee_Avatar,"
                           + " d.Department_Name, a.Account_UserName, a.Role_Name,"
                           + " a.Account_IsLocked, a.Account_IsDelete"
                           + " FROM department d RIGHT JOIN employee e ON d.Department_Id = e.Department_Id"
                           + " LEFT JOIN Account a ON a.Employee_Id = e.Employee_Id"
                           + " WHERE {0} e.Employee_IsDelete = '{1}'";

            query = String.Format(query, where, isDelete);
            DBHelper.Instance.OpenConnection();
            SqlDataReader reader = DBHelper.Instance.ExecuteReaderSQL(query);

            List<EmployeeDetail> list = new List<EmployeeDetail>();

            while (reader.Read())
            {
                EmployeeDetail employeeDetail = new EmployeeDetail();
                if (!reader.IsDBNull(0))
                {
                    employeeDetail.Employee_Id = reader.GetGuid(0);
                    employeeDetail.Employee_FullName = reader.GetString(3) + " " + reader.GetString(4);
                    if (reader.GetBoolean(5))
                        employeeDetail.Employee_Gender = "Male";
                    else
                        employeeDetail.Employee_Gender = "Female";
                    employeeDetail.Employee_DateOfBirth = reader.GetDateTime(6).ToShortDateString();
                    employeeDetail.Employee_Address = reader.GetString(7);
                    employeeDetail.Employee_PhoneNumber = reader.GetString(8);
                    employeeDetail.Employee_Email = reader.GetString(9);
                    employeeDetail.Employee_Avatar = reader.GetString(10);
                }
                if (!reader.IsDBNull(1))
                {
                    employeeDetail.Department_Id = reader.GetGuid(1);
                    employeeDetail.Department_Name = reader.GetString(11);
                }
                if (!reader.IsDBNull(2))
                {
                    if (reader.GetBoolean(15) == isDelete)
                    {
                        employeeDetail.Account_Id = reader.GetGuid(2);
                        employeeDetail.Account_UserName = reader.GetString(12);
                        employeeDetail.Role_Name = reader.GetString(13);
                        employeeDetail.Account_IsLocked = reader.GetBoolean(14);
                    }
                }

                list.Add(employeeDetail);
            }
            DBHelper.Instance.CloseConnection();

            return list;
        }
    }
}
