// -----------------------------------------------------------------------
// <copyright file="ServiceBusiness.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
using Eproject.ECS.Dal;

namespace Eproject.ECS.Bll
{
    /// <summary>
    /// The ServiceBusiness class is responsible for managing Eproject.ECS.Entities.Service objects in the system.
    /// </summary>
    public class ServiceBusiness
    {
        ServiceDAL SD = new ServiceDAL();
        /// <summary>
        /// Create a service.
        /// </summary>
        /// <param name="serviceId">Id of service.</param>
        /// <param name="name">Name of service.</param>
        /// <param name="description">Description of service.</param>
        /// <param name="charge">Charge of service.</param>
        /// <param name="data">Image of service.</param>
        public void CreateService(Guid serviceId, String name, String description, String charge, String data)
        {
            try
            {
                Service service = new Service();
                service.Service_Id = serviceId;
                service.Service_Name = name;
                service.Service_Description = description;
                service.Service_Charge = SecurityHelper.Instance.EncryptCryptography(charge, true);
                service.Service_Image = data;

                // Check name
                if (SD.GetService(service.Service_Name) != null)
                    throw new Exception(String.Format("This service with the name is '{0}' has already existed.", service.Service_Name));
                int result = SD.Create(service);
                if (result == -1)
                {
                    throw new Exception("An error occurred while executing this operation.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Get all services in database.
        /// </summary>
        /// <param name="isDelete">True if services are deleted, false otherwise.</param>
        /// <returns>A list of services.</returns>
        public List<Service> GetServices(bool isDelete)
        {
            try
            {
                return SD.GetServices(isDelete);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Select service by name.
        /// </summary>
        /// <param name="name">Name of service.</param>
        /// <returns>A service if it exists, null otherwise.</returns>
        public Service GetService(String name)
        {
            try
            {
                return SD.GetService(name);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
