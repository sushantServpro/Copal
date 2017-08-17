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
using System.IO;

namespace MySpace.Pages
{
    public partial class frmAnnouncementsMaster : System.Web.UI.Page
    {
        AppAddAnnouncement appann = new AppAddAnnouncement();
        BussAnnouncement bussann = new BussAnnouncement();
        DataAnnouncement dann = new DataAnnouncement();
        string filepath = System.Configuration.ConfigurationManager.AppSettings["AnnouncementImagePath"];
        string strDefaultProjectPath = System.Configuration.ConfigurationManager.AppSettings["DefaultProjectPath"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void btnaddnewuser_Click(object sender, EventArgs e)
        {

        }

        protected void gvAnnounceMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkflag = (CheckBox)e.Row.FindControl("chkflag");
                chkflag.Checked = true;
                if (chkflag.Checked == false)
                {
                    // chkflag.Checked = false;
                    e.Row.Enabled = false;
                }
                else
                {
                    // chkflag.Checked = true;
                    e.Row.Enabled = true;
                }
            }
        }

        protected void gvAnnounceMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvAnnounceMaster.Rows[e.RowIndex].FindControl("lblID") as Label;
            //DropDownList ddrole = (DropDownList)gvUserMaster.Rows[e.RowIndex].FindControl("ddlrole") as DropDownList;
            TextBox txtheading = gvAnnounceMaster.Rows[e.RowIndex].FindControl("txtheading") as TextBox;
            TextBox txtdescp = gvAnnounceMaster.Rows[e.RowIndex].FindControl("txtdescp") as TextBox;
            FileUpload FileUpload1 = (FileUpload)gvAnnounceMaster.Rows[e.RowIndex].FindControl("FileUpload1");
            TextBox txtEditFrom = gvAnnounceMaster.Rows[e.RowIndex].FindControl("txtEditFrom") as TextBox;

            string filename = "";
            string strImagePath = "";
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;
                filepath += FileUpload1.FileName;
                //save image in folder    
                FileUpload1.SaveAs(MapPath(".." + filepath));
                strImagePath = strDefaultProjectPath + filepath;
            }
            else
            {
                // use previous user image if new image is not changed    
                Image img = (Image)gvAnnounceMaster.Rows[e.RowIndex].FindControl("img_user");
                strImagePath = img.ImageUrl;
            }

            //Updating records
            int ds = bussann.UpdateAnnouncementDetails(id.Text, txtheading.Text, txtdescp.Text, strImagePath, filename, txtEditFrom.Text);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvAnnounceMaster.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvAnnounceMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvAnnounceMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAnnounceMaster.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvAnnounceMaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAnnounceMaster.EditIndex = -1;
            BindGrid();
        }

        protected void gvAnnounceMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAnnounceMaster.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        public void BindGrid()
        {
            // pnlgrid.Visible = true;
            DataSet dt = bussann.GetAllAnnouncements("");
            gvAnnounceMaster.DataSource = dt;
            gvAnnounceMaster.DataBind();
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string filename = "";
            string strImagePath = "";
            try
            {
                if (ImageUpload.HasFile)
                {
                    filename = Path.GetFileName(ImageUpload.FileName);
                    ImageUpload.SaveAs(Server.MapPath(".." + filepath) + filename);
                    //filepath = Server.MapPath("~/assets/announcements/") + filename;   //File Path
                    //filepath = System.Configuration.ConfigurationManager.AppSettings["AnnouncementImagePath"];
                    filepath += filename;
                    strImagePath = strDefaultProjectPath + filepath;
                    StatusLabel.Text = "Upload status: File uploaded!";
                }
                else
                {
                    StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                    //return;
                }
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
            int s = bussann.InsertAnnouncement(txtheading.Text, txtdescp.Text, strImagePath, filename,txtFrom.Text);
            BindGrid();
            clear();
        }

        public void clear()
        {
            txtdescp.Text = "";
            txtheading.Text = "";
        }

        protected void chkflag_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
            int index = row.RowIndex;
            CheckBox chkflag = (CheckBox)row.FindControl("chkflag");
            Label lblID = (Label)row.FindControl("lblId");
            int flag = 0;
            if (chkflag.Checked == false)
            {
                flag = 0;
                int s = dann.UpdateAnnouncementFlag(lblID.Text, flag);
            }
            else if (chkflag.Checked == true)
            {
                flag = 1;
                int s = dann.UpdateAnnouncementFlag(lblID.Text, flag);
            }
            //CheckBox chkAll = (CheckBox)gvAnnounceMaster.HeaderRow.FindControl("chkflag");
            //if (chkAll.Checked == false)
            //{
            //    foreach (GridViewRow gvRow in gvAnnounceMaster.Rows)
            //    {
            //        CheckBox chkSel = (CheckBox)gvRow.FindControl("chkflag");

            //        chkSel.Checked = false;

            //    }
            //}
        }
    }
}