using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class NewsEntity
    {

        #region Private member
        private string news_id;
        private string news_title;
        private string news_content;
        private DateTime news_date;
        private bool news_is_delete;
        #endregion


        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string NewsId
        {
            get { return news_id; }
            set { news_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsTitle
        {
            get { return news_title; }
            set { news_title = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsContent
        {
            get { return news_content; }
            set { news_content = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime NewsDate
        {
            get { return news_date; }
            set { news_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool NewsIsDelete
        {
            get { return news_is_delete; }
            set { news_is_delete = value; }
        }

        #endregion


        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public NewsEntity()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newsId"></param>
        /// <param name="newsTitle"></param>
        /// <param name="newsContent"></param>
        /// <param name="newsDate"></param>
        /// <param name="newsIsDelete"></param>
        public NewsEntity(string newsId, string newsTitle, string newsContent, DateTime newsDate, bool newsIsDelete)
        {
            news_id = newsId;
            news_title = newsTitle;
            news_content = newsContent;
            news_date = newsDate;
            news_is_delete = newsIsDelete;
        }

        #endregion

    }
}
