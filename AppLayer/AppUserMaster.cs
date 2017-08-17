using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
   public class AppUserMaster
    {
        String _Id;
        public String Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        String _Username;
        public String Username
        {
            get { return _Username; }
            set { _Username = value; }
        }

        String _Password;
        public String Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        String _EmployeeCode;
        public String EmployeeCode
        {
            get { return _EmployeeCode; }
            set { _EmployeeCode = value; }
        }

        String _CreatedOn;
        public String CreatedOn
        {
            get { return _CreatedOn; }
            set { _CreatedOn = value; }
        }

        String _UpdatedOn;
        public String UpdatedOn
        {
            get { return _UpdatedOn; }
            set { _UpdatedOn = value; }
        }

        String _SecurityQuestion;
        public String SecurityQuestion
        {
            get { return _SecurityQuestion; }
            set { _SecurityQuestion = value; }
        }

        String _SecurityPassword;
        public String SecurityPassword
        {
            get { return _SecurityPassword; }
            set { _SecurityPassword = value; }
        }

        String _RoleId;
        public String RoleId
        {
            get { return _RoleId; }
            set { _RoleId = value; }
        }
    }
}
