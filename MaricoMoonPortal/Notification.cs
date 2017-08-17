using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Net;
using System.Text;
using System.IO;
using System;

namespace MySpace
{
    public class Notification
    {
        public String SendNotification(string Msg)
        {
            string _applicationID = System.Web.Configuration.WebConfigurationManager.AppSettings["LegacyServerKey"].ToString();
            string _senderId = System.Web.Configuration.WebConfigurationManager.AppSettings["SenderId"].ToString();
            string _Topic = System.Web.Configuration.WebConfigurationManager.AppSettings["TopicsAndroid"].ToString();
            try
            {
                var applicationID = _applicationID;
                var senderId = _senderId;

                WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
                tRequest.Method = "post";
                tRequest.ContentType = "application/json";

                var data = new
                {
                    to = _Topic,

                    data = new
                    {
                        message = Msg,//"{\"tickerText\":\"example test GCM\", \"contentTitle\":\"Advertise_GCM\",\"message\": \"Android Data Testing\",\"NotificationType\": \"Generic\",\"ImageURL\": \"http://servpro70.servpro.in/NagpurMetroPortalTest/PNImage/IMG-20161115-WA0006.jpg\"}",
                        title = "Title",
                        icon = "myicon"

                    },
                    priority = "high"
                };

                var serializer = new JavaScriptSerializer();
                var json = serializer.Serialize(data);
                Byte[] byteArray = Encoding.UTF8.GetBytes(json);
                tRequest.Headers.Add(string.Format("Authorization: key={0}", applicationID));
                tRequest.Headers.Add(string.Format("Sender: id={0}", senderId));
                tRequest.ContentLength = byteArray.Length;

                using (Stream dataStream = tRequest.GetRequestStream())
                {
                    dataStream.Write(byteArray, 0, byteArray.Length);

                    using (WebResponse tResponse = tRequest.GetResponse())
                    {
                        using (Stream dataStreamResponse = tResponse.GetResponseStream())
                        {
                            using (StreamReader tReader = new StreamReader(dataStreamResponse))
                            {
                                String sResponseFromServer = tReader.ReadToEnd();

                                return sResponseFromServer;
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            finally
            {

            }
        }
    }
}