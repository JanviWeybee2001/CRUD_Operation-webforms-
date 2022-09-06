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
    public partial class EditAssignItems : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                slctParty.SelectedValue = Request.QueryString["party"];
                slctProduct.SelectedValue = Request.QueryString["product"];
            }
        }

        protected void UpdateAssignItems_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string party = slctParty.SelectedValue;
                string product = slctProduct.SelectedValue;
                int party_id, product_id;

                //FindControl Id of Party
                SqlDataAdapter daParty = new SqlDataAdapter("spFindDuplicateParty", con);
                daParty.SelectCommand.CommandType = CommandType.StoredProcedure;
                daParty.SelectCommand.Parameters.AddWithValue("@party", party);
                DataSet dsParty = new DataSet();
                daParty.Fill(dsParty);
                DataRow drParty = dsParty.Tables[0].Rows[0];
                party_id = System.Convert.ToInt32(drParty["Party_id"]);

                //FindControl Id of Product
                SqlDataAdapter daProduct = new SqlDataAdapter("spFindDuplicateProduct", con);
                daProduct.SelectCommand.CommandType = CommandType.StoredProcedure;
                daProduct.SelectCommand.Parameters.AddWithValue("@product", product);
                DataSet dsProduct = new DataSet();
                daProduct.Fill(dsProduct);
                DataRow drProduct = dsProduct.Tables[0].Rows[0];
                product_id = System.Convert.ToInt32(drProduct["Product_id"]);

                SqlCommand cmd = new SqlCommand("update Party_Product set Product_id = " + product_id + ", Party_id = " + party_id + " where Party_Product_id = " + Request.QueryString["id"], con);
                cmd.ExecuteNonQuery();

                lblAssignItem.Text = "Data Update SuccessFully..!!";
                lblAssignItem.ForeColor = System.Drawing.Color.Green;

                con.Close();
            }
        }
    }
}