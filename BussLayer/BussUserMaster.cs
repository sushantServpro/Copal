using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using AppLayer;
using BussLayer;
using System.Data;

namespace BussLayer
{
   public class BussUserMaster
    {
        DataUserMaster duser = new DataUserMaster();
        public DataSet GetUserInfo(AppUserMaster obj)
        {
            return duser.GetUserInfo(obj);
        }

        //txtempcode.Text, ddrole.SelectedItem.Text, Convert.ToInt32(id.Text), txtsecqt.Text
        public int UpdateUserInfo(string id,string username,string password,string empcode,string secquestion,string secanswer,string RoleId)
        {
            return duser.UpdateUserInfo(id,username,password,empcode, secquestion, secanswer,RoleId);
        }

        public string InsertUserInfo(string username, string password, string empcode, string createdon, string updatedon, string SecurityQuestion, string SecurityAnswer, string RoleId)
        {
            return duser.InsertUserInfo(username, password, empcode, createdon, updatedon, SecurityQuestion, SecurityAnswer, RoleId);
        }

        public DataSet SearchUserDetails(string search)
        {
            return duser.SearchUserDetails(search);
        }
    }
}
