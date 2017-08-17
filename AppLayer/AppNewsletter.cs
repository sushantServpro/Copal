using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
    public class AppNewsletter
    {
        String _Id;

        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        String _NewsHeading;
        public string NewsHeading
        {
            get { return _NewsHeading; }
            set { _NewsHeading = value; }
        }

        String _NewsDescription;
        public string NewsDescription
        {
            get { return _NewsDescription; }
            set { _NewsDescription = value; }
        }

        String _CreatedDatetime;
        public string CreatedDatetime
        {
            get { return _CreatedDatetime; }
            set { _CreatedDatetime = value; }
        }
    }
}
