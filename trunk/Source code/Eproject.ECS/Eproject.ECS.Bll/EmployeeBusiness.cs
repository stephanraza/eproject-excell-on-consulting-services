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
        DepartmentBusiness DB = new DepartmentBusiness();
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
        public void CreateEmployee(String departmentName, String fName, String lName, String gender, String DOB, String address, String phone, String email, String avatar)
        {
            try
            {
                Employee newEmployee = new Employee();
                newEmployee.Employee_Id = new Guid();
                newEmployee.Department_Id = DB.GetDepartment(departmentName, false).Department_Id;
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
                newEmployee.Employee_Avatar = avatar;
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
        public List<String> GetEmailNotRegister()
        {
            try
            {
                List<String> listEmail = new List<String>();

                foreach (Object item in ED.GetEmployeesNotRegister())
                {
                    Employee employee = (Employee)item;
                    listEmail.Add(employee.Employee_Email);
                }
                return listEmail;
            }
            catch (Exception ex)
            {
                return new List<String>();
            }
        }


        public Employee GetEmployee(String email)
        {
            Employee employee = ED.GetEmployee(email);
            if (employee != null)
                return employee;
            else
                throw new Exception(String.Format("Emloyee with email is '{0}' not found!"));
        }
    }
}
