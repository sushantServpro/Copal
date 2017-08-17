using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using BussLayer;
using AppLayer;
using System.Data;
using System.Net;
using System.Xml;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;

namespace MySpacePortal.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        EmpApp empapp = new EmpApp();
        EmpBuss empbuss = new EmpBuss();
        EmpData empdata = new EmpData();
        AppAddAnnouncement appann = new AppAddAnnouncement();
        BussAnnouncement bussann = new BussAnnouncement();
        DataAnnouncement dataann = new DataAnnouncement();
        AppImp appimp = new AppImp();
        BussImp bussimp = new BussImp();
        DataImp dataimp = new DataImp();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


                if (Session["RoleId"].ToString() == "1")
                {
                    DataSet dt = empbuss.GetAllEmployeesWithId(Session["EmpCode"].ToString());

                    string fname = dt.Tables[0].Rows[0]["FirstName"].ToString();
                    string mname = dt.Tables[0].Rows[0]["MiddleName"].ToString();
                    string lname = dt.Tables[0].Rows[0]["LastName"].ToString();
                    string designation = dt.Tables[0].Rows[0]["Designation"].ToString();
                    string department = dt.Tables[0].Rows[0]["Department"].ToString();
                    string location = dt.Tables[0].Rows[0]["City"].ToString();
                    string ImagePath = dt.Tables[0].Rows[0]["ImagePath"].ToString();
                    string image = dt.Tables[0].Rows[0]["ImageName"].ToString();
                    string username = fname.Trim() + " " + mname.Trim() + " " + lname.Trim();

                    Image1.ImageUrl = ImagePath;

                    lblusername.InnerText = username;
                    lbldept.InnerText = department;
                    lbldesignation.InnerText = designation;
                    lbllocation.InnerText = location;
                    getAnnouncements();
                    getImpNotification();
                    //// byte[] bytes = Convert.FromBase64String(image);
                    ////string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    ////Image1.ImageUrl = "data:image/png;base64," + base64String;
                    //Image image = e.Row.FindControl("img_user") as Image;
                    //if (!File.Exists(Server.MapPath(image.ImageUrl)))
                    //{
                    //    image.ImageUrl = "~/Images/No_image_available.png";
                    //}          
                }
                else
                {
                    DataSet dt = empbuss.GetAllEmployeesWithId(Session["EmpCode"].ToString());

                    string fname = dt.Tables[0].Rows[0]["FirstName"].ToString();
                    string mname = dt.Tables[0].Rows[0]["MiddleName"].ToString();
                    string lname = dt.Tables[0].Rows[0]["LastName"].ToString();
                    string designation = dt.Tables[0].Rows[0]["Designation"].ToString();
                    string department = dt.Tables[0].Rows[0]["Department"].ToString();
                    string location = dt.Tables[0].Rows[0]["City"].ToString();
                    string image = dt.Tables[0].Rows[0]["ImagePath"].ToString();
                    string username = fname.Trim() + " " + mname.Trim() + " " + lname.Trim();

                    Image1.ImageUrl = image;

                    lblusername.InnerText = username;
                    lbldept.InnerText = department;
                    lbldesignation.InnerText = designation;
                    lbllocation.InnerText = location;
                    getAnnouncements();
                    getImpNotification();
                    //Image image = dt.Tables[0].Rows[0]["ImagePath"] as Image;
                    //if (image.ImageUrl == "")
                    //{
                    //    image.ImageUrl = "~/Images/No_image_available.png";
                    //}
                    //else
                    //{
                    //    image.ImageUrl = Image1.ImageUrl;
                    //}
                }
            }
        }

        public void getAnnouncements()
        {
            DataSet dt = bussann.GetAllAnnouncements("");
            DataTable dtTop5Announcements = new DataTable();
            //HtmlGenericControl ul_myLst = (HtmlGenericControl)this.Page.FindControl("ul_myLst");
            //List<string> list = new List<string>();

            //Commented and added by Ali
            //logic to handle exception if empty datatable
            var top5Rows = (from x in dt.Tables[0].AsEnumerable() select x).Take(5);
            if (top5Rows.Any())
                dtTop5Announcements = top5Rows.CopyToDataTable();
            //foreach (DataTable table in dt.Tables)
            //{
            //foreach (DataRow row in table.Rows)
            //{
            //foreach (DataColumn column in table.Columns)
            //{
            //AnnouncementRepeater.DataSource = dt;
            AnnouncementRepeater.DataSource = dtTop5Announcements;
            AnnouncementRepeater.DataBind();
            //  Console.WriteLine(row[column]);
            //lblheading.InnerText = row["Heading"].ToString();
            //lbldescription.InnerText = row["Description"].ToString();

            //}
            //}
            //}
        }

        public void getImpNotification()
        {
            DataSet dt = bussimp.GetAllImpNotifications("");
            DataTable dtTop5ImpNotification = new DataTable();
            //HtmlGenericControl ul_myLst = (HtmlGenericControl)this.Page.FindControl("ul_myLst");
            //List<string> list = new List<string>();

            //Commented and added by Ali
            //logic to handle exception if empty datatable
            var top5Rows = (from x in dt.Tables[0].AsEnumerable() select x).Take(5);
            if (top5Rows.Any())
                dtTop5ImpNotification = top5Rows.CopyToDataTable();

            //foreach (DataTable table in dt.Tables)
            //{
            //    foreach (DataRow row in table.Rows)
            //    {
            //        foreach (DataColumn column in table.Columns)
            //        {
            //IMPNotiRepeater.DataSource = dt;
            IMPNotiRepeater.DataSource = dtTop5ImpNotification;
            IMPNotiRepeater.DataBind();
            //  Console.WriteLine(row[column]);
            //lblheading.InnerText = row["Heading"].ToString();
            //lbldescription.InnerText = row["Description"].ToString();

            //        }
            //    }
            //}
        }

        protected void btnreadallannouncements_Click(object sender, EventArgs e)
        {
            Response.Redirect("announcements.aspx");
        }

        protected void btnreadimpnoti_Click(object sender, EventArgs e)
        {
            Response.Redirect("imp_notifications.aspx");
        }
    }
}