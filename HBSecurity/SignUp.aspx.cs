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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private int InsertCustomer(string companyName, string contactName, string contactTitle, string city, string address, string postalCode, string country, string phone, string email, string password)
        {
            int result = 0;
            string connectionString = "Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            if (connection.State == ConnectionState.Open)
            {
                SqlCommand command = new SqlCommand("INSERT INTO Users (CompanyName,ContactName,ContactTitle,City,Address,PostalCode,Country,Phone,Email,Password) " +
                      "VALUES('" + companyName + "','" + contactName + "','" + contactTitle + "','" + city + "','" + address + "','" + postalCode + "','" + country + "','" + phone + "','" + email + "','" + password + "')", connection);
                result = command.ExecuteNonQuery();
            }

            return result;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int result = InsertCustomer(txtCompanyName.Text, txtContactName.Text, txtContactTitle.Text, txtCity.Text, txtAddress.Text, txtPostalCode.Text, txtCountry.Text, txtPhone.Text, txtEmail.Text, txtPassword.Text);
            if (result > 0)
            {
                lblMessage.Text = "Your company recorded successfully!";
            }
            else
            {
                lblMessage.Text = "Your company could not registered. Try again! ";
            }
        }
    }
}