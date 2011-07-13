using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
using Eproject.ECS.Dal;

namespace Eproject.ECS.Bll
{

    public class CompanyBLL
    {
        CompanyDAL companyDal = new CompanyDAL();
        /// <summary>
        /// Insert a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Company_Insert(Company entity)
        {
            return companyDal.Company_Insert(entity);
        }

        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Company_Update(Company entity)
        {
            return companyDal.Company_Update(entity);
        }

        /// <summary>
        /// Get a DataTable
        /// </summary>
        /// <returns></returns>
        public DataTable Company_ShowAllDisplay()
        {
            return companyDal.Company_ShowAllDisplay();
        }

        /// <summary>
        /// Get a row
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public DataRow Company_ShowOnewDisplay(string Company_Id)
        {
            return companyDal.Company_ShowOnewDisplay(Company_Id);
        }

        /// <summary>
        /// Update Isdelete
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Company_IsDelete"></param>
        /// <returns></returns>
        public int Company_UpdateStatus(string Company_Id, bool Company_IsDelete)
        {
            return companyDal.Company_UpdateStatus(Company_Id, Company_IsDelete);
        }

        /// <summary>
        /// Check Company__Name
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public bool Company_CheckName(string Company_Name)
        {
            return companyDal.Company_CheckName(Company_Name) > 0;
        }
        /// <summary>
        /// Check Mail
        /// </summary>
        /// <param name="Company_Email"></param>
        /// <returns></returns>
        public bool Company_CheckEmail(string Company_Email)
        {
            return companyDal.Company_CheckEmail(Company_Email) > 0;
        }

        /// <summary>
        /// Delete a row
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public int Company_Delete(string Company_Id)
        {
            return companyDal.Company_Delete(Company_Id);
        }
    }
}
