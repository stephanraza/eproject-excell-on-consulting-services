// -----------------------------------------------------------------------
// <copyright file="DBHelper.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;
using Eproject.ECS.Entities;

namespace Eproject.ECS.Dal
{
    /// <summary>
    /// The DBHelper.cs class support operations with database.
    /// </summary>
    public class DBHelper
    {
        /// <summary>
        /// SingleTon pattern.
        /// </summary>
        private static DBHelper instance;

        public static DBHelper Instance
        {
            get
            {
                if (instance == null)
                    instance = new DBHelper();
                return instance;
            }
        }        
        /// <summary>
        /// Constructor of DBHelper class.
        /// </summary>
        private DBHelper()
        {
            connection = new SqlConnection(AppConfiguration.ConnectionString);
        }

        private SqlConnection connection;

        public SqlConnection Connection
        {
            get { return connection; }
        }
        /// <summary>
        /// Open connection to connect to database.
        /// </summary>
        public void OpenConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
            connection.Open();
        }
        /// <summary>
        /// Execute SQL query and return SQLDataReader.
        /// </summary>
        /// <param name="sql">The SQL query that you want to execute.</param>
        /// <returns>Return SQLDataReader contains datas or return null if occur exception.</returns>
        public SqlDataReader ExecuteReaderSQL(string sql)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql, connection);
                SqlDataReader reader = cmd.ExecuteReader();
                return reader;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                return null;
            }
        }
        /// <summary>
        /// Executes a Transact-SQL statement against the connection and returns the
        /// number of rows affected.
        /// </summary>
        /// <param name="sql">The SQL query that you want to execute.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int ExecuteNonQuerySQL(string sql)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.CommandText = sql;
                return cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                return -1;
            }
        }
        /// <summary>
        /// Diconnect connection with database.
        /// </summary>
        public void CloseConnection()
        {
            if (connection.State != ConnectionState.Closed)
            {
                connection.Close();
            }
        }
        /// <summary>
        /// Get the first record that is returned after executing SQL query.
        /// </summary>
        /// <param name="TableName">The name of the table that you want to execute SQL query.</param>
        /// <param name="Where">The conditions of SQL query.</param>
        /// <returns>The first record with type of Object.</returns>
        public Object SelectFirst(String TableName, String Where)
        {
            List<Object> Objs = Select(TableName, Where, null, -1, -1);

            if (Objs.Count == 0)
            {
                return null;
            }
            else
            {
                return Objs[0];
            }
        }
        /// <summary>
        /// Get list of records that is returned after executing SQL query.
        /// </summary>
        /// <param name="TableName">The name of the table that you want to execute SQL query.</param>
        /// <param name="Where">The conditions of SQL query.</param>
        /// <param name="OrderBy">Sort the datas returned by any conditions.</param>
        /// <param name="PageIndex">Index of page.</param>
        /// <param name="PageSize">Number of records that you want to select to display in your page.</param>
        /// <returns>Return the list of object depen on entity.</returns>
        public List<Object> Select(String TableName, String Where, String OrderBy, int PageIndex, int PageSize)
        {
            List<Object> list = new List<object>();

            String query = "Select * From {0} ";

            if (TableName != null && TableName.Trim() != "")
            {
                query = String.Format(query, TableName);
            }
            else
            {
                return list;
            }

            if (Where != null && Where.Trim() != "")
            {
                query = query + String.Format(" where {0} ", Where);
            }

            if (OrderBy != null && OrderBy.Trim() != "")
            {
                query = query + String.Format(" order by {0} ", OrderBy);
            }

            OpenConnection();
            SqlCommand Command = new SqlCommand();
            Command.Connection = connection;
            Command.CommandText = query;

            SqlDataReader reader = Command.ExecuteReader();
            while (reader.Read())
            {
                String TypeName = "Eproject.ECS.Entities." + TableName;
                // Load all assemblies in project by Linq
                var type = AppDomain.CurrentDomain.GetAssemblies()
                       .SelectMany(a => a.GetTypes())
                       .FirstOrDefault(t => t.FullName == TypeName);

                Object o = Activator.CreateInstance(type);

                for (int i = 0; i < reader.FieldCount; i++)
                {
                    string NameCollumn = reader.GetName(i);
                    PropertyInfo pi = type.GetProperty(NameCollumn);
                    if (!(reader.GetValue(i) is System.DBNull))
                    {
                        pi.SetValue(o, reader.GetValue(i), null);
                    }
                    else
                    {
                        pi.SetValue(o, null, null);
                    }
                }

                list.Add(o);
            }

            CloseConnection();
            return list;
        }
        /// <summary>
        /// Insert 1 record to database.
        /// </summary>
        /// <param name="obj">The name of Entity whose datas will be insert to database.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int Insert(Object obj)
        {
            SqlCommand Command = new SqlCommand();
            Command.Connection = connection;

            String TableName = obj.GetType().ToString().Split('.')[3];
            String ParametersString = "";

            String query = "Insert into {0} values({1})";
            String split = ",";
            foreach (PropertyInfo property in obj.GetType().GetProperties())
            {
                String ParameterName = "@" + property.Name;
                ParametersString += ParameterName + split;
                Command.Parameters.AddWithValue(ParameterName, property.GetValue(obj, null));
            }

            ParametersString = ParametersString.Substring(0, ParametersString.Length - split.Length);

            Command.CommandText = String.Format(query, TableName, ParametersString);

            connection.Open();
            int result = Command.ExecuteNonQuery();
            connection.Close();

            return result;
        }
        /// <summary>
        /// Update a record details in database.
        /// </summary>
        /// <param name="obj">The name of Entity whose datas will be update in database.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int Update(Object obj)
        {
            SqlCommand Command = new SqlCommand();
            Command.Connection = connection;

            String query = "Update {0} set {1} where {2}";

            String TableName = obj.GetType().ToString().Split('.')[3];
            String ParametersString = "";
            String split = ",";
            PropertyInfo pi = (PropertyInfo)obj.GetType().GetProperties().GetValue(0);
            String Where = pi.Name + " = '" + pi.GetValue(obj, null) + "'";

            foreach (PropertyInfo property in obj.GetType().GetProperties())
            {
                String ParameterName = "@" + property.Name;
                ParametersString += property.Name + " = " + ParameterName + split;
                Command.Parameters.AddWithValue(ParameterName, property.GetValue(obj, null));
            }

            ParametersString = ParametersString.Substring(0, ParametersString.Length - split.Length);

            Command.CommandText = String.Format(query, TableName, ParametersString, Where);

            connection.Open();
            int result = Command.ExecuteNonQuery();
            connection.Close();

            return result;
        }
        /// <summary>
        /// Delete a record in database.
        /// </summary>
        /// <param name="Tablename">The name of the table that you want to execute SQL query.</param>
        /// <param name="Where">The conditions of SQL query.</param>
        /// <returns>Return the number of rows affected or return -1 if occur exception.</returns>
        public int Delete(String TableName, String Where)
        {
            String query = "Delete from {0} ";

            if (TableName != null && TableName.Trim() != "")
            {
                query = String.Format(query, TableName);
            }
            else
            {
                return -1;
            }

            if (Where != null && Where.Trim() != "")
            {
                query = query + String.Format(" where {0} ", Where);
            }

            OpenConnection();
            int result = ExecuteNonQuerySQL(query);
            CloseConnection();

            return result;
        }
    }
}
