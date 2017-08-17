using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

namespace BussLayer
{
    public class BLDiscountMaster
    {
        DLDiscountMaster dld = new DLDiscountMaster();
        public int AddUpdatediscount(int Discountid, int ProductId, int DiscountRate, DateTime DiscountDate)
        {
            return dld.AddUpdatediscount(Discountid, ProductId, DiscountRate, DiscountDate);
        }
        public DataSet GetDiscountInfo()
        {
            return dld.GetDiscountInfo();
        }
        public DataSet GetProduct()
        {
            return dld.GetProduct();
        }
    }
}
