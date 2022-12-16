using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HBSecurity
{
    public partial class UserSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int InsertUser(string companyName, string contactName, string contactTitle, string phone, string address, string postalCode, string country, string email, string password)
        {
            int result = 0;
            string connectionString = "Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            if (connection.State == ConnectionState.Open)
            {
                SqlCommand command = new SqlCommand("INSERT INTO Users (CompanyName,ContactName,ContactTitle,Phone,Address,PostalCode,Country,Email,Password) " +
                      "VALUES('" + companyName + "','" + contactName + "','" + contactTitle + "','" + phone + "','" + address + "','" + postalCode + "','" + country + "','" + email + "','" + password + "')", connection);
                result = command.ExecuteNonQuery();
            }

            return result;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            int result = InsertUser(txtCompanyName.Text, txtContactName.Text, txtContactTitle.Text, txtPhone.Text, txtAddress.Text, txtPostalCode.Text, ddlCountry.Text, txtEmail.Text, txtPassword.Text);
            if (result > 0)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                //Response.Redirect("UserSignUp.aspx");
            }
        }
    }
}