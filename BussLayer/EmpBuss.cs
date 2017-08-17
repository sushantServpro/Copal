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
    public class EmpBuss
    {
        EmpData empdata = new EmpData();

        public DataSet GetAllEmployees(EmpApp obj)
        {
            return empdata.GetAllEmployees(obj);
        }

        public DataSet GetAllEmployeesWithId(string empcode)
        {
            return empdata.GetAllEmployeesWithId(empcode);
        }

        public int InsertEmpInfo(string empcode, string FirstName, string MiddleName, string LastName, string Address, string ContactNo, string LandLineNo, string WhatsAppNo, string EmailId, string Department, string Country, string State, string City, string GmailId, string SkypeId, string CompanyEmailId, string Hobbies, string DOB, string DOJ, string Qualification, string Experience, string BriefInfo, string Achievements, string Designation, string ImageName, string ImagePath)
        {
            return empdata.InsertEmpInfo(empcode, FirstName, MiddleName, LastName, Address, ContactNo, LandLineNo, WhatsAppNo, EmailId, Department, Country, State, City, GmailId, SkypeId, CompanyEmailId, Hobbies, DOB,  DOJ,  Qualification,  Experience,  BriefInfo,  Achievements,  Designation, ImageName,ImagePath);
        }

        public int UpdateEmployeeInfo(string id, string FirstName, string MiddleName, string LastName, string Address, string ContactNo, string LandLineNo, string WhatsAppNo, string EmailId, string Department, string Country, string State, string City, string GmailId, string SkypeId, string CompanyEmailId, string Hobbies, string Qualification, string Experience, string BriefInfo, string Achievements, string Designation, string ImageName, string ImagePath)
        {
            return empdata.UpdateEmployeeInfo(id, FirstName, MiddleName, LastName, Address, ContactNo, LandLineNo, WhatsAppNo, EmailId, Department, Country, State, City, GmailId, SkypeId, CompanyEmailId, Hobbies, Qualification, Experience, BriefInfo, Achievements, Designation, ImageName, ImagePath);
        }

        public DataSet FetchCountry(EmpApp obj)
        {
            return empdata.FetchCountry(obj);
        }

        public DataSet FetchState(EmpApp obj)
        {
            return empdata.FetchState(obj);
        }

        public DataSet FetchCity(string stateid)
        {
            return empdata.FetchCity(stateid);
        }

        public DataSet GetEmpCode(EmpApp obj)
        {
            return empdata.GetEmpCode(obj);
        }
    }
}
