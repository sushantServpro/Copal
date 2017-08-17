using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace DataLayer
{
    class Common
    {
        string connectionStr;
        SqlConnection con;
        SqlCommand cmd;

        SqlDataAdapter AD;
        DataSet ds;
        SqlParameter[] sp;

        public Common()
        {
            connectionStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            con = new SqlConnection();
            con.ConnectionString = connectionStr;
        }


        public DataSet GetData(string procName, ref SqlCommand cmd, out String ErrorMessage)
        {
            ds = new DataSet();
            ErrorMessage = string.Empty;
            try
            {
                cmd.CommandText = procName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                AD = new SqlDataAdapter(cmd);
                AD.Fill(ds);

            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
            }
            return ds;

        }

        public int AddUpdate(string procName, ref SqlCommand cmd, out String ErrorMessage)
        {
            int i = 0;
            ErrorMessage = string.Empty;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = procName;
                cmd.Connection = con;
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                i = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

            return i;

        }

        public DataSet ExecuteSqlQuery(string query, CommandType cmdType, Parameter[] DBParameters = null)
        {
            try
            {

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;


                //cmd.Parameters.Clear();

                //if (DBParameters != null && DBParameters.Length > 0)
                //{
                //    //SqlParameter[] Parameters = (SqlParameter[])DBParameters; //ConvertParameters(DBParameters); DbParameter
                //    sp = ConvertToSqlParameters(DBParameters);
                //    cmd.Parameters.AddRange(sp);
                //}

                ds = new DataSet();
                AD = new SqlDataAdapter(cmd);

                AD.Fill(ds);
                con.Close();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataSet ExecuteProcedure(string procName, CommandType cmdType, Parameter[] DBParameters = null)
        {
            try
            {
                cmd.CommandText = procName;
                cmd.CommandType = cmdType;

                cmd.Parameters.Clear();

                if (DBParameters != null && DBParameters.Length > 0)
                {
                    //SqlParameter[] Parameters = (SqlParameter[])DBParameters; //ConvertParameters(DBParameters); DbParameter
                    sp = ConvertToSqlParameters(DBParameters);
                    cmd.Parameters.AddRange(sp);
                }

                ds = new DataSet();
                AD = new SqlDataAdapter(cmd);

                AD.Fill(ds);
                con.Close();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int ExecuteNonQuery(string procName, CommandType cmdType, Parameter[] DBParameters = null)
        {
            try
            {
                cmd.CommandText = procName;
                cmd.CommandType = cmdType;

                cmd.Parameters.Clear();

                if (DBParameters != null && DBParameters.Length > 0)
                {
                    sp = ConvertToSqlParameters(DBParameters);
                    cmd.Parameters.AddRange(sp);
                }

                con.Open();
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public object ExecuteScalar(string procName, CommandType cmdType, Parameter[] DBParameters = null)
        {
            try
            {
                cmd.CommandText = procName;
                cmd.CommandType = cmdType;

                cmd.Parameters.Clear();

                if (DBParameters != null && DBParameters.Length > 0)
                {
                    sp = ConvertToSqlParameters(DBParameters);
                    cmd.Parameters.AddRange(sp);
                }

                con.Open();
                return cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        private SqlParameter[] ConvertToSqlParameters(Parameter[] parameters)
        {
            SqlParameter[] sp = new SqlParameter[parameters.Length];
            int i = 0;
            foreach (Parameter parameter in parameters)
            {
                sp[i] = new SqlParameter();
                sp[i].ParameterName = parameter.ParameterName;
                sp[i].Direction = parameter.Direction;
                sp[i].DbType = parameter.DbType;
                sp[i].Value = parameter.Value;
                sp[i].SourceColumn = parameter.SourceColumn;
                sp[i].Size = parameter.Size;

                i++;
            }

            return sp;
        }

        public int SaveData(string procName, ref SqlCommand cmd, out String ErrorMessage)
        {
            int i = 0;
            ErrorMessage = string.Empty;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = procName;
                cmd.Connection = con;
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                i = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

            return i;
        }

        public string Save(string procName, ref SqlCommand cmd, out String ErrorMessage)
        {
            string msg = "";
            ErrorMessage = string.Empty;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = procName;
                cmd.Connection = con;
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                msg = "success";
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

            return msg;
        }


    }


    public struct Parameter
    {
        public string ParameterName { get; set; }
        public ParameterDirection Direction { get; set; }
        public DbType DbType { get; set; }
        public object Value { get; set; }
        public string SourceColumn { get; set; }
        public int Size { get; set; }
    }

}
