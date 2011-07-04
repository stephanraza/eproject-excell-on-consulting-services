using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class CustomerOfCompany
    {
        public Guid Customer_Id { get; set; }
        public Guid Company_Id { get; set; }
        public bool CustomerOfCompany_IsDelete { get; set; }
    }
}
