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
    }
}
