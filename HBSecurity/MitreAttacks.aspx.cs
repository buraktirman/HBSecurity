using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HBSecurity
{
    public partial class MitreAttacks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void CheckCreateAccountSelected(object sender, EventArgs e)
        {
            if (ddlTestTypes.SelectedItem.Value == "Create Account: Local Account")
            {
                lblAccountName.Visible = true;
                txtAccountName.Visible = true;
                lblAccountPassword.Visible = true;
                txtAccountPassword.Visible = true;
            }
            else
            {
                lblAccountName.Visible = false;
                txtAccountName.Visible = false;
                lblAccountPassword.Visible = false;
                txtAccountPassword.Visible = false;
            }
        }

        protected void btnApplyTest_Click(object sender, EventArgs e)
        {
            if (ddlTestTypes.SelectedItem.Value == "Network Service Discovery")
            {
                SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                connection.Open();

                var procInfo1 = new ProcessStartInfo();
                string testCommand = "nmap -Pn -A -T5 --open -oN nmap_test_result.txt 127.0.0.1";
                procInfo1.UseShellExecute = true;
                procInfo1.WorkingDirectory = @"C:\Windows\SysWOW64";
                procInfo1.FileName = @"C:\Windows\System32\cmd.exe";
                procInfo1.Verb = "runas";
                procInfo1.Arguments = "/K " + testCommand;
                procInfo1.WindowStyle = ProcessWindowStyle.Normal;
                Process process = Process.Start(procInfo1);
                process.WaitForExit();
                
                string testResult1 = File.ReadAllText(@"C:\Windows\SysWOW64\nmap_test_result.txt");
                if (connection.State == ConnectionState.Open)
                {
                    string today = DateTime.Today.ToString("yyyy-MM-dd");
                    SqlCommand command = new SqlCommand("INSERT INTO Reports (TestResult, TestId, UserId, TestDate) " +
                            "VALUES('" + testResult1 + "','" + 1 + "','" + Session["user_id"].ToString().Trim() + "','" + today + "')", connection);
                    command.ExecuteNonQuery();
                }
            }

            if (ddlTestTypes.SelectedItem.Value == "Create Account: Local Account")
            {
                SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                connection.Open();

                string accountName = txtAccountName.Text;
                string accountPassword = txtAccountPassword.Text;

                var procInfo2 = new ProcessStartInfo();
                string testCommand2 = $"net user /add {txtAccountName.Text} {txtAccountPassword.Text}";
                procInfo2.UseShellExecute = true;
                procInfo2.WorkingDirectory = @"C:\Windows\SysWOW64";
                procInfo2.FileName = @"C:\Windows\System32\cmd.exe";
                procInfo2.Verb = "runas";
                procInfo2.Arguments = "/K " + testCommand2;
                procInfo2.WindowStyle = ProcessWindowStyle.Normal;
                Process process2 = Process.Start(procInfo2);
                process2.WaitForExit();

                var procInfo3 = new ProcessStartInfo();
                string testCommand3 = "net user > net_user_test.txt";
                procInfo3.UseShellExecute = true;
                procInfo3.WorkingDirectory = @"C:\Windows\SysWOW64";
                procInfo3.FileName = @"C:\Windows\System32\cmd.exe";
                procInfo3.Verb = "runas";
                procInfo3.Arguments = "/K " + testCommand3;
                procInfo3.WindowStyle = ProcessWindowStyle.Normal;
                Process process3 = Process.Start(procInfo3);
                process3.WaitForExit();

                string testResult2 = File.ReadAllText(@"C:\Windows\SysWOW64\net_user_test.txt");
                if (connection.State == ConnectionState.Open)
                {
                    string today = DateTime.Today.ToString("yyyy-MM-dd");
                    SqlCommand command = new SqlCommand("INSERT INTO Reports (TestResult, TestId, UserId, TestDate) " +
                          "VALUES('" + testResult2 + "','" + 2 + "','" + Session["user_id"].ToString().Trim() + "','" + today + "')", connection);
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}