using AppLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataLayer
{
    public class DataGroupActivityTab
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get GroupAvtivityTab all and selected record from Database
        /// </summary>
        /// <param name="strGroupActivityTabId">Tab Id</param>
        /// <returns>Dataset</returns>
        public DataSet GetGroupActivityTab(string strGroupActivityTabId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@ID", strGroupActivityTabId);
            cmd.CommandType = CommandType.StoredProcedure;
            return c.GetData("Proc_GetGroupActivityTab", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Insert GroupActivityTab Records in Database
        /// </summary>
        /// <param name="obj">GroupActivityTab object</param>
        /// <returns>Insert Status</returns>
        public int InsertGroupActivityTab(AppGroupActivityTab obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@TabName", obj.TabName);
            cmd.Parameters.AddWithValue("@TabDescription", obj.TabDescription);
            cmd.CommandType = CommandType.StoredProcedure;
            return c.SaveData("Proc_InsertGroupActivityTab", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Update GroupActivityTab Records in Database
        /// </summary>
        /// <param name="obj">GroupActivityTab object</param>
        /// <returns>Update Status</returns>
        public int UpdateGroupActivityTab(AppGroupActivityTab obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@TabName", obj.TabName);
            cmd.Parameters.AddWithValue("@TabDescription", obj.TabDescription);
            cmd.Parameters.AddWithValue("@IsActive", obj.IsActive);
            cmd.CommandType = CommandType.StoredProcedure;
            return c.SaveData("Proc_UpdateGroupActivityTab", ref cmd, out strErrorMessage);
        }
    }
}
