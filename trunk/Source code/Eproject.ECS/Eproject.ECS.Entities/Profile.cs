using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Profile
    {
        public String Profile_Id { get; set; }
        public String Employee_Id { get; set; }
        public String Profile_FirtName { get; set; }
        public String Profile_LastName { get; set; }
        public bool Profile_Gender { get; set; }
        public DateTime Profile_DateOfBirth { get; set; }
        public String Profile_Address { get; set; }
        public String Profile_PhoneNumber { get; set; }
        public String Profile_Email { get; set; }
        public String Profile_Avatar { get; set; }
        public bool Profile_IsDelete { get; set; }
    }
}
