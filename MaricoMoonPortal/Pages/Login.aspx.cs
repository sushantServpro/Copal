using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AppLayer;
using BussLayer;


namespace MySpacePortal.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        BussLoginMaster blm = new BussLoginMaster();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            DataSet ds = blm.GetUserInfo(txtUserName.Text, txtPassword.Text);
            //int UserId = Convert.ToInt32(ds.Tables[0].Rows[0]["UserId"]);
            //int LocationId = Convert.ToInt32(ds.Tables[0].Rows[0]["LocationId"]);

            if (ds == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Please enter correct User Name & Password.');", true); return;
            }
            if (ds.Tables.Count > 0)
            {
                Session["LoggedUser"] = ds;

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string UserTypeId = ds.Tables[0].Rows[0]["RoleId"].ToString();
                    string EmpCode = ds.Tables[0].Rows[0]["EmployeeCode"].ToString();
                    Session["RoleId"] = UserTypeId;
                    Session["EmpCode"] = EmpCode;
                    if (UserTypeId == "1")
                    {
                        Session["UserName"] = ds.Tables[0].Rows[0]["UserName"].ToString();
                        Session["Designation"] = ds.Tables[0].Rows[0]["Designation"].ToString();
                        Response.Redirect("Dashboard.aspx", true);
                    }

                    if (UserTypeId == "2")
                    {
                        Session["UserName"] = ds.Tables[0].Rows[0]["UserName"].ToString();
                        Session["Designation"] = ds.Tables[0].Rows[0]["Designation"].ToString();
                        Response.Redirect("Dashboard.aspx", true);
                        //Response.Redirect("frmApplicationStage1.aspx?LeadNo=" + ds.Tables[0].Rows[0]["LeadNo"].ToString() + "", false);
                    }

                    if (UserTypeId == "5")
                    {
                        Session["UserName"] = ds.Tables[0].Rows[0]["UserName"].ToString();
                        Session["Designation"] = ds.Tables[0].Rows[0]["Designation"].ToString();
                        Response.Redirect("Dashboard.aspx", true);
                        //Response.Redirect("frmApplicationStage1.aspx?LeadNo=" + ds.Tables[0].Rows[0]["LeadNo"].ToString() + "", false);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Please enter correct User Name & Password.');", true);
                // txtPassword.Focus();
            }
        }
    }
}