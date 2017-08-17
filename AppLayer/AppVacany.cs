using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
    public class AppVacany
    {
        String _Id;

        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        String _JobHeading;
        public string JobHeading
        {
            get { return _JobHeading; }
            set { _JobHeading = value; }
        }

        String _Experience;
        public string Experience
        {
            get { return _Experience; }
            set { _Experience = value; }
        }

        String _Location;
        public string Location
        {
            get { return _Location; }
            set { _Location = value; }
        }

        String _Department;
        public string Department
        {
            get { return _Department; }
            set { _Department = value; }
        }

        String _JobDescription;
        public string JobDescription
        {
            get { return _JobDescription; }
            set { _JobDescription = value; }
        }

        String _ContactDetails;
        public string ContactDetails
        {
            get { return _ContactDetails; }
            set { _ContactDetails = value; }
        }

        String _CreatedDatetime;
        public string CreatedDatetime
        {
            get { return _CreatedDatetime; }
            set { _CreatedDatetime = value; }
        }
    }
}
