using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Category
    {
        public Guid Category_Id { get; set; }
        public String Category_Name { get; set; }
        public bool Category_IsDelete { get; set; }
    }
}
