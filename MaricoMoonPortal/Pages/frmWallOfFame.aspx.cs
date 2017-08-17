using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppLayer;
using BussLayer;
using DataLayer;
using System.Data;
using System.Globalization;

namespace MySpace.Pages
{
    public partial class frmWallOfFame : System.Web.UI.Page
    {
        AppWall appwall = new AppWall();
        BussWall busswall = new BussWall();
        DataWall dataeall = new DataWall();
        EmpApp empapp = new EmpApp();
        EmpBuss empbuss = new EmpBuss();
        EmpData empdata = new EmpData();
        Helper HelpObj = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //BindEmpCode();
            if (!IsPostBack)
            {
                BindGrid();
                BindEmpCode();
            }
        }

        public void BindGrid()
        {
            pnlgrid.Visible = true;
            DataSet dt = busswall.GetAllWallDetails(appwall);
            gvWallOfFame.DataSource = dt;
            gvWallOfFame.DataBind();
        }

        public void BindEmpCode()
        {
            DataSet dt = empbuss.GetEmpCode(empapp);
            ddlempcode.Items.Clear();
            ddlempcode.DataSource = dt;
            ddlempcode.DataTextField = "EmpCode";
            ddlempcode.DataValueField = "Id";
            ddlempcode.DataBind();
            ListItem tListItem = default(ListItem);
            tListItem = new ListItem("-- Select Employee Code --", "0");
            ddlempcode.Items.Insert(0, tListItem);
            ddlempcode.SelectedIndex = 0;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            DataSet dtSearchedWallOfFame = busswall.SearchWalloffameInfo(txtsearch.Text);
            gvWallOfFame.DataSource = dtSearchedWallOfFame;
            gvWallOfFame.DataBind();
        }


        public void clear()
        {
            //txtdescp.Text = "";
            //txtheading.Text = "";
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void gvWallOfFame_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvWallOfFame.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlempcode = (DropDownList)e.Row.FindControl("ddlempcode");
                DataSet dt1 = empbuss.GetEmpCode(empapp);
                ddlempcode.Items.Clear();
                ddlempcode.DataSource = dt1;
                ddlempcode.DataTextField = "EmpCode";
                ddlempcode.DataValueField = "Id";
                ddlempcode.DataBind();
                string _empcd = (e.Row.FindControl("lblempcd") as Label).Text;
                //ddlempcode.SelectedValue = _empcd;
                HelpObj.SetDropDownText(ddlempcode, _empcd, "", "");
            }
        }

        protected void gvWallOfFame_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvWallOfFame.Rows[e.RowIndex].FindControl("lblID") as Label;
            DropDownList ddlempcode = (DropDownList)gvWallOfFame.Rows[e.RowIndex].FindControl("ddlempcode") as DropDownList;
            TextBox txteditName = gvWallOfFame.Rows[e.RowIndex].FindControl("txteditName") as TextBox;
            TextBox txteditDescription = gvWallOfFame.Rows[e.RowIndex].FindControl("txteditDescription") as TextBox;
            TextBox txtAchieverMonth = (TextBox)gvWallOfFame.Rows[e.RowIndex].FindControl("txtEditAchieverMonth") as TextBox;

            DateTime dtAchieverMonth = DateTime.ParseExact(txtAchieverMonth.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            //string strAchieverMonth = dtAchieverMonth.ToString("MMM, yyyy");

            //Updating records
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            int ds = busswall.UpdateWalloffameInfo(id.Text, ddlempcode.SelectedItem.Text, txteditName.Text, txteditDescription.Text, createddt, dtAchieverMonth);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvWallOfFame.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvWallOfFame_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvWallOfFame_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvWallOfFame.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvWallOfFame_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvWallOfFame.EditIndex = -1;
            BindGrid();
        }

        protected void gvWallOfFame_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        //protected void btnaddwalloffame_Click(object sender, EventArgs e)
        //{
        //    pnlPopup.Visible = true;
        //    ModalPopupExtender2.Show();
        //}

        protected void btnaddwalloffame_Click1(object sender, EventArgs e)
        {
            //pnlPopup.Visible = true;
            ModalPopupExtender2.Show();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string txtAchieverMonth = dtpAchieverMonth.Value;
            DateTime dtAchieverMonth = DateTime.ParseExact(txtAchieverMonth, "MM/dd/yyyy", CultureInfo.InvariantCulture);

            int s = busswall.InsertWallOfFameInfo(ddlempcode.SelectedItem.Text, txtHeaderName.Value, txtHeaderDescription.Value, createddt, dtAchieverMonth);
            BindGrid();
            ModalPopupExtender2.Hide();
        }

        protected void ddlempcode_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList dp = (DropDownList)sender;
            string strSelectedText = dp.SelectedItem.Text;
            string val = dp.SelectedValue;
            HelpObj.SetDropDownText(ddlempcode, strSelectedText, "", "");
        }

        protected void ddlempcode_TextChanged(object sender, EventArgs e)
        {
            string strSelectedText = ddlempcode.SelectedItem.Text;

            HelpObj.SetDropDownText(ddlempcode, strSelectedText, "", "");
        }


    }
}