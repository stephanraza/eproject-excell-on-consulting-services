using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class ProblemDAL
    {
        /// <summary>
        /// Addnew a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Problem_Insert(Problem entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Problem_Insert", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Problem_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Problem_Id"].Value = entity.Problem_Id;
                    command.Parameters.Add(new SqlParameter("@Problem_Title", SqlDbType.NVarChar));
                    command.Parameters["@Problem_Title"].Value = entity.Problem_Title;
                    command.Parameters.Add(new SqlParameter("@Problem_Content", SqlDbType.NVarChar));
                    command.Parameters["@Problem_Content"].Value = entity.Problem_Content;
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
        /// get all rows
        /// </summary>
        /// <returns></returns>
        public DataTable Problem_ShowAllDisplay(string KeyWord)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Problem_ShowAllDisplay", conn);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@SearchKey", SqlDbType.NVarChar));
                command.Parameters["@SearchKey"].Value = KeyWord;

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
        public int Problem_Update(Problem entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Problem_Update", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Problem_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Problem_Id"].Value = entity.Problem_Id;
                    command.Parameters.Add(new SqlParameter("@Problem_Title", SqlDbType.NVarChar));
                    command.Parameters["@Problem_Title"].Value = entity.Problem_Title;
                    command.Parameters.Add(new SqlParameter("@Problem_Content", SqlDbType.NVarChar));
                    command.Parameters["@Problem_Content"].Value = entity.Problem_Content;
                    command.Parameters.Add(new SqlParameter("@Problem_IsDelete", SqlDbType.Bit));
                    command.Parameters["@Problem_IsDelete"].Value = entity.Problem_IsDelete;

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
        /// Update trang isDelete
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <param name="Problem_IsDelete"></param>
        /// <returns></returns>
        public int Problem_UpdateStatus(string Problem_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Problem_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Problem_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Problem_Id"].Value = new Guid(Problem_Id);                   

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
        /// <param name="Problem_Id"></param>
        /// <returns></returns>
        public int Problem_Delete(string Problem_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Problem_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Problem_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Problem_Id"].Value = new Guid(Problem_Id);
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
        /// get a row
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <returns></returns>
        public DataTable Problem_ShowOnewDisplay(string Problem_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Problem_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Problem_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Problem_Id"].Value = new Guid(Problem_Id);
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
        /// Check Id
        /// </summary>
        /// <param name="Problem_Id"></param>
        /// <returns></returns>
        public int Problem_Check(string Problem_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Problem_Check", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Problem_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Problem_Id"].Value = new Guid(Problem_Id);
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

        public int Problem_DeleteRemove(string Problem_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Problem_DeleteRemove", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Problem_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Problem_Id"].Value = new Guid(Problem_Id);
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

        public DataTable Problem_ShowAllDisplayRemove(string KeyWord)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Problem_ShowAllDisplayRemove", conn);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@SearchKey", SqlDbType.NVarChar));
                command.Parameters["@SearchKey"].Value = KeyWord;

                conn.Open();
                DataTable table = new DataTable();
                table.Load(command.ExecuteReader());
                return table;
            }

        }
    }
}
