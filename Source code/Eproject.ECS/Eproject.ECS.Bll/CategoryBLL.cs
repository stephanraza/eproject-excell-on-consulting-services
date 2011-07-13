using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class CategoryBLL
    {
        CategoryDAL _categoryDal = new CategoryDAL();
        /// <summary>
        /// Insert a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Category_Insert(Category entity)
        {
            return _categoryDal.Category_Insert(entity) > 0;
        }
        /// <summary>
        /// Get a table
        /// </summary>
        /// <returns></returns>
        public DataTable Category_ShowAllDisplay()
        {
            return _categoryDal.Category_ShowAllDisplay();
        }
        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Category_Update(Category entity)
        {
            return _categoryDal.Category_Update(entity);
        }
        /// <summary>
        /// update isdelete
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <param name="Category_IsDelete"></param>
        /// <returns></returns>
        public int Category_UpdateStatus(string Category_Id, bool Category_IsDelete)
        {
            return _categoryDal.Category_UpdateStatus(Category_Id, Category_IsDelete);
        }
        /// <summary>
        /// Delete a row
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <returns></returns>
        public int Category_Delete(string Category_Id)
        {
            return _categoryDal.Category_Delete(Category_Id);
        }
        /// <summary>
        /// Get a row
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <returns></returns>
        public DataRow Category_ShowOnewDisplay(string Category_Id)
        {
            return _categoryDal.Category_ShowOnewDisplay(Category_Id);
        }

        /// <summary>
        /// Check Category_Id
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <returns></returns>
        public int Category_Check(string Category_Id)
        {
            return _categoryDal.Category_Check(Category_Id);
        }

        public bool Category_CheckName(string Category_Name)
        {
            return _categoryDal.Category_CheckName(Category_Name) > 0;
        }
    }
}
