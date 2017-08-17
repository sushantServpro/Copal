using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using System.Data;

namespace BussLayer
{
    public class BussAnnouncement
    {
        DataAnnouncement dann = new DataAnnouncement();

        public DataSet GetAllAnnouncements(string id)
        {
            return dann.GetAllAnnouncements(id);
        }

        public int InsertAnnouncement(string heading, string description, string ImagePath, string ImageName)
        {
            return dann.InsertAnnouncement(heading, description,ImagePath, ImageName);
        }

        public int UpdateAnnouncementFlag(string id, int flag)
        {
            return dann.UpdateAnnouncementFlag(id, flag);
        }

        public int UpdateAnnouncementDetails(string id, string heading, string descp,string ImagePath, string ImageName)
        {
            return dann.UpdateAnnouncementDetails(id, heading, descp,ImagePath,ImageName);
        }

        public DataSet SearchUserDetails(string search, string profile)
        {
            return SearchUserDetails(search, profile);
        }

    }
}
