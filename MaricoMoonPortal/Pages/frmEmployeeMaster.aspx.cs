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

namespace MySpace
{
    public partial class frmEmployeeMaster : System.Web.UI.Page
    {
        EmpApp empapp = new EmpApp();
        EmpBuss empbuss = new EmpBuss();
        EmpData empdata = new EmpData();
        Helper HelpObj = new Helper();
        string strImagePath = System.Configuration.ConfigurationManager.AppSettings["EmployeeImagePath"];
        string strDefaultProjectPath = System.Configuration.ConfigurationManager.AppSettings["DefaultProjectPath"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
                BindState();
                BindCountry();
                BindCity();
            }
        }

        public void BindGrid()
        {
            pnlgrid.Visible = true;
            DataSet dt = empbuss.GetAllEmployees(empapp);
            if (dt.Tables.Count > 0)
            {
                gvEmpDetails.DataSource = dt;
                gvEmpDetails.DataBind();
            }
        }

        public void BindCity()
        {
            DataSet dt = new DataSet();
            dt = empbuss.FetchCity(ddlstate.SelectedValue);
            ddlcity.DataSource = dt;
            ddlcity.DataTextField = "CityName";
            ddlcity.DataValueField = "CityId";
            ddlcity.DataBind();
            ListItem tListItem = default(ListItem);
            tListItem = new ListItem("-- Select City --", "-- Select City--");
            ddlcity.Items.Insert(0, tListItem);
        }

        public void BindState()
        {
            DataSet dtState = new DataSet();
            dtState = empbuss.FetchState(empapp);
            ddlstate.DataSource = dtState;
            ddlstate.DataTextField = "StateName";
            ddlstate.DataValueField = "StateId";
            ddlstate.DataBind();
        }


        public void BindCountry()
        {
            DataSet dtcountry = new DataSet();
            dtcountry = empbuss.FetchCountry(empapp);
            ddlcountry.DataSource = dtcountry;
            ddlcountry.DataTextField = "CountryName";
            ddlcountry.DataValueField = "CountryId";
            ddlcountry.DataBind();
        }

        protected void lbtnsearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnaddnewemp_Click(object sender, EventArgs e)
        {
            pnlPopup.Style.Add("display", "block");
            //BindState();
            //BindCountry();
            //BindCity(); 
            ModalPopupExtender1.Show();
        }

        protected void gvEmpDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvEmpDetails.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlcntry = (DropDownList)e.Row.FindControl("ddlcntry");
                DataSet dtcountry = new DataSet();
                dtcountry = empbuss.FetchCountry(empapp);
                ddlcntry.Items.Clear();
                ddlcntry.DataSource = dtcountry;
                ddlcntry.DataTextField = "CountryName";
                ddlcntry.DataValueField = "CountryId";
                ddlcntry.DataBind();
                string _cntry = (e.Row.FindControl("lblcntry") as Label).Text;
                //Commented by ali
                //ddlcntry.SelectedValue = _cntry;
                HelpObj.SetDropDownText(ddlcntry, _cntry, "", "");

                DropDownList ddlst = (DropDownList)e.Row.FindControl("ddlst");
                DataSet dtState = new DataSet();
                dtState = empbuss.FetchState(empapp);
                ddlst.Items.Clear();
                ddlst.DataSource = dtState;
                ddlst.DataTextField = "StateName";
                ddlst.DataValueField = "StateId";
                ddlst.DataBind();
                string _state = (e.Row.FindControl("lblst") as Label).Text;
                //Commented by ali
                //ddlst.SelectedValue = _state;
                HelpObj.SetDropDownText(ddlst, _state, "", "");

                DropDownList ddlcty = (DropDownList)e.Row.FindControl("ddlcty");
                DataSet dt = new DataSet();
                //Commented by ali
                //dt = empbuss.FetchCity(ddlstate.SelectedValue);
                dt = empbuss.FetchCity(ddlst.SelectedValue);
                ddlcty.Items.Clear();
                ddlcty.DataSource = dt;
                ddlcty.DataTextField = "CityName";
                ddlcty.DataValueField = "CityId";
                ddlcty.DataBind();
                ListItem tListItem = default(ListItem);
                tListItem = new ListItem("-- Select City --", "-- Select City--");
                ddlcty.Items.Insert(0, tListItem);
                string _city = (e.Row.FindControl("lblcty") as Label).Text;
                //Commented by ali
                //ddlst.SelectedValue = _city;
                HelpObj.SetDropDownText(ddlcty, _city, "", "");

