using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Employee
    {

        #region Private Memember
        private string employee_id;
        private string department_id;
        private bool employee_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string EmployeeId
        {
            get { return employee_id; }
            set { employee_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DepartmentId
        {
            get { return department_id; }
            set { department_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool EmployeeIsDelete
        {
            get { return employee_is_delete; }
            set { employee_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public Employee()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="employeeId"></param>
        /// <param name="departmentId"></param>
        /// <param name="employeeIsDelete"></param>
        public Employee(string employeeId, string departmentId, bool employeeIsDelete)
        {
            employee_id = employeeId;
            department_id = departmentId;
            employee_is_delete = employeeIsDelete;
        }

        #endregion

    }
}
