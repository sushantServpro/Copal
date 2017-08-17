using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussLayer;
using AppLayer;
using System.IO;


namespace MySpace.Pages
{
    public partial class frmCorporateEvents : System.Web.UI.Page
    {
        BussCorporateEvent bussEvent = new BussCorporateEvent();
        AppCorporateEvent appEvent = new AppCorporateEvent();

        string strDefaultImagePath = System.Configuration.ConfigurationManager.AppSettings["CorporateSpace_EventImagePath"];
        string strDefaultProjectPath = System.Configuration.ConfigurationManager.AppSettings["DefaultProjectPath"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid("");
            }
        }

        public void BindGrid(string Id)
        {
            pnlgrid.Visible = true;
            appEvent.Id = Id;
            DataSet dt = bussEvent.GetAllCorporateEvent(appEvent);
            gvCorporateEvent.DataSource = dt;
            gvCorporateEvent.DataBind();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            BindCorporateEvents();
        }

        private void BindCorporateEvents()
        {
            DataSet dtUserDetails = new DataSet();
            dtUserDetails = bussEvent.SearchCorporateEvent(txtsearch.Value);
            gvCorporateEvent.DataSource = dtUserDetails;
            gvCorporateEvent.DataBind();
        }

        protected void btnNewCorporateEventMaster_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string fileName = "";
            string strImagePath = "";
            //Save File in Folder
            //if (ImageUpload.PostedFile.ContentLength < 102400 && ImageUpload.HasFile)
            if (ImageUpload.HasFile)
            {
                fileName = Path.GetFileName(ImageUpload.PostedFile.FileName);//FileName
                ImageUpload.PostedFile.SaveAs(Server.MapPath(".." + strDefaultImagePath) + fileName);
                strDefaultImagePath += fileName;
                //string filepath = Server.MapPath("~/CorporateEventImages/") + fileName;   //File Path
                strImagePath = strDefaultProjectPath + strDefaultImagePath;
            }
            else
            {
                StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                //return;
            }

            //int s = bussEvent.InsertCorporateEvent(fileName, filepath, txtHeaderName.Value, txtHeaderDescription.Value, txtLocation.Value, txtTimings.Value);
            int s = bussEvent.InsertCorporateEvent(fileName, strImagePath, txtHeaderName.Value, txtHeaderDescription.Value, txtLocation.Value, txtTimings.Value);

            BindGrid("");
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

            //ModalPopupExtender1.Show();
        }

        protected void gvCorporateEvent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCorporateEvent.EditIndex = e.NewEditIndex;
            BindGrid("");
        }

        protected void gvCorporateEvent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCorporateEvent.EditIndex = -1;
            BindGrid("");
        }

        protected void gvCorporateEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCorporateEvent.PageIndex = e.NewPageIndex;
            BindGrid("");
        }

        protected void gvCorporateEvent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvCorporateEvent.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox txtHeaderName = gvCorporateEvent.Rows[e.RowIndex].FindControl("txtHeaderName") as TextBox;
            TextBox txtHeaderDescription = gvCorporateEvent.Rows[e.RowIndex].FindControl("txtHeaderDescription") as TextBox;
            TextBox txtLocation = gvCorporateEvent.Rows[e.RowIndex].FindControl("txtLocation") as TextBox;
            TextBox txtTimings = gvCorporateEvent.Rows[e.RowIndex].FindControl("txtTimings") as TextBox;
            FileUpload FileUpload1 = (FileUpload)gvCorporateEvent.Rows[e.RowIndex].FindControl("FileUpload1");

            string filename = "";
            string strImagePath = "";
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;
                strDefaultImagePath += FileUpload1.FileName;
                //save image in folder    
                FileUpload1.SaveAs(MapPath(".." + strDefaultImagePath));
                strImagePath = strDefaultProjectPath + strDefaultImagePath;
            }
            else
            {
                // use previous user image if new image is not changed    
                Image img = (Image)gvCorporateEvent.Rows[e.RowIndex].FindControl("img_user");
                strImagePath = img.ImageUrl;
            }

            int intEventUpateStatus = bussEvent.UpdateCorporateEvent(id.Text, filename, strImagePath, txtHeaderName.Text, txtHeaderDescription.Text, txtLocation.Text, txtTimings.Text);

            gvCorporateEvent.EditIndex = -1;
            BindGrid("");

        }
    }
}