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
    public partial class Invoice : System.Web.UI.Page
    {
        private string cs = "data source=JANVI-DESAI\\SQLEXPRESS; database=Party_Product; Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("select Party_Name from Party_List", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    slctParty.DataSource = ds;
                    slctParty.DataBind();
                    slctParty.Items.Insert(0, new ListItem("Select Party", "0"));
                    con.Close();
                }

                lblTotal.Visible = false;
                btnCloseInvoice.Visible = false;
            }
        }

        protected void getData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spGetInvoice", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    tblInvoice.DataSource = ds;
                    tblInvoice.DataBind();
                }
                con.Close();
            }
        }

        protected void addInvoice_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string party = slctParty.SelectedValue;
                string product = slctProduct.SelectedValue;
                int party_id, product_id;

                if (party == "0" || product == "0")
                {
                    lblInvoiceStatus.Text = "You have to select party and product BOTH...!!!";
                    lblInvoiceStatus.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
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

                    //Add into imvoice
                    if (txtRate.Text != "")
                    {
                        SqlCommand cmd = new SqlCommand("spAddInvoice", con);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@party", party_id);
                        cmd.Parameters.AddWithValue("@product", product_id);
                        cmd.Parameters.AddWithValue("@rate", System.Convert.ToInt32(txtRate.Text));
                        cmd.Parameters.AddWithValue("@quantity", System.Convert.ToInt32(txtQuantity.Text));
                        int n = cmd.ExecuteNonQuery();

                        lblInvoiceStatus.Text = "Data inserted Successfully..!!";
                        lblInvoiceStatus.ForeColor = System.Drawing.Color.Green;
                        getData();

                        SqlDataAdapter daTotal = new SqlDataAdapter("Select sum(total) as Sum from Invoice", con);
                        DataSet dsTotal = new DataSet();
                        daTotal.Fill(dsTotal);
                        DataRow drTotal = dsTotal.Tables[0].Rows[0];
                        txtTotal.Text = drTotal["Sum"].ToString();

                        con.Close();

                        slctParty.SelectedValue = "0";
                        txtRate.Text = "";
                        txtQuantity.Text = "";
                        slctProduct.SelectedValue = "0";
                        lblInvoiceStatus.Text = "";

                        lblTotal.Visible = true;
                        btnCloseInvoice.Visible = true;
                        tblInvoice.Visible = true;
                    }
                    else
                    {
                        lblInvoiceStatus.Text = "You have to enter Rate ...!!!";
                        lblInvoiceStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void slctParty_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string party = slctParty.SelectedValue;
                int party_id;

                //FindControl Id of Party
                SqlDataAdapter daParty = new SqlDataAdapter("spFindDuplicateParty", con);
                daParty.SelectCommand.CommandType = CommandType.StoredProcedure;
                daParty.SelectCommand.Parameters.AddWithValue("@party", party);
                DataSet dsParty = new DataSet();
                daParty.Fill(dsParty);
                DataRow drParty = dsParty.Tables[0].Rows[0];
                party_id = System.Convert.ToInt32(drParty["Party_id"]);

                SqlCommand cmd = new SqlCommand("spGetproductbyPartyId", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@party", party_id);
                DataSet ds = new DataSet();
                da.Fill(ds);
                cmd.ExecuteReader();
                slctProduct.DataSource = ds;
                slctProduct.DataBind();
                slctProduct.Items.Insert(0, new ListItem("Select Product", "0"));
                con.Close();
            }
        }

        protected void slctProduct_SelectedIndexChanged(object sender, EventArgs e)
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

                if(party_id == 0 || product_id == 0)
                {
                    lblInvoiceStatus.Text = "You have to selct party and product both";
                    lblInvoiceStatus.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    SqlDataAdapter daRate = new SqlDataAdapter("spGetRate", con);
                    daRate.SelectCommand.CommandType = CommandType.StoredProcedure;
                    daRate.SelectCommand.Parameters.AddWithValue("@party", party_id);
                    daRate.SelectCommand.Parameters.AddWithValue("@product", product_id);
                    DataSet dsRate = new DataSet();
                    daRate.Fill(dsRate);
                    if (dsRate.Tables[0].Rows.Count == 0)
                    {
                        txtRate.Text = "";
                    }
                    else
                    {
                        DataRow drRate = dsRate.Tables[0].Rows[0];
                        txtRate.Text = drRate["Rate"].ToString();
                    }
                    con.Close();
                }
                
            }
        }

        protected void btnCloseInvoice_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Invoice", con);
                int n = cmd.ExecuteNonQuery();

                lblTotal.Visible = false;
                btnCloseInvoice.Visible = false;
                txtTotal.Text = "";
                tblInvoice.Visible = false;
            }
        }
    }
}