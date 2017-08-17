using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AppLayer;

namespace DataLayer
{
    public class DataCompanySurvey
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get Company Survey records from Database
        /// </summary>
        /// <param name="strSurveyId">Survey ID</param>
        /// <returns>DataSet</returns>
        public DataSet GetCompanySurvey(string strSurveyId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CompSurveyId", strSurveyId);
            return c.GetData("Proc_GetCompanySurvey", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Insert Company Survey Records in database
        /// </summary>
        /// <param name="obj">App Layer Object</param>
        /// <returns>Insert Status</returns>
        public int InsertCompanySurvey(AppCompanySurvey obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Heading", obj.Heading);
            cmd.Parameters.AddWithValue("@Description", obj.Description);
            cmd.Parameters.AddWithValue("@Link", obj.Link);
            return c.SaveData("Proc_InsertCompanySurvey", ref cmd, out strErrorMessage);
        }

        /// <summary>
        /// Update Company Survey Records in Database
        /// </summary>
        /// <param name="obj">App Layer Object</param>
        /// <returns>Update Status</returns>
        public int UpdateCOmpanySurvey(AppCompanySurvey obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Heading", obj.Heading);
            cmd.Parameters.AddWithValue("@Description", obj.Heading);
            cmd.Parameters.AddWithValue("@Link", obj.Heading);
            cmd.Parameters.AddWithValue("@IsActive", obj.IsActive);
            return c.SaveData("Proc_UpdateCompanySurvey",ref cmd,out strErrorMessage);
        }
    }
}
