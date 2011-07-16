using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class EmployeeOfDepartment
    {
        public Guid Employee_Id { get; set; }
        public Guid Department_Id { get; set; }
        public String Employee_FirtName { get; set; }
        public String Employee_LastName { get; set; }
        public bool Employee_Gender { get; set; }
        public DateTime Employee_DateOfBirth { get; set; }
        public String Employee_Address { get; set; }
        public String Employee_PhoneNumber { get; set; }
        public String Employee_Email { get; set; }
        public String Employee_Avatar { get; set; }
        public bool Employee_IsDelete { get; set; }
        public String Department_Name { get; set; }
        public String Department_Description { get; set; }
        public bool Department_IsDelete { get; set; }
    }
}
