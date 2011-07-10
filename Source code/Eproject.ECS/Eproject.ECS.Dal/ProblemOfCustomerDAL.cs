using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class ProblemOfCustomerDAL
    {
        /// <summary>
        /// Add new a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int ProblemOfCustomer_Insert(ProblemOfCustomer entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("ProblemOfCustomer_Insert", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Customer_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Customer_Id"].Value = entity.Customer_Id;
                    command.Parameters.Add(new SqlParameter("@Company_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add(new SqlParameter("@Problem_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Problem_Id"].Value = entity.Problem_Id;
                    command.Parameters.Add(new SqlParameter("@ProblemOfCustomer_Date", SqlDbType.SmallDateTime));
                    command.Parameters["@ProblemOfCustomer_Date"].Value = entity.ProblemOfCustomer_Date;
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
        /// Show all display
        /// </summary>
        /// <returns></returns>
        public DataTable ProblemOfCustomer_ShowAllDisplay()
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("ProblemOfCustomer_ShowAllDisplay", conn);
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
        public int ProblemOfCustomer_Update(ProblemOfCustomer entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("ProblemOfCustomer_Update", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@ProblemOfCustomer_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@ProblemOfCustomer_Id"].Value = entity.ProblemOfCustomer_Id;
                    command.Parameters.Add(new SqlParameter("@Problem_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Problem_Id"].Value = entity.Problem_Id;
                    command.Parameters.Add(new SqlParameter("@Customer_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Customer_Id"].Value = entity.Customer_Id;
                    command.Parameters.Add(new SqlParameter("@Company_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add(new SqlParameter("@ProblemOfCustomer_Date", SqlDbType.SmallDateTime));
                    command.Parameters["@ProblemOfCustomer_Date"].Value = entity.ProblemOfCustomer_Date;
                    command.Parameters.Add(new SqlParameter("@ProblemOfCustomer_IsDelete", SqlDbType.Bit));
                    command.Parameters["@ProblemOfCustomer_IsDelete"].Value = entity.ProblemOfCustomer_IsDelete;

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
        /// Update IsDelete
        /// </summary>
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <param name="ProblemOfCustomer_IsDelete"></param>
        /// <returns></returns>
        public int ProblemOfCustomer_UpdateStatus(string ProblemOfCustomer_Id, bool ProblemOfCustomer_IsDelete)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("ProblemOfCustomer_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@ProblemOfCustomer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@ProblemOfCustomer_Id"].Value = new Guid(ProblemOfCustomer_Id);
                    command.Parameters.Add("@ProblemOfCustomer_IsDelete", SqlDbType.Bit);
                    command.Parameters["@ProblemOfCustomer_IsDelete"].Value = ProblemOfCustomer_IsDelete;

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
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <returns></returns>
        public int ProblemOfCustomer_Delete(string ProblemOfCustomer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("ProblemOfCustomer_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@ProblemOfCustomer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@ProblemOfCustomer_Id"].Value = new Guid(ProblemOfCustomer_Id);
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
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <returns></returns>
        public DataRow ProblemOfCustomer_ShowOnewDisplay(string ProblemOfCustomer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("ProblemOfCustomer_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@ProblemOfCustomer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@ProblemOfCustomer_Id"].Value = new Guid(ProblemOfCustomer_Id);
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
        /// Check ID 
        /// </summary>
        /// <param name="ProblemOfCustomer_Id"></param>
        /// <returns></returns>
        public int ProblemOfCustomer_Check(string ProblemOfCustomer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("ProblemOfCustomer_Check", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@ProblemOfCustomer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@ProblemOfCustomer_Id"].Value = new Guid(ProblemOfCustomer_Id);
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
