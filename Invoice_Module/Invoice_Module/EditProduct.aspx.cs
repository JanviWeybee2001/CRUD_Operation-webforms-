using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoice_Module
{
    public partial class EditProduct : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtEditProduct.Text = Request.QueryString["name"];
            }
        }

        protected void UpdateProduct_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string product = txtEditProduct.Text;
                SqlCommand cmd = new SqlCommand("update Product_List set Product_Name = '" + product + "' where Product_id = " + Request.QueryString["id"], con);
                cmd.ExecuteNonQuery();

                lblProductSts.Text = "Data Update SuccessFully..!!";
                lblProductSts.ForeColor = System.Drawing.Color.Green;

                con.Close();
            }
        }
    }
}