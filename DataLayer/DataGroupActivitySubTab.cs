using AppLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataLayer
{
    public class DataGroupActivitySubTab
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get GroupAvtivitySubTab all and selected record from Database
        /// </summary>
        /// <param name="strSubTabId">Selected SubTabId</param>
        /// <returns>dataset</returns>
        public DataSet GetGroupActivitySubTabRecords(string strTabId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@GroupActivityTabId", strTabId);
            cmd.CommandType = CommandType.StoredProcedure;
            return c.GetData("Proc_GetGroupActivitySubTab", ref cmd, out strErrorMessage);
        }
        
        /// <summary>
        /// Insert GroupActivitySubTab Records in Database
        /// </summary>
        /// <param name="obj">GroupActivitySubTab object</param>
        /// <returns>Insert Status</returns>
        public int InsertGroupActivitySubTabRecord(AppGroupActivitySubTab obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@GroupActivityId", obj.GroupActivityId);
            cmd.Parameters.AddWithValue("@SubTabName", obj.SubTabName);
            cmd.Parameters.AddWithValue("@SubTabURL", obj.SubTabURL);
            cmd.Parameters.AddWithValue("@ImageName", obj.ImageName);
            cmd.Parameters.AddWithValue("@ImagePath", obj.ImagePath);
            cmd.CommandType = CommandType.StoredProcedure;
            return c.SaveData("Proc_InsertGroupActivitySubTab", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Update GroupActivitySubTab Records in Database
        /// </summary>
        /// <param name="obj">GroupActivitySubTab object</param>
        /// <returns>Update Status</returns>
        public int UpdateGroupActivitySubTabRecord(AppGroupActivitySubTab obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@GroupActivityId", obj.GroupActivityId);
            cmd.Parameters.AddWithValue("@SubTabName", obj.SubTabName);
            cmd.Parameters.AddWithValue("@SubTabURL", obj.SubTabURL);
            cmd.Parameters.AddWithValue("@ImageName", obj.ImageName);
            cmd.Parameters.AddWithValue("@ImagePath", obj.ImagePath);
            cmd.CommandType = CommandType.StoredProcedure;
            return c.SaveData("Proc_InsertGroupActivitySubTab", ref cmd, out strErrorMessage);
        }
    }
}
