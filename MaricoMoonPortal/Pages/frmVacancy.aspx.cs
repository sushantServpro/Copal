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


namespace MySpace.Pages
{
    public partial class frmVacany : System.Web.UI.Page
    {
        BussVacancy bv = new BussVacancy();
        AppVacany av = new AppVacany();
        DataVacancy dv = new DataVacancy();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            pnlgrid.Visible = true;
            DataSet dt = bv.GetVacancyInfo(av);
            gvVacany.DataSource = dt;
            gvVacany.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string s = bv.InsertVacancyInfo(txtjbheading.Value, txtexp.Value, txtloc.Value, txtdept.Value, txtjobdescp.Value, txtcnt.Value, txtlink.Value);
            BindGrid();
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void gvVacany_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvVacany_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvVacany.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox txtheading = gvVacany.Rows[e.RowIndex].FindControl("txtheading") as TextBox;
            TextBox txtExperience = gvVacany.Rows[e.RowIndex].FindControl("txtExperience") as TextBox;
            TextBox txtDepartment = gvVacany.Rows[e.RowIndex].FindControl("txtDepartment") as TextBox;
            TextBox txtlocation = gvVacany.Rows[e.RowIndex].FindControl("txtlocation") as TextBox;
            TextBox txtjobdescp = gvVacany.Rows[e.RowIndex].FindControl("txtjobdescp") as TextBox;
            TextBox txtcontactdetails = gvVacany.Rows[e.RowIndex].FindControl("txtcontactdetails") as TextBox;
            //TextBox txtCreatedDatetime = gvVacany.Rows[e.RowIndex].FindControl("txtCreatedDatetime") as TextBox;
            TextBox txtLink = gvVacany.Rows[e.RowIndex].FindControl("txtlink") as TextBox;

            //commented and added by ali
            //Updating records
            //int ds = bussuser.UpdateUserInfo(id.Text, txtusername.Text, txtpassword.Text, txtempcode.Text, txtsecqt.Text, txtsecans.Text, ddrole.SelectedValue);
            int ds = bv.UpdateVacancyInfo(id.Text, txtheading.Text, txtExperience.Text, txtlocation.Text, txtDepartment.Text, txtjobdescp.Text, txtcontactdetails.Text, txtLink.Text);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvVacany.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvVacany_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvVacany_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvVacany.EditIndex = e.NewEditIndex;

            //added by ali
            if (string.IsNullOrEmpty(txtsearch.Value))
            {
                BindGrid();
            }
            else
            {
                //BindUsersDetails();
            }
        }

        protected void gvVacany_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvVacany.EditIndex = -1;
            BindGrid();
        }

        protected void gvVacany_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVacany.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnaddnewuser_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnedit_Click1(object sender, EventArgs e)
        {

        }
    }
}