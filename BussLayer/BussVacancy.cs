using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;

namespace BussLayer
{
    public class BussVacancy
    {
        DataVacancy dv = new DataVacancy();
        public DataSet GetVacancyInfo(AppVacany obj)
        {
            return dv.GetVacancyInfo(obj);
        }

       //update vacancy details
        public int UpdateVacancyInfo(string Id,string JobHeading, string Experience, string Location, string Department, string JobDescription, string ContactDetails, string Link)
        {
            return dv.UpdateVacancyInfo(Id, JobHeading, Experience, Location, Department, JobDescription, ContactDetails,Link);
        }

        //insert vacancy detailss
        public string InsertVacancyInfo(string JobHeading, string Experience, string Location, string Department, string JobDescription, string ContactDetails, string Link)
        {
            return dv.InsertVacancyInfo(JobHeading, Experience, Location, Department, JobDescription, ContactDetails, Link);
        }

        //search vacancy details
        public DataSet SearchVacancyDetails(string search)
        {
            return dv.SearchVacancyDetails(search);
        }
    }
}
