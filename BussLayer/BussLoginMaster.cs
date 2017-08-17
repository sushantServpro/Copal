using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

namespace BussLayer
{
    public class BussLoginMaster
    {
        DataLoginMaster dlm = new DataLoginMaster();

       public DataSet GetUserInfo(string username, string password)
        {
            try
            {
                return dlm.GetUserInfo(username, password);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
