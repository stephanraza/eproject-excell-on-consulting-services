using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Problem
    {
        public Guid Problem_Id { get; set; }        
        public String Problem_Title { get; set; }
        public String Problem_Content { get; set; }
        public bool Problem_IsDelete { get; set; }
    }
}
