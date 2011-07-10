using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class DealerBLL
    {
        DealerDAL dealer = new DealerDAL();
        /// <summary>
        /// Add new a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Dealer_Insert(Dealer entity)
        {
            return dealer.Dealer_Insert(entity);
        }

        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Dealer_Update(Dealer entity)
        {
            return dealer.Dealer_Update(entity);
        }

       /// <summary>
        /// Get All rows of table
       /// </summary>
       /// <returns></returns>
        public DataTable Dealer_ShowAllDisplay()
        {
            return dealer.Dealer_ShowAllDisplay();
        }

        /// <summary>
        /// Update Trang Thai
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <param name="Dealer_IsDelete"></param>
        /// <returns></returns>
        public int Dealer_UpdateStatus(string Dealer_Id, bool Dealer_IsDelete)
        {
            return dealer.Dealer_UpdateStatus(Dealer_Id, Dealer_IsDelete);
        }

        /// <summary>
        /// Delete a Dealer
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <returns></returns>
        public int Dealer_Delete(string Dealer_Id)
        {
            return dealer.Dealer_Delete(Dealer_Id);
        }

        /// <summary>
        /// Get a row
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <returns></returns>
        public DataRow Dealer_ShowOnewDisplay(string Dealer_Id)
        {
            return dealer.Dealer_ShowOnewDisplay(Dealer_Id);
        }

        /// <summary>
        /// Check Dealer_Id
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <returns></returns>
        public int Dealer_Check(string Dealer_Id)
        {
            return dealer.Dealer_Check(Dealer_Id);
        }
    }
}
