using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;

namespace BussLayer
{
    public class BussRules
    {
        DataRules drule = new DataRules();

        public DataSet GetAllRulesList()
        {
            return drule.GetAllRulesList();
        }

        public DataSet GetRulesItem(string strRuleId)
        {
            return drule.GetRulesItem(strRuleId);
        }
    }
}
