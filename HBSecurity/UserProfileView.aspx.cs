using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HBSecurity
{
    public partial class UserProfileView : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["role"] == null)
            {
                Response.Redirect("Home.aspx");
            }

            //GetUserPersonalDetails();
            gvMitreAttacks.DataSource = GetReports();
            gvMitreAttacks.DataBind();
        }

        void GetUserPersonalDetails()
        {

            try
            {
                SqlConnection con = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Users WHERE Email='" + Session["email"].ToString().Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                txtContactName.Text = dt.Rows[0]["ContactName"].ToString();
                txtContactTitle.Text = dt.Rows[0]["ContactTitle"].ToString();
                txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPostalCode.Text = dt.Rows[0]["PostalCode"].ToString();
                ddlCountry.SelectedValue = dt.Rows[0]["Country"].ToString().Trim();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtOldPassword.Text = dt.Rows[0]["Password"].ToString();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateUserPersonalDetails();
        }

        void UpdateUserPersonalDetails()
        {
            string password;
            if (txtNewPassword.Text.Trim() == "")
            {
                password = txtOldPassword.Text.Trim();
            }
            else
            {
                password = txtNewPassword.Text.Trim();
            }

            try
            {
                SqlConnection con = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("UPDATE Users SET CompanyName=@CompanyName, ContactName=@ContactName, ContactTitle=@ContactTitle, Phone=@Phone, Address=@Address, PostalCode=@PostalCode, Country=@Country, Email=@Email, Password=@Password WHERE Email='" + Session["email"].ToString().Trim() + "'", con);


                cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactName", txtContactName.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactTitle", txtContactTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@PostalCode", txtPostalCode.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", password);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                Session["contactname"] = txtContactName.Text.Trim();
                Session["email"] = txtEmail.Text.Trim();

                if (result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    //GetUserPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invalid entry');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnBringData_Click(object sender, EventArgs e)
        {
            GetUserPersonalDetails();
        }

        private DataTable GetReports()
        {
            string connectionString = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=HBSecurity;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            DataTable dtTests = new DataTable();

            if (connection.State == ConnectionState.Open)
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT u.ContactName, t.Name , r.TestResult, r.TestDate FROM Users u, Reports r, Tests t WHERE u.Id = r.UserId AND t.Id = r.TestId AND u.Email ='" + Session["email"].ToString().Trim() + "'", connection);
                adapter.Fill(dtTests);
            }

            return dtTests;
        }
    }
}