<%@ Page language="C#" CodeFile="displayad.aspx.cs" Inherits="BoatRenting.displayad_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="includes/__dbconnection.aspx"-->
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    if (((Convert.ToString(Session["Kart"]) == "") || ((Convert.ToString(Session["Kart"])).Substring(0, 3) == "adm")))
    {
        VBMath.Randomize();
        varSession = "";
        for(i = 0; i <= 50; i += 1)
        {
            varSession = varSession + "" + Convert.ToString(Conversion.Int(((float)6.0 * VBMath.Rnd()) + (float)1.0));
        }
        Session.Add("Kart", varSession);
    }
    countryID = 1;
    facilityID = 0;
    boatID = 0;
    bodyID = 0;
    cityVAL = "";
    zipVAL = "";
    if (!(Request["country"] == ""))
    {
        countryID = Request["country"];
    }
    if (!(Request["boat"] == ""))
    {
        boatID = Request["boat"];
    }
    if (!(Request["facility"] == ""))
    {
        facilityID = Request["facility"];
    }
    if (!(Request["city"] == ""))
    {
        cityVAL = Request["city"];
    }
    if (!(Request["zip"] == ""))
    {
        zipVAL = Request["zip"];
    }
    if (!(Request["bodyOfWater"] == ""))
    {
        bodyID = Request["bodyOfWater"];
    }
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_NEWBOATS_MONTH";
    cmd.CommandType = adCmdStoredProc;
    rs.CursorType = (nce.adodb.CursorType)3;
    rs.CursorLocation = (nce.adodb.CursorLocation)3;
    rs.Open(cmd);
%>
<html>
<head>
<title>Boat Rentals, Worldwide Yacht Charters and Sailboat Rental </title>
<style type="text/css" media="screen">
@import "br.css";.Estilo1 {font-size: 9px}
</style>
<meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
<meta name="description" content="Find Online Boat Rental, Sailboat Charters and Yacht Reservations. View boat photos, availability and reserve online. Rated #1 in customer satisfaction">
<meta name="robots" content="index, follow">
<meta name="revisit-after" content="15 days">
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />

    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<div id="container">
		<div id="banner" style="width: 779; height: 102"></div>
		<div id="menu" style="width: 912; height: 246">
			<ul>
				<li id="current"><a href="default.aspx">Home</a></li>

				<li id="<%= c12 %>"><a href="javascript:QuickSearch(2)">Cabin</a></li>
				<li id="<%= c8 %>"><a href="javascript:QuickSearch(3)">Charters</a></li>
				<li id="<%= c10 %>"><a href="javascript:QuickSearch(5)">Diving</a></li>
				<li id="<%= c9 %>"><a href="javascript:QuickSearch(6)">Excursions</a></li>
				<li id="<%= c1 %>"><a href="javascript:QuickSearch(7)">Fishing</a></li>
				<li id="<%= c13 %>"><a href="javascript:QuickSearch(8)">Houseboat</a></li>
				<li id="<%= c7 %>"><a href="javascript:QuickSearch(9)">Jet Ski</a></li>
				<li id="<%= c4 %>"><a href="javascript:QuickSearch(10)">Paddle</a></li>
				<li id="<%= c11 %>"><a href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li id="<%= c2 %>"><a href="javascript:QuickSearch(12)">Sailing</a></li>
				<li id="<%= c6 %>"><a href="javascript:QuickSearch(13)">Speed</a></li>
				<li id="<%= c5 %>"><a href="javascript:QuickSearch(14)">Yachts</a></li>

			</ul>
		</div>
		<!-- SUB MENU -->
		<table cellpadding="0" cellspacing="0" width="780" height="26" style="background: url('images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; color: #666">
		<tr>
			<td width="29"></td>
			<td width="657">
			<a href="default.aspx">Home</a>&nbsp;|&nbsp;
			<a href="rentwithus.aspx">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Members</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="sitemap.aspx">Site Map</a>
			</td>
			<td width="130">
			<div><a href="members.aspx" class="buttonMenu-Sign" style="color:white;"> <b>
			Manager Sign In</b></div></a></td>
		</tr>
		</table>
		<!-- SUB MENU -->		<!--<div id="sub_menu">
			<a href="default.aspx">Home</a>&nbsp;|&nbsp;<a href="rentwithus.aspx">Rent With Us</a>&nbsp;|&nbsp;<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;<a href="members.aspx">Members</a> <a href="members.aspx" class="button" ><b>Sign In</b></a>
		</div>
		-->
		<div id="displayad" style="width: 898; height: 218">
<html>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
				<table border="0" cellspacing="0" cellpadding="0" width="650" height="65">
					<tr>
						<td height="65" width="125" align="center">
						<a class="button" href="howto.htm">How To</a></td>
						<td height="65" width="125" align="center">
						<a class="button" href="members.aspx">
						Facility Login</a></td>
						<td height="65" width="125" align="center">
						<a class="button" href="facilities_mant.aspx">
						New Facility</a></td>
						<td height="65" width="125" align="center">
						<a class="button" href="rentwithus.aspx">
						Learn More</a></td>
						<td height="65" width="150" align="center">
						<a class="button" href="#">
						New Captain</a></td>
					</tr>
</table>
<br>		
<!--SiteSeal Html Builder Code:
Shows the logo at URL https://seal.networksolutions.com/images/basicrecblue.gif
Logo type is  ("NETSB")
//--><script language="JavaScript" type="text/javascript"> SiteSeal("https://seal.networksolutions.com/images/basicrecblue.gif", "NETSB", "none");</script>.<map name="FPMap0"><area coords="423, 519, 690, 619" shape="rect" href="http://www.boatrenting.com/client/addaboat.aspx"><area href="http://www.boatrenting.com/client/picupload.aspx" shape="rect" coords="329, 297, 700, 342"></map><img border="0" src="images/displayad.gif" usemap="#FPMap0"><p>BoatRenting.com · 320 South Country Road · Brookhaven/Bellport
				NY 11719 · 631-286-7816 · <a href="mailto:info@boatrenting.com">
				info@boatrenting.com</a> <br>




		</p>




		<div id="footer" style="width: 719; height: 180">
<html>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
			<div id="footer_details" style="width: 882; height: 71">
				&nbsp;</div>
		




</body>
</html>

