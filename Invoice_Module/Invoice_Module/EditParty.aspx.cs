using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoice_Module
{
    public partial class EditParty : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Request.QueryString["id"] + " " + Request.QueryString["name"]);
            if(!IsPostBack)
            {
                txtEditParty.Text = Request.QueryString["name"];
            }
        }

        protected void UpdateParty_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string party = txtEditParty.Text;
                SqlCommand cmd = new SqlCommand("update Party_List set Party_Name = '" + party + "' where Party_id = " + Request.QueryString["id"], con);
                cmd.ExecuteNonQuery();

                lblPartySts.Text = "Data Update SuccessFully..!!";
                lblPartySts.ForeColor = System.Drawing.Color.Green;

                con.Close();
            }
        }
    }
}