                //Image image = e.Row.FindControl("img_user") as Image;
                //    if (!File.Exists(Server.MapPath(image.ImageUrl)))
                //    {
                //        image.ImageUrl = "~/Images/No_image_available.png";
                //    }                
            }
        }

        protected void gvEmpDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvEmpDetails.Rows[e.RowIndex].FindControl("lblID") as Label;
            //DropDownList ddrole = (DropDownList)gvUserMaster.Rows[e.RowIndex].FindControl("ddlrole") as DropDownList;
            TextBox txtfname = gvEmpDetails.Rows[e.RowIndex].FindControl("txtfname") as TextBox;
            TextBox txtmname = gvEmpDetails.Rows[e.RowIndex].FindControl("txtmname") as TextBox;
            TextBox txtlname = gvEmpDetails.Rows[e.RowIndex].FindControl("txtlastname") as TextBox;
            TextBox txtaddress = gvEmpDetails.Rows[e.RowIndex].FindControl("txtaddress") as TextBox;
            TextBox txtcontactno = gvEmpDetails.Rows[e.RowIndex].FindControl("txtcontactno") as TextBox;
            TextBox txtlandline = gvEmpDetails.Rows[e.RowIndex].FindControl("txtlandlineno") as TextBox;
            TextBox txtWhatsAppno = gvEmpDetails.Rows[e.RowIndex].FindControl("txtwhatsappno") as TextBox;
            TextBox txtemailid = gvEmpDetails.Rows[e.RowIndex].FindControl("txtemailid") as TextBox;
            TextBox txtdept = gvEmpDetails.Rows[e.RowIndex].FindControl("txtDepartment") as TextBox;
            DropDownList ddlcountry = (DropDownList)gvEmpDetails.Rows[e.RowIndex].FindControl("ddlcntry") as DropDownList;
            DropDownList ddlstate = (DropDownList)gvEmpDetails.Rows[e.RowIndex].FindControl("ddlst") as DropDownList;
            DropDownList ddlcity = (DropDownList)gvEmpDetails.Rows[e.RowIndex].FindControl("ddlcty") as DropDownList;
            TextBox txtgmailid = gvEmpDetails.Rows[e.RowIndex].FindControl("txtgmailid") as TextBox;
            TextBox txtskypeid = gvEmpDetails.Rows[e.RowIndex].FindControl("txtSkypeId") as TextBox;
            TextBox txtcmpemailid = gvEmpDetails.Rows[e.RowIndex].FindControl("txtCompanyEmailId") as TextBox;
            TextBox txthobbies = gvEmpDetails.Rows[e.RowIndex].FindControl("txtHobbies") as TextBox;
            TextBox txtqualification = gvEmpDetails.Rows[e.RowIndex].FindControl("txtQualification") as TextBox;
            TextBox txtexperience = gvEmpDetails.Rows[e.RowIndex].FindControl("txtExperience") as TextBox;
            TextBox txtBriefInfo = gvEmpDetails.Rows[e.RowIndex].FindControl("txtBriefInfo") as TextBox;
            TextBox txtAchievements = gvEmpDetails.Rows[e.RowIndex].FindControl("txtAchievements") as TextBox;
            TextBox txtDesignation = gvEmpDetails.Rows[e.RowIndex].FindControl("txtDesignation") as TextBox;
            FileUpload FileUpload1 = (FileUpload)gvEmpDetails.Rows[e.RowIndex].FindControl("FileUpload1");

            //string path = "~/EmployeeImages/";
            string path = strImagePath;
            string filename = "";
            string strEmpImagePath = "";
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;
                path += FileUpload1.FileName;
                //save image in folder    
                FileUpload1.SaveAs(MapPath("~" + path));
                strEmpImagePath = strDefaultProjectPath + path;
            }
            else
            {
                // use previous user image if new image is not changed    
                Image img = (Image)gvEmpDetails.Rows[e.RowIndex].FindControl("img_user");
                strEmpImagePath = img.ImageUrl;
            }

            //Updating records
            //Commented by Ali
            //int ds = empbuss.UpdateEmployeeInfo(id.Text, txtfname.Text, txtmname.Text, txtlname.Text, txtaddress.Text, txtcontactno.Text, txtlandline.Text, txtWhatsAppno.Text, txtemailid.Text, txtdept.Text, ddlcountry.SelectedValue, ddlstate.SelectedValue, ddlcity.SelectedValue, txtgmailid.Text, txtskypeid.Text, txtcmpemailid.Text, txthobbies.Text, txtqualification.Text, txtexperience.Text, txtBriefInfo.Text, txtAchievements.Text, txtDesignation.Text, filename, path);
            int ds = empbuss.UpdateEmployeeInfo(id.Text, txtfname.Text, txtmname.Text, txtlname.Text, txtaddress.Text, txtcontactno.Text, txtlandline.Text, txtWhatsAppno.Text, txtemailid.Text, txtdept.Text, ddlcountry.SelectedItem.Text, ddlstate.SelectedItem.Text, ddlcity.SelectedItem.Text, txtgmailid.Text, txtskypeid.Text, txtcmpemailid.Text, txthobbies.Text, txtqualification.Text, txtexperience.Text, txtBriefInfo.Text, txtAchievements.Text, txtDesignation.Text, filename, strEmpImagePath);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvEmpDetails.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvEmpDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvEmpDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmpDetails.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvEmpDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmpDetails.EditIndex = -1;
            BindGrid();
        }

        protected void gvEmpDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string filename = "";
            string strEmpImagePath = "";
            try
            {
                //if (ImageUpload.PostedFile.ContentLength < 102400 && ImageUpload.HasFile)
                if (ImageUpload.HasFile)
                {
                    filename = Path.GetFileName(ImageUpload.FileName);
                    strImagePath += filename;
                    //ImageUpload.SaveAs(Server.MapPath("~/EmployeeImages/") + filename);
                    ImageUpload.SaveAs(Server.MapPath("~" + strImagePath));
                    //filepath = Server.MapPath("~/EmployeeImages/") + filename;   //File Path
                    StatusLabel.Text = "Upload status: File uploaded!";
                    strEmpImagePath = strDefaultProjectPath + strImagePath;
                }
                else
                    StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
            //Check for Duplicate Employee code
            if (!isEmpCodeAlreadyPresent(txtempcode.Text))
            {
                int s = empbuss.InsertEmpInfo(txtempcode.Text, txtfname.Text, txtmname.Text, txtlname.Text, txtaddress.Text, txtcontactno.Text, txtlandline.Text, txtWhatsAppno.Text, txtemailid.Text, txtdept.Text, ddlcountry.SelectedItem.Text, ddlstate.SelectedItem.Text, ddlcity.SelectedItem.Text, txtgmailid.Text, txtskypeid.Text, txtcmpemailid.Text, txthobbies.Text, datepicker.Value, datepicker1.Value, txtqualification.Text, txtexperience.Text, txtbriefInfo.Text, txtachievements.Text, txtDesignation.Text, filename, strEmpImagePath);
                ScriptManager.RegisterStartupScript(pnlPopup, pnlPopup.GetType(), "", "alert('Employee record created Successfully.')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(pnlPopup, pnlPopup.GetType(), "", "alert('Employee Code already present.')", true);
                ModalPopupExtender1.Show();
            }
            BindGrid();

        }

        /// <summary>
        /// Check for Employee already exists
        /// </summary>
        /// <param name="strEmpCode">New Employee Code</param>
        /// <returns></returns>
        public bool isEmpCodeAlreadyPresent(string strEmpCode)
        {
            bool isPresent = false;
            try
            {
                DataSet dt = empbuss.GetEmpCode(empapp);
                isPresent = (from x in dt.Tables[0].AsEnumerable() where x.Field<string>("EmpCode") == strEmpCode select x).Any();
            }
            catch (Exception ex)
            {
                throw;
            }
            return isPresent;
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlPopup.Style.Add("display", "block");
            BindCity();
            ModalPopupExtender1.Show();
        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlPopup.Style.Add("display", "block");
            BindState();
        }

        protected void ddlcntry_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    string strSelectedCountry = ddlcountry.SelectedItem.Text;
            //    HelpObj.SetDropDownText(ddlcountry, _state, "", "");
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

    }
}