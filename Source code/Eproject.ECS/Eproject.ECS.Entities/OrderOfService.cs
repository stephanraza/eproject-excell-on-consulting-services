﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class OrderOfService
    {
        public Guid OrderOfService_Id { get; set; }
        public Guid Company_Id { get; set; }
        public Guid Employee_Id { get; set; }
        public String OrderOfService_Description { get; set; }
        public String OrderOfService_PaymentMethod { get; set; }
        public DateTime OrderOfService_PaymentDate { get; set; }
        public DateTime OrderOfService_BillDate { get; set; }
        public int OrderOfService_Status { get; set; }
        public bool OrderOfService_IsDelete { get; set; }
    }
}
