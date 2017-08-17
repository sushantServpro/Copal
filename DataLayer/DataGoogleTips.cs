using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataLayer
{
    public class DataGoogleTips
    {
        Common c = new Common();
        string strErrorMessage = "";

        /// <summary>
        /// Get Google Tips Link from Database
        /// </summary>
        /// <returns>DataSet</returns>
        public DataSet GetGoogleTips()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            return c.GetData("Proc_GetGoogleTips", ref cmd, out strErrorMessage);
        }
    }
}
