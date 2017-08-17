using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using BussLayer;
using DataLayer;
using System.Data;

namespace BussLayer
{
    public class BussNews
    {
        DataNews dnews = new DataNews();

        public DataSet GetAllNewsDetails(string id)
        {
            return dnews.GetAllNewsDetails(id);
        }

        public string InsertNewsInfo(string heading, string description)
        {
            return dnews.InsertNewsInfo(heading, description);
        }

        public int UpdateNewsInfo(string id, string heading, string description, string createddt)
        {
            return dnews.UpdateNewsInfo(id, heading, description, createddt);
        }

        public DataSet GetSearchNewsLetter(string strSearchText)
        {
            return dnews.SearchNewsLetter(strSearchText);
        }
    }
}
