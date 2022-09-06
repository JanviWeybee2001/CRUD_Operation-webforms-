using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Invoice_Module
{
    public partial class addProductRate : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveProductRateItems_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string product = slctProduct.SelectedValue;
                int product_id;

                //FindControl Id of Product
                SqlDataAdapter daProduct = new SqlDataAdapter("spFindDuplicateProduct", con);
                daProduct.SelectCommand.CommandType = CommandType.StoredProcedure;
                daProduct.SelectCommand.Parameters.AddWithValue("@product", product);
                DataSet dsProduct = new DataSet();
                daProduct.Fill(dsProduct);
                DataRow drProduct = dsProduct.Tables[0].Rows[0];
                product_id = System.Convert.ToInt32(drProduct["Product_id"]);

                //Find the record of already rate item
                SqlDataAdapter da = new SqlDataAdapter("spgetProductRateItem", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@productid", product_id);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    SqlCommand cmd = new SqlCommand("spAddProductRateItem", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productid", product_id);
                    cmd.Parameters.AddWithValue("@rate", System.Convert.ToInt32(txtRate.Text));
                    cmd.Parameters.AddWithValue("@date", calDate.SelectedDate);
                    int n = cmd.ExecuteNonQuery();

                    lblProductRateSts.Text = "Data inserted Successfully..!!";
                    lblProductRateSts.ForeColor = System.Drawing.Color.Green;
                    con.Close();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("spUpdateProductRateItem", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productid", product_id);
                    cmd.Parameters.AddWithValue("@rate", System.Convert.ToInt32(txtRate.Text));
                    cmd.Parameters.AddWithValue("@date", calDate.SelectedDate);
                    int n = cmd.ExecuteNonQuery();

                    lblProductRateSts.ForeColor = System.Drawing.Color.Blue;
                    lblProductRateSts.Text = "Data Updated Successfully..!!";
                    con.Close();
                }
            }
        }
    }
}

//Response.Write(calDate.SelectedDate);
//Response.Write(slctProduct.SelectedValue);
//Response.Write(txtRate.Text);