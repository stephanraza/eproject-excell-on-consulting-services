using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Department
    {
        public Guid Department_Id { get; set; }
        public String Department_Name { get; set; }
        public String Department_Description { get; set; }
        public bool Department_IsDelete { get; set; }
    }
}
