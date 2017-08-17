using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using BussLayer;
using System.Data;

namespace BussLayer
{
    public class BussImp
    {
        DataImp dann = new DataImp();

        public DataSet GetAllImpNotifications(string id)
        {
            return dann.GetAllImpNotifications(id);
        }

        public int InsertImpNotification(string heading, string description, string strImagePath, string strImageName)
        {
            return dann.InsertImpNotification(heading, description,strImagePath,strImageName);
        }

        public int UpdateImpNotificationFlag(string id, int flag)
        {
            return dann.UpdateImpNotificationFlag(id, flag);
        }

        public int UpdateNotificationDetails(string id, string heading, string descp, string strImagePath, string strImageName)
        {
            return dann.UpdateNotificationDetails(id, heading, descp,strImagePath,strImageName);
        }

        public DataSet SearchNotificationDetails(string search)
        {
            return SearchNotificationDetails(search);
        }

    }
}
