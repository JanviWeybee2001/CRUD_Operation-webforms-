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
    public partial class Party : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }

        protected void getData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Party_List", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    tblParty.DataSource = ds;
                    tblParty.DataBind();
                }
                con.Close();
            }
        }

        protected void EditBtn_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblParty.Rows[rowIndex].Cells[0].Text);
            string name = tblParty.Rows[rowIndex].Cells[1].Text;
            Response.Write(id + " " + name);

            Response.Redirect("EditParty.aspx?id=" + id + "&name=" + name);
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblParty.Rows[rowIndex].Cells[0].Text);
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from Party_List where Party_id = " + id, con);
                    cmd.ExecuteNonQuery();
                    getData();
                    con.Close();
                }
            }
            catch(Exception exce)
            {
                lblException.Text = "You cant' delete this Party..!!";
            }
        }
    }
}