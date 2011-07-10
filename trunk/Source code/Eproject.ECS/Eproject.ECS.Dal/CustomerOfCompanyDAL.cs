using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class CustomerOfCompanyDAL
    {
        /// <summary>
        /// Insert a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int CustomerOfCompany_Insert(CustomerOfCompany entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("CustomerOfCompany_Insert", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Company_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add(new SqlParameter("@Customer_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Customer_Id"].Value = entity.Customer_Id;
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
        public DataTable CustomerOfCompany_ShowAllDisplay()
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("CustomerOfCompany_ShowAllDisplay", conn);
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
        public int CustomerOfCompany_Update(CustomerOfCompany entity)
        {
            using (SqlConnection conn = new SqlConnection(AppConfiguration.ConnectionString))
            {
                SqlCommand command = new SqlCommand("CustomerOfCompany_Update", conn);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    command.Parameters.Add(new SqlParameter("@Company_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add(new SqlParameter("@Customer_Id", SqlDbType.UniqueIdentifier));
                    command.Parameters["@Customer_Id"].Value = entity.Customer_Id;
                    command.Parameters.Add(new SqlParameter("@CustomerOfCompany_IsDelete", SqlDbType.Bit));
                    command.Parameters["@CustomerOfCompany_IsDelete"].Value = entity.CustomerOfCompany_IsDelete;

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
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <param name="CustomerOfCompany_IsDelete"></param>
        /// <returns></returns>
        public int CustomerOfCompany_UpdateStatus(string Company_Id, string Customer_Id, bool CustomerOfCompany_IsDelete)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("CustomerOfCompany_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    command.Parameters.Add("@Customer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Customer_Id"].Value = new Guid(Customer_Id);
                    command.Parameters.Add("@CustomerOfCompany_IsDelete", SqlDbType.Bit);
                    command.Parameters["@CustomerOfCompany_IsDelete"].Value = CustomerOfCompany_IsDelete;

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
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <returns></returns>
        public int CustomerOfCompany_Delete(string Company_Id, string Customer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("CustomerOfCompany_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    command.Parameters.Add("@Customer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Customer_Id"].Value = new Guid(Customer_Id);
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
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <returns></returns>
        public DataRow CustomerOfCompany_ShowOnewDisplay(string Company_Id, string Customer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("CustomerOfCompany_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    command.Parameters.Add("@Customer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Customer_Id"].Value = new Guid(Customer_Id);
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
        /// Check
        /// </summary>
        /// <param name="Company_Id"></param>
        /// <param name="Customer_Id"></param>
        /// <returns></returns>
        public int CustomerOfCompany_Check(string Company_Id, string Customer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("CustomerOfCompany_Check", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = new Guid(Company_Id);
                    command.Parameters.Add("@Customer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Customer_Id"].Value = new Guid(Customer_Id);
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
