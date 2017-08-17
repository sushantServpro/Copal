using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using AppLayer;

namespace BussLayer
{
    public class BussCorporateEvent
    {
        DataCorporateEvent dann = new DataCorporateEvent();

        public DataSet GetAllCorporateEvent(AppCorporateEvent obj)
        {
            return dann.GetAllCorporateEvent(obj);
        }

        public DataSet SearchCorporateEvent(string search)
        {
            return dann.SearchCorporateEvent(search);
        }


        public int InsertCorporateEvent(string ImageName, string ImagePath, string HeaderName, string HeaderDescription, string Location, string Timings,DateTime EventDate)
        {
            return dann.InsertCorporateEvent(ImageName, ImagePath, HeaderName, HeaderDescription, Location, Timings,EventDate);
        }

        public int UpdateCorporateEvent(string ID, string ImageName, string ImagePath, string HeaderName, string HeaderDescription, string Location, string Timings, DateTime Eventdate)
        {
            return dann.UpdateCorporateEvent(ID, ImageName, ImagePath, HeaderName, HeaderDescription, Location, Timings, Eventdate);
        }
    }
}
