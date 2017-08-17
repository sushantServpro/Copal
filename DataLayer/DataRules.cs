using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataLayer
{
    public class DataRules
    {
        Common c = new Common();
        String ErrorMessage;

        public DataSet GetAllRulesList()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            return c.GetData("Proc_GetRulesList", ref cmd, out ErrorMessage);
        }

        public DataSet GetRulesItem(string strRuleId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", strRuleId);
            return c.GetData("Proc_GetRulesItem", ref cmd, out ErrorMessage);
        }
    }
}
