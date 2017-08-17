using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;

namespace BussLayer
{
    /// <summary>
    /// Business Layer
    /// </summary>
    public class BussGoogleSurvey
    {
        //DataLayer
        DataGoogleSurvey dGoogSurv = new DataGoogleSurvey();

        /// <summary>
        /// Get Google Survey records from Database through DataLayer
        /// </summary>
        /// <returns>DataSet</returns>
        public DataSet getGoogleSurvey()
        {
            return dGoogSurv.GetGoogleSurvey();
        }
    }
}
