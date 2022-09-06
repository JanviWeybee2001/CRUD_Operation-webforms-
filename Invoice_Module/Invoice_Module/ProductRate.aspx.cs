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
    public partial class ProductRate : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select Product_Rate_id, Product_Name, Rate,  FORMAT (Date_OF_Rate, 'dd-MM-yyyy') as Date_OF_Rate from Product_Rate PR join Product_List PRO on PR.Product_id = PRO.Product_id", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    tblProductRate.DataSource = ds;
                    tblProductRate.DataBind();
                }
                con.Close();
            }
        }

        protected void EditBtn_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblProductRate.Rows[rowIndex].Cells[0].Text);
            string product = tblProductRate.Rows[rowIndex].Cells[1].Text;
            string rate = tblProductRate.Rows[rowIndex].Cells[2].Text;
            string dates = tblProductRate.Rows[rowIndex].Cells[3].Text;

            Response.Redirect("EditProductRate.aspx?id=" + id + "&product=" + product + "&rate=" + rate + "&dates=" + dates);
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as System.Web.UI.Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32(tblProductRate.Rows[rowIndex].Cells[0].Text);
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Product_Rate where Product_Rate_id = " + id, con);
                cmd.ExecuteNonQuery();
                getData();
                con.Close();
            }

        }

    }
}