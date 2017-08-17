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
    public partial class frmRoleMaster : System.Web.UI.Page
    {
        AppRole appr = new AppRole();
        BussRole bussrole = new BussRole();
        DataRole drole = new DataRole();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            DataSet dt = bussrole.GetUserRole(appr);
            gvRoleMaster.DataSource = dt;
            gvRoleMaster.DataBind();
        }

        //public void BindRole()
        //{
        //    DataSet dt = bussrole.GetUserRole(appr);
        //    ddlroletype.Items.Clear();
        //    ddlroletype.DataSource = dt;
        //    ddlroletype.DataTextField = "Role";
        //    ddlroletype.DataValueField = "Id";
        //    ddlroletype.DataBind();
        //}

        protected void gvRoleMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvRoleMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvRoleMaster.Rows[e.RowIndex].FindControl("lblID") as Label;     
            TextBox txtrole = gvRoleMaster.Rows[e.RowIndex].FindControl("txtrole") as TextBox;
            TextBox txtdescp = gvRoleMaster.Rows[e.RowIndex].FindControl("txtdescp") as TextBox;
            //DropDownList ddlroletype = (DropDownList)gvRoleMaster.Rows[e.RowIndex].FindControl("ddlroletype") as DropDownList;
            TextBox txtroletype = gvRoleMaster.Rows[e.RowIndex].FindControl("txtroletype") as TextBox;

            //Updating records
            int ds = bussrole.UpdateRoleInfo(id.Text, txtrole.Text, txtdescp.Text, txtroletype.Text);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvRoleMaster.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvRoleMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRoleMaster.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvRoleMaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRoleMaster.EditIndex = -1;
            BindGrid();
        }

        protected void gvRoleMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvRoleMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRoleMaster.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnaddnewrole_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            int s = bussrole.InsertRoleInfo(txtrole.Text, txtroled.Text, txtroletype.Text);
            BindGrid();
            clear();
        }

        public void clear()
        {
            txtrole.Text = "";
            txtroled.Text = "";
            //txtroletype.Text = "";
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }
    }
}