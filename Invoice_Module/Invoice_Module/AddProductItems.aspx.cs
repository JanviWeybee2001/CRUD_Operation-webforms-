using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoice_Module
{
    public partial class AddProductItems : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SaveProduct_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string product = txtAddProduct.Text;
                SqlDataAdapter da = new SqlDataAdapter("spFindDuplicateProduct", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@product", product);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0 && product!="")
                {
                    SqlCommand cmd = new SqlCommand("spProductItem", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@product", product);
                    int n = cmd.ExecuteNonQuery();
                    if (System.Convert.ToBoolean(n))
                    {
                        lblProductSts.Text = "Data inserted Successfully..!!";
                        lblProductSts.ForeColor = System.Drawing.Color.Green;
                        txtAddProduct.Text = "";
                    }
                    con.Close();
                }
                else
                {
                    lblProductSts.Text = "Product is alredy there";
                    lblProductSts.ForeColor = System.Drawing.Color.Red;
                    txtAddProduct.Text = "";
                }
            }
        }
    }
}