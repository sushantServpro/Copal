using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
    public class AppLogin
    {
        String _UserName;

        public String UserName
        {
            get { return _UserName; }
            set { _UserName = value; }
        }

        String _Password;
        public String Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
    }
}
