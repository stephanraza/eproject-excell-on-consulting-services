using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class CategoryEntity
    {
        #region Private Member
        private string category_id;
        private string category_name;
        private bool category_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string CategoryId
        {
            get { return category_id; }
            set { category_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CategoryName
        {
            get { return category_name; }
            set { category_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool CategoryIsDelete
        {
            get { return category_is_delete; }
            set { category_is_delete = value; }
        }
        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public CategoryEntity()
        {
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="categoryId"></param>
        /// <param name="categoryName"></param>
        /// <param name="categoryIsDelete"></param>
        public CategoryEntity(string categoryId, string categoryName, bool categoryIsDelete)
        {
            category_id = categoryId;
            category_name = categoryName;
            category_is_delete = categoryIsDelete;
        }

        #endregion

    }
}
