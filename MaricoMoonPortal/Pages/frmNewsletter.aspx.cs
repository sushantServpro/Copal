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
    public partial class frmNewsletter : System.Web.UI.Page
    {
        AppNewsletter appnews = new AppNewsletter();
        BussNews bussnews = new BussNews();
        DataWall datanews = new DataWall();
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
            DataSet dt = bussnews.GetAllNewsDetails("");
            if (dt.Tables.Count > 0)
            {
                gvnews.DataSource = dt;
                gvnews.DataBind();
            }
        }


        protected void btnsearch_Click(object sender, EventArgs e)
        {
            DataSet ds = bussnews.GetSearchNewsLetter(txtsearch.Text);
            if (ds.Tables.Count > 0)
            {
                gvnews.DataSource = ds;
                gvnews.DataBind();
            }
        }

        protected void btnaddnews_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void gvnews_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvnews_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvnews.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox txteditName = gvnews.Rows[e.RowIndex].FindControl("txtHeaderName") as TextBox;
            TextBox txteditDescription = gvnews.Rows[e.RowIndex].FindControl("txtHeaderDescription") as TextBox;
            TextBox txtEditFrom = gvnews.Rows[e.RowIndex].FindControl("txtEditFrom") as TextBox;

            //Updating records
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            int ds = bussnews.UpdateNewsInfo(id.Text, txteditName.Text, txteditDescription.Text, createddt, txtEditFrom.Text);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvnews.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvnews_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvnews_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvnews.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvnews_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvnews.EditIndex = -1;
            BindGrid();
        }

        protected void gvnews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvnews.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            string msg = bussnews.InsertNewsInfo(txtnewshd.Value, txtnewsdescp.Value, txtMPEFrom.Value);
            if (msg == "success")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", "alert(' New Details Save Successfully');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", "alert(' Error');", true);
            }
            BindGrid();
        }
    }
}