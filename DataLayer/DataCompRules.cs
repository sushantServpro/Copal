using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using System.Data;
using System.Data.SqlClient;
using AppLayer;

namespace DataLayer
{
    public class DataCompRules
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get Company Rules from database
        /// </summary>
        /// <param name="strRuleId">Rule ID</param>
        /// <returns>DataSet</returns>
        public DataSet GetCompanyRules(string strRuleId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", strRuleId);
            return c.GetData("Proc_GetCompanyRules", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Insert Company Rules Records in Database
        /// </summary>
        /// <param name="obj">App Layer Obj</param>
        /// <returns>Insert Status</returns>
        public int InsertCompanyRules(AppCompanyRules obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Heading", obj.Heading);
            cmd.Parameters.AddWithValue("@Description", obj.Description);
            return c.SaveData("Proc_InsertCompanyRules", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Update Company Rule record in Database
        /// </summary>
        /// <param name="obj">App Layer Object</param>
        /// <returns>Update Status</returns>
        public int UpdateCompanyRules(AppCompanyRules obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CompRuleId", obj.CompRuleId);
            cmd.Parameters.AddWithValue("@Heading", obj.Heading);
            cmd.Parameters.AddWithValue("@Description", obj.Description);
            cmd.Parameters.AddWithValue("@Flag", obj.Flag);
            return c.SaveData("Proc_UpdateCompanyRules", ref cmd, out strErrorMessage);
        }
    }
}
