<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="HBSecurity.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">  <%--mx auto to center.--%> <%--Validators are commented -> Do not work properly.--%>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="Images/user_login.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Sign Up</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCompanyName" Text="Company Name" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtCompanyName" runat="server" placeholder="Ex: Vindum LLC"></asp:TextBox>
                                   <%-- <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server"
                                        ControlToValidate="txtCompanyName" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblContactName" Text="Contact Name" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtContactName" runat="server" placeholder="Ex: Hasan Uysal"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvContactName" runat="server"
                                        ControlToValidate="txtContactName" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="lblContactTitle" Text="Contact Title" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtContactTitle" runat="server" placeholder="Ex: CEO"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvContactTitle" runat="server"
                                        ControlToValidate="txtContactTitle" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblPhone" Text="Phone" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtPhone" runat="server" placeholder="Ex: +15555555555"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                                        ControlToValidate="txtPhone" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label ID="lblAddress" Text="Address" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" placeholder="Ex: 385 FRANKLIN AVE STE 2A"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPostalCode" Text="Postal Code" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPostalCode" runat="server" placeholder="Ex: 07866"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlCountry" runat="server">
                                        <asp:ListItem Text="Select" Value="" />
                                        <asp:ListItem Text="Germany" Value="Germany" />
                                        <asp:ListItem Text="Spain" Value="Spain" />
                                        <asp:ListItem Text="France" Value="France" />
                                        <asp:ListItem Text="England" Value="England" />
                                        <asp:ListItem Text="Morocco" Value="Morocco" />
                                        <asp:ListItem Text="Argentina" Value="Argentina" />
                                        <asp:ListItem Text="Mexico" Value="Mexico" />
                                        <asp:ListItem Text="Turkey" Value="Turkey" />
                                        <asp:ListItem Text="Switzerland" Value="Switzerland" />
                                        <asp:ListItem Text="Sweden" Value="Sweden" />
                                        <asp:ListItem Text="Russia" Value="Russia" />
                                        <asp:ListItem Text="United States" Value="United States" />
                                        <asp:ListItem Text="Portugal" Value="Portugal" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label ID="lblEmail" Text="Email" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtEmail" runat="server" placeholder="Ex: johnsmith@gmail.com"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="txtEmail" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter a valid email address!" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPassword" Text="Password" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                        ControlToValidate="txtPassword" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblConfirmPassword" Text="Confirm Password" runat="server" /><b style="color: red">*</b>
                                <div class="form-group">
                                    <asp:TextBox required="true" CssClass="form-control" ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                                        ControlToValidate="txtCOnfirmPassword" ErrorMessage="This field can not be empty!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    <br />
                                    <asp:CompareValidator ID="cvConfirmPassword" runat="server" ErrorMessage="Passwords are not matching!" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />

</asp:Content>
