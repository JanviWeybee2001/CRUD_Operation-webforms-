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
    public partial class EditProductRate : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                slctProduct.SelectedValue = Request.QueryString["product"];
                txtRate.Text = Request.QueryString["rate"];
                calDate.SelectedDate = System.Convert.ToDateTime(Request.QueryString["dates"]);
            }
        }

        protected void UpdateProductRateItems_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string product = slctProduct.SelectedValue;
                string productRate = txtRate.Text;
                string date = calDate.SelectedDate.ToString();
                int product_id;

                //FindControl Id of Product
                SqlDataAdapter daProduct = new SqlDataAdapter("spFindDuplicateProduct", con);
                daProduct.SelectCommand.CommandType = CommandType.StoredProcedure;
                daProduct.SelectCommand.Parameters.AddWithValue("@product", product);
                DataSet dsProduct = new DataSet();
                daProduct.Fill(dsProduct);
                DataRow drProduct = dsProduct.Tables[0].Rows[0];
                product_id = System.Convert.ToInt32(drProduct["Product_id"]);

                SqlCommand cmd = new SqlCommand("update Product_Rate set Product_id = " + product_id + ", Rate = " + productRate + ", Date_OF_Rate = '" + calDate.SelectedDate + "'  where Product_Rate_id = " + Request.QueryString["id"], con);
                cmd.ExecuteNonQuery();

                lblProductRateSts.Text = "Data Update SuccessFully..!!";
                lblProductRateSts.ForeColor = System.Drawing.Color.Green;

                con.Close();
            }
        }
    }
}