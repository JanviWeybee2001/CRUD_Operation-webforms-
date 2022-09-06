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
    public partial class Products : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select * from Product_List", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    tblProduct.DataSource = ds;
                    tblProduct.DataBind();
                }
                con.Close();
            }
        }

        protected void EditBtn_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblProduct.Rows[rowIndex].Cells[0].Text);
            string name = tblProduct.Rows[rowIndex].Cells[1].Text;
            Response.Write(id + " " + name);

            Response.Redirect("EditProduct.aspx?id=" + id + "&name=" + name);
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblProduct.Rows[rowIndex].Cells[0].Text);
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from Product_List where Product_id = " + id, con);
                    cmd.ExecuteNonQuery();
                    getData();
                    con.Close();
                }
            }
            catch(Exception exce)
            {
                lblException.Text = "You cant' delete this Product..!!";
            }
}
    }
}