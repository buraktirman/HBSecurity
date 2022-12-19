<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HBSecurity.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
      <img src="imgs/cybersecurity-banner.jpg" width="100%"  class="img-fluid" /> <%--Auto resized image--%>
   </section>
    <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Area of Expertise</h2>
                  <p><b>2 Main Missions</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-6"> <%--<col-md-6: It will occupy 6 space, as the device size greater than medium size.>--%> 
               <center>
                  <img width="400px" height="180px" src="Images/mitre_corporation.png"/>
                  <h4>Information About MITRE</h4>
                  <p class="text-justify">You can find useful information about MITRE foundation and its activities.</p>
               </center>
            </div>
            <div class="col-md-6">
               <center>
                   <img  width="400px" height="180px" src="Images/mitre_att&ck.jpg" />
                  <h4>MITTRE ATT&CK Tests</h4>
                  <p class="text-justify">We provide 2 kinds of MITRE ATT&CK tests for your company. You can apply and see the results.</p>
               </center>
            </div>
            
         </div>
      </div>
   </section>
</asp:Content>
