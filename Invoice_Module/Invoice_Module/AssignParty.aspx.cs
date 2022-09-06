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
    public partial class AssignParty : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("getPartyProduct", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    tblAssignParty.DataSource = ds;
                    tblAssignParty.DataBind();
                }
                con.Close();
            }
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblAssignParty.Rows[rowIndex].Cells[0].Text);
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Party_Product where Party_Product_id = " + id, con);
                cmd.ExecuteNonQuery();
                getData();
                con.Close();
            }

        }
        protected void EditBtn_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblAssignParty.Rows[rowIndex].Cells[0].Text);
            string party = tblAssignParty.Rows[rowIndex].Cells[1].Text;
            string product = tblAssignParty.Rows[rowIndex].Cells[2].Text;
            Response.Write(id + " " + party + " " + product);

            Response.Redirect("EditAssignItems.aspx?id=" + id + "&party=" + party + "&product=" + product);
        }
    }
}