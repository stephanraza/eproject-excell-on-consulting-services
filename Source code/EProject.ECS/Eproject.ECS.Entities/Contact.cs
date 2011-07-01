using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Contact
    {
        #region Private member
        private string contact_id;
        private string contact_title;
        private string contact_content;
        private string contact_name;
        private string contact_email;
        private DateTime contact_date;
        private int contact_status;
        private bool contact_is_delete;

        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string ContactId
        {
            get { return contact_id; }
            set { contact_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContactTitle
        {
            get { return contact_title; }
            set { contact_title = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContactContent
        {
            get { return contact_content; }
            set { contact_content = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContactName
        {
            get { return contact_name; }
            set { contact_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContactEmail
        {
            get { return contact_email; }
            set { contact_email = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ContactDate
        {
            get { return contact_date; }
            set { contact_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int ContactStatus
        {
            get { return contact_status; }
            set { contact_status = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool ContactIsDelete
        {
            get { return contact_is_delete; }
            set { contact_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public Contact()
        {
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="contactId"></param>
        /// <param name="contactTitle"></param>
        /// <param name="contactContent"></param>
        /// <param name="contactName"></param>
        /// <param name="contactEmail"></param>
        /// <param name="contactDate"></param>
        /// <param name="contactStatus"></param>
        /// <param name="contactIsDelete"></param>
        public Contact(string contactId, string contactTitle, string contactContent, string contactName, string contactEmail, DateTime contactDate, int contactStatus, bool contactIsDelete)
        {
            contact_id = contactId;
            contact_title = contactTitle;
            contact_content = contactContent;
            contact_name = contactName;
            contact_email = contactEmail;
            contact_date = contactDate;
            contact_status = contactStatus;
            contact_is_delete = contactIsDelete;
        }

        #endregion
    }
}
