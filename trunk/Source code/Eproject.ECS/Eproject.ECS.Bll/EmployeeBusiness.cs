// -----------------------------------------------------------------------
// <copyright file="EmployeeBusiness.cs">
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
using System.IO;

namespace Eproject.ECS.Bll
{
    /// <summary>
    /// The EmployeeBusiness class is responsible for managing Eproject.ECS.Entities.Employee objects in the system.
    /// </summary>
    public class EmployeeBusiness
    {
        EmployeeDAL ED = new EmployeeDAL();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="departmentName"></param>
        /// <param name="fName"></param>
        /// <param name="lName"></param>
        /// <param name="gender"></param>
        /// <param name="DOB"></param>
        /// <param name="address"></param>
        /// <param name="phone"></param>
        /// <param name="email"></param>
        /// <param name="avatar"></param>
        public void CreateEmployee(Guid employeeId, Guid departmentId, String fName, String lName, String gender, String DOB, String address, String phone, String email, String data)
        {
            try
            {
                DepartmentBusiness DB = new DepartmentBusiness();
                Employee newEmployee = new Employee();
                newEmployee.Employee_Id = employeeId;
                newEmployee.Department_Id = departmentId;
                newEmployee.Employee_FirtName = fName;
                newEmployee.Employee_LastName = lName;
                if (gender.Equals("Male"))
                    newEmployee.Employee_Gender = true;
                else
                    newEmployee.Employee_Gender = false;
                newEmployee.Employee_DateOfBirth = DateTime.Parse(DOB);
                newEmployee.Employee_PhoneNumber = phone;
                newEmployee.Employee_Address = address;
                newEmployee.Employee_Email = email;
                newEmployee.Employee_Avatar = data;
                newEmployee.Employee_IsDelete = false;

                int result = ED.CreateEmployee(newEmployee);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Employee> GetEmployeesNotRegistered()
        {
            try
            {
                List<Employee> list = new List<Employee>();
                List<Object> listObj = ED.GetEmployeesNotRegistered();

                foreach (Object item in listObj)
                {
                    Employee employee = (Employee)item;
                    list.Add(employee);
                }
                return list;
            }
            catch (Exception ex)
            {
                return new List<Employee>();
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="employeeId"></param>
        /// <returns></returns>
        public Employee GetEmployee(Guid employeeId)
        {
            Employee employee = ED.GetEmployee(employeeId);
            if (employee != null)
                return employee;
            else
                throw new Exception(String.Format("This emloyee is not exists."));
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public Employee GetEmployee(String email)
        {
            Employee employee = ED.GetEmployee(email);
            if (employee != null)
                return employee;
            else
                throw new Exception(String.Format("Emloyee with email is '{0}' not found!"));
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool IsExist(String email)
        {
            try
            {
                if (GetEmployee(email) != null)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="fName"></param>
        /// <param name="lName"></param>
        /// <param name="email"></param>
        /// <param name="address"></param>
        /// <param name="phone"></param>
        /// <param name="gender"></param>
        /// <param name="dob"></param>
        /// <param name="data"></param>
        public void UpdateEmployee(Guid employeeId, Guid departmentId, String fName, String lName, String email, String address, String phone, String gender, String dob, String data)
        {
            Employee employee = ED.GetEmployee(employeeId);

            employee.Department_Id = departmentId;
            if (fName != null)
                employee.Employee_FirtName = fName;
            if (lName != null)
                employee.Employee_LastName = lName;
            if (email != null)
                employee.Employee_Email = email;
            if (address != null)
                employee.Employee_Address = address;
            if (phone != null)
                employee.Employee_PhoneNumber = phone;
            if (gender != null)
            {
                if (gender.Equals("Male"))
                    employee.Employee_Gender = true;
                else if (gender.Equals("Female"))
                    employee.Employee_Gender = false;
            }
            if (dob != null)
            {
                if (dob.Equals(""))
                    dob = "1/1/1900";
                employee.Employee_DateOfBirth = DateTime.Parse(dob);
            }
            if (data != null)
                employee.Employee_Avatar = data;

            int result = ED.UpdateEmployee(employee);
            if (result == -1)
            {
                throw new Exception("An error occurred while executing this operation.");
            }
        }
        /// <summary>
        /// Get all employees in department.
        /// </summary>
        /// <returns>List of employees.</returns>
        public List<Employee> GetEmployees(Guid departmentId, bool isDelete)
        {
            try
            {
                return ED.GetEmployees(departmentId.ToString(), isDelete);
            }
            catch (Exception ex)
            {
                return new List<Employee>();
            }
        }
        /// <summary>
        /// Get all employees in database.
        /// </summary>
        /// <returns>List of employees.</returns>
        public List<Employee> GetEmployees(bool isDelete)
        {
            try
            {
                return ED.GetEmployees(isDelete);
            }
            catch (Exception ex)
            {
                return new List<Employee>();
            }
        }
        /// <summary>
        /// Delete permanently an employee.
        /// </summary>
        /// <param name="emId">Id of the employee that you want to delete.</param>
        public void DeleteEmployee(Guid emId)
        {
            try
            {
                Employee employee = ED.GetEmployee(emId);

                // Check related datas
                OrderBusiness OB = new OrderBusiness();
                List<Order> list = OB.GetOrdersByEmployeeId(emId, false);
                if (list.Count == 0)
                {
                    // Delete account of this employee first.
                    AccountBusiness AB = new AccountBusiness();
                    Account account = AB.GetAccountOfEmployee(emId);
                    if (account != null)
                        AB.DeleteAccount(account.Account_Id);
                    // Then delete orders of this employee
                    foreach (Order item in list)
                    {
                        OB.DeleteOrder(item.OrderOfService_Id);
                    }
                    int result = ED.DeleteEmployee(employee);
                    if (result == -1)
                    {
                        throw new Exception("An error occurred while executing this operation.");
                    }
                }
                else
                {
                    throw new Exception("This employee's data is also related to some other data. It could be not deleted.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Remove an employee to trash.
        /// </summary>
        /// <param name="employeeId">Id of the employee that you want to remove.</param>
        public void RemoveEmployee(Guid employeeId)
        {
            try
            {
                Employee employee = GetEmployee(employeeId);
                //Remove account first.
                AccountBusiness AB = new AccountBusiness();
                Account account = AB.GetAccountOfEmployee(employeeId);
                if (account != null)
                    AB.RemoveAccount(account.Account_Id);

                employee.Employee_IsDelete = true;
                int result = ED.UpdateEmployee(employee);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (NullReferenceException ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Restore an employee from trash.
        /// </summary>
        /// <param name="employeeId">Id of the employee that you want to restore.</param>
        public void RestoreEmployee(Guid employeeId)
        {
            try
            {
                Employee employee = GetEmployee(employeeId);
                employee.Employee_IsDelete = false;
                int result = ED.UpdateEmployee(employee);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
                //Then restore account.
                AccountBusiness AB = new AccountBusiness();
                Account account = AB.GetAccountOfEmployee(employeeId);
                if (account != null)
                    AB.RestoreAccount(account.Account_Id);
            }
            catch (NullReferenceException ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Filter while searching
        /// </summary>
        /// <param name="searchBy">Searching by filter.</param>
        /// <returns>String for searching.</returns>
        private String SearchBy(String searchBy)
        {
            String result = "";
            String searchByEmployee = "e.Employee_FirtName LIKE N'%{0}%' OR e.Employee_LastName LIKE N'%{0}%'"
                                    + " OR e.Employee_Address LIKE N'%{0}%' OR e.Employee_PhoneNumber LIKE N'%{0}%'"
                                    + " OR e.Employee_Email LIKE N'%{0}%'";
            String searchByAccount = "a.Role_Name LIKE N'%{0}%'"
                                   + " OR a.Account_UserName LIKE N'%{0}%'";
            String searchByDepartment = "d.Department_Name LIKE N'%{0}%'"
                                      + " OR d.Department_Description LIKE N'%{0}%'";
            if (searchBy.Equals("Employee"))
                result = searchByEmployee;
            else if (searchBy.Equals("Account"))
                result = searchByAccount;
            else if (searchBy.Equals("Department"))
                result = searchByDepartment;
            else if (String.IsNullOrEmpty(searchBy) || searchBy.Equals("All"))
            {
                result = searchByEmployee + " OR " + searchByAccount + " OR " + searchByDepartment;
            }
            return result;
        }
        /// <summary>
        /// Search employees by anything.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <returns>List of employee.</returns>
        public List<EmployeeDetail> SearchEmployee(String content, String searchBy, bool isDelete)
        {
            try
            {
                String conditionSearchBy = "({0})";
                String result = SearchBy(searchBy);
                if (!String.IsNullOrEmpty(result))
                    conditionSearchBy = String.Format(conditionSearchBy, result);
                else
                    conditionSearchBy = "";

                String where = conditionSearchBy + " AND ";
                content = content.Replace("'", " ");
                where = String.Format(where, content);

                return ED.Search(where, isDelete);
            }
            catch (Exception ex)
            {
                return new List<EmployeeDetail>();
            }
        }
        /// <summary>
        /// Advance search for searching employee.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="gender">Gender of employee.</param>
        /// <param name="fromDate">Searching birthday in range.</param>
        /// <param name="toDate">Searching birthday in range.</param>
        /// <param name="isDelete">True if these employees are deleted, false otherwise.</param>
        /// <returns>List of employee.</returns>
        public List<EmployeeDetail> SearchEmployee(String content, String searchBy, String gender, String fromDate, String toDate, bool isDelete)
        {
            try
            {
                String conditionSearchBy = "({0})";
                String result = SearchBy(searchBy);
                if (!String.IsNullOrEmpty(result))
                    conditionSearchBy = String.Format(conditionSearchBy, result);
                else
                    conditionSearchBy = "";

                String conditionGender = " AND e.Employee_Gender = '{0}'";
                if (gender.Equals("Male"))
                    conditionGender = String.Format(conditionGender, true);
                else if (gender.Equals("Female"))
                    conditionGender = String.Format(conditionGender, false);
                else
                    conditionGender = "";

                String conditionDate = " AND e.Employee_DateOfBirth BETWEEN '{0}' AND '{1}'";
                if (String.IsNullOrEmpty(fromDate))
                    fromDate = "1/1/1900";
                if (String.IsNullOrEmpty(toDate))
                    toDate = DateTime.Now.ToShortDateString();
                conditionDate = String.Format(conditionDate, fromDate, toDate);

                String where = conditionSearchBy ;

                content = content.Replace("'", " ");
                where = String.Format(where, content);
                where = where + conditionGender + conditionDate + " AND ";

                return ED.Search(where, isDelete);
            }
            catch (Exception ex)
            {
                return new List<EmployeeDetail>();
            }
        }
        /// <summary>
        /// Advance search for searching employee.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="status">Status of these accounts for searching.</param>
        /// <param name="isDelete">True if these employees are deleted, false otherwise.</param>
        /// <returns>List of employee.</returns>
        public List<EmployeeDetail> SearchEmployee(String content, String searchBy, String status, bool isDelete)
        {
            try
            {
                String conditionSearchBy = "({0})";
                String result = SearchBy(searchBy);
                if (!String.IsNullOrEmpty(result))
                    conditionSearchBy = String.Format(conditionSearchBy, result);
                else
                    conditionSearchBy = "";

                String conditionStatus = " AND a.Account_IsLocked = '{0}'";
                if (status.Equals("Locked"))
                    conditionStatus = String.Format(conditionStatus, true);
                else if (status.Equals("Unlocked"))
                    conditionStatus = String.Format(conditionStatus, false);
                else
                    conditionStatus = "";

                String where = conditionSearchBy;

                content = content.Replace("'", " ");
                where = String.Format(where, content);
                where = where + conditionStatus + " AND ";
                return ED.Search(where, isDelete);
            }
            catch (Exception ex)
            {
                return new List<EmployeeDetail>();
            }
        }
    }
}
