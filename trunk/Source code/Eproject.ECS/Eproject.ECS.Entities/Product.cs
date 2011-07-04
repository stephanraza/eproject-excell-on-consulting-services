using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Product
    {
        public Guid Product_Id { get; set; }
        public Guid Company_Id { get; set; }
        public Guid Category_Id { get; set; }
        public String Product_Name { get; set; }
        public String Product_Price { get; set; }
        public String Product_Description { get; set; }
        public String Product_Image { get; set; }
        public DateTime Product_ManufactureDate { get; set; }
        public DateTime Product_ExpiryDate { get; set; }
        public bool Product_IsDelete { get; set; }
    }
}
