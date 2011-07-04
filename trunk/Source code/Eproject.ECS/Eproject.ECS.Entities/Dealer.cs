using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Dealer
    {
        public Guid Dealer_Id { get; set; }
        public Guid Company_Id { get; set; }
        public String Dealer_Name { get; set; }
        public String Dealer_Address { get; set; }
        public String Dealer_Phone { get; set; }
        public String Dealer_Email { get; set; }
        public bool Dealer_IsDelete { get; set; }
    }
}
