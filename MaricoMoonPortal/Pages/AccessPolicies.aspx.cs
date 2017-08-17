using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussLayer;
using System.Data;
using AppLayer;

namespace MySpace.Pages
{
    public partial class AccessPolicies : System.Web.UI.Page
    {
        string strDefaultPath = System.Configuration.ConfigurationManager.AppSettings["DefaultProjectPath"];
        string strDefaultPolicyFilePath = System.Configuration.ConfigurationManager.AppSettings["AccessPoliciesPath"];
        string strProjectDirectory = AppDomain.CurrentDomain.BaseDirectory;

        BussAccessPolicies bussAccPol = new BussAccessPolicies();
        AppAccessPolicies appAccPol = new AppAccessPolicies();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUploadPolicy_Click(object sender, EventArgs e)
        {
            string strFileName = "";
            string strFilePath = "";
            int intInsertStauts = 0;
            try
            {
                if (fpUploadPolicy.HasFile)
                {
                    strFileName = Path.GetFileName(fpUploadPolicy.FileName);
                    strFilePath = ".." + strDefaultPolicyFilePath + strFileName;
                    fpUploadPolicy.SaveAs(Server.MapPath(strFilePath));

                    appAccPol.PolicyName = strFileName;
                    appAccPol.PolicyPath = strDefaultPath + strDefaultPolicyFilePath + strFileName;

                    intInsertStauts = bussAccPol.insertAccessPolicies(appAccPol);
                }
                else
                {
                    StatusLabel.Text = "Please select File.";
                }
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Failed to Upload the file.";
            }
            if (intInsertStauts > 0)
                StatusLabel.Text = "File Uploaded Successfully.";
            else
                StatusLabel.Text = "Failed to Upload the file.";

        }
    }
}