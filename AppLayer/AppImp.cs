using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppLayer
{
    public class AppImp
    {
        String _Id;

        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        String _Heading;
        public string Heading
        {
            get { return _Heading; }
            set { _Heading = value; }
        }

        String _Description;
        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        String _Flag;
        public string Flag
        {
            get { return _Flag; }
            set { _Flag = value; }
        }

        String _CreatedDatetime;
        public string CreatedDatetime
        {
            get { return _CreatedDatetime; }
            set { _CreatedDatetime = value; }
        }
    }
}
