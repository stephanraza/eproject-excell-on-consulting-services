using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class ProblemOfCustomerBLL
    {
        ProblemOfCustomerDAL problemOfCustomer = new ProblemOfCustomerDAL();
        /// <summary>
        /// Add new a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Problem_Insert(ProblemOfCustomer entity)
        {
            return problemOfCustomer.ProblemOfCustomer_Insert(entity) > 0;
        }

        /// <summary>
        /// Show all display
        /// </summary>
        /// <returns></returns>
        public DataTable ProblemOfCustomer_ShowAllDisplay()
        {
            return problemOfCustomer.ProblemOfCustomer_ShowAllDisplay();
        }

        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ProblemOfCustomer_Update(ProblemOfCustomer entity)
        {
            return problemOfCustomer.ProblemOfCustomer_Update(entity) > 0;
        }

        /// <summary>
        /// Update IsDelete
        /// </summary>
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <param name="ProblemOfCustomer_IsDelete"></param>
        /// <returns></returns>
        public bool ProblemOfCustomer_UpdateStatus(string ProblemOfCustomer_Id, bool ProblemOfCustomer_IsDelete)
        {
            return problemOfCustomer.ProblemOfCustomer_UpdateStatus(ProblemOfCustomer_Id, ProblemOfCustomer_IsDelete) > 0;
        }

        /// <summary>
        /// Delete a row
        /// </summary>
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <returns></returns>
        public bool ProblemOfCustomer_Delete(string ProblemOfCustomer_Id)
        {
            return problemOfCustomer.ProblemOfCustomer_Delete(ProblemOfCustomer_Id) > 0;
        }

        /// <summary>
        /// Get a row
        /// </summary>
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <returns></returns>
        public DataRow ProblemOfCustomer_ShowOnewDisplay(string ProblemOfCustomer_Id)
        {
            return problemOfCustomer.ProblemOfCustomer_ShowOnewDisplay(ProblemOfCustomer_Id);
        }

        /// <summary>
        /// Check ID 
        /// </summary>
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <returns></returns>
        public bool ProblemOfCustomer_Check(string ProblemOfCustomer_Id)
        {
            return problemOfCustomer.ProblemOfCustomer_Check(ProblemOfCustomer_Id) > 0;
        }
    }
}
