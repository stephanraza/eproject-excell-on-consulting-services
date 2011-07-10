using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class DealerDAL
    {
        /// <summary>
        /// Add new a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Dealer_Insert(Dealer entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Dealer_Insert", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Company_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add(new SqlParameter("@Dealer_Name", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Name"].Value = entity.Dealer_Name;
                    command.Parameters.Add(new SqlParameter("@Dealer_Address", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Address"].Value = entity.Dealer_Address;
                    command.Parameters.Add(new SqlParameter("@Dealer_Phone", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Phone"].Value = entity.Dealer_Phone;
                    command.Parameters.Add(new SqlParameter("@Dealer_Email", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Email"].Value = entity.Dealer_Email;

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
        /// Update a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Dealer_Update(Dealer entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Dealer_Update", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Dealer_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Dealer_Id"].Value = entity.Dealer_Id;
                    command.Parameters.Add(new SqlParameter("@Company_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add(new SqlParameter("@Dealer_Name", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Name"].Value = entity.Dealer_Name;
                    command.Parameters.Add(new SqlParameter("@Dealer_Address", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Address"].Value = entity.Dealer_Address;
                    command.Parameters.Add(new SqlParameter("@Dealer_Phone", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Phone"].Value = entity.Dealer_Phone;
                    command.Parameters.Add(new SqlParameter("@Dealer_Email", SqlDbType.NVarChar));
                    command.Parameters["@Dealer_Email"].Value = entity.Dealer_Email;
                    command.Parameters.Add(new SqlParameter("@Dealer_IsDelete", SqlDbType.Bit));
                    command.Parameters["@Dealer_IsDelete"].Value = entity.Dealer_IsDelete;

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
        /// Get All rows of table
        /// </summary>
        /// <returns></returns>
        public DataTable Dealer_ShowAllDisplay()
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("Dealer_ShowAllDisplay", conn);
                command.CommandType = CommandType.StoredProcedure;
                conn.Open();
                DataTable table = new DataTable();
                table.Load(command.ExecuteReader());
                return table;
            }
        }

        /// <summary>
        /// Update Trang Thai
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <param name="Dealer_IsDelete"></param>
        /// <returns></returns>
        public int Dealer_UpdateStatus(string Dealer_Id, bool Dealer_IsDelete)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Dealer_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Dealer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Dealer_Id"].Value = new Guid(Dealer_Id);
                    command.Parameters.Add("@Dealer_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Dealer_IsDelete"].Value = Dealer_IsDelete;
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
        /// Delete a Dealer
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <returns></returns>
        public int Dealer_Delete(string Dealer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Dealer_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Dealer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Dealer_Id"].Value = new Guid(Dealer_Id);
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
        /// <param name="Dealer_Id"></param>
        /// <returns></returns>
        public DataRow Dealer_ShowOnewDisplay(string Dealer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Dealer_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Dealer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Dealer_Id"].Value = new Guid(Dealer_Id);
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
        /// Check Dealer_Id
        /// </summary>
        /// <param name="Dealer_Id"></param>
        /// <returns></returns>
        public int Dealer_Check(string Dealer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Dealer_Check", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Dealer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Dealer_Id"].Value = new Guid(Dealer_Id);
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
