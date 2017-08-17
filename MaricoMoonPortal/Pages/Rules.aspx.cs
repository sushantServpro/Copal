using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussLayer;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Xml;

namespace MySpace.Pages
{
    public partial class Rules : System.Web.UI.Page
    {
        BussRules busrule = new BussRules();
        DataSet dt = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = busrule.GetAllRulesList();
            RulesRepeater.DataSource = ds;
            RulesRepeater.DataBind();
        }

        protected void RulesRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        protected void RulesChannelRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void ancRulesList_ServerClick(object sender, EventArgs e)
        {
            string strRuleID = ((HtmlAnchor)sender).HRef;
            DataSet ds = busrule.GetRulesItem(strRuleID);
            RulesChannelRepeater.DataSource = ds;
            RulesChannelRepeater.DataBind();
            RulesItemRepeater.Visible = false;
        }

        protected void lblheading_Click(object sender, EventArgs e)
        {
            RulesItemRepeater.Visible = true;
            string strRuleItemURL = ((HtmlAnchor)sender).HRef;

            var req = (HttpWebRequest)WebRequest.Create(strRuleItemURL);
            var res = (HttpWebResponse)req.GetResponse();
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(res.GetResponseStream());

            dt = new DataSet();
            dt.ReadXml(new XmlNodeReader(xmlDoc));

            RulesItemRepeater.DataSource = dt.Tables[2];
            RulesItemRepeater.DataBind();
        }

        protected void a1_Click(object sender, EventArgs e)
        {
            var a = ((LinkButton)sender).CommandArgument;
            //spnItemDetails.InnerHtml = a;
            //pnlItemDetailsPopup.Style.Add("display", "block");
            Page.ClientScript.RegisterStartupScript(
   this.GetType(), "OpenWindow", "window.open('" + a + "','_newtab');", true);
        }
    }
}