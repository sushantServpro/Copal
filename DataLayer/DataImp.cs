using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DataImp
    {
        Common c = new Common();

        String ErrorMessage;

        public DataSet GetAllImpNotifications(string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            return c.GetData("Proc_GetAllImpNotification", ref cmd, out ErrorMessage);
        }

        public int InsertImpNotification(string heading, string description, string strImagePath, string strImageName, string strFrom)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Heading", heading);
            cmd.Parameters.AddWithValue("Description", description);
            cmd.Parameters.AddWithValue("ImagePath", strImagePath);
            cmd.Parameters.AddWithValue("ImageName", strImageName);
            cmd.Parameters.AddWithValue("From", strFrom);
            return c.SaveData("Proc_InsertImpNotificationDetails", ref cmd, out ErrorMessage);
        }

        public int UpdateImpNotificationFlag(string id, int flag)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("Flag", flag);
            return c.SaveData("Proc_UpdateImpNotificationFlag", ref cmd, out ErrorMessage);
        }

        public int UpdateNotificationDetails(string id, string heading, string descp, string strImagePath,string strImageName,string strFrom)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("Heading", heading);
            cmd.Parameters.AddWithValue("Description", descp);
            cmd.Parameters.AddWithValue("ImagePath", strImagePath);
            cmd.Parameters.AddWithValue("ImageName", strImageName);
            cmd.Parameters.AddWithValue("From", strFrom);
            return c.SaveData("Proc_UpdateNotificationdetails", ref cmd, out ErrorMessage);
        }
    }
}
