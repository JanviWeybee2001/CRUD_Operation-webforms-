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
    public partial class AddPartyItems : System.Web.UI.Page
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
                string party = txtAddParty.Text;
                SqlDataAdapter da = new SqlDataAdapter("spFindDuplicateParty", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@party", party);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if(ds.Tables[0].Rows.Count == 0 && party != "")
                {
                    SqlCommand cmd = new SqlCommand("spPartyItem", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@party", party);
                    int n = cmd.ExecuteNonQuery();

                    lblPartySts.Text = "Data inserted Successfully..!!";
                    lblPartySts.ForeColor = System.Drawing.Color.Green;
                    txtAddParty.Text = "";

                    con.Close();
                }
                else
                {
                    lblPartySts.Text = "Party is alredy there";
                    lblPartySts.ForeColor = System.Drawing.Color.Red;
                    txtAddParty.Text = "";
                }
            }
        }
    }
}