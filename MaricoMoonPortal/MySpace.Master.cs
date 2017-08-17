using AppLayer;
using BussLayer;
using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MySpace
{
    public partial class MySpacePortal : System.Web.UI.MasterPage
    {
        EmpApp empapp = new EmpApp();
        EmpBuss empbuss = new EmpBuss();
        EmpData empdata = new EmpData();
        protected void Page_Init(object sender, EventArgs e)
        {
            //if (Session["UserName"].ToString() == "" || Session["UserName"].ToString() == null)
            //{
            //    Response.Redirect("~/Login.aspx");
            //}
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    lblUserName.Text = Session["UserName"].ToString();
                    lbldesignation.Text = Session["Designation"].ToString();
                    DataSet dt = empbuss.GetAllEmployeesWithId(Session["EmpCode"].ToString());
                    string ImagePath = dt.Tables[0].Rows[0]["ImagePath"].ToString();
                    Image1.ImageUrl = ImagePath;

                    switch (Session["RoleId"].ToString())
                    {
                        case "1":
                            lisetting.Visible = true;
                            li2.Visible = true;
                            liprofile.Visible = false;
                            liemp.Visible = true;
                            lirole.Visible = true;
                            li1.Visible = true;
                            liannounce.Visible = true;
                            lium.Visible = true;
                            liannouncement.Visible = true;
                            liImpNotification.Visible = true;
                            licorp.Visible = true;
                            liinbox.Visible = true;
                            limsg.Visible = true;
                            liaccess.Visible = true;
                            linew.Visible = true;
                            lirules.Visible = true;
                            licontact.Visible = true;
                            liAccessPolicy.Visible = true;

                            break;

                        case "2":
                            lisetting.Visible = true;
                            li2.Visible = true;
                            liprofile.Visible = false;
                            liemp.Visible = true;
                            lirole.Visible = true;
                            li1.Visible = true;
                            liannounce.Visible = true;
                            lium.Visible = true;
                            liannouncement.Visible = true;
                            liImpNotification.Visible = true;
                            licorp.Visible = true;
                            liinbox.Visible = true;
                            limsg.Visible = true;
                            liaccess.Visible = true;
                            linew.Visible = true;
                            lirules.Visible = true;
                            licontact.Visible = true;
                            liAccessPolicy.Visible = true;
                            break;

                        case "3":
                            lisetting.Visible = true;
                            li2.Visible = true;
                            liprofile.Visible = false;
                            liemp.Visible = true;
                            lirole.Visible = true;
                            li1.Visible = true;
                            liannounce.Visible = true;
                            lium.Visible = true;
                            liannouncement.Visible = true;
                            liImpNotification.Visible = true;
                            licorp.Visible = true;
                            liinbox.Visible = true;
                            limsg.Visible = true;
                            liaccess.Visible = true;
                            linew.Visible = true;
                            lirules.Visible = true;
                            licontact.Visible = true;
                            liAccessPolicy.Visible = true;
                            break;

                        case "4":
                            lisetting.Visible = true;
                            liprofile.Visible = false;
                            li2.Visible = true;
                            liemp.Visible = true;
                            lirole.Visible = true;
                            li1.Visible = true;
                            liannounce.Visible = true;
                            lium.Visible = true;
                            liannouncement.Visible = true;
                            liImpNotification.Visible = true;
                            licorp.Visible = false;
                            liinbox.Visible = false;
                            limsg.Visible = false;
                            liaccess.Visible = false;
                            linew.Visible = false;
                            lirules.Visible = false;
                            licontact.Visible = false;
                            liAccessPolicy.Visible = true;
                            break;

                        case "5":
                            lisetting.Visible = false;
                            li2.Visible = true;
                            liprofile.Visible = false;
                            liemp.Visible = false;
                            lirole.Visible = false;
                            li1.Visible = false;
                            liannounce.Visible = false;
                            lium.Visible = false;
                            liannouncement.Visible = true;
                            liImpNotification.Visible = true;
                            licorp.Visible = false;
                            liinbox.Visible = false;
                            limsg.Visible = false;
                            liaccess.Visible = false;
                            linew.Visible = false;
                            lirules.Visible = false;
                            licontact.Visible = false;
                            liAccessPolicy.Visible = false;
                            break;

                        default:
                            // reportsNav.Visible = false;
                            // settingsNav.Visible = false;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/Pages/Login.aspx");
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}