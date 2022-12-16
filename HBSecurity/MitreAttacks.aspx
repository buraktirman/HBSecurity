<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MitreAttacks.aspx.cs" Inherits="HBSecurity.MitreAttacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">  <%--mx auto to center.--%>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/logo.png" /> <br /> <br />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Apply Mitre Attack Tests</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <asp:Label ID="lblTestType" runat="server" Text="Test Type"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlTestTypes" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Network Service Discovery" Value="Network Service Discovery" />
                                        <asp:ListItem Text="Create Account: Local Account" Value="Create Account: Local Account" />
                                        <asp:ListItem Text="Network Sniffing" Value="Network Sniffing" />
                                        <asp:ListItem Text="Phishing" Value="Phishing" />
                                        <asp:ListItem Text="Account Manipulation" Value="Account Manipulation" />
                                        <asp:ListItem Text="Email Collection" Value="Email Collection" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnApplyTest" runat="server" Text="Apply Test" OnClick="btnApplyTest_Click" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
