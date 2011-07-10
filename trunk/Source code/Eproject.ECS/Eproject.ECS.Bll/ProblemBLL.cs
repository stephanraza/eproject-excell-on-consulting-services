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
        public DataTable Problem_ShowAllDisplay()
        {
            return problem.Problem_ShowAllDisplay();
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
        public int Problem_UpdateStatus(string Problem_Id, bool Problem_IsDelete)
        {
            return problem.Problem_UpdateStatus(Problem_Id, Problem_IsDelete);
        }

        /// <summary>
        /// get a row
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <returns></returns>
        public DataRow Problem_ShowOnewDisplay(string Problem_Id)
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
    }
}
