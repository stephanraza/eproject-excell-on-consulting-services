using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Problem
    {

        #region Private member
        private string problem_id;
        private string customer_id;
        private string problem_title;
        private string problem_content;
        private bool problem_is_delete;

        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string ProblemId
        {
            get { return problem_id; }
            set { problem_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CustomerId
        {
            get { return customer_id; }
            set { customer_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProblemTitle
        {
            get { return problem_title; }
            set { problem_title = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProblemContent
        {
            get { return problem_content; }
            set { problem_content = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool ProblemIsDelete
        {
            get { return problem_is_delete; }
            set { problem_is_delete = value; }
        }

        #endregion

        #region Private member
        /// <summary>
        /// 
        /// </summary>
        public Problem()
        {
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="problemId"></param>
        /// <param name="customerId"></param>
        /// <param name="problemTitle"></param>
        /// <param name="problemContent"></param>
        /// <param name="problemIsDelete"></param>
        public Problem(string problemId, string customerId, string problemTitle, string problemContent, bool problemIsDelete)
        {
            problem_id = problemId;
            customer_id = customerId;
            problem_title = problemTitle;
            problem_content = problemContent;
            problem_is_delete = problemIsDelete;
        }

        #endregion

    }
}
