using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
  public class DataLoginMaster
    {
        Common c = new Common();
        String ErrorMessage;
        public DataSet GetUserInfo(string UserName,string Password)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("UserName", UserName);
                cmd.Parameters.AddWithValue("Password", Password);
                return c.GetData("Proc_GetUserDetails", ref cmd, out ErrorMessage);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
