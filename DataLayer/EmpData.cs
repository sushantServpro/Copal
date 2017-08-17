using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using System.Data.SqlClient;
using System.Data;

namespace DataLayer
{
    public class EmpData
    {
        Common c = new Common();

        String ErrorMessage;

        public DataSet GetAllEmployees(EmpApp obj)
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetEmployeeDetails", ref cmd, out ErrorMessage);
        }

        public DataSet GetAllEmployeesWithId(string empcode)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("Empcode", empcode);

            return c.GetData("Proc_GetEmployeeDetailsWithId", ref cmd, out ErrorMessage);
        }

        public int InsertEmpInfo(string empcode, string FirstName, string MiddleName, string LastName, string Address, string ContactNo, string LandLineNo, string WhatsAppNo, string EmailId, string Department, string Country, string State, string City, string GmailId, string SkypeId, string CompanyEmailId, string Hobbies, string DOB, string DOJ, string Qualification, string Experience, string BriefInfo, string Achievements,string Designation,string ImageName, string ImagePath)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Empcode", empcode);
            cmd.Parameters.AddWithValue("FirstName", FirstName);
            cmd.Parameters.AddWithValue("MiddleName", MiddleName);
            cmd.Parameters.AddWithValue("LastName", LastName);
            cmd.Parameters.AddWithValue("Address", Address);
            cmd.Parameters.AddWithValue("ContactNo", ContactNo);
            cmd.Parameters.AddWithValue("LandLineNo", LandLineNo);
            cmd.Parameters.AddWithValue("WhatsAppNo", WhatsAppNo);
            cmd.Parameters.AddWithValue("EmailId", EmailId);
            cmd.Parameters.AddWithValue("Department", Department);
            cmd.Parameters.AddWithValue("Country", Country);
            cmd.Parameters.AddWithValue("State", State);
            cmd.Parameters.AddWithValue("City", City);
            cmd.Parameters.AddWithValue("GmailId", GmailId);
            cmd.Parameters.AddWithValue("SkypeId", SkypeId);
            cmd.Parameters.AddWithValue("CompanyEmailId", CompanyEmailId);
            cmd.Parameters.AddWithValue("Hobbies", Hobbies);
            cmd.Parameters.AddWithValue("DOB", DOB);
            cmd.Parameters.AddWithValue("DOJ", DOJ);
            cmd.Parameters.AddWithValue("Qualification", Qualification);
            cmd.Parameters.AddWithValue("Experience", Experience);
            cmd.Parameters.AddWithValue("BriefInfo", BriefInfo);
            cmd.Parameters.AddWithValue("Achievements", Achievements);
            cmd.Parameters.AddWithValue("Designation", Designation);
            cmd.Parameters.AddWithValue("ImageName", ImageName);
            cmd.Parameters.AddWithValue("ImagePath", ImagePath);
            return c.SaveData("Proc_InsertEmployeeMaster", ref cmd, out ErrorMessage);
        }

        public int UpdateEmployeeInfo(string id, string FirstName, string MiddleName, string LastName, string Address, string ContactNo, string LandLineNo, string WhatsAppNo, string EmailId, string Department, string Country, string State, string City, string GmailId, string SkypeId, string CompanyEmailId, string Hobbies, string Qualification, string Experience, string BriefInfo, string Achievements,string Designation,string ImageName, string ImagePath)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", id);
            cmd.Parameters.AddWithValue("FirstName", FirstName);
            cmd.Parameters.AddWithValue("MiddleName", MiddleName);
            cmd.Parameters.AddWithValue("LastName", LastName);
            cmd.Parameters.AddWithValue("Address", Address);
            cmd.Parameters.AddWithValue("ContactNo", ContactNo);
            cmd.Parameters.AddWithValue("LandLineNo", LandLineNo);
            cmd.Parameters.AddWithValue("WhatsAppNo", WhatsAppNo);
            cmd.Parameters.AddWithValue("EmailId", EmailId);
            cmd.Parameters.AddWithValue("Department", Department);
            cmd.Parameters.AddWithValue("Country", Country);
            cmd.Parameters.AddWithValue("State", State);
            cmd.Parameters.AddWithValue("City", City);
            cmd.Parameters.AddWithValue("GmailId", GmailId);
            cmd.Parameters.AddWithValue("SkypeId", SkypeId);
            cmd.Parameters.AddWithValue("CompanyEmailId", CompanyEmailId);
            cmd.Parameters.AddWithValue("Hobbies", Hobbies);
            cmd.Parameters.AddWithValue("Qualification", Qualification);
            cmd.Parameters.AddWithValue("Experience", Experience);
            cmd.Parameters.AddWithValue("BriefInfo", BriefInfo);
            cmd.Parameters.AddWithValue("Achievements", Achievements);
            cmd.Parameters.AddWithValue("Designation", Designation);
            cmd.Parameters.AddWithValue("ImageName", ImageName);
            cmd.Parameters.AddWithValue("ImagePath", ImagePath);
            return c.SaveData("Proc_UpdateEmployeeDetails", ref cmd, out ErrorMessage);
        }

        public DataSet FetchCountry(EmpApp obj)
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetCountry", ref cmd, out ErrorMessage);
        }

        public DataSet FetchState(EmpApp obj)
        {
            SqlCommand cmd = new SqlCommand();
      
            return c.GetData("Proc_GetState", ref cmd, out ErrorMessage);
        }

        public DataSet FetchCity(string stateid)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("StateId", stateid);
            return c.GetData("Proc_GetCity", ref cmd, out ErrorMessage);
        }

        public DataSet GetEmpCode(EmpApp obj)
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetEmployeeCode", ref cmd, out ErrorMessage);
        }

        /// <summary>
        /// Get Employee Contact details from database
        /// </summary>
        /// <returns>DataSet</returns>
        public DataSet GetEmployeeContacts()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            return c.GetData("Proc_GetEmployeeContacts", ref cmd, out ErrorMessage);
        }
    }
}
