using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    public class ProductDAL
    {
        /// <summary>
        /// Get rows all
        /// </summary>
        /// <returns></returns>
        public DataTable Product_ShowAllDisplay()
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand conCommand = new SqlCommand("Product_ShowAllDisplay", connection);
                    conCommand.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    DataTable table = new DataTable();
                    IDataReader reader = conCommand.ExecuteReader();
                    table.Load(reader);

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
        /// Add new a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Product_Insert(Product entity)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Product_Insert", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add("@Category_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Category_Id"].Value = entity.Category_Id;
                    command.Parameters.Add("@Product_Name", SqlDbType.VarChar);
                    command.Parameters["@Product_Name"].Value = entity.Product_Name;
                    command.Parameters.Add("@Product_Price", SqlDbType.VarChar);
                    command.Parameters["@Product_Price"].Value = entity.Product_Price;
                    command.Parameters.Add("@Product_Description", SqlDbType.VarChar);
                    command.Parameters["@Product_Description"].Value = entity.Product_Description;
                    command.Parameters.Add("@Product_Image", SqlDbType.VarChar);
                    command.Parameters["@Product_Image"].Value = entity.Product_Image;
                    command.Parameters.Add("@Product_ManufactureDate", SqlDbType.SmallDateTime);
                    command.Parameters["@Product_ManufactureDate"].Value = entity.Product_ManufactureDate;
                    command.Parameters.Add("@Product_ExpiryDate", SqlDbType.SmallDateTime);
                    command.Parameters["@Product_ExpiryDate"].Value = entity.Product_ExpiryDate;

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
        /// edit a row
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Product_Update(Product entity)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Product_Update", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Product_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Product_Id"].Value = entity.Product_Id;
                    command.Parameters.Add("@Company_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Company_Id"].Value = entity.Company_Id;
                    command.Parameters.Add("@Category_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Category_Id"].Value = entity.Category_Id;
                    command.Parameters.Add("@Product_Name", SqlDbType.VarChar);
                    command.Parameters["@Product_Name"].Value = entity.Product_Name;
                    command.Parameters.Add("@Product_Price", SqlDbType.VarChar);
                    command.Parameters["@Product_Price"].Value = entity.Product_Price;
                    command.Parameters.Add("@Product_Description", SqlDbType.VarChar);
                    command.Parameters["@Product_Description"].Value = entity.Product_Description;
                    command.Parameters.Add("@Product_Image", SqlDbType.VarChar);
                    command.Parameters["@Product_Image"].Value = entity.Product_Image;
                    command.Parameters.Add("@Product_ManufactureDate", SqlDbType.SmallDateTime);
                    command.Parameters["@Product_ManufactureDate"].Value = entity.Product_ManufactureDate;
                    command.Parameters.Add("@Product_ExpiryDate", SqlDbType.SmallDateTime);
                    command.Parameters["@Product_ExpiryDate"].Value = entity.Product_ExpiryDate;
                    command.Parameters.Add("@Product_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Product_IsDelete"].Value = entity.Product_IsDelete;
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
        /// Delete a row
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <returns></returns>
        public int Product_Delete(string Product_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Product_Delete", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Product_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Product_Id"].Value = new Guid(Product_Id);

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
        /// Update status IsDelete
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <param name="Product_IsDelete"></param>
        /// <returns></returns>
        public int Product_UpdateStatus(string Product_Id, bool Product_IsDelete)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Product_UpdateStatus", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Product_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Product_Id"].Value = new Guid(Product_Id);

                    command.Parameters.Add("@Product_IsDelete", SqlDbType.Bit);
                    command.Parameters["@Product_IsDelete"].Value = Product_IsDelete;

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
        /// Check Exists of Id
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <returns></returns>
        public int Product_Check(string Product_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Product_Check", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Product_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Product_Id"].Value = new Guid(Product_Id);
                    connection.Open();
                    DataTable table = new DataTable();
                    table.Load(command.ExecuteReader());
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
        ///  Get a row
        /// </summary>
        /// <param name="Product_Id"></param>
        /// <returns></returns>
        public DataRow Product_ShowOnewDisplay(string Product_Id)
        {
            using (SqlConnection connection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand("Product_ShowOnewDisplay", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@Product_Id", SqlDbType.UniqueIdentifier);
                    command.Parameters["@Product_Id"].Value = new Guid(Product_Id);
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
    }
}
