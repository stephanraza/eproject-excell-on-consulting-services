using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Company
    {
        public Guid Company_Id { get; set; }
        public String Company_Name { get; set; }
        public String Company_Logo { get; set; }
        public String Company_Description { get; set; }
        public String Company_Phone { get; set; }
        public String Company_Email { get; set; }
        public String Company_Address { get; set; }
        public bool Company_IsDelete { get; set; }
    }
}
