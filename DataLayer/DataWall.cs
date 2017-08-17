using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;

namespace DataLayer
{
    public class DataWall
    {
        Common c = new Common();

        String ErrorMessage;

        public DataSet GetAllWallDetails(AppWall obj)
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetWallofFame", ref cmd, out ErrorMessage);
        }

        public int InsertWallOfFameInfo(string empcode, string heading, string description, string createddt, DateTime achievermonth)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Empcode", empcode);
            cmd.Parameters.AddWithValue("Heading", heading);
            cmd.Parameters.AddWithValue("Description", description);
            cmd.Parameters.AddWithValue("CreatedDatetime", createddt);
            cmd.Parameters.AddWithValue("AchieverMonth", achievermonth);
            return c.SaveData("Proc_InsertWallOfFameDetails", ref cmd, out ErrorMessage);
        }

        public int UpdateWalloffameInfo(string id, string empcode, string heading, string description, string createddt, DateTime achievermonth)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("Empcode", empcode);
            cmd.Parameters.AddWithValue("Heading", heading);
            cmd.Parameters.AddWithValue("Description", description);
            cmd.Parameters.AddWithValue("AchieverMonth", achievermonth);
            return c.SaveData("Proc_UpdateWallOfFamedetails", ref cmd, out ErrorMessage);
        }

        public DataSet SearchWallOfFame(string strsearch)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("HeaderName", strsearch);
            return c.GetData("Proc_GetSearchWallOfFame", ref cmd, out ErrorMessage);
        }

    }
}
