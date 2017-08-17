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

namespace MySpace.Pages
{
    public partial class frmCompanyRule : System.Web.UI.Page
    {
        AppCompanyRules appCompRule = new AppCompanyRules();
        BussCompanyRules bussCompRule = new BussCompanyRules();
        DataCompRules dCompRule = new DataCompRules();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            DataSet dsCompRules = bussCompRule.getCompanyRules("");
            if (dsCompRules.Tables.Count > 0)
            {
                gvCompRuleMaster.DataSource = dsCompRules;
                gvCompRuleMaster.DataBind();
            }
        }

        protected void gvCompRuleMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvCompRuleMaster.Rows[e.RowIndex].FindControl("lblID") as Label;
            TextBox txtHeading = gvCompRuleMaster.Rows[e.RowIndex].FindControl("txtEditCompRuleHeading") as TextBox;
            TextBox txtCompRuledescp = gvCompRuleMaster.Rows[e.RowIndex].FindControl("txtEditCompRuleDescp") as TextBox;
            CheckBox chbFlag = gvCompRuleMaster.Rows[e.RowIndex].FindControl("chbEditFlag") as CheckBox;

            appCompRule = new AppCompanyRules();
            appCompRule.CompRuleId = id.Text;
            appCompRule.Heading = txtHeading.Text;
            appCompRule.Description = txtCompRuledescp.Text;
            appCompRule.Flag = chbFlag.Checked.ToString();

            //Updating records
            int ds = bussCompRule.updateCompanyRules(appCompRule);

            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCompRuleMaster.EditIndex = -1;

            //Call ShowData method for displaying updated data  
            BindGrid();
        }

        protected void gvCompRuleMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCompRuleMaster.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvCompRuleMaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCompRuleMaster.EditIndex = -1;
            BindGrid();
        }

        protected void gvCompRuleMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvCompRuleMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompRuleMaster.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnAddNewCompRule_Click(object sender, EventArgs e)
        {
            string createddt = DateTime.Now.ToString("yyyy-MM-dd");
            appCompRule = new AppCompanyRules();
            appCompRule.Heading = txtCompRuleHeading.Text;
            appCompRule.Description = txtCompRuleDesc.Text;
            int s = bussCompRule.insertCompanyRules(appCompRule);
            BindGrid();
            clear();
        }

        public void clear()
        {
            txtCompRuleHeading.Text = "";
            txtCompRuleDesc.Text = "";
            //txtroletype.Text = "";
        }
        protected void lbtnedit_Click(object sender, EventArgs e)
        {

        }

        protected void gvCompRuleMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}