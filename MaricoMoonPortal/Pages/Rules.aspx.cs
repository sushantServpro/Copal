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
using AppLayer;

namespace MySpace.Pages
{
    public partial class Rules : System.Web.UI.Page
    {
        BussRules busrule = new BussRules();
        DataSet dt = new DataSet();

        BussCompanyRules bussCompRule = new BussCompanyRules();
        AppCompanyRules appCompRule = new AppCompanyRules();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRSSRulesGrid();
                BindCompanyRules();
            }
        }

        public void BindRSSRulesGrid()
        {
            DataSet ds = busrule.GetAllRulesList();
            if (ds.Tables.Count > 0)
            {
                RulesRepeater.DataSource = ds;
                RulesRepeater.DataBind();
            }
        }

        public void BindCompanyRules()
        {
            DataSet dsCompRules = bussCompRule.getCompanyRules("");
            if (dsCompRules.Tables.Count > 0)
            {
                RepeaterCompanyRules.DataSource = dsCompRules;
                RepeaterCompanyRules.DataBind();
            }
        }

        protected void RulesRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        protected void RulesChannelRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        public void removeActiveClass()
        {
            RSSRulesTab.Attributes.Add("class", RSSRulesTab.Attributes["class"].ToString().Replace("active", ""));
            CompanyRulesTab.Attributes.Add("class", CompanyRulesTab.Attributes["class"].ToString().Replace("active", ""));
        }

        protected void ancRulesList_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            RSSRulesTab.Attributes.Add("class", RSSRulesTab.Attributes["class"].ToString() + " active");
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

        protected void ancliCompRuleTab_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            CompanyRulesTab.Attributes.Add("class", CompanyRulesTab.Attributes["class"].ToString() + " active");
        }

        protected void ancliRSSRuleTab_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            RSSRulesTab.Attributes.Add("class", RSSRulesTab.Attributes["class"].ToString() + " active");
        }

        protected void ancliCompanyRules_ServerClick(object sender, EventArgs e)
        {
            pnlCompanyRulesPopup.Visible = true;
            string strCompRuleId = ((HtmlAnchor)sender).HRef;
            appCompRule = new AppCompanyRules();
            
            DataSet dsSelectedEvent = bussCompRule.getCompanyRules(strCompRuleId);

            //imgSelectedEvent.Src = dsSelectedEvent.Tables[0].Rows[0]["ImagePath"].ToString();
            lblMPEHeading.Text = dsSelectedEvent.Tables[0].Rows[0]["Heading"].ToString();
            //lblMPECreatedDatetime.InnerText = dsSelectedEvent.Tables[0].Rows[0]["EventDate"].ToString();
            pMPEDesc.InnerText = dsSelectedEvent.Tables[0].Rows[0]["Description"].ToString();
            MPECompanyRules.Show();
        }
    }
}