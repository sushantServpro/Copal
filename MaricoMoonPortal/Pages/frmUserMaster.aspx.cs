using AppLayer;
using BussLayer;
using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MySpace.Pages
{
    public partial class frmUserMaster : System.Web.UI.Page
    {
        BussUserMaster bussuser = new BussUserMaster();
        AppUserMaster appuser = new AppUserMaster();
        BussRole brole = new BussRole();
        AppRole approle = new AppRole();
        EmpApp empapp = new EmpApp();
        EmpBuss empbuss = new EmpBuss();
        EmpData empdata = new EmpData();
        Helper HelpObj = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnlgrid.Visible = false;
                BindRole();
                BindGrid();
                BindEmpCode();
                // BindUsersDetails();
            }
        }

        public void BindGrid()
        {
            pnlgrid.Visible = true;
            DataSet dt = bussuser.GetUserInfo(appuser);
            gvUserMaster.DataSource = dt;
            gvUserMaster.DataBind();
        }

        public void BindRole()
        {
            DataSet dt = brole.GetUserRole(approle);
            drprole.Items.Clear();
            drprole.DataSource = dt;
            drprole.DataTextField = "Role";
            drprole.DataValueField = "Id";
            drprole.DataBind();
        }

        public void BindEmpCode()
        {
            DataSet dt = empbuss.GetEmpCode(empapp);
            ddlempcode.Items.Clear();
            ddlempcode.DataSource = dt;
            ddlempcode.DataTextField = "EmpCode";
            ddlempcode.DataValueField = "Id";
            ddlempcode.DataBind();
        }

        protected void gvUserMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvUserMaster.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlrole = (DropDownList)e.Row.FindControl("ddlrole");
                DataSet dt = brole.GetUserRole(approle);
                ddlrole.Items.Clear();
                ddlrole.DataSource = dt;
                ddlrole.DataTextField = "Role";
                ddlrole.DataValueField = "Id";
                ddlrole.DataBind();
                string _role = (e.Row.FindControl("lblRoleId") as Label).Text;
                //Commented by Ali
                //ddlrole.SelectedValue = _role;
                HelpObj.SetDropDownText(ddlrole, _role, "", "");

                //DropDownList ddlempcode = (DropDownList)e.Row.FindControl("ddlempcode");
                //DataSet dt1 = empbuss.GetEmpCode(empapp);
                //ddlempcode.Items.Clear();
                //ddlempcode.DataSource = dt1;
                //ddlempcode.DataTextField = "EmpCode";
                //ddlempcode.DataValueField = "Id";
                //ddlempcode.DataBind();
                //string _empcd = (e.Row.FindControl("lblempcd") as Label).Text;
                //ddlempcode.SelectedValue = _empcd;
            }
        }

        protected void gvUserMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvUserMaster.Rows[e.RowIndex].FindControl("lblID") as Label;
            DropDownList ddrole = (DropDownList)gvUserMaster.Rows[e.RowIndex].FindControl("ddlrole") as DropDownList;
            TextBox txtusername = gvUserMaster.Rows[e.RowIndex].FindControl("txtusername") as TextBox;
            TextBox txtpassword = gvUserMaster.Rows[e.RowIndex].FindControl("txtpassword") as TextBox;
            //commented and added by ali
            Label lblempcode = gvUserMaster.Rows[e.RowIndex].FindControl("lblempcode") as Label;
            //TextBox txtempcode = gvUserMaster.Rows[e.RowIndex].FindControl("txtempcode") as TextBox;
            DropDownList ddempcode = gvUserMaster.Rows[e.RowIndex].FindControl("ddlempcode") as DropDownList;
            TextBox txtsecqt = gvUserMaster.Rows[e.RowIndex].FindControl("txtsecqt") as TextBox;
            TextBox txtsecans = gvUserMaster.Rows[e.RowIndex].FindControl("txtsecans") as TextBox;


            //commented and added by ali
            //Updating records
            //int ds = bussuser.UpdateUserInfo(id.Text, txtusername.Text, txtpassword.Text, txtempcode.Text, txtsecqt.Text, txtsecans.Text, ddrole.SelectedValue);
            int ds = bussuser.UpdateUserInfo(id.Text, txtusername.Text, txtpassword.Text, lblempcode.Text, txtsecqt.Text, txtsecans.Text, ddrole.SelectedValue);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvUserMaster.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvUserMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvUserMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUserMaster.EditIndex = e.NewEditIndex;

            //added by ali
            if (string.IsNullOrEmpty(txtsearch.Value))
                BindGrid();
            else
                BindUsersDetails();
        }

        protected void gvUserMaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUserMaster.EditIndex = -1;
            BindGrid();
        }

        protected void gvUserMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserMaster.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            BindUsersDetails();
        }


        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string strEmpCode = ddlempcode.SelectedItem.Text;
            string result = "";

            if (!isEmpCodeAlreadyPresent(strEmpCode))
            {
                result = bussuser.InsertUserInfo(txtuname.Value, inputPassword3.Value, ddlempcode.SelectedItem.Text, createddt, "", txtsecurityque.Value, txtsecurityans.Value, drprole.SelectedValue);
                ScriptManager.RegisterStartupScript(pnlPopup, pnlPopup.GetType(), "", "alert('" + result + "');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(pnlPopup, pnlPopup.GetType(), "", "alert('User Already created for selected Employee.');", true);
            }

            BindGrid();
        }

        public bool isEmpCodeAlreadyPresent(string strEmpCode)
        {
            bool isPresent = false;
            try
            {
                DataSet dt = bussuser.GetUserInfo(appuser);
                isPresent = (from x in dt.Tables[0].AsEnumerable() where x.Field<string>("EmployeeCode") == strEmpCode select x).Any();
            }
            catch (Exception ex)
            {
                throw;
            }
            return isPresent;
        }

        private void BindUsersDetails()
        {
            DataSet dtUserDetails = new DataSet();
            dtUserDetails = bussuser.SearchUserDetails(txtsearch.Value);
            gvUserMaster.DataSource = dtUserDetails;
            gvUserMaster.DataBind();

        }

        protected void btnaddnewuser_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

    }
}