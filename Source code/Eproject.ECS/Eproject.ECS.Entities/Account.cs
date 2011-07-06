using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Account
    {
        public Guid Account_Id { get; set; }
        public Guid Employee_Id { get; set; }
        public String Role_Name { get; set; }
        public String Account_UserName { get; set; }
        public String Account_Password { get; set; }
        public bool Account_IsLocked { get; set; }
        public bool Account_IsDelete { get; set; }
    }
}
