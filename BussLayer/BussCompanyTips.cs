using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using AppLayer;

namespace BussLayer
{
    public class BussCompanyTips
    {
        //DataLayer Object
        DataCompanyTips dCompTips = new DataCompanyTips();

        /// <summary>
        /// Get Company Tips records from Database through DataLayer
        /// </summary>
        /// <param name="strTipsId"></param>
        /// <returns></returns>
        public DataSet getCompanyTips(string strTipsId)
        {
            return dCompTips.GetCompanyTips(strTipsId);
        }

        /// <summary>
        /// Insert Company Tips records in Database through DataLayer
        /// </summary>
        /// <param name="obj">Company Tips App Layer Object</param>
        /// <returns>Insert Status</returns>
        public int insertCompanyTips(AppCompanyTips obj)
        {
            return dCompTips.InsertCompanyTips(obj);
        }
    }
}
