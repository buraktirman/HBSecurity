<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HBSecurity.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        .login {
            /*width: 33%;*/
            margin: 0;
            position: absolute;
            top: 37%;
            left: 34%;
        }
        .auto-style1 {
            /*width: 33%;*/
            margin: 0;
            position: absolute;
            top: 37%;
            left: 39%;
        }

    </style>
</head>
<body>
    <form id="fLogin" runat="server">
        <div class="auto-style1">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" Text="Email" runat="server" /></td>
                    <td>
                        
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="This field can not be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" Text="Password" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="This field can not be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        

                    </td>
                     
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
