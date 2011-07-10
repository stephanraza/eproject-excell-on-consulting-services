using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;
namespace Eproject.ECS.Dal
{
    public class CategoryDAL
    {
        /// <summary>
        /// Insert a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Category_Insert(Category entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Category_Insert", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Category_Name", SqlDbType.NVarChar));
                    command.Parameters["@Category_Name"].Value = entity.Category_Name;
                    conn.Open();

                    return command.ExecuteNonQuery();
                }
                catch
                {

                    throw;
                }
                finally
                {
                    command.Dispose();
                }

            }

        }
        /// <summary>
        /// Get DataTable 
        /// </summary>
        /// <returns></returns>
        public DataTable Category_ShowAllDisplay()
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Category_ShowAllDisplay", conn);
                command.CommandType = CommandType.StoredProcedure;
                conn.Open();
                DataTable table = new DataTable();
                table.Load(command.ExecuteReader());
                return table;
            }

        }
        /// <summary>
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Category_Update(Category entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Category_Update", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Category_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Category_Id"].Value = entity.Category_Id;
                    command.Parameters.Add(new SqlParameter("@Category_Name", SqlDbType.NVarChar));
                    command.Parameters["@Category_Name"].Value = entity.Category_Name;
                    command.Parameters.Add(new SqlParameter("@Category_IsDelete", SqlDbType.Bit));
                    command.Parameters["@Category_IsDelete"].Value = entity.Category_IsDelete;

                    conn.Open();

                    return command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                    throw ex;
                }
                finally
                {
                    command.Dispose();
                }
            }

        }
        /// <summary>
        /// Update isDelete
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <param name="Category_IsDelete"></param>
        /// <returns></returns>
        public int Category_UpdateStatus(string Category_Id, bool Category_IsDelete)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Category_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Category_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Category_Id"].Value = new Guid(Category_Id);
                    command.Parameters.Add("@Category_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Category_IsDelete"].Value = Category_IsDelete;

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
        /// Delete a row
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <returns></returns>
        public int Category_Delete(string Category_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Category_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Category_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Category_Id"].Value = new Guid(Category_Id);
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
        /// Get a row
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <returns></returns>
        public DataRow Category_ShowOnewDisplay(string Category_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Category_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Category_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Category_Id"].Value = new Guid(Category_Id);
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
        /// Check Category_Id
        /// </summary>
        /// <param name="Category_Id"></param>
        /// <returns></returns>
        public int Category_Check(string Category_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Category_Check", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Category_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Category_Id"].Value = new Guid(Category_Id);
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
    }
}
