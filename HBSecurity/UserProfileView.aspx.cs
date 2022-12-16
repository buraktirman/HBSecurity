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
    public partial class UserProfileView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
            //    try
            //    {
            //        if (Session["ContactName"].ToString() == "" || Session["ContactName"] == null)
            //        {
            //            Response.Write("<script>alert('Session Expired Login Again');</script>");
            //            Response.Redirect("UserLogin.aspx");
            //        }
            //        else
            //        {

            //            if (!Page.IsPostBack)
            //            {
            //                getUserPersonalDetails();
            //            }

            //        }
            //    }
            //    catch (Exception ex)
            //    {

            //        Response.Write("<script>alert('Session Expired Login Again');</script>");
            //        Response.Redirect("UserLogin.aspx");
            //    }
            getUserPersonalDetails();

            if (Session["role"] == null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        void getUserPersonalDetails()
        {

            try
            {
                SqlConnection con = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Users WHERE Id='" + 2  + "';", con);
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

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateUserPersonalDetails();
        }

        void updateUserPersonalDetails()
        {
            string password = "";
            if (txtOldPassword.Text.Trim() == "")
            {
                password = txtNewPassword.Text.Trim();
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


                SqlCommand cmd = new SqlCommand("UPDATE Users SET CompanyName=@CompanyName, ContactName=@ContactName, ContactTitle=@ContactTitle, Phone=@Phone, Address=@Address, PostalCode=@PostalCode, Country=@Country, Email=@Email, Password=@Password WHERE Email='" + "tayfun@gmail.com" + "'", con);

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
                if (result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}