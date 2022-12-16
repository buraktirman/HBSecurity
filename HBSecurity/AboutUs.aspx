<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="HBSecurity.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            /*font-family: 'Poppins', sans-serif;*/
        }

        .section {
            width: 100%;
            min-height: 100vh;
        }

        .container {
            width: 80%;
            display: block;
            margin: auto;
            padding-top: 100px;
            padding: 0 16px;
        }

            .container::after, .row::after {
                content: "";
                clear: both;
                display: table;
            }

        .content-section {
            float: left;
            width: 55%;
        }

        .image-section {
            float:left;
            width: 45%;
            
            
        }

            .image-section img {
                width: 100%;
                height: inherit;
                
                
            }

        .content-section .title {
            
            text-transform: uppercase;
            font-size: 28px;
        }

        .content-section .content h3 {
            margin-top: 20px;
            color: #5d5d5d;
            font-size: 21px;
        }

        .content-section .content p {
            margin-top: 10px;
            /*font-family: sans-serif;*/
            font-size: 18px;
            line-height: 1.5;
        }

        .content-section .content .button {
            margin-top: 30px;
        }

            .content-section .content .button a {
                background-color: #3d3d3d;
                padding: 12px 40px;
                text-decoration: none;
                color: #fff;
                font-size: 25px;
                letter-spacing: 1.5px;
            }

                .content-section .content .button a:hover {
                    background-color: cornflowerblue;
                    color: #fff;
                }

        .content-section .social {
            margin: 60px 60px;
        }

            .content-section .social i {
                color: cornflowerblue;
                font-size: 30px;
                padding: 0px 10px;
            }

                .content-section .social i:hover {
                    color: #3d3d3d;
                }
    </style>
    
        <div class="section">
            <div class="container">
                <div class="content-section">
                    <div class="title">
                        <h1 style="margin-top:150px">About Us</h1>
                    </div>
                    <div class="content">
                        <h3>Lorem ipsum dolor sit amet, consectetur adipisicing</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat.
                        </p>
                        <div class="button">
                            <a href="UserSignUp.aspx">Learn More</a>
                        </div>
                    </div>
                    <div class="social">
                        <a href="https://github.com/buraktirman" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://www.linkedin.com/in/buraktirman/" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="image-section">
                    <img src="imgs/hb_security_logo.jpg" />

                </div>
            </div>
        </div>
       
</asp:Content>
