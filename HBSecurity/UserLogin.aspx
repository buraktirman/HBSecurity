<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="HBSecurity.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="Images/user_login.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblEmail" Text="Email" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                                </div>
                                <asp:Label ID="lblPassword" Text="Password" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" BackColor="#573b8a" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                </div>
                                <%--<div class="form-group">
                                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" />
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="Home.aspx"><- Return to Homepage</a><br>
                <br>
            </div>
        </div>
    </div>


</asp:Content>
