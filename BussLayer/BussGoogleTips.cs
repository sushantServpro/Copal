using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;

namespace BussLayer
{
    public class BussGoogleTips
    {
        DataGoogleTips dGoogleTips = new DataGoogleTips();

        /// <summary>
        /// Get Google Tips Link from Database through DataLayer
        /// </summary>
        /// <returns>DataSet</returns>
        public DataSet getGoogleTips()
        {
            return dGoogleTips.GetGoogleTips();
        }
    }
}
