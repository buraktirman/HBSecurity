<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HBSecurity.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup Page</title>
    <style>
        .signup {
            width: 33%;
            margin: auto;
        }
    </style>
</head>
<body>
    <form id="fSignUp" runat="server">
        <div class="signup">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblCompanyName" Text="Company Name*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtCompanyName" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server"
                            ControlToValidate="txtCompanyName" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContactName" Text="Contact Name*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtContactName" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvContactName" runat="server"
                            ControlToValidate="txtContactName" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContactTitle" Text="Contact Title*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtContactTitle" runat="server" />
                    </td>
                    <td>
                         <asp:RequiredFieldValidator ID="rfvContactTitle" runat="server"
                            ControlToValidate="txtContactTitle" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCity" Text="City" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblAddress" Text="Address" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblPostalCode" Text="Postal Code" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtPostalCode" runat="server" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCountry" Text="Country" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtCountry" runat="server" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPhone" Text="Phone*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                            ControlToValidate="txtPhone" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" Text="Email*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid email address!" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" Text="Password*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" />
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblConfirmPassword" Text="Confirm Password*" runat="server" /></td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" />
                    </td>
                    <td>
                        
                        <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Please enter the same password!" ControlToValidate="txtConfirmPassword" ForeColor="Red" ControlToCompare="txtPassword"></asp:CompareValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /> <br/>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td>
                        <p>(*) fields can not be empty.</p>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
