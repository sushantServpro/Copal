using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using System.Data.SqlClient;
using System.Data;


namespace DataLayer
{
    public class DataAnnouncement
    {
        Common c = new Common();

        String ErrorMessage;

        public DataSet GetAllAnnouncements(string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", id);
            return c.GetData("Proc_GetAllAnnouncements", ref cmd, out ErrorMessage);
        }

        public int InsertAnnouncement(string heading, string description, string ImagePath, string ImageName,string strFrom)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Heading", heading);
            cmd.Parameters.AddWithValue("Description", description);
            cmd.Parameters.AddWithValue("ImagePath", ImagePath);
            cmd.Parameters.AddWithValue("ImageName", ImageName);
            cmd.Parameters.AddWithValue("From", strFrom);
            return c.SaveData("Proc_InsertAnnouncementDetails", ref cmd, out ErrorMessage);
        }

        public int UpdateAnnouncementFlag(string id, int flag)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("Flag", flag);
            return c.SaveData("Proc_UpdateAnnouncementFlag", ref cmd, out ErrorMessage);
        }

        public int UpdateAnnouncementDetails(string id, string heading, string descp, string ImagePath, string ImageName,string strFrom)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("Heading", heading);
            cmd.Parameters.AddWithValue("Description", descp);
            cmd.Parameters.AddWithValue("ImagePath", ImagePath);
            cmd.Parameters.AddWithValue("ImageName", ImageName);
            cmd.Parameters.AddWithValue("From", strFrom);
            return c.SaveData("Proc_UpdateAnnouncementdetails", ref cmd, out ErrorMessage);
        }


    }
}
