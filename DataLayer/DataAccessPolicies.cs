using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AppLayer;

namespace DataLayer
{
    public class DataAccessPolicies
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get all Policies details from database
        /// </summary>
        /// <returns>Dataset</returns>
        public DataSet GetAccessPolicies()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            return c.GetData("Proc_GetAccessPolicies", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Insert Policy details in Database
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public int InsertAccessPolicies(AppAccessPolicies obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PolicyName", obj.PolicyName);
            cmd.Parameters.AddWithValue("@PolicyPath", obj.PolicyPath);
            return c.SaveData("Proc_InsertAccessPolicies", ref cmd, out strErrorMessage);

        }
    }
}
