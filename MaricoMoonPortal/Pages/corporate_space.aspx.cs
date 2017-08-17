using AppLayer;
using BussLayer;
using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MySpace.Pages
{
    public partial class corporate_space : System.Web.UI.Page
    {
        #region Bussiness and App Layer objects

        AppWall appwall = new AppWall();
        BussWall busswall = new BussWall();
        DataWall dataeall = new DataWall();
        EmpApp empapp = new EmpApp();
        EmpBuss empbuss = new EmpBuss();
        EmpData empdata = new EmpData();

        BussCorporateEvent BusCorpEvent = new BussCorporateEvent();
        AppCorporateEvent AppCorpEvent = new AppCorporateEvent();

        BussNews BusNewLetter = new BussNews();
        AppNewsletter AppNewLetter = new AppNewsletter();

        BussVacancy BusVaccancy = new BussVacancy();
        AppVacany AppVacancy = new AppVacany();

        BussGroupActivityTab busGrpActTab = new BussGroupActivityTab();
        AppGroupActivityTab appGrpActTab = new AppGroupActivityTab();

        BussGroupActivitySubTab busGrpActSubTab = new BussGroupActivitySubTab();
        AppGroupActivitySubTab appGrpActSubTab = new AppGroupActivitySubTab();

        BussCompanyTips bussCompTips = new BussCompanyTips();
        AppCompanyTips appCompTips = new AppCompanyTips();

        BussGoogleTips bussGoogleTips = new BussGoogleTips();

        BussCompanySurvey busCompSurv = new BussCompanySurvey();
        AppCompanySurvey appCompSurv = new AppCompanySurvey();

        BussGoogleSurvey busGoogSurv = new BussGoogleSurvey();

        #endregion

        //default Group Activity Image Path
        string strGrpActImagePath = System.Configuration.ConfigurationManager.AppSettings["CorporateSpace_GrpActImagePath"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getpreviousachievements();
                //lblyear.InnerText = DateTime.Now.Year.ToString();
                getEvents();
                getNewsLetters();
                getVacancies();
                getGroupActivityTabs();
                getCompanyTips();
                getGoogleTips();
                getCompanySurvey();
                getGoogleSurvey();
            }
        }

        /// <summary>
        /// Get Previous Acheivements from database through Business Layer
        /// </summary>
        public void getpreviousachievements()
        {
            DataSet dt = busswall.GetAllWallDetails(appwall);
            if (dt.Tables[0].Rows.Count > 0)
            {
                imgWallOfFameAchiever.Src = dt.Tables[0].Rows[0]["ImagePath"].ToString();
                lblWallOfFameName.Text = dt.Tables[0].Rows[0]["FullName"].ToString();
                lblDesignation.Text = dt.Tables[0].Rows[0]["Designation"].ToString();
                lblAddress.Text = dt.Tables[0].Rows[0]["Address"].ToString();
                lblDepartment.Text = dt.Tables[0].Rows[0]["Department"].ToString();
                lblWallofFameHeader.Text = dt.Tables[0].Rows[0]["Heading"].ToString();

                string strAchieverDatime = dt.Tables[0].Rows[0]["AchieverMonth"].ToString();
                DateTime AchieverDateTime = Convert.ToDateTime(strAchieverDatime);
                lblyearnmonth.Text = AchieverDateTime.ToString("MMM, yyyy");

                pWallofFameDescription.InnerText = dt.Tables[0].Rows[0]["Description"].ToString();
            }
            //repeater1.DataSource = dt;
            //repeater1.DataBind();
        }

        /// <summary>
        /// Get Corporate Events from database through Business Layer
        /// </summary>
        public void getEvents()
        {
            AppCorpEvent.Id = "";
            DataSet dsCorpEvent = BusCorpEvent.GetAllCorporateEvent(AppCorpEvent);
            if (dsCorpEvent.Tables.Count > 0)
            {
                RepeaterEvents.DataSource = dsCorpEvent;
                RepeaterEvents.DataBind();
            }
        }

        /// <summary>
        /// Get News Letter from database through Business Layer
        /// </summary>
        public void getNewsLetters()
        {
            AppNewLetter.Id = "";
            DataSet dsNewsLetterAllRecords = BusNewLetter.GetAllNewsDetails(AppNewLetter.Id);
            if (dsNewsLetterAllRecords.Tables.Count > 0)
            {
                RepeaterNewsLetter.DataSource = dsNewsLetterAllRecords;
                RepeaterNewsLetter.DataBind();
            }
        }

        /// <summary>
        /// Get Vacancies from database through Business Layer
        /// </summary>
        public void getVacancies()
        {
            divVacancyDetails.Visible = false;
            AppVacancy.Id = "";
            DataSet dsVacancyRecords = BusVaccancy.GetVacancyInfo(AppVacancy);
            if (dsVacancyRecords.Tables.Count > 0)
            {
                RepeaterVacancy.DataSource = dsVacancyRecords;
                RepeaterVacancy.DataBind();
            }
        }

        /// <summary>
        /// Get Group Activity Tabs from database through Business Layer
        /// </summary>
        public void getGroupActivityTabs()
        {
            DataSet dsGrpActTabRecords = busGrpActTab.getGroupActivityTab("");
            if (dsGrpActTabRecords.Tables.Count > 0)
            {
                RepeaterGrpActTab.DataSource = dsGrpActTabRecords;
                RepeaterGrpActTab.DataBind();
            }
        }

        /// <summary>
        /// Get Company Tips from Database through Bussiness Layer
        /// </summary>
        public void getCompanyTips()
        {
            DataSet dsCompanyTips = bussCompTips.getCompanyTips("");
            if (dsCompanyTips.Tables.Count > 0)
            {
                RepeaterCompanyTips.DataSource = dsCompanyTips;
                RepeaterCompanyTips.DataBind();
            }
        }

        /// <summary>
        /// Get Google Tips link from database through Business Layer
        /// </summary>
        public void getGoogleTips()
        {
            DataSet dsGoogleTipsRecords = bussGoogleTips.getGoogleTips();
            if (dsGoogleTipsRecords.Tables.Count > 0)
            {
                RepeaterGoogleTips.DataSource = dsGoogleTipsRecords;
                RepeaterGoogleTips.DataBind();
            }
        }

        /// <summary>
        /// Get Company Survey from Database
        /// </summary>
        public void getCompanySurvey()
        {
            DataSet dsCompSurv = busCompSurv.getCompanySurvey("");
            if (dsCompSurv.Tables.Count > 0)
            {
                RepeaterCompSurvey.DataSource = dsCompSurv;
                RepeaterCompSurvey.DataBind();
            }
        }

        /// <summary>
        /// Get Google Survey from Database
        /// </summary>
        public void getGoogleSurvey()
        {
            DataSet dsGoogSurv = busGoogSurv.getGoogleSurvey();
            if (dsGoogSurv.Tables.Count > 0)
            {
                RepeaterGoogleSurvery.DataSource = dsGoogSurv;
                RepeaterGoogleSurvery.DataBind();
            }
        }

        /// <summary>
        /// Load Previous Achievements
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                DataSet dt = busswall.GetAllWallDetails(appwall);
                Label lblyear = (Label)e.Item.FindControl("lblyear");
                Label pdescp = (Label)e.Item.FindControl("pdescp");
                lblyear.Text = DateTime.Now.Year.ToString();
                pdescp.Text = dt.Tables[0].Rows[0]["Description"].ToString();
            }
        }

        /// <summary>
        /// Display selected Corporate Events details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_show_event_Click(object sender, EventArgs e)
        {
            string strEventId = ((Button)sender).CommandArgument;
            AppCorpEvent.Id = strEventId;
            DataSet dsSelectedEventDetails = BusCorpEvent.GetAllCorporateEvent(AppCorpEvent);
        }

        /// <summary>
        /// Display selected News Letter details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ancNewsLetter_ServerClick(object sender, EventArgs e)
        {
            string strNewsLetterId = ((HtmlAnchor)sender).HRef;
            DataSet dsSelectedNewsLetter = BusNewLetter.GetAllNewsDetails(strNewsLetterId);
            lblNewsHeader.Text = dsSelectedNewsLetter.Tables[0].Rows[0]["NewsHeading"].ToString();
            spnNewLetterDesc.InnerText = dsSelectedNewsLetter.Tables[0].Rows[0]["NewsDescription"].ToString();
            spnCreatedDateTime.InnerText = dsSelectedNewsLetter.Tables[0].Rows[0]["CreatedDatetime"].ToString();
            lblSelEventFrom.Text = dsSelectedNewsLetter.Tables[0].Rows[0]["From"].ToString();
        }

        /// <summary>
        /// Display selected Vacancy details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ancVancancy_ServerClick(object sender, EventArgs e)
        {
            divVacancyDetails.Visible = true;
            string strVacancyId = ((HtmlAnchor)sender).HRef;
            AppVacancy.Id = strVacancyId;
            DataSet dsSelectedVacancyDetails = BusVaccancy.GetVacancyInfo(AppVacancy);
            lblJobHeading.Text = dsSelectedVacancyDetails.Tables[0].Rows[0]["JobHeading"].ToString();
            spnVancancyCreatedDateTime.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["CreatedDatetime"].ToString();
            spnVancExperience.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["Experience"].ToString();
            spnVancLocation.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["Location"].ToString();
            spnVancDept.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["Department"].ToString();
            pVancDecsription.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["JobDescription"].ToString();
            spnVancContactName.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["ContactName"].ToString();
            spnVancContactNo.InnerText = dsSelectedVacancyDetails.Tables[0].Rows[0]["ContactDetails"].ToString();
        }

        /// <summary>
        /// Display Sub Tab of Selected GroupActivity
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ancGroupActTab_ServerClick(object sender, EventArgs e)
        {
            string strGrpActTabId = ((HtmlAnchor)sender).HRef;

            DataSet dsGrpActSubTab = busGrpActSubTab.getGroupActivitySubTabRecords(strGrpActTabId);
            RepeaterGrpActSubTab.DataSource = dsGrpActSubTab;
            RepeaterGrpActSubTab.DataBind();
        }

        public void removeActiveClass()
        {
            liEvent.Attributes.Add("class", liEvent.Attributes["class"].ToString().Replace("active", ""));
            divevent.Attributes.Add("class", divevent.Attributes["class"].Replace(" active", ""));

            liNewLetter.Attributes.Add("class", liNewLetter.Attributes["class"].ToString().Replace("active", ""));
            newsltr.Attributes.Add("class", newsltr.Attributes["class"].ToString().Replace("active", ""));

            liWOF.Attributes.Add("class", liWOF.Attributes["class"].ToString().Replace("active", ""));
            wof.Attributes.Add("class", wof.Attributes["class"].ToString().Replace("active", ""));

            liVacancy.Attributes.Add("class", liVacancy.Attributes["class"].ToString().Replace("active", ""));
            vacancy.Attributes.Add("class", vacancy.Attributes["class"].ToString().Replace("active", ""));

            liGrpAct.Attributes.Add("class", liGrpAct.Attributes["class"].ToString().Replace("active", ""));
            gract.Attributes.Add("class", gract.Attributes["class"].ToString().Replace("active", ""));

            liSurvey.Attributes.Add("class", liSurvey.Attributes["class"].ToString().Replace("active", ""));
            survey.Attributes.Add("class", survey.Attributes["class"].ToString().Replace("active", ""));

            liFeedBack.Attributes.Add("class", liFeedBack.Attributes["class"].ToString().Replace("active", ""));
            feedback.Attributes.Add("class", feedback.Attributes["class"].ToString().Replace("active", ""));

            liTips.Attributes.Add("class", liTips.Attributes["class"].ToString().Replace("active", ""));
            tips.Attributes.Add("class", tips.Attributes["class"].ToString().Replace("active", ""));

            liHelpDesk.Attributes.Add("class", liHelpDesk.Attributes["class"].ToString().Replace("active", ""));
            helpdesk.Attributes.Add("class", helpdesk.Attributes["class"].ToString().Replace("active", ""));

            liTraining.Attributes.Add("class", liTraining.Attributes["class"].ToString().Replace("active", ""));
            training.Attributes.Add("class", training.Attributes["class"].ToString().Replace("active", ""));
        }

        protected void ancliEvent_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liEvent.Attributes.Add("class", liEvent.Attributes["class"] + " active");
            divevent.Attributes.Add("class", divevent.Attributes["class"] + " active");
        }

        protected void ancliNewsLetter_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liNewLetter.Attributes.Add("class", liNewLetter.Attributes["class"] + " active");
            newsltr.Attributes.Add("class", newsltr.Attributes["class"] + " active");
        }

        protected void ancliWOF_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liWOF.Attributes.Add("class", liWOF.Attributes["class"] + " active");
            wof.Attributes.Add("class", wof.Attributes["class"] + " active");
        }

        protected void ancliVacancy_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liVacancy.Attributes.Add("class", liVacancy.Attributes["class"] + " active");
            vacancy.Attributes.Add("class", vacancy.Attributes["class"] + " active");
        }

        protected void ancliGrpAct_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liGrpAct.Attributes.Add("class", liGrpAct.Attributes["class"] + " active");
            gract.Attributes.Add("class", gract.Attributes["class"] + " active");
        }

        protected void ancliSurvey_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liSurvey.Attributes.Add("class", liSurvey.Attributes["class"] + " active");
            survey.Attributes.Add("class", survey.Attributes["class"] + " active");
        }

        protected void ancliFeedBack_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liFeedBack.Attributes.Add("class", liFeedBack.Attributes["class"] + " active");
            feedback.Attributes.Add("class", feedback.Attributes["class"] + " active");
        }

        protected void ancliTips_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liTips.Attributes.Add("class", liTips.Attributes["class"] + " active");
            tips.Attributes.Add("class", tips.Attributes["class"] + " active");
        }

        protected void ancliHelpDesk_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liHelpDesk.Attributes.Add("class", liHelpDesk.Attributes["class"] + " active");
            helpdesk.Attributes.Add("class", helpdesk.Attributes["class"] + " active");
        }

        protected void ancliTraining_ServerClick(object sender, EventArgs e)
        {
            removeActiveClass();
            liTraining.Attributes.Add("class", liTraining.Attributes["class"] + " active");
            training.Attributes.Add("class", training.Attributes["class"] + " active");
        }

        protected void ancliCompanyTips_ServerClick(object sender, EventArgs e)
        {
            pnlCompanyTipsPopup.Visible = true;
            string strTipId = ((HtmlAnchor)sender).HRef;
            DataSet dsSelectedCompanyTip = bussCompTips.getCompanyTips(strTipId);
            lblMPEHeading.Text = dsSelectedCompanyTip.Tables[0].Rows[0]["Heading"].ToString();
            pMPEDesc.InnerText = dsSelectedCompanyTip.Tables[0].Rows[0]["Description"].ToString();
            lblMPECreatedDatetime.Text = dsSelectedCompanyTip.Tables[0].Rows[0]["CreatedDatetime"].ToString();
            MPECompanyTips.Show();
        }

        protected void ancliEvent_ServerClick1(object sender, EventArgs e)
        {
            string strEventId = ((HtmlAnchor)sender).HRef;
            AppCorpEvent.Id = strEventId;
            DataSet dsSelectedEvent = BusCorpEvent.GetAllCorporateEvent(AppCorpEvent);

            imgSelectedEvent.Src = dsSelectedEvent.Tables[0].Rows[0]["ImagePath"].ToString();
            lblHeading.Text = dsSelectedEvent.Tables[0].Rows[0]["HeaderName"].ToString();
            spnEventDate.InnerText = dsSelectedEvent.Tables[0].Rows[0]["EventDate"].ToString();
            lbldescp.Text = dsSelectedEvent.Tables[0].Rows[0]["HeaderDescription"].ToString();

        }

        protected void ancPuzzleGame_ServerClick(object sender, EventArgs e)
        {
            string strpath = "../Games/Puzzle/GamePuzzle.exe";
            Process myProcess = new Process();
            string temp = HttpContext.Current.Server.MapPath(strpath);
            try
            {
                myProcess.StartInfo.UseShellExecute = false;
                myProcess.StartInfo.FileName = temp;
                myProcess.StartInfo.CreateNoWindow = true;
                myProcess.Start();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}