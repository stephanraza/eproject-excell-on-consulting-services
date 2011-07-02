using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class ProblemOfCustomer
    {
        public String ProblemOfCustomer_Id { get; set; }
        public String Customer_Id { get; set; }
        public String Company_Id { get; set; }
        public String Problem_Id { get; set; }
        public DateTime ProblemOfCustomer_Date { get; set; }
        public bool ProblemOfCustomer_IsDelete { get; set; }
    }
}
