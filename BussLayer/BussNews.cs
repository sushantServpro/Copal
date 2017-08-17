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

        public string InsertNewsInfo(string heading, string description,string strFrom)
        {
            return dnews.InsertNewsInfo(heading, description,strFrom);
        }

        public int UpdateNewsInfo(string id, string heading, string description, string createddt, string strFrom)
        {
            return dnews.UpdateNewsInfo(id, heading, description, createddt, strFrom);
        }

        public DataSet GetSearchNewsLetter(string strSearchText)
        {
            return dnews.SearchNewsLetter(strSearchText);
        }
    }
}
