using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Contact
    {
        public String Contact_Id { get; set; }
        public String Contact_Title { get; set; }
        public String Contact_Content { get; set; }
        public String Contact_Name { get; set; }
        public String Contact_Email { get; set; }
        public DateTime Contact_Date { get; set; }
        public int Contact_Status { get; set; }
        public bool Contact_IsDelete { get; set; }
    }
}
