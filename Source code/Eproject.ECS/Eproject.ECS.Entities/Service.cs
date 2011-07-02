using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Service
    {
        public String Service_Id { get; set; }
        public String Service_Name { get; set; }
        public String Service_Image { get; set; }
        public String Service_Description { get; set; }
        public String Service_Charge { get; set; }
        public bool Service_IsDelete { get; set; }
    }
}
