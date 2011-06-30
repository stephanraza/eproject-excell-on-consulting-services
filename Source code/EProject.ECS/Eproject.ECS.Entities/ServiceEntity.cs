using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class ServiceEntity
    {

        #region Private member
        private string service_id;
        private string service_name;
        private string service_image;
        private string service_description;
        private string service_charge;
        private bool service_is_delete;

        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public string ServiceId
        {
            get { return service_id; }
            set { service_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ServiceName
        {
            get { return service_name; }
            set { service_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ServiceImage
        {
            get { return service_image; }
            set { service_image = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ServiceDescription
        {
            get { return service_description; }
            set { service_description = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ServiceCharge
        {
            get { return service_charge; }
            set { service_charge = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool ServiceIsDelete
        {
            get { return service_is_delete; }
            set { service_is_delete = value; }
        }

        #endregion

        #region Private member
        /// <summary>
        /// 
        /// </summary>
        public ServiceEntity()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceId"></param>
        /// <param name="serviceName"></param>
        /// <param name="serviceImage"></param>
        /// <param name="serviceDescription"></param>
        /// <param name="serviceCharge"></param>
        /// <param name="serviceIsDelete"></param>
        public ServiceEntity(string serviceId, string serviceName, string serviceImage, string serviceDescription, string serviceCharge, bool serviceIsDelete)
        {
            service_id = serviceId;
            service_name = serviceName;
            service_image = serviceImage;
            service_description = serviceDescription;
            service_charge = serviceCharge;
            service_is_delete = serviceIsDelete;
        }

        #endregion

    }
}
