using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class CompanyDAL
    {
        /// <summary>
        /// Insert a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Company_Insert(Company entity)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_Insert", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Name", SqlDbType.NVarChar);
                    command.Parameters["@Company_Name"].Value = entity.Company_Name;
                    command.Parameters.Add("@Company_Logo", SqlDbType.NVarChar);
                    command.Parameters["@Company_Logo"].Value = entity.Company_Logo;
                    command.Parameters.Add("@Company_Description", SqlDbType.NVarChar);
                    command.Parameters["@Company_Description"].Value = entity.Company_Description;
                    command.Parameters.Add("@Company_Phone", SqlDbType.NVarChar);
                    command.Parameters["@Company_Phone"].Value = entity.Company_Phone;
                    command.Parameters.Add("@Company_Email", SqlDbType.NVarChar);
                    command.Parameters["@Company_Email"].Value = entity.Company_Email;
                    command.Parameters.Add("@Company_Address", SqlDbType.NVarChar);
                    command.Parameters["@Company_Address"].Value = entity.Company_Address;

                    connection.Open();
                    return command.ExecuteNonQuery();
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Company_Update(Company entity)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_Update", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add("@Company_Name", SqlDbType.NVarChar);
                    command.Parameters["@Company_Name"].Value = entity.Company_Name;
                    command.Parameters.Add("@Company_Logo", SqlDbType.NVarChar);
                    command.Parameters["@Company_Logo"].Value = entity.Company_Logo;
                    command.Parameters.Add("@Company_Description", SqlDbType.NVarChar);
                    command.Parameters["@Company_Description"].Value = entity.Company_Description;
                    command.Parameters.Add("@Company_Phone", SqlDbType.NVarChar);
                    command.Parameters["@Company_Phone"].Value = entity.Company_Phone;
                    command.Parameters.Add("@Company_Email", SqlDbType.NVarChar);
                    command.Parameters["@Company_Email"].Value = entity.Company_Email;
                    command.Parameters.Add("@Company_Address", SqlDbType.NVarChar);
                    command.Parameters["@Company_Address"].Value = entity.Company_Address;
                    command.Parameters.Add("@Company_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Company_IsDelete"].Value = entity.Company_IsDelete;

                    connection.Open();
                    return command.ExecuteNonQuery();
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// Get a DataTable
        /// </summary>
        /// <returns></returns>
        public DataTable Company_ShowAllDisplay(string SearchKey)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_ShowAllDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@SearchKey", SqlDbType.NVarChar);
                    command.Parameters["@SearchKey"].Value = SearchKey;

                    connection.Open();
                    IDataReader dataReader = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(dataReader);
                    if (table.Rows.Count == 0)
                        return null;
                    return table;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// Get a row
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public DataRow Company_ShowOnewDisplay(string Company_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    connection.Open();

                    IDataReader reader = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(reader);
                    if (table.Rows.Count == 0)
                        return null;
                    DataRow row = table.Rows[0];
                    return row;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// /
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public DataTable Company_ShowOnewDisplayForm(string Company_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_ShowOnewDisplayForm", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    connection.Open();

                    IDataReader reader = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(reader);
                    if (table.Rows.Count == 0)
                        return null;

                    return table;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// Update Isdelete
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Company_IsDelete"></param>
        /// <returns></returns>
        public int Company_UpdateStatus(string Company_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);                    

                    connection.Open();

                    return command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
                finally
                {
                    connection.Dispose();
                }

            }
        }
        /// <summary>
        /// Check Company_Id
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public int Company_CheckName(string Company_Name)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_CheckName", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Name", SqlDbType.NVarChar);
                    command.Parameters["@Company_Name"].Value = Company_Name;
                    connection.Open();

                    IDataReader dataReader = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(dataReader);
                    if (table.Rows.Count == 0)
                        return 0;
                    return table.Rows.Count;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// Check Mail
        /// </summary>
        /// <param name="Company_Email"></param>
        /// <returns></returns>
        public int Company_CheckEmail(string Company_Email)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_CheckEmail", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Email", SqlDbType.NVarChar);
                    command.Parameters["@Company_Email"].Value = Company_Email;
                    connection.Open();

                    IDataReader dataReader = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(dataReader);
                    if (table.Rows.Count == 0)
                        return 0;
                    return table.Rows.Count;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }
        /// <summary>
        /// Delete a row
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <returns></returns>
        public int Company_Delete(string Company_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    connection.Open();
                    return command.ExecuteNonQuery();
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }

            }
        }

        public DataTable Company_ShowAllDisplayRemove(string SearchKey)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_ShowAllDisplayRemove", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@SearchKey", SqlDbType.NVarChar);
                    command.Parameters["@SearchKey"].Value = SearchKey;

                    connection.Open();
                    IDataReader dataReader = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(dataReader);
                    if (table.Rows.Count == 0)
                        return null;
                    return table;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }

        public int Company_UpdateStatusRemove(string Company_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Company_UpdateStatusRemove", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);

                    connection.Open();

                    return command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
                finally
                {
                    connection.Dispose();
                }

            }
        }
    }
}
