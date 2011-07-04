using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class OrderOfServiceDetail
    {
        public Guid OrderOfService_Id { get; set; }
        public Guid Servive_Id { get; set; }
        public DateTime OrderOfServiceDetail_FromDate { get; set; }
        public DateTime OrderOfServiceDetail_ToDate { get; set; }
        public int OrderOfServiceDetail_NumberOfEmployee { get; set; }
        public String OrderOfServiceDetail_Price { get; set; }
        public bool OrderOfServiceDetail_IsDelete { get; set; }
    }
}
