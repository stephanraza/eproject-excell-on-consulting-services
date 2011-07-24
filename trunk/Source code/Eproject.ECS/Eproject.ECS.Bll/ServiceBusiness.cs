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
        /// Get all services in database.
        /// </summary>
        /// <returns>A list of services.</returns>
        public List<Service> GetServices()
        {
            try
            {
                return SD.GetServices();
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
        /// <summary>
        /// Select service by id.
        /// </summary>
        /// <param name="serviceId">Id of service.</param>
        /// <returns>A service if it exists, null otherwise.</returns>
        public Service GetService(Guid serviceId)
        {
            try
            {
                return SD.GetService(serviceId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Searching service.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="isDelete">True if services are deleted, false otherwise.</param>
        /// <returns>A list of services.</returns>
        public List<Service> SearchService(String content, bool isDelete)
        {
            try
            {
                String where = "([Service_Name] LIKE N'%{0}%' OR Service_Description LIKE N'%{0}%') AND ";
                content = content.Replace("'", " ");
                if (!String.IsNullOrEmpty(content))
                    where = String.Format(where, content);
                else
                    where = "";

                return SD.Search(where, isDelete);
            }
            catch (Exception ex)
            {
                return new List<Service>();
            }
        }
        /// <summary>
        /// Delete a service.
        /// </summary>
        /// <param name="serviceId">Id of the service.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public void DeleteService(Guid serviceId)
        {
            try
            {
                OrderBusiness OB = new OrderBusiness();
                List<OrderOfServiceDetail> listDetail = OB.GetOrderDetailsByServiceId(serviceId, false);
                if (listDetail.Count == 0)
                {
                    List<OrderOfServiceDetail> listDetailRemoved = OB.GetOrderDetailsByServiceId(serviceId, true);
                    if (listDetailRemoved.Count > 0)
                        OB.DeleteOrderDetail(null, serviceId.ToString());

                    int result = SD.Delete(serviceId);
                    if (result == -1)
                    {
                        throw new Exception("An error occurred while executing this operation.");
                    }
                }
                else
                {
                    throw new Exception("This service's data is also related to some other data. It could be not deleted.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Update information of servie.
        /// </summary>
        /// <param name="serviceId">Id of the service.</param>
        /// <param name="name">Name of the service.</param>
        /// <param name="description">Description of the service.</param>
        /// <param name="charge">Charge of the service.</param>
        /// <param name="data">Image of the service.</param>
        public void UpdateService(Guid serviceId, String name, String description, String charge, String data)
        {
            try
            {
                Service service = SD.GetService(serviceId);
                if (!String.IsNullOrEmpty(name))
                {
                    Service serviceCompare = SD.GetService(name);
                    if (serviceCompare != null && !service.Service_Id.Equals(serviceCompare.Service_Id))
                        throw new Exception(String.Format("This service with the name is '{0}' has already existed.", name));
                    service.Service_Name = name;
                }
                if (!String.IsNullOrEmpty(description))
                    service.Service_Description = description;
                if (!String.IsNullOrEmpty(charge))
                    service.Service_Charge = SecurityHelper.Instance.EncryptCryptography(charge, true);
                if (!String.IsNullOrEmpty(data))
                    service.Service_Image = data;

                int result = SD.Update(service);
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
        /// Remove a service.
        /// </summary>
        /// <param name="serviceId">Id of the service.</param>
        public void RemoveService(Guid serviceId)
        {
            try
            {
                Service service = SD.GetService(serviceId);
                service.Service_IsDelete = true;

                int result = SD.Update(service);
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
        /// Restore a service.
        /// </summary>
        /// <param name="serviceId">Id of the service.</param>
        public void RestoreService(Guid serviceId)
        {
            try
            {
                Service service = SD.GetService(serviceId);
                service.Service_IsDelete = false;

                int result = SD.Update(service);
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
    }
}
