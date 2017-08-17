using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MySpace
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string imageid = context.Request.QueryString["EmpCode"];
            SqlConnection connection = new SqlConnection(@"Data Source=servpro40;Initial Catalog=MySpace;Integrated Security=True");
            connection.Open();
            SqlCommand command = new SqlCommand("select ImageName from EmployeeMaster where EmpCode=" + imageid, connection);
            SqlDataReader dr = command.ExecuteReader();
            dr.Read();
            context.Response.BinaryWrite((Byte[])dr[0]);
            connection.Close();
            context.Response.End();  
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}