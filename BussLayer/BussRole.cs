using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
using AppLayer;

namespace BussLayer
{
    public class BussRole
    {
        DataRole drole = new DataRole();

        public DataSet GetUserRole(AppRole obj)
        {
            return drole.GetUserRole(obj);
        }

        public int UpdateRoleInfo(string id, string role, string roledescription, string roletype)
        {
            return drole.UpdateRoleInfo(id, role, roledescription, roletype);
        }

        public int InsertRoleInfo(string role, string roledescription, string roletype)
        {
            return drole.InsertRoleInfo(role, roledescription, roletype);
        }

        public DataSet SearchUserDetails(string search, string profile)
        {
            return SearchUserDetails(search, profile);
        }
    }
}
