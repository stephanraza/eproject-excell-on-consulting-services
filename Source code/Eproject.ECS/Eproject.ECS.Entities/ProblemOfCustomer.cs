using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class ProblemOfCustomer
    {
        public Guid ProblemOfCustomer_Id { get; set; }
        public Guid Company_Id { get; set; }
        public Guid Problem_Id { get; set; }
        public DateTime ProblemOfCustomer_Date { get; set; }
        public bool ProblemOfCustomer_IsDelete { get; set; }
    }
}
