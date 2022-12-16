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

        protected void btnApplyTest_Click(object sender, EventArgs e)
        {
            int result = 0;
            if (ddlTestTypes.SelectedItem.Value == "Network Service Discovery")
            {
                SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                connection.Open();

                var proc1 = new ProcessStartInfo();
                string anyCommand = "nmap -Pn -A -T5 --open -oN nmap_test_result.txt 127.0.0.1";
                proc1.UseShellExecute = true;
                proc1.WorkingDirectory = @"C:\Windows\SysWOW64";
                proc1.FileName = @"C:\Windows\System32\cmd.exe";
                proc1.Verb = "runas";
                proc1.Arguments = "/c " + anyCommand;
                proc1.WindowStyle = ProcessWindowStyle.Normal;
                Process.Start(proc1);

                string testResult1 = File.ReadAllText(@"C:\Windows\SysWOW64\nmap_test_result.txt");
                if (connection.State == ConnectionState.Open)
                {
                    SqlCommand command = new SqlCommand("INSERT INTO Reports (TestResult, TestCategory) " +
                          "VALUES('" + testResult1 + "','" + 1 + "')", connection);
                    result = command.ExecuteNonQuery();
                }
            }

            if (ddlTestTypes.SelectedItem.Value == "Create Account: Local Account")
            {
                //string strCmdText2 = "net user > netuser_test.txt";
                //strCmdText2 = "/C net user /add \"#{yenihesap}\" \"#{şifre}\"";
                //System.Diagnostics.Process.Start(@"C:\\Windows\\System32\\cmd.exe", "/C cd C:\\Users\\Burak");

                SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=HBSecurity;Trusted_Connection=True");
                connection.Open();

                var proc2 = new ProcessStartInfo();
                string anyCommand = "net user /add #{yenihesap} #{şifre}";
                proc2.UseShellExecute = true;
                proc2.WorkingDirectory = @"C:\Users\Burak";
                proc2.FileName = @"C:\Windows\System32\cmd.exe";
                proc2.Verb = "runas";
                proc2.Arguments = "/c " + anyCommand;
                proc2.WindowStyle = ProcessWindowStyle.Normal;
                Process.Start(proc2);

                var proc3 = new ProcessStartInfo();
                string anyCommand3 = "net user > net_user_test.txt";
                proc3.UseShellExecute = true;
                proc3.WorkingDirectory = @"C:\Users\Burak";
                proc3.FileName = @"C:\Windows\System32\cmd.exe";
                proc3.Verb = "runas";
                proc3.Arguments = "/c " + anyCommand3;
                proc3.WindowStyle = ProcessWindowStyle.Normal;
                Process.Start(proc3);

                string testResult2 = File.ReadAllText(@"C:\Windows\SysWOW64\net_user_test.txt");
                if (connection.State == ConnectionState.Open)
                {
                    SqlCommand command = new SqlCommand("INSERT INTO Reports (TestResult, TestCategory) " +
                          "VALUES('" + testResult2 + "','" + 2 + "')", connection);
                    result = command.ExecuteNonQuery();
                }
            }
        }
    }
}