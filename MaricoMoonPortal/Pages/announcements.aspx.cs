using BussLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MySpace.Pages
{
    public partial class announcements : System.Web.UI.Page
    {
        BussAnnouncement bussann = new BussAnnouncement();
        //string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dt = bussann.GetAllAnnouncements("");
            //foreach (DataTable table in dt.Tables)
            //{
            //    foreach (DataRow row in table.Rows)
            //    {
            //        foreach (DataColumn column in table.Columns)
            //        {
            AnnouncementRepeater.DataSource = dt;
            AnnouncementRepeater.DataBind();
            //        }
            //    }
            //}
        }


        protected void a_ServerClick(object sender, EventArgs e)
        {
            string strAnnouncementID = ((HtmlAnchor)sender).HRef;

            DataSet dt = bussann.GetAllAnnouncements(strAnnouncementID);
            string strheading = dt.Tables[0].Rows[0]["Heading"].ToString();
            string strdescp = dt.Tables[0].Rows[0]["Description"].ToString();
            string strImagePath = dt.Tables[0].Rows[0]["ImagePath"].ToString();
            string strimageName = dt.Tables[0].Rows[0]["ImageName"].ToString();
            string strCreatedDatime = dt.Tables[0].Rows[0]["CreatedDate"].ToString();
            string strFrom = dt.Tables[0].Rows[0]["From"].ToString();
            DateTime createdDateTime = Convert.ToDateTime(strCreatedDatime);

            lblhd.Text = strheading;
            lbldescp.Text = strdescp;
            //spnCreatedDate.InnerText = createdDateTime.ToString("MMM dd, yyyy HH:mm tt");
            imgSelectedAnnouncementDetails.Src = strImagePath;
            lblselectedFrom.Text = strFrom;

            if (createdDateTime.Date == DateTime.Now.Date)
                spnCreatedDate.InnerText = createdDateTime.ToString("HH:mm tt");
            else if (createdDateTime.Date < DateTime.Now.Date)
                spnCreatedDate.InnerText = createdDateTime.ToString("MMMM dd, yyyy");

        }

        //protected void AnnouncementRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Label lblid = (Label)e.Item.FindControl("lblid");
        //        HiddenField HDId = (HiddenField)e.Item.FindControl("HDId");
        //        //lblid.ID = (e.Item.FindControl("HDId") as HiddenField).Value;
        //        id = HDId.Value;
        //    }
        //}
    }
}