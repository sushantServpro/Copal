using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussLayer;
using System.Data;
using System.Web.UI.HtmlControls;

namespace MySpace.Pages
{
    public partial class imp_notifications : System.Web.UI.Page
    {
        BussImp bimp = new BussImp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet dt = bimp.GetAllImpNotifications("");
                //foreach (DataTable table in dt.Tables)
                //{
                //    foreach (DataRow row in table.Rows)
                //    {
                //        foreach (DataColumn column in table.Columns)
                //        {
                NotificationRepeater.DataSource = dt;
                NotificationRepeater.DataBind();
                //        }
                //    }
                //}
            }
        }

        protected void NotificationRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void a_ServerClick(object sender, EventArgs e)
        {
            string strImpNotificationID = ((HtmlAnchor)sender).HRef;

            DataSet dt = bimp.GetAllImpNotifications(strImpNotificationID);
            string strheading = dt.Tables[0].Rows[0]["Heading"].ToString();
            string strdescp = dt.Tables[0].Rows[0]["Description"].ToString();
            string strImagePath = dt.Tables[0].Rows[0]["ImagePath"].ToString();
            string strimageName = dt.Tables[0].Rows[0]["ImageName"].ToString();
            string strCreatedDatime = dt.Tables[0].Rows[0]["CreatedDate"].ToString();
            string strFrom = dt.Tables[0].Rows[0]["From"].ToString();
            DateTime createdDateTime = Convert.ToDateTime(strCreatedDatime);

            lblSelectedFrom.Text = strFrom;
            lblhd.Text = strheading;
            lbldescp.Text = strdescp;
            //spnCreatedDate.InnerText = createdDateTime.ToString("MMM dd, yyyy HH:mm tt");
            imgSelectedImpNotification.Src = strImagePath;

            if (createdDateTime.Date == DateTime.Now.Date)
                spnCreatedDate.InnerText = createdDateTime.ToString("HH:mm tt");
            else if (createdDateTime.Date < DateTime.Now.Date)
                spnCreatedDate.InnerText = createdDateTime.ToString("MMMM dd, yyyy");
        }
    }
}