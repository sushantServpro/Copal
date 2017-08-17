using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using AppLayer;
using System.Data;
using System.Data.SqlClient;


namespace DataLayer
{
    public class DataNews
    {
        Common c = new Common();

        String ErrorMessage;

        public DataSet GetAllNewsDetails(string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            return c.GetData("Proc_GetNewsLetterDetails", ref cmd, out ErrorMessage);
        }

        public string InsertNewsInfo(string heading, string description, string strFrom)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("NewsHeading", heading);
            cmd.Parameters.AddWithValue("NewsDescription", description);
            cmd.Parameters.AddWithValue("From", strFrom);
            return c.Save("Proc_InsertNewsLetterDetails", ref cmd, out ErrorMessage);
        }

        public int UpdateNewsInfo(string id, string heading, string description, string createddt, string strFrom)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("NewsHeading", heading);
            cmd.Parameters.AddWithValue("NewsDescription", description);
            //cmd.Parameters.AddWithValue("CreatedDatetime", createddt);
            cmd.Parameters.AddWithValue("From", strFrom);
            return c.SaveData("Proc_UpdateNewsLetterdetails", ref cmd, out ErrorMessage);
        }

        public DataSet SearchNewsLetter(string strSearchText)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Header", strSearchText);
            return c.GetData("Proc_GetSearchNewsLetter", ref cmd, out ErrorMessage);
        }
    }
}
