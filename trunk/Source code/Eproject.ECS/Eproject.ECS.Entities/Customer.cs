using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Customer
    {
        public Guid Customer_Id { get; set; }
        public String Customer_FulName { get; set; }
        public String Customer_Phone { get; set; }
        public String Customer_Address { get; set; }
        public bool Customer_IsDelete { get; set; }
    }
}
