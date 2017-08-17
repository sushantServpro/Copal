using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using System.Web.Configuration;

namespace DataLayer
{
    public class DataUserMaster
    {
        public static SqlConnection conn()
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ToString());
            return conn;
        }

        Common c = new Common();

        String ErrorMessage;
        public DataSet GetUserInfo(AppUserMaster obj)
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetAllUsers", ref cmd, out ErrorMessage);
        }
        //txtempcode.Text, ddrole.SelectedItem.Text, Convert.ToInt32(id.Text), txtsecqt.Text,txtsecans.Text);
        public int UpdateUserInfo(string id, string username, string password, string empcode, string secquestion, string secanswer, string RoleId)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("UserName", username);
            cmd.Parameters.AddWithValue("Password", password);
            cmd.Parameters.AddWithValue("EmployeeCode", empcode);
            cmd.Parameters.AddWithValue("SecurityQuestion", secquestion);
            cmd.Parameters.AddWithValue("SecurityAnswer", secanswer);
            cmd.Parameters.AddWithValue("RoleId", RoleId);
            return c.SaveData("Proc_UpdateUserDetails", ref cmd, out ErrorMessage);
        }

        public string InsertUserInfo(string username, string password, string empcode, string createdon, string updatedon, string SecurityQuestion, string SecurityAnswer, string RoleId)
        {
            SqlConnection con = conn();
            string msg = "";
            string query = "select * from UserMaster where UserName = '" + username + "' and Password='" + password + "'";
            SqlCommand cmd1 = new SqlCommand(query,con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable d = new DataTable();
            da.Fill(d);

            if (d.Rows.Count > 0)
            {
                msg = "Already exists";
            }

            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Username", username);
                cmd.Parameters.AddWithValue("Password", password);
                cmd.Parameters.AddWithValue("EmployeeCode", empcode);
                cmd.Parameters.AddWithValue("CreatedOn", createdon);
                cmd.Parameters.AddWithValue("UpdatedOn", updatedon);
                cmd.Parameters.AddWithValue("SecurityQuestion", SecurityQuestion);
                cmd.Parameters.AddWithValue("SecurityAnswer", SecurityAnswer);
                cmd.Parameters.AddWithValue("RoleId", RoleId);
                return c.Save("Proc_InsertUserMaster", ref cmd, out ErrorMessage);
            }
            return msg;
        }

        public DataSet SearchUserDetails(string search)
        {
            //string query = "select * from UserMaster where UserName like '%" + search + "%' order by Id desc";
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserName", search);
            return c.GetData("Proc_GetSearchedUsers", ref cmd, out ErrorMessage);
        }
    }
}
