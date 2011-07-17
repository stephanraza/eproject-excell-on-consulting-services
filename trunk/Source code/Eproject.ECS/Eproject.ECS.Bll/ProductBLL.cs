using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class ProductBLL
    {
        ProductDAL entity = new ProductDAL();

        /// <summary>
        /// Show all 
        /// </summary>
        /// <returns></returns>
        public DataTable Product_ShowAllDisplay(string key)
        {
            return entity.Product_ShowAllDisplay(key);
        }
        /// <summary>
        /// Add new a row
        /// </summary>
        /// <param name="entitys"></param>
        /// <returns></returns>
        public bool Product_Insert(Product entitys)
        {
            return entity.Product_Insert(entitys) > 0;
        }
        /// <summary>
        /// edit a row
        /// </summary>
        /// <param name="entitys"></param>
        /// <returns></returns>
        public int Product_Update(Product entitys)
        {
            return entity.Product_Update(entitys);
        }
        /// <summary>
        /// Delete a row
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <returns></returns>
        public int Product_Delete(string Product_Id)
        {
            return entity.Product_Delete(Product_Id);
        }
        /// <summary>
        /// Update Status IsDelete
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <param name="Product_IsDelete"></param>
        /// <returns></returns>
        public int Product_UpdateStatus(string Product_Id)
        {
            return entity.Product_UpdateStatus(Product_Id);
        }
        /// <summary>
        /// Check Exsits of ID
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <returns></returns>
        public int Product_Check(string Product_Id)
        {
            return entity.Product_Check(Product_Id);
        }

        /// <summary>
        ///  Get a row
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <returns></returns>
        public DataRow Product_ShowOnewDisplay(string Product_Id)
        {
            return entity.Product_ShowOnewDisplay(Product_Id);
        }

        public bool Product_UpdateStatusRemove(string Product_Id)
        {
            return entity.Product_UpdateStatusRemove(Product_Id) > 0;
        }

        public DataTable Product_ShowAllDisplayRemove(string key)
        {
            return entity.Product_ShowAllDisplayRemove(key);
        }
    }
}
