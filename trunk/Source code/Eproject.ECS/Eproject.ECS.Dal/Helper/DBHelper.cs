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
            con = new SqlConnection(AppConfiguration.ConnectionString);
        }

        private static SqlConnection con;
        /// <summary>
        /// Open connection to connect to database.
        /// </summary>
        public void OpenConnection()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
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
                SqlCommand cmd = new SqlCommand(sql, con);
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
                cmd.Connection = con;
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
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
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
        /// <returns></returns>
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
            Command.Connection = con;
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
    }
}
