using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using System.Data;
using System.Data.SqlClient;
using AppLayer;
using DataLayer;

namespace DataLayer
{
    public class DataRole
    {
        Common c = new Common();
        String ErrorMessage;

        public DataSet GetUserRole(AppRole obj)
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetRoleDetails", ref cmd, out ErrorMessage);
        }

        public int UpdateRoleInfo(string id, string role, string roledescription, string roletype)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("Role", role);
            cmd.Parameters.AddWithValue("RoleDescription", roledescription);
            cmd.Parameters.AddWithValue("RoleType", roletype);
            return c.SaveData("Proc_UpdateRoleMaster", ref cmd, out ErrorMessage);
        }

        public int InsertRoleInfo(string role, string roledescription, string roletype)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Role", role);
            cmd.Parameters.AddWithValue("RoleDescription", roledescription);
            cmd.Parameters.AddWithValue("RoleType", roletype);
            return c.SaveData("Proc_InsertRoleMaster", ref cmd, out ErrorMessage);
        }

        public DataSet SearchUserDetails(string search)
        {
            string query = "select * from RoleMaster where Role like '%" + search + "%' or RoleType like '%" + search + "%' order by Id desc";
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            return ds;
        }
    }
}
