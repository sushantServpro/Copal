using AppLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataLayer
{
   public class DataCorporateEvent
    {
        Common c = new Common();

        String ErrorMessage;

        public DataSet GetAllCorporateEvent(AppCorporateEvent obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@ID", obj.Id);
            return c.GetData("Proc_GetCorporateEvent", ref cmd, out ErrorMessage);
        }


        public DataSet SearchCorporateEvent(string search)
        {
            //string query = "select * from UserMaster where UserName like '%" + search + "%' order by Id desc";
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("HeaderName", search);
            return c.GetData("Proc_GetSearchCorporateEvents", ref cmd, out ErrorMessage);
        }

        public int InsertCorporateEvent(string ImageName, string ImagePath, string HeaderName, string HeaderDescription, string Location, string Timings)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("HeaderName", HeaderName);
            cmd.Parameters.AddWithValue("Description", HeaderDescription);
            cmd.Parameters.AddWithValue("Location", Location);
            cmd.Parameters.AddWithValue("Timings", Timings);
            cmd.Parameters.AddWithValue("ImageName", ImageName);
            cmd.Parameters.AddWithValue("ImagePath", ImagePath);
            return c.SaveData("Proc_InsertCorporateEvent", ref cmd, out ErrorMessage);
        }

        public int UpdateCorporateEvent(string ID,string ImageName, string ImagePath, string HeaderName, string HeaderDescription, string Location, string Timings)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("HeaderName", HeaderName);
            cmd.Parameters.AddWithValue("Description", HeaderDescription);
            cmd.Parameters.AddWithValue("Location", Location);
            cmd.Parameters.AddWithValue("Timings", Timings);
            cmd.Parameters.AddWithValue("ImageName", ImageName);
            cmd.Parameters.AddWithValue("ImagePath", ImagePath);

            return c.SaveData("Proc_UpdateCorporateEvent", ref cmd, out ErrorMessage);
        }
    }
}
