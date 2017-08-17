using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AppLayer;

namespace DataLayer
{
    public class DataCompanyTips
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get Company Tips all and selected records from database
        /// </summary>
        /// <param name="strTipsId">Tips Id</param>
        /// <returns>Dataset</returns>
        public DataSet GetCompanyTips(string strTipsId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", strTipsId);
            return c.GetData("Proc_GetAllTipsDetails", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Insert Company Tips in Database
        /// </summary>
        /// <param name="obj">Company Tips App Layer Object</param>
        /// <returns>Insert Status</returns>
        public int InsertCompanyTips(AppCompanyTips obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Heading",obj.Heading);
            cmd.Parameters.AddWithValue("@Description", obj.Description);
            return c.SaveData("Proc_InsertCompanyTips", ref cmd, out strErrorMessage);
        }
    }
}
