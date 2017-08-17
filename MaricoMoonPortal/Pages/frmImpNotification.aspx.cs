using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppLayer;
using BussLayer;
using DataLayer;
using System.IO;

namespace MySpace.Pages
{
    public partial class frmImpNotification : System.Web.UI.Page
    {
        AppImp appimp = new AppImp();
        BussImp bussimp = new BussImp();
        DataImp dataimp = new DataImp();
        string strDefaultImagePath = System.Configuration.ConfigurationManager.AppSettings["ImpNotificationImagePath"];
        string strDefaultImageName = System.Configuration.ConfigurationManager.AppSettings["ImpNotificationDefaultImage"];
        string strDefaultProjectPath = System.Configuration.ConfigurationManager.AppSettings["DefaultProjectPath"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            // pnlgrid.Visible = true;
            DataSet dt = bussimp.GetAllImpNotifications("");
            gvimpnotification.DataSource = dt;
            gvimpnotification.DataBind();
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

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
                int s = dataimp.UpdateImpNotificationFlag(lblID.Text, flag);
            }
            else if (chkflag.Checked == true)
            {
                flag = 1;
                int s = dataimp.UpdateImpNotificationFlag(lblID.Text, flag);
            }
        }

        protected void gvimpnotification_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkflag = (CheckBox)e.Row.FindControl("chkflag");
                chkflag.Checked = true;
                if (chkflag.Checked == false)
                {
                    e.Row.Enabled = false;
                }
                else
                {
                    e.Row.Enabled = true;
                }
            }
        }

        protected void gvimpnotification_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvimpnotification.Rows[e.RowIndex].FindControl("lblID") as Label;
            //DropDownList ddrole = (DropDownList)gvUserMaster.Rows[e.RowIndex].FindControl("ddlrole") as DropDownList;
            TextBox txtheading = gvimpnotification.Rows[e.RowIndex].FindControl("txtheading") as TextBox;
            TextBox txtdescp = gvimpnotification.Rows[e.RowIndex].FindControl("txtdescp") as TextBox;
            FileUpload FileUpload1 = (FileUpload)gvimpnotification.Rows[e.RowIndex].FindControl("FileUpload1");

            string filename = "";
            string strImagePath = "";
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;

                if (string.IsNullOrEmpty(filename))
                    filename = strDefaultImageName;

                strDefaultImagePath += FileUpload1.FileName;

                //save image in folder    
                FileUpload1.SaveAs(MapPath(".." + strDefaultImagePath));
                strImagePath = strDefaultProjectPath + strDefaultImagePath;
            }
            else
            {
                // use previous user image if new image is not changed    
                Image img = (Image)gvimpnotification.Rows[e.RowIndex].FindControl("img_user");
                strImagePath = img.ImageUrl;
            }
            //Updating records
            int ds = bussimp.UpdateNotificationDetails(id.Text, txtheading.Text, txtdescp.Text, strImagePath, filename);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvimpnotification.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvimpnotification_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvimpnotification_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvimpnotification.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvimpnotification_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvimpnotification.EditIndex = -1;
            BindGrid();
        }

        protected void gvimpnotification_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string filename = "";
            string strImagePath="";
            try
            {
                if (ImageUpload.HasFile)
                {
                    filename = Path.GetFileName(ImageUpload.FileName);

                    if (string.IsNullOrEmpty(filename))
                        filename = strDefaultImageName;

                    ImageUpload.SaveAs(Server.MapPath(".." + strDefaultImagePath) + filename);
                    //filepath = Server.MapPath("~/assets/announcements/") + filename;   //File Path
                    //filepath = System.Configuration.ConfigurationManager.AppSettings["AnnouncementImagePath"];

                    strDefaultImagePath += filename;
                    StatusLabel.Text = "Upload status: File uploaded!";
                    strImagePath = strDefaultProjectPath + strDefaultImagePath;
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
            int s = bussimp.InsertImpNotification(txtheading.Text, txtdescp.Text, strImagePath, filename);
            BindGrid();
            clear();
        }

        public void clear()
        {
            txtdescp.Text = "";
            txtheading.Text = "";
        }
    }
}