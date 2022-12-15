using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HBSecurity
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private int GetCustomer()
        {
            int affectedRecords = 0;

            using (SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True"))
            {
                SqlCommand command = new SqlCommand("SELECT u.Email, u.Password FROM Users as u WHERE u.Email = @Email and u.Password = @Password", connection);

                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                command.Parameters.AddWithValue("@Password", txtPassword.Text);

                try
                {
                    connection.Open();
                    affectedRecords = command.ExecuteNonQuery();
                }
                catch (SqlException)
                {
                }
                finally
                {
                    connection.Close();
                }
            }

            return affectedRecords;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var result = GetCustomer();
            if (result == 0)
            {
                Response.Redirect("SignUp.aspx");
            }
            else
            {
                Response.Redirect("Home.html");
            }
        }
    }
}