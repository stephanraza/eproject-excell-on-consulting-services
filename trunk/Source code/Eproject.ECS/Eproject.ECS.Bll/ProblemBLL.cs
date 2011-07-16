using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Dal;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Bll
{
    public class ProblemBLL
    {

        ProblemDAL problem = new ProblemDAL();
        /// <summary>
        /// Addnew a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Problem_Insert(Problem entity)
        {
            return problem.Problem_Insert(entity);
        }

        /// <summary>
        /// get all rows
        /// </summary>
        /// <returns></returns>
        public DataTable Problem_ShowAllDisplay(string SearchKey)
        {
            return problem.Problem_ShowAllDisplay(SearchKey);
        }

        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Problem_Update(Problem entity)
        {
            return problem.Problem_Update(entity);
        }

        /// <summary>
        /// Update trang isDelete
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <param name="Problem_IsDelete"></param>
        /// <returns></returns>
        public int Problem_UpdateStatus(string Problem_Id)
        {
            return problem.Problem_UpdateStatus(Problem_Id);
        }

        /// <summary>
        /// get a row
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <returns></returns>
        public DataTable Problem_ShowOnewDisplay(string Problem_Id)
        {
            return problem.Problem_ShowOnewDisplay(Problem_Id);
        }

        /// <summary>
        /// Check Id
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <returns></returns>
        public int Problem_Check(string Problem_Id)
        {
            return problem.Problem_Check(Problem_Id);
        }

        public bool Problem_Delete(string Problem_Id)
        {
            return problem.Problem_Delete(Problem_Id) > 0;
        }

        public bool Problem_DeleteRemove(string Problem_Id)
        {
            return problem.Problem_DeleteRemove(Problem_Id) > 0;
        }

        public DataTable Problem_ShowAllDisplayRemove(string KeyWord)
        {
            return problem.Problem_ShowAllDisplayRemove(KeyWord);
        }
    }
}
