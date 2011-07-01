using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Profile
    {

        #region Private member
        private string profile_id;
        private string employee_id;
        private string profile_firt_name;
        private string profile_last_name;
        private bool profile_gender;
        private DateTime profile_date_of_birth;
        private string profile_address;
        private string profile_phone_number;
        private string profile_email;
        private string profile_avatar;
        private bool profile_is_delete;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string ProfileId
        {
            get { return profile_id; }
            set { profile_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string EmployeeId
        {
            get { return employee_id; }
            set { employee_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProfileFirtName
        {
            get { return profile_firt_name; }
            set { profile_firt_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProfileLastName
        {
            get { return profile_last_name; }
            set { profile_last_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool ProfileGender
        {
            get { return profile_gender; }
            set { profile_gender = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ProfileDateOfBirth
        {
            get { return profile_date_of_birth; }
            set { profile_date_of_birth = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProfileAddress
        {
            get { return profile_address; }
            set { profile_address = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProfilePhoneNumber
        {
            get { return profile_phone_number; }
            set { profile_phone_number = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProfileEmail
        {
            get { return profile_email; }
            set { profile_email = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProfileAvatar
        {
            get { return profile_avatar; }
            set { profile_avatar = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool ProfileIsDelete
        {
            get { return profile_is_delete; }
            set { profile_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public Profile()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="profileId"></param>
        /// <param name="employeeId"></param>
        /// <param name="profileFirtName"></param>
        /// <param name="profileLastName"></param>
        /// <param name="profileGender"></param>
        /// <param name="profileDateOfBirth"></param>
        /// <param name="profileAddress"></param>
        /// <param name="profilePhoneNumber"></param>
        /// <param name="profileEmail"></param>
        /// <param name="profileAvatar"></param>
        /// <param name="profileIsDelete"></param>
        public Profile(string profileId, string employeeId, string profileFirtName, string profileLastName, bool profileGender, DateTime profileDateOfBirth, string profileAddress, string profilePhoneNumber, string profileEmail, string profileAvatar, bool profileIsDelete)
        {
            profile_id = profileId;
            employee_id = employeeId;
            profile_firt_name = profileFirtName;
            profile_last_name = profileLastName;
            profile_gender = profileGender;
            profile_date_of_birth = profileDateOfBirth;
            profile_address = profileAddress;
            profile_phone_number = profilePhoneNumber;
            profile_email = profileEmail;
            profile_avatar = profileAvatar;
            profile_is_delete = profileIsDelete;
        }

        #endregion
    }
}
