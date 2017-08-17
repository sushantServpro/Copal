using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppLayer;
using DataLayer;
using System.Data;

namespace BussLayer
{
    /// <summary>
    /// GroupActivitySubTab Bussiness Layer
    /// </summary>
    public class BussGroupActivitySubTab
    {
        //GroupActivitySubTab Datalayer Object
        DataGroupActivitySubTab dGrpActSubTab = new DataGroupActivitySubTab();

        /// <summary>
        /// Get GroupActivitySubTab records through Datalayer
        /// </summary>
        /// <param name="strSubTabId">SubTab Id</param>
        /// <returns>DataSet</returns>
        public DataSet getGroupActivitySubTabRecords(string strSubTabId)
        {
            return dGrpActSubTab.GetGroupActivitySubTabRecords(strSubTabId);
        }

        /// <summary>
        /// Insert GroupActivitySubTab records through Datalayer
        /// </summary>
        /// <param name="obj">GroupActivitySubTab object</param>
        /// <returns>Insert Status</returns>
        public int insertGroupActivitySubTab(AppGroupActivitySubTab obj)
        {
            return dGrpActSubTab.InsertGroupActivitySubTabRecord(obj);
        }

        /// <summary>
        /// Update GroupActivitySubTab records through Datalayer
        /// </summary>
        /// <param name="obj">GroupActivitySubTab object</param>
        /// <returns>Update Status</returns>
        public int updateGroupActivitySubTab(AppGroupActivitySubTab obj)
        {
            return dGrpActSubTab.UpdateGroupActivitySubTabRecord(obj);
        }
    }
}
