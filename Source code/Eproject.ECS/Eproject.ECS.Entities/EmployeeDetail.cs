using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class EmployeeDetail
    {
        public Guid Employee_Id { get; set; }
        public String Employee_FullName { get; set; }
        public String Employee_Gender { get; set; }
        public String Employee_DateOfBirth { get; set; }
        public String Employee_Address { get; set; }
        public String Employee_PhoneNumber { get; set; }
        public String Employee_Email { get; set; }
        public String Employee_Avatar { get; set; }
        public bool Employee_IsDelete { get; set; }

        public Guid Account_Id { get; set; }
        public String Role_Name { get; set; }
        public String Account_UserName { get; set; }
        public bool Account_IsLocked { get; set; }

        public Guid Department_Id { get; set; }
        public String Department_Name { get; set; }
    }
}
