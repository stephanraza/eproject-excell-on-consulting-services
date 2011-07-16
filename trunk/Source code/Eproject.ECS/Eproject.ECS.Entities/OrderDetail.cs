using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class OrderDetail
    {
        public Guid Service_Id { get; set; }
        public String Service_Name { get; set; }
        public String Service_Image { get; set; }
        public String Service_Description { get; set; }
        public String Service_Charge { get; set; }
        public bool Service_IsDelete { get; set; }

        public Guid OrderOfService_Id { get; set; }
        public DateTime OrderOfServiceDetail_FromDate { get; set; }
        public DateTime OrderOfServiceDetail_ToDate { get; set; }
        public int OrderOfServiceDetail_NumberOfEmployee { get; set; }
        public String OrderOfServiceDetail_Price { get; set; }
        public bool OrderOfServiceDetail_IsDelete { get; set; }
    }
}
