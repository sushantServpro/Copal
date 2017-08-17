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
    /// GroupActivityTab Bussiness Layer
    /// </summary>
    public class BussGroupActivityTab
    {
        //GroupActivityTab DataLayer Object
        DataGroupActivityTab dGrpActTab = new DataGroupActivityTab();

        /// <summary>
        /// Get GroupActivityTab Records through DataLayer
        /// </summary>
        /// <param name="strTabId">Tab Id</param>
        /// <returns>DataSet</returns>
        public DataSet getGroupActivityTab(string strTabId)
        {
            return dGrpActTab.GetGroupActivityTab(strTabId);
        }

        /// <summary>
        /// Insert GroupActivityTab records in database through DataLayer
        /// </summary>
        /// <param name="obj">GroupActivityTab Object</param>
        /// <returns>Insert Status</returns>
        public int insertGroupactivityTabRecord(AppGroupActivityTab obj)
        {
            return dGrpActTab.InsertGroupActivityTab(obj);
        }

        /// <summary>
        /// Update GroupActivityTab Record in database through DataLayer
        /// </summary>
        /// <param name="obj">GroupActivityTab Id</param>
        /// <returns>Update Status</returns>
        public int updateGroupActivityTabRecord(AppGroupActivityTab obj)
        {
            return dGrpActTab.UpdateGroupActivityTab(obj);
        }
    }
}
