using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HBSecurity
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    btnLogin.Visible = true; // user login link button
                    btnSignUpRedirect.Visible = true; // sign up link button

                    btnLogout.Visible = false; // logout link button
                    btnUserProfileView.Visible = false; // user link button
                    btnApplyTest.Visible = false;

                }
                else if (Session["role"].Equals("user"))
                {
                    btnLogin.Visible = false; // user login link button
                    btnSignUpRedirect.Visible = false; // sign up link button

                    btnLogout.Visible = true; // logout link button
                    btnUserProfileView.Visible = true; // hello user link button
                    btnApplyTest.Visible = true;
                    btnUserProfileView.Text = "Hello " + Session["contactname"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnUserProfileView_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfileView.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }
        protected void btnSignUpRedirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = "";
            Session["contactname"] = "";
            Session["role"] = "";

            btnLogin.Visible = true; // user login link button
            btnSignUpRedirect.Visible = true; // sign up link button

            btnLogout.Visible = false; // logout link button
            btnUserProfileView.Visible = false; // hello user link button
            btnApplyTest.Visible = false;

            Response.Redirect("Home.aspx");
        }

        protected void btnApplyTest_Click(object sender, EventArgs e)
        {
            Response.Redirect("MitreAttacks.aspx");
        }
    }
}