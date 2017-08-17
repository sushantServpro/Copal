using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BussLayer;
using AppLayer;


namespace MySpace.Pages
{
    public partial class access : System.Web.UI.Page
    {
        BussAccessPolicies bussAccPol = new BussAccessPolicies();
        AppAccessPolicies appAccPol = new AppAccessPolicies();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void removeActiveClass()
        {
            liAccessDrive.Attributes["class"] = "";
            liAccessPolicies.Attributes["class"] = "";
            liAccessSystem.Attributes["class"] = "";
            //liAccessDrive.Attributes.Add("class", liAccessDrive.Attributes["class"].ToString().Replace("active", ""));
            //liAccessPolicies.Attributes.Add("class", liAccessPolicies.Attributes["class"].ToString().Replace("active", ""));
            //liAccessSystem.Attributes.Add("class", liAccessSystem.Attributes["class"].ToString().Replace("active", ""));
        }

        protected void ancliPolicies_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liAccessPolicies.Attributes.Add("class", liAccessPolicies.Attributes["class"] + "active");

            DataSet dsAccessPolicies = bussAccPol.getAccessPolicies();
            if (dsAccessPolicies.Tables.Count > 0)
            {
                RepeaterAccessPolicies.DataSource = dsAccessPolicies;
                RepeaterAccessPolicies.DataBind();
            }
        }

        protected void ancliAccessDrive_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liAccessDrive.Attributes.Add("class", liAccessDrive.Attributes["class"] + "active");
        }

        protected void ancliAccessSystem_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liAccessSystem.Attributes.Add("class", liAccessSystem.Attributes["class"] + "active");
        }
    }
}