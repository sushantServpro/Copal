using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using AppLayer;
using System.Data;

namespace BussLayer
{
    public class BussAccessPolicies
    {
        DataAccessPolicies dAccessPolicy = new DataAccessPolicies();

        /// <summary>
        /// Get Access Policies from database through Datalayer
        /// </summary>
        /// <returns>Dataser</returns>
        public DataSet getAccessPolicies()
        {
            return dAccessPolicy.GetAccessPolicies();
        }

        /// <summary>
        /// Insert Access Policies in database through DataLayer
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public int insertAccessPolicies(AppAccessPolicies obj)
        {
            return dAccessPolicy.InsertAccessPolicies(obj);
        }
    }
}
