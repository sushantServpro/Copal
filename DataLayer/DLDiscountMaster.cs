using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace DataLayer
{
    public class DLDiscountMaster
    {
        Common c = new Common();
        String ErrorMessage;

        public int AddUpdatediscount(int Discountid,int ProductId,int DiscountRate,DateTime DiscountDate)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("DiscountId", Discountid);
            cmd.Parameters.AddWithValue("ProductId", ProductId);
            cmd.Parameters.AddWithValue("DiscountRate", DiscountRate);
            cmd.Parameters.AddWithValue("DiscountDate", DiscountDate);
            return c.AddUpdate("Proc_AddUpdateDiscount", ref cmd, out ErrorMessage);
        }

        public DataSet GetDiscountInfo()
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetDiscount", ref cmd, out ErrorMessage);
        }

        public DataSet GetProduct()
        {
            SqlCommand cmd = new SqlCommand();
            return c.GetData("Proc_GetDiscountProduct", ref cmd, out ErrorMessage);
        }
    }
}
