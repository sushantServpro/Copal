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
    public partial class contacts : System.Web.UI.Page
    {
        EmpBuss bussEmp = new EmpBuss();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }

        public void BindGrid()
        {
            DataSet dsEmployeeContacts = bussEmp.GetEmployeeContacts();
            gvCompContact.DataSource = dsEmployeeContacts;
            gvCompContact.DataBind();
        }

        protected void gvCompContact_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompContact.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}