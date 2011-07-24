// -----------------------------------------------------------------------
// <copyright file="ServiceDAL.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    /// <summary>
    /// The ServiceDAL class is responsible for interacting with the database to retrieve and store information
    /// about Service objects.
    /// </summary>
    public class ServiceDAL
    {
        /// <summary>
        /// Create new a service
        /// </summary>
        /// <param name="service">Service that you want to create.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int Create(Service service)
        {
            return DBHelper.Instance.Insert(service);
        }
        /// <summary>
        /// Select service by name.
        /// </summary>
        /// <param name="name">Name of service.</param>
        /// <returns>A service if it exists, null otherwise.</returns>
        public Service GetService(String name)
        {
            return (Service)DBHelper.Instance.SelectFirst("Service", String.Format("Service_Name = '{0}'", name));
        }
        /// <summary>
        /// Select service by id.
        /// </summary>
        /// <param name="serviceId">Id of service.</param>
        /// <returns>A service if it exists, null otherwise.</returns>
        public Service GetService(Guid serviceId)
        {
            return (Service)DBHelper.Instance.SelectFirst("Service", String.Format("Service_Id = '{0}'", serviceId.ToString()));
        }
        /// <summary>
        /// Get all services in database.
        /// </summary>
        /// <param name="isDelete">True if services are deleted, false otherwise.</param>
        /// <returns>A list of services.</returns>
        public List<Service> GetServices(bool isDelete)
        {
            List<Service> listService = new List<Service>();
            List<Object> listObject = DBHelper.Instance.Select("Service", String.Format("Service_IsDelete = '{0}'", isDelete), null, -1, -1);
            foreach (Object item in listObject)
            {
                Service service = (Service)item;
                listService.Add(service);
            }
            return listService;
        }
        /// <summary>
        /// Get all services in database.
        /// </summary>
        /// <returns>A list of services.</returns>
        public List<Service> GetServices()
        {
            List<Service> listService = new List<Service>();
            List<Object> listObject = DBHelper.Instance.Select("Service", null, null, -1, -1);
            foreach (Object item in listObject)
            {
                Service service = (Service)item;
                listService.Add(service);
            }
            return listService;
        }
        /// <summary>
        /// Searching service.
        /// </summary>
        /// <param name="content">Content for searching.</param>
        /// <param name="isDelete">True if services are deleted, false otherwise.</param>
        /// <returns>A list of services.</returns>
        public List<Service> Search(String content, bool isDelete)
        {
            List<Service> listService = new List<Service>();
            List<Object> listObject = DBHelper.Instance.Select("Service", String.Format("{0} Service_IsDelete = '{1}'", content, isDelete), null, -1, -1);
            foreach (Object item in listObject)
            {
                Service service = (Service)item;
                listService.Add(service);
            }
            return listService;
        }
        /// <summary>
        /// Delete a service.
        /// </summary>
        /// <param name="serviceId">Id of the service.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int Delete(Guid serviceId)
        {
            return DBHelper.Instance.Delete("Service", String.Format("Service_Id = '{0}'", serviceId));
        }
        /// <summary>
        /// Update a service.
        /// </summary>
        /// <param name="service">The service that be updated.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int Update(Service service)
        {
            return DBHelper.Instance.Update(service, String.Format("Service_Id = '{0}'", service.Service_Id));
        }
    }
}
