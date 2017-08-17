using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BussLayer;
using AppLayer;
using DataLayer;
using System.Data;

namespace BussLayer
{
    public class BussWall
    {
        DataWall dwall = new DataWall();

        public DataSet GetAllWallDetails(AppWall obj)
        {
            return dwall.GetAllWallDetails(obj);
        }

        public int InsertWallOfFameInfo(string empcode, string heading, string description, string createddt, DateTime achievermonth)
        {
            return dwall.InsertWallOfFameInfo(empcode, heading, description, createddt, achievermonth);
        }

        public int UpdateWalloffameInfo(string id, string empcode, string heading, string description, string createddt, DateTime achievermonth)
        {
            return dwall.UpdateWalloffameInfo(id, empcode, heading, description, createddt, achievermonth);
        }

        public DataSet SearchWalloffameInfo(string strSearchText)
        {
            return dwall.SearchWallOfFame(strSearchText);
        }
    }
}
