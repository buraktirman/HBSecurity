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
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int GetUser()
        {
            int recordsAffected = 0;

            using (SqlConnection con = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True"))
            {
                SqlCommand command = new SqlCommand($"SELECT COUNT(*) FROM Users as u WHERE u.Email= '{txtEmail.Text}' AND u.Password = '{txtPassword.Text}'", con);


                try
                {
                    con.Open();
                    recordsAffected = (int)command.ExecuteScalar();
                }
                catch (SqlException)
                {
                }
                finally
                {
                    con.Close();
                }
            }

            return recordsAffected;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var result = GetUser();
            if (result == 0)
            {
                Response.Write("<script>alert('Unsuccessful login');</script>");
                Response.Redirect("UserSignup.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                SqlCommand cmd = new SqlCommand("SELECT * from Users WHERE Email='" + txtEmail.Text + "' AND Password='" + txtPassword.Text + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Successful login');</script>");
                        Session["email"] = dr.GetValue(8).ToString();
                        Session["contactname"] = dr.GetValue(2).ToString();
                        Session["user_id"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                    }
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}