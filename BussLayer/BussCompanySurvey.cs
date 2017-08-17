using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using AppLayer;

namespace BussLayer
{
    /// <summary>
    /// Company Survey Bussiness Layer
    /// </summary>
    public class BussCompanySurvey
    {
        //DataLayer Object
        DataCompanySurvey dCompSurv = new DataCompanySurvey();

        /// <summary>
        /// Get Company Survey Reecords from Database through DataLayer
        /// </summary>
        /// <param name="strSurveyId">SurveyId</param>
        /// <returns>DataSet</returns>
        public DataSet getCompanySurvey(string strSurveyId)
        {
            return dCompSurv.GetCompanySurvey(strSurveyId);
        }

        /// <summary>
        /// Insert Company Survey from Database through Datalayer
        /// </summary>
        /// <param name="obj">AppLayer Obj</param>
        /// <returns>Insert Status</returns>
        public int insertCompanySurvey(AppCompanySurvey obj)
        {
            return dCompSurv.InsertCompanySurvey(obj);
        }

        /// <summary>
        /// Update Company Survey from Database through DataLayer
        /// </summary>
        /// <param name="obj">AppLayer Obj</param>
        /// <returns>Update Status</returns>
        public int updateCompanySurvey(AppCompanySurvey obj)
        {
            return dCompSurv.UpdateCOmpanySurvey(obj);
        }
    }
}
