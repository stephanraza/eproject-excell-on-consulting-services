using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class News
    {
        public Guid News_Id { get; set; }
        public String News_Title { get; set; }
        public String News_Content { get; set; }
        public DateTime News_Date { get; set; }
        public bool News_IsDelete { get; set; }
    }
}
