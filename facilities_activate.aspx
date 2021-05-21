<%@ Page language="C#" CodeFile="facilities_activate.aspx.cs" Inherits="BoatRenting.facilities_activate_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }

    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    Marina_ID = Request["MarinaID"];
    cmd = new Command();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_MARINA_ACTIVATE_UPD";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = Marina_ID;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MarinaID"].Value = Marina_ID;
    cmd.Execute();
    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_MARINA_GET";
    cmd.CommandType = adCmdStoredProc;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MarinaID"].Value = Marina_ID;
    //cmd.Parameters[1] = Marina_ID;
    rs = cmd.Execute();
    cmd = new Command();
    rs2 = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_USER_LIST";
    cmd.CommandType = adCmdStoredProc;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MARINAID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MARINAID"].Value = Marina_ID;
    //cmd.Parameters[1] = Marina_ID;
    rs2 = cmd.Execute();
    //'sends email
    strBody = "<html>";
    strBody = strBody + "<head>";
    strBody = strBody + "<title>Welcome to BoatRenting.com!</title>";
    strBody = strBody + "<style type='text/css'>";
    strBody = strBody + "	#forgotten_password {";
    strBody = strBody + "	width: 500px;";
    strBody = strBody + "	margin-top: 20px;";
    strBody = strBody + "	text-align: center;";
    strBody = strBody + "	padding-bottom: 10px;";
    strBody = strBody + "	margin-left: auto;";
    strBody = strBody + "	margin-right: auto;";
    strBody = strBody + "	border: 1px solid #CCCCCC;";
    strBody = strBody + "	}";
    strBody = strBody + "#forgotten_password_title {";
    strBody = strBody + "	width: 100%;";
    strBody = strBody + "	clear: none;";
    strBody = strBody + "	background-color: #E9EDF1;";
    strBody = strBody + "	padding-top: 10px;";
    strBody = strBody + "	padding-bottom: 10px;";
    strBody = strBody + "	text-indent: 10px;";
    strBody = strBody + "	font-size: 10pt;";
    strBody = strBody + "	font-weight: bold;";
    strBody = strBody + "	color: #333;";
    strBody = strBody + "	}";
    strBody = strBody + "#forgotten_password_form {";
    strBody = strBody + "	width: 100%;";
    strBody = strBody + "	height: 20px;";
    strBody = strBody + "	margin-top: 10px;";
    strBody = strBody + "	margin-bottom: 20px;";
    strBody = strBody + "	}";
    strBody = strBody + "#forgotten_password a.button {";
    strBody = strBody + "	width: 100px;";
    strBody = strBody + "	text-decoration: none;";
    strBody = strBody + "	color: white;";
    strBody = strBody + "	display: block;";
    strBody = strBody + "	background-color: #FF9933;";
    strBody = strBody + "	padding-top: 1px;";
    strBody = strBody + "	padding-bottom: 1px;";
    strBody = strBody + "	padding-left: 10px;";
    strBody = strBody + "	padding-right: 10px;";
    strBody = strBody + "	font-weight: bold;";
    strBody = strBody + "	text-align: center;";
    strBody = strBody + "	margin: auto;";
    strBody = strBody + "	margin-bottom: 10px;}";
    strBody = strBody + "#forgotten_password a.button:hover {";
    strBody = strBody + "	text-decoration: underline;";
    strBody = strBody + "	}";
    strBody = strBody + "#footer_details {";
    strBody = strBody + "	padding-left: 8px;";
    strBody = strBody + "	font-size: 7pt;";
    strBody = strBody + "	color: white;";
    strBody = strBody + "	height: 10px;";
    strBody = strBody + "	line-height: 8px;";
    strBody = strBody + "	}";
    strBody = strBody + "#footer_details a{";
    strBody = strBody + "	font-size: 8pt;";
    strBody = strBody + "	color: #ccc;";
    strBody = strBody + "	text-decoration: none;";
    strBody = strBody + "	}";
    strBody = strBody + "#footer_details a:hover {";
    strBody = strBody + "	font-size: 8pt;";
    strBody = strBody + "	color: white;";
    strBody = strBody + "	font-weight: normal;";
    strBody = strBody + "	}";
    strBody = strBody + "</style>";
    strBody = strBody + "</head>";
    strBody = strBody + "<body>";
    strBody = strBody + "<table cellpadding='0' cellspacing='0' border='0'>";
    strBody = strBody + "<tr>";
    strBody = strBody + "	<td width='550' height='78' valign='middle' align='left' bgcolor='#4D8DD5'><img src='http://www.boatrenting.com/images/banner.gif'></td>";
    strBody = strBody + "</tr>";
    strBody = strBody + "<tr>";
    strBody = strBody + "	<td width='550' height='12' background='http://www.boatrenting.com/images/sub_menu_bg.gif'>&nbsp;</td>";
    strBody = strBody + "</tr>";
    strBody = strBody + "<tr>";
    strBody = strBody + "	<td width='550' align='center'>";
    strBody = strBody + "		<div id='forgotten_password'>";
    strBody = strBody + "			<div id='forgotten_password_title'>Congratulations</div>";
    strBody = strBody + "			<div style='padding-top: 30px; height: 30px; margin-bottom: 20px;'>Dear " + Convert.ToString(rs.Fields["vc_contactname"].Value) + ", thanks for your registration in our site.<br>You membership has been approved!!<br><br>";
    strBody = strBody + "				You can access and manage your information at <a href='http://www.boatrenting.com/members.aspx'>http://www.boatrenting.com</a><br>";
    strBody = strBody + "				<b>UserName</b>:&nbsp;" + Convert.ToString(rs2.Fields["vc_UserName"].Value) + "<br>";
    strBody = strBody + "				<b>Password</b>:&nbsp;" + Convert.ToString(rs2.Fields["vc_password"].Value) + "</div>";
    strBody = strBody + "		</div>	";
    strBody = strBody + "	</td>";
    strBody = strBody + "</tr>";
    strBody = strBody + "<tr>";
    strBody = strBody + "	<td width='550' height='40' background='http://www.boatrenting.com/images/footer_bg.gif'>";
    strBody = strBody + "		<div id='footer_details'>";
    strBody = strBody + "			<br><br><br>BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href='mailto:info@boatrenting.com'>info@boatrenting.com</a>";
    strBody = strBody + "		</div>	";
    strBody = strBody + "	</td>";
    strBody = strBody + "</tr>";
    strBody = strBody + "</table>";
    strBody = strBody + "</body>";
    strBody = strBody + "</html>";
    //oNewMail = new CDO.Message();
    //oNewMail.To = Convert.ToString(rs.Fields["vc_email"].Value);
    //oNewMail.From = "info@boatrenting.com";
    //oNewMail.Subject = "You have been approved at http://www.boatrenting.com !!";
    //oNewMail.HTMLBody = strBody;
    //oNewMail.Send();
    //oNewMail = null;

    //sendEmail("paul.toto@idserve.com", strBody); // <- For Testing ****0000


   // sendEmail("Kenny@boatrenting.com", strBody);

    sendEmail(Marina_ID);


    //sendEmail(Convert.ToString(rs.Fields["vc_email"].Value), strBody);

    //Dim iMsg
    //Dim iConf
    //Dim Flds
    //Dim strHTML
    //Dim strSmartHost
    //Const cdoSendUsingPort = 2
    //StrSmartHost = "209.139.124.12"
    //set iMsg = CreateObject("CDO.Message")
    //set iConf = CreateObject("CDO.Configuration")
    //Set Flds = iConf.Fields
    //set the CDOSYS configuration fields to use port 25 on the SMTP server
    //With Flds
    //.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = cdoSendUsingPort
    //.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strSmartHost
    //.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10
    //.Update
    //End With
    //apply the settings to the message
    //With iMsg
    //Set .Configuration = iConf
    //.To = request.Form("email")
    //.From = "info@boatrenting.com"
    //.Subject = "http://www.boatrenting.com - Password update"
    //.HTMLBody = strBody
    //.Send
    //End With
    //Set iMsg = Nothing
    //Set iConf = Nothing
    //Set Flds = Nothing
    rs.Close();
    rs = null;
    rs2.Close();
    rs2 = null;
    Response.Redirect("facilities_list.aspx");
%>
