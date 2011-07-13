using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class CustomerDAL
    {

        public int Customer_Insert(Customer entity)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Customer_Insert", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Customer_FulName", SqlDbType.NVarChar);
                    command.Parameters["@Customer_FulName"].Value = entity.Customer_FulName;
                    command.Parameters.Add("@Customer_Address", SqlDbType.NVarChar);
                    command.Parameters["@Customer_Address"].Value = entity.Customer_Address;
                    command.Parameters.Add("@Customer_Phone", SqlDbType.NVarChar);
                    command.Parameters["@Customer_Phone"].Value = entity.Customer_Phone;

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

        public int Customer_Update(Customer entity)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Customer_Update", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Customer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Customer_Id"].Value = entity.Customer_Id;
                    command.Parameters.Add("@Customer_FulName", SqlDbType.NVarChar);
                    command.Parameters["@Customer_FulName"].Value = entity.Customer_FulName;
                    command.Parameters.Add("@Customer_Address", SqlDbType.NVarChar);
                    command.Parameters["@Customer_Address"].Value = entity.Customer_Address;
                    command.Parameters.Add("@Customer_Phone", SqlDbType.NVarChar);
                    command.Parameters["@Customer_Phone"].Value = entity.Customer_Phone;
                    command.Parameters.Add("@Customer_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Customer_IsDelete"].Value = entity.Customer_IsDelete;

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

        public DataTable Customer_ShowAllDisplay()
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Customer_ShowAllDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

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

        public DataRow Customer_ShowOnewDisplay(string Customer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Customer_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

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

        public int Customer_UpdateStatus(string Customer_Id, bool Customer_IsDelete)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Customer_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Customer_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Customer_Id"].Value = new Guid(Customer_Id);
                    command.Parameters.Add("@Customer_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Customer_IsDelete"].Value = Customer_IsDelete;

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

        public int Customer_Delete(string Customer_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Customer_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

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
    }
}
