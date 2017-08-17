using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
    public class AppRole
    {
        String _Id;

        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        String _Role;
        public string Role
        {
            get { return _Role; }
            set { _Role = value; }
        }

        String _RoleDescription;
        public string RoleDescription
        {
            get { return _RoleDescription; }
            set { _RoleDescription = value; }
        }

        String _RoleType;
        public string RoleType
        {
            get { return _RoleType; }
            set { _RoleType = value; }
        }
    }
}
