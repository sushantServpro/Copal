using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.API.Search;
using System.Web.Services;
using System.Net;
using System.IO;
using System.Text;
using RestSharp;
using System.Collections.ObjectModel;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Web.UI.HtmlControls;
using System.Globalization;

namespace MySpace.Pages
{
    public partial class news_update : System.Web.UI.Page
    {
        string result = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                getNews();

                //GnewsSearchClient client = new GnewsSearchClient("www.c-sharpcorner.com");

                //IList<INewsResult> results;
                //results = client.Search(txt_search.Text, 10);



                //DataSet ds = new DataSet();
                //DataTable dt = new DataTable();

                //dt.Columns.Add(new DataColumn("Content", typeof(string)));
                //dt.Columns.Add(new DataColumn("Url", typeof(string)));
                //dt.Columns.Add(new DataColumn("Image", typeof(string)));
                //dt.Columns.Add(new DataColumn("Link", typeof(string)));
                //dt.Columns.Add(new DataColumn("Publisher", typeof(string)));
                //dt.Columns.Add(new DataColumn("Date", typeof(string)));




                //foreach (var news in results)
                //{

                //    DataRow dr = dt.NewRow();

                //    dr["Content"] = news.Content;

                //    dr["Image"] = news.Image;
                //    dr["Link"] = news.Url;

                //    dt.Rows.Add(dr);
                //    DataList1.DataSource = dt;
                //    DataList1.DataBind();


                //}


            }

        }

        public void searchNews(string prefix)
        {
            //var client = new RestClient("https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=86c79d608bb14565bf6c74cee7830c87");
            var client = new RestClient("https://newsapi.org/v1/sources?language=en");
            var request = new RestRequest(Method.GET);
            //request.AddHeader("postman-token", "91f301db-0e6f-cbc5-25f3-f46cdc53f18e");
            //request.AddHeader("cache-control", "no-cache");
            IRestResponse response = client.Execute(request);

            //result = response.Content;

            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = default(Dictionary<string, object>);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                dt.Columns.Add(new DataColumn("Content", typeof(string)));
                dt.Columns.Add(new DataColumn("Url", typeof(string)));
                dt.Columns.Add(new DataColumn("Image", typeof(string)));
                dt.Columns.Add(new DataColumn("Link", typeof(string)));
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                //return msg;
                // result = response.Content;
                //var jObject = result.Parse(result);
                //if (jObject["status"].ToString().Equals("ok"))
                //{
                //    var jArray = jObject.SelectToken("sources").ToString();
                //    Data = new List<Source>();
                //    Data = JsonConvert.DeserializeObject<List<Source>>(jArray);
                //}
            }
        }

        public class Source
        {
            public string id { get; set; }
            public string name { get; set; }
            public string description { get; set; }
            public string url { get; set; }
            public string category { get; set; }
            public string language { get; set; }
            public string country { get; set; }
            public List<string> sortBysAvailable { get; set; }
        }

        protected void btn_btn_Click(object sender, EventArgs e)
        {
            getNews();
            //searchNews(txt_search.Text);
        }

        public List<Source> getNews()
        {
            //var client = new RestClient("https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=86c79d608bb14565bf6c74cee7830c87");
            var client = new RestClient("https://newsapi.org/v1/sources?language=en");
            var request = new RestRequest(Method.GET);//
            //request.AddHeader("postman-token", "91f301db-0e6f-cbc5-25f3-f46cdc53f18e");
            //request.AddHeader("cache-control", "no-cache");
            IRestResponse response = client.Execute(request);
            result = response.Content;

            var jObject = JObject.Parse(result);
            if (jObject["status"].ToString().Equals("ok"))
            {
                var jArray = jObject.SelectToken("sources").ToString();
                var Data = new List<Source>();
                var Data1 = JsonConvert.DeserializeObject<List<Source>>(jArray);

                var anyNewUpdatedRecords = from x in Data1 where x.category == "general" select new { name = x.name, category = x.category, description = x.description, url = x.url };
                //My changes Ali start

                var NewsCategoriesTabs = (from x in Data1 select new { category = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(x.category.ToString().ToLower()) }).Distinct();


                NewsCategoryRepeater.DataSource = NewsCategoriesTabs;
                NewsCategoryRepeater.DataBind();


                //My changes Ali End
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = default(Dictionary<string, object>);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                dt.Columns.Add(new DataColumn("name", typeof(string)));
                dt.Columns.Add(new DataColumn("url", typeof(string)));
                dt.Columns.Add(new DataColumn("category", typeof(string)));
                dt.Columns.Add(new DataColumn("language", typeof(string)));



                DataList1.DataSource = anyNewUpdatedRecords;
                DataList1.DataBind();
                return Data1;
            }




            return null;
        }

        protected void ancNewsCategory_ServerClick(object sender, EventArgs e)
        {
            string strNewsCategory = ((HtmlAnchor)sender).HRef;
            var client = new RestClient("https://newsapi.org/v1/sources?language=en&category=" + strNewsCategory);
            var request = new RestRequest(Method.GET);//

            IRestResponse response = client.Execute(request);
            result = response.Content;

            var jObject = JObject.Parse(result);
            if (jObject["status"].ToString().Equals("ok"))
            {
                var jArray = jObject.SelectToken("sources").ToString();
                var Data = new List<Source>();
                var Data1 = JsonConvert.DeserializeObject<List<Source>>(jArray);
                var anyobjNewsRecordsCategoryWise = from x in Data1 select new { name = x.name, category = x.category, description = x.description, url = x.url };
                DataList1.DataSource = anyobjNewsRecordsCategoryWise;
                DataList1.DataBind();
            }
        }
    }

    public class Grouping<K, T> : ObservableCollection<T>
    {
        public K Key { get; private set; }

        public Grouping(K key, IEnumerable<T> items)
        {
            Key = key;
            foreach (var item in items)
                this.Items.Add(item);
        }
    }
}