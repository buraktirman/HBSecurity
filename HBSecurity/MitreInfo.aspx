<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MitreInfo.aspx.cs" Inherits="HBSecurity.MitreInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
            * {
                margin: 0px;
                padding: 0px;
                box-sizing: border-box;
            }

            .container {
                width: 100%;
            }

            .container .row {
                width: 100%;
                margin: auto;
            }

            .container .row .header {
                width: 60%;
                text-align: center;
                margin: auto;
            }

            .container .row .header h1 {
                padding-top: 30px;
                font-size: 45px;
                color: cornflowerblue;
            }

            .container .row .header p {
                margin-top: 15px;
                font-size: 18px;
                line-height: 1.5;
                color: #6e6e6e;
            }

            .content {
                display: flex;
                justify-content: center;
                align-items: flex-start;
                margin: auto;
            }

            .content .card {
                flex: 1;
                margin: 50px 20px;
                box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.1);
                background-color: #fff
            }

            .content .card img {
                width: 100%;
                height: auto;
            }

            .content .card h4 {
                margin-top: 10px;
                margin-left: 10px;
                font-size: 18px;
            }

            .content .card p {
                font-size: 15px;
                color: #6e6e6e;
                line-height: 1.5;
                padding: 10px;
            }

        @media screen and (max-width: 768px) {
            .content {
                flex-direction: column;
            }
        }
    </style>

    <div class="container">
        <div class="row">

            <div class="header">
                <h1>MITRE ATT&CK</h1>
                <p>Keywords: Cyber Security, MITRE ATT&CK, Web, Internet</p>
            </div>


            <div class="content">
                <div class="card">
                    <%--<img src="imgs/mitre_att&ck.jpg" />--%>
                    <h4>ABSTRACT</h4>
                    <p>
                        With the developing technology, the number of devices accessing the internet and 
                               websites is increasing dramatically, and the adoption of advanced hacking tools and softwares
                               greatly increases the attack potential against websites. The cyber security field tries to take 
                               measures against these attacks by examining the past cyber attacks. To address these security 
                               problems, this study examines the MITRE organization and its ATT&CK Framework which is a 
                               knowledge base that models aggressive behaviors in cyber attacks. In addition, it talks about the 
                               Network Service Discovery technique under the Discovery tactic and Create Account technique
                               under the Persistence tactic in this Framework and shows the applications of these two 
                               techniques.
                    </p>
                </div>


                <div class="card">
                    <%--<img src="imgs/mitre_reports.jpg" />--%>
                    <h4>What is MITRE ATT&CK?</h4>
                    <p>
                        MITRE ATT&CK® is a globally-accessible knowledge base of adversary tactics and techniques based on 
                                real-world observations. The ATT&CK knowledge base is used as a foundation for the development of 
                                specific threat models and methodologies in the private sector, in government, and in the cybersecurity
                                product and service community.With the creation of ATT&CK, MITRE is fulfilling its mission to solve
                                problems for a safer world — by bringing communities together to develop more effective cybersecurity.
                                ATT&CK is open and available to any person or organization for use at no charge.
                    </p>
                </div>


                <div class="card">
                    <%--<img src="imgs/mitre_corporation.png" />--%>
                    <h4>Some MITRE ATT&CK Techniques</h4>
                    <p>
                        1-Reconnaissance: gathering information to plan future adversary operations.<br />
                        2-Resource Development: establishing resources to support operations.<br />
                        3-Initial Access: trying to get into your network.<br />
                        4-Execution: trying the run malicious code.<br />
                        5-Persistence: trying to maintain their foothold.<br />
                        6-Privilege Escalation: trying to gain higher-level permissions.<br />
                        7-Defense Evasion: trying to avoid being detected.<br />
                        8-Credential Access: stealing accounts names and passwords.<br />
                        9-Discovery: trying to figure out your environment.<br />
                        10-Lateral Movement: moving through your environment.<br />
                        11-Collection: gathering data of interest to the adversary goal.<br />
                        12-Command and Control: communicating with compromised systems to control them.<br />
                        13-Exfiltration: stealing data.<br />
                        14-Impact: manipulate, interrupt, or destroy systems and data.
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
