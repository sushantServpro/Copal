using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Net;
using System.Text;
using System.IO;
using System;
using context = System.Web.HttpContext;

namespace MySpace
{
    public class LogErrorClass
    {
        public void Logerror(string MessageText)
        {
            try
            {
                string filepath = context.Current.Server.MapPath("~/ExceptionDetailsFile/");  //Text File Path

                if (!Directory.Exists(filepath))
                {
                    Directory.CreateDirectory(filepath);

                }
                filepath = filepath + DateTime.Today.ToString("dd-MM-yy") + ".txt";   //Text File Name
                if (!File.Exists(filepath))
                {


                    File.Create(filepath).Dispose();

                }
                var line = Environment.NewLine + Environment.NewLine;
                using (StreamWriter sw = File.AppendText(filepath))
                {
                    string error = "Date:" + " " + DateTime.Now.ToString() + line + "Message :" + " " + MessageText + line;
                    sw.WriteLine("-----------Details on " + " " + DateTime.Now.ToString() + "-----------------");
                    sw.WriteLine("-------------------------------------------------------------------------------------");
                    sw.WriteLine(line);
                    sw.WriteLine(error);
                    sw.WriteLine("--------------------------------*End*------------------------------------------");
                    sw.WriteLine(line);
                    sw.Flush();
                    sw.Close();

                }

            }
            catch (Exception e)
            {
                e.ToString();

            }
        }
        //public string DisplayObjectInfo(Object o)
        //{
        //    StringBuilder sb = new StringBuilder();

        //    // Include the type of the object
        //    System.Type type = o.GetType();
        //    sb.Append("Type: " + type.Name);

        //    // Include information for each Field
        //    sb.Append("\r\n\r\nFields:");
        //    System.Reflection.FieldInfo[] fi = type.GetFields();
        //    if (fi.Length > 0)
        //    {
        //        foreach (System.Reflection.FieldInfo f in fi)
        //        {
        //            sb.Append("\r\n " + f.ToString() + " = " + f.GetValue(o));
        //        }
        //    }
        //    else
        //        sb.Append("\r\n None");

        //    // Include information for each Property
        //    sb.Append("\r\n\r\nProperties:");
        //    System.Reflection.PropertyInfo[] pi = type.GetProperties();
        //    if (pi.Length > 0)
        //    {
        //        foreach (System.Reflection.PropertyInfo p in pi)
        //        {
        //            sb.Append("\r\n " + p.ToString() + " = " +
        //                      p.GetValue(o, null));
        //        }
        //    }
        //    else
        //    {
        //        sb.Append("\r\n None");
        //    }
        //    return sb.ToString();
        //}​
    }
}