using AppLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.Configuration;

namespace DataLayer
{
    public class DataVacancy
    {
        public static SqlConnection conn()
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ToString());
            return conn;
        }

        Common c = new Common();

        String ErrorMessage;
        public DataSet GetVacancyInfo(AppVacany obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add("@ID", obj.Id);
            return c.GetData("Proc_GetVacanyDetails", ref cmd, out ErrorMessage);
        }
        //txtempcode.Text, ddrole.SelectedItem.Text, Convert.ToInt32(id.Text), txtsecqt.Text,txtsecans.Text);
        public int UpdateVacancyInfo(string id, string JobHeading, string Experience, string Location, string Department, string JobDescription, string ContactDetails, string Link)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("JobHeading", JobHeading);
            cmd.Parameters.AddWithValue("Experience", Experience);
            cmd.Parameters.AddWithValue("Location", Location);
            cmd.Parameters.AddWithValue("Department", Department);
            cmd.Parameters.AddWithValue("JobDescription", JobDescription);
            cmd.Parameters.AddWithValue("ContactDetails", ContactDetails);
            cmd.Parameters.AddWithValue("Link", Link);
            return c.SaveData("Proc_UpdateVacancydetails", ref cmd, out ErrorMessage);
        }

        public string InsertVacancyInfo(string JobHeading, string Experience, string Location, string Department, string JobDescription, string ContactDetails, string Link)
        {
            SqlConnection con = conn();
            string msg = "";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("JobHeading", JobHeading);
            cmd.Parameters.AddWithValue("Experience", Experience);
            cmd.Parameters.AddWithValue("Location", Location);
            cmd.Parameters.AddWithValue("Department", Department);
            cmd.Parameters.AddWithValue("JobDescription", JobDescription);
            cmd.Parameters.AddWithValue("ContactDetails", ContactDetails);
            cmd.Parameters.AddWithValue("Link", Link);

            return c.Save("Proc_InsertVacancyDetails", ref cmd, out ErrorMessage);
            //return msg;
        }

        public DataSet SearchVacancyDetails(string search)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserName", search);
            return c.GetData("Proc_GetSearchedUsers", ref cmd, out ErrorMessage);
        }
    }
}
