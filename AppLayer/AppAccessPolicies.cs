using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
    public class AppAccessPolicies
    {
        public string PolicyId { get; set; }
        public string PolicyName { get; set; }
        public string PolicyPath { get; set; }
        public string IsActive { get; set; }
        public string CreatedDateTime { get; set; }
        public string UpdatedDateTime { get; set; }
    }
}
