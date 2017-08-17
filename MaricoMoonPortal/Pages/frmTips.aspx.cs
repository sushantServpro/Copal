using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppLayer;
using DataLayer;
using BussLayer;
using System.Data;

namespace MySpace.Pages
{
    public partial class frmTips : System.Web.UI.Page
    {
        AppCompanyTips appCompTips = new AppCompanyTips();
        BussCompanyTips bussCompTips = new BussCompanyTips();
        DataCompanyTips dCompTips = new DataCompanyTips();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            DataSet dsCompTips = bussCompTips.getCompanyTips("");
            if (dsCompTips.Tables.Count > 0)
            {
                gvCompTipMaster.DataSource = dsCompTips;
                gvCompTipMaster.DataBind();
            }
        }

        protected void gvCompTipMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvCompTipMaster.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox txtHeading = gvCompTipMaster.Rows[e.RowIndex].FindControl("txtEditHeading") as TextBox;
            TextBox txtTipsdescp = gvCompTipMaster.Rows[e.RowIndex].FindControl("txtEditTipsdescp") as TextBox;

            appCompTips = new AppCompanyTips();
            appCompTips.Id = id.Text;
            appCompTips.Heading = txtHeading.Text;
            appCompTips.Description = txtTipsdescp.Text;

            //Updating records
            int ds = bussCompTips.updateCompanyTips(appCompTips);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCompTipMaster.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvCompTipMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCompTipMaster.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvCompTipMaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCompTipMaster.EditIndex = -1;
            BindGrid();
        }

        protected void gvCompTipMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvCompTipMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompTipMaster.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnAddNewCompTip_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            appCompTips = new AppCompanyTips();
            appCompTips.Heading = txtHeading.Text;
            appCompTips.Description = txtTipDesc.Text;
            int s = bussCompTips.insertCompanyTips(appCompTips);
            BindGrid();
            clear();
        }

        public void clear()
        {
            txtHeading.Text = "";
            txtTipDesc.Text = "";
            //txtroletype.Text = "";
        }
        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void gvCompTipMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}