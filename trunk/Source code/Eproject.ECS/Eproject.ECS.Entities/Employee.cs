using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Employee
    {
        public Guid Employee_Id { get; set; }
        public Guid Department_Id { get; set; }
        public bool Employee_IsDelete { get; set; }
    }
}
