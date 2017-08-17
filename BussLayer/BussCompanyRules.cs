using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using System.Data;

namespace BussLayer
{
    public class BussCompanyRules
    {
        DataCompRules dCompRules = new DataCompRules();

        /// <summary>
        /// Get Company Rules Records from Database through DataLayer
        /// </summary>
        /// <param name="strCompRuleId">Comp Rule Id</param>
        /// <returns>DataSet</returns>
        public DataSet getCompanyRules(string strCompRuleId)
        {
            return dCompRules.GetCompanyRules(strCompRuleId);
        }

        /// <summary>
        /// Insert Company Rules in Database through DataLayer
        /// </summary>
        /// <param name="obj">App Layer Obj</param>
        /// <returns>Insert Status</returns>
        public int insertCompanyRules(AppCompanyRules obj)
        {
            return dCompRules.InsertCompanyRules(obj);
        }

        /// <summary>
        /// Update Company Rules in Database through DataLayer
        /// </summary>
        /// <param name="obj">App Layer Obj</param>
        /// <returns>Update Status</returns>
        public int updateCompanyRules(AppCompanyRules obj)
        {
            return dCompRules.UpdateCompanyRules(obj);
        }
    }
}
