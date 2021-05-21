<%@ Page language="C#" CodeFile="gps1.aspx.cs" Inherits="BoatRenting.gps1_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    Session.Timeout = 740;
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
<title>Boat rental Business Equipment </title>
<style type="text/css" media="screen">
@import "br.css";.Estilo1 {font-size: 9px}
</style>
<meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, 

sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat 

rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht 

charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
<meta name="description" content="Equip you Boat rental fleet with the latest in boat rental Business Equipment">
<meta name="robots" content="index, follow">
<meta name="revisit-after" content="15 days">
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<script language="JavaScript" 

src="https://seal.networksolutions.com/siteseal/javascript/siteseal.js" 

type="text/javascript"></script>

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<div id="container">
		<div id="banner" style="width: 779; height: 102"></div>
		<div id="menu" style="width: 912; height: 246">
			<ul>
				<li id="current"><a href="default.aspx">Home</a></li>

				<li id="<%= c12 %>"><a 

href="javascript:QuickSearch(2)">Cabin</a></li>
				<li id="<%= c8 %>"><a 

href="javascript:QuickSearch(3)">Charters</a></li>
				<li id="<%= c10 %>"><a 

href="javascript:QuickSearch(5)">Diving</a></li>
				<li id="<%= c9 %>"><a 

href="javascript:QuickSearch(6)">Excursions</a></li>
				<li id="<%= c1 %>"><a 

href="javascript:QuickSearch(7)">Fishing</a></li>
				<li id="<%= c13 %>"><a 

href="javascript:QuickSearch(8)">Houseboat</a></li>
				<li id="<%= c7 %>"><a href="javascript:QuickSearch(9)">Jet 

Ski</a></li>
				<li id="<%= c4 %>"><a 

href="javascript:QuickSearch(10)">Paddle</a></li>
				<li id="<%= c11 %>"><a 

href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li id="<%= c2 %>"><a 

href="javascript:QuickSearch(12)">Sailing</a></li>
				<li id="<%= c6 %>"><a 

href="javascript:QuickSearch(13)">Speed</a></li>
				<li id="<%= c5 %>"><a 

href="javascript:QuickSearch(14)">Yachts</a></li>

			</ul>
		</div>
		<!-- SUB MENU -->
		<table cellpadding="0" cellspacing="0" width="781" height="25" 

style="background: url('images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; 

color: #666">
		<tr>
			<td width="29" height="25"></td>
			<td width="727" height="25">
			<a href="default.aspx">Home</a>&nbsp;| &nbsp;
			<a href="rentwithus.aspx">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="Articles.aspx">Articles</a>&nbsp;|&nbsp;
			<a href="In_the_News.aspx">In the News</a>&nbsp;|&nbsp;
			<a href="sitemap.aspx">Site Map</a>
			</td>
					</tr>
		</table>
		<!-- SUB MENU -->		<!--<div id="sub_menu">
			<a href="default.aspx">Home</a>&nbsp;|&nbsp;<a 

href="rentwithus.aspx">Rent With Us</a>&nbsp;|&nbsp;<a href="contactus.aspx">Contact 

Us</a>&nbsp;|&nbsp;<a href="members.aspx">Members</a> <a href="members.aspx" class="button" 

><b>Sign In</b></a>
		</div>
		-->		<!--
		<div id="main_boat_picture" style="width: 912; height: 35"><a 

href="http://www.discoverboating.com/contests/bestboatname.aspx" target="_blank"><img 

src="images/boat_home.jpg"></a></div>
		-->
		
		
		
		
		<div id="search_field_new">
			<div id="search_new" style="width: 779; height: 100">
				<h1> <font size="2" color="#0000A0"> <span> Step 1 

&nbsp;&nbsp;&nbsp; </span></font><font size="2" color="#990000">  Find a 

Boat&nbsp;&nbsp;&nbsp;
                 <span style="font-weight: 400"><font face="Arial">Choose a 

location</font></span></font></h1>
					<form name="frm_search" action="" method="post">
					<input type="hidden" name="country" value = 0>
					<input type="hidden" name="state" value = 0>
					<input type="hidden" name="bodyOfWater" value = 0>
					<input type="hidden" name="zip" value = "">
					<input type="hidden" name="city" value = "">
					<input type="hidden" name="facility" value = 0>
					<input type="hidden" name="boat" value = 0>
					<!--<input type="hidden" name="txt_city" value = 

"">-->
					<input type="hidden" name="hdnBoatID">
					<input type="hidden" name="hdnMarinaID">
					<input type="hidden" name="hdnRating">


					<!-- Beginning of the Table Find a Boat -->
					<div align=center>
						<table align=left border="0" 

style="font-family: Arial; font-size: 10px" cellspacing="0" cellpadding="0">
							<tr>
								<td 

align="right">Country:&nbsp;&nbsp;</td>
								<td ><%
    Country();
%>
</td>
								<td 

align="right">&nbsp;&nbsp;State:&nbsp;&nbsp;</td>
								<td width="80px" ><%
    States();
%>
</td>
								
									<td  

align="right">&nbsp;&nbsp;&nbsp;City:&nbsp;&nbsp;</td>
											<td 

style="text-indent: 5">

											

<input type="text" name="txt_city" class="city1" tabindex="7" 

value="<%= Request.Form["txt_city"] %>" style="width:107px" size="20">
											

&nbsp;&nbsp;
											

</td>
											
									
											

<td>Zip Code 
											

<input type="text" name="txt_zip" class="zip1" tabindex="2" 

value="<%= Request.Form["txt_zip"] %>" onchange="javascript:cmb_zip.value=30;" size="20">
											

Within
											

<select name="cmb_zip" class="water" tabindex="3" style="width:70px">
												

<option value="0" <%
    if (Request.Form["cmb_zip"] == "")
    {
%>
selected<%
    }
%>
>- Miles 

-</option>
												

<option value="5" <%
    if (Request.Form["cmb_zip"] == "5")
    {
%>
selected<%
    }
%>
>
												

05 miles</option>
												

<option value="10" <%
    if (Request.Form["cmb_zip"] == "10")
    {
%>
selected<%
    }
%>
>
												

10 miles</option>
												

<option value="20" <%
    if (Request.Form["cmb_zip"] == "20")
    {
%>
selected<%
    }
%>
>
												

20 miles</option>
												

<option value="30" <%
    if (Request.Form["cmb_zip"] == "30")
    {
%>
selected<%
    }
%>
>
												

30 miles</option>
												

<option value="50" <%
    if (Request.Form["cmb_zip"] == "50")
    {
%>
selected<%
    }
%>
>
												

50 miles</option>
											

</Select> of this Zip</td>
											
								
							</tr>
							
							
							
							<tr>
							<tr>
										<td 

colspan="3" align="center" height="20"  >
								                        

&nbsp;    &nbsp;   &nbsp;
										</td>
						</tr>
							<tr>
							<td colspan="7" align="center">
							<table border="0" id="table3" 

style="font-family: Arial; font-size: 10px" cellspacing="0" cellpadding="0">
								<tr>
									<td 

width="40px"></td>
									<td><a  

href="javascript:Search()" class="button">
									Search</a></td>
									<td><a 

href="javascript:Clear()" class="button">
									Clear</a>

									</td>
									<td>&nbsp;    &nbsp; 

  &nbsp; </td>
									<td>
									<h1><a 

href="./advancesearch.aspx" target="_self" > Advance Search </a></h1>
									</td>
								</tr>
								
							</table>

							</td>
						</tr>
						
					
						
						<tr style="display:none">
								<td colspan="4" 

align="center">
									<table border="0" 

id="table1" style="font-family: Arial; font-size: 10px">
										
										
										<tr>
											<td 

width="94" align="right">Body of
											

Water:</td>
											<td 

style="text-indent: 5"><%
    BodyWater();
%>
											

&nbsp;&nbsp;Optional
											

</td>
										</tr>
										
										<tr>
											<td 

width="94" align="right">
											

Facility:</td>
											<td 

style="text-indent: 5"><%
    Facility();
%>
											

&nbsp;&nbsp;Optional
											

</td>
										</tr>
										<tr>
											<td 

colspan="2" style="font-size: 12px; font-family: Arial; font-weight: bold">
											

<table border="0" width="100%" id="table6" cellspacing="0" cellpadding="0">
												

<tr>
												

	<td width="56px"></td>
												

	<td></td>
												

</tr>
											

</table>
											

</td>
										</tr>

										<tr 

style="display:none">
											<td 

width="94" align="right">Boat Type:</td>
											<td 

style="text-indent: 5"><%
    BoatType();
%>
</td>
										</tr>
										<tr>
											<td 

colspan="2" style="font-family: Arial; font-size: 12px; font-weight: bold">
											

<table border="0" width="100%" id="table7" cellspacing="0" cellpadding="0">
												

<tr>
												

	<td width="56px"></td>
												

	<td>or</td>
												

</tr>
											

</table>
											

</td>
										</tr>
									</table>
								</td>
							</tr>
							
							
									
									
										
									
									
								
						
						
									
							
							
					
						
					

				</table>
		              </div>
		              <!-- Ending of the Table Find a Boat -->
					</form>
						</div>
				
 		
				</div>
		<p style="text-align: center">
		<br>
		&nbsp;&nbsp; <b><font size="5">Boat Rental Equipment</font></b></p>





		<p style="text-align: center"><font size="5"><b>GPS Tracking Device</b></font></p>





		<p style="text-align: center">
        <img border="0" src="images/img587.jpg" width="249" height="201">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img border="0" src="images/GPS_tracking-12.jpg" width="284" height="203">&nbsp;&nbsp;&nbsp;&nbsp;
        <img border="0" src="images/gps-satellite.jpg" width="263" height="202"></p>





		<p>&nbsp;</p>





		<p align="left"><b>Marine Applications </b></p>
        <ul>
          <li>
          <p align="left">Monitor &amp; Log Operation Times &amp; Locations </li>
          <li>Geo- Fencing Notifies Marina Centre </li>
          <li>Boat has Lost Mooring, </li>
          <li>Taking Water </li>
          <li>Security Breach </li>
          <li>Automatic or Remote Control Activation of Bilge Pumps, Beacons etc
          </li>
          <li>Report Service Schedules </li>
          <li>Report SOS </li>
          <li>Reporting to Host PC and Marina &amp; SMS </li>
          <li>GPS Navigation </li>
          <li>Voice Communication </li>
        </ul>





		<p>&nbsp;</p>





		<div id="footer">
			<div id="footer_details">
				BoatRenting.com � 320 South Country Road � 

Brookhaven/Bellport
				NY 11719 � 631-286-7816 � <a 

href="mailto:info@boatrenting.com">
				info@boatrenting.com</a>
			</div>
		</div>
	</div>

<script language="JavaScript" type="text/javascript">
function QuickSearch(x){
	Clear();
	document.frm_search.cmb_boat.selectedIndex = x;
	document.frm_search.action = "results.aspx";
	document.frm_search.submit();
}

function Search(){
if (document.frm_search.txt_zip.value=="") {
	if (!(document.frm_search.cmb_zip.value=="0")){
		document.frm_search.cmb_zip.value=0;
	}
}

	document.frm_search.action = "results.aspx";
	document.frm_search.submit();
}

function Clear(){
	//var country = document.frm_search.country.value;
//	document.frm_search.cmb_country.selectedIndex = country;
	document.frm_search.cmb_state.selectedIndex = 0;
//	document.frm_search.cmb_body.selectedIndex = 0;
	//document.frm_search.cmb_facility.selectedIndex = 0;
	//document.frm_search.cmb_boat.selectedIndex = 0;
	document.frm_search.txt_zip.value="";
	document.frm_search.txt_city.value="";
	document.frm_search.cmb_zip.value=0;
}

function ClearFileds(x)
	{
	if ((x == 1) && (document.frm_search.cmb_facility != 0))
	{
	document.frm_search.cmb_country.selectedIndex = 0;
		document.frm_search.cmb_state.selectedIndex = 0;
		//document.frm_search.cmb_body.selectedIndex = 0;
		//document.frm_search.cmb_boat.selectedIndex = 0;
		document.frm_search.txt_zip.value="";
		document.frm_search.txt_city.value="";
		
		Search();
		
	
	}
	}

function LoadStates(){
	var country = document.frm_search.cmb_country.selectedIndex;
	var state = document.frm_search.cmb_state.selectedIndex;
	var bodyOfWater = document.frm_search.cmb_body.selectedIndex;
	var facility = document.frm_search.cmb_facility.selectedIndex;
	var boat = document.frm_search.cmb_boat.selectedIndex;
	var zip = document.frm_search.txt_zip.value;
	var city = document.frm_search.txt_city.value;
	document.frm_search.country.value = country;
	document.frm_search.state.value = state;
	//document.frm_search.facility.value = facility;
	//document.frm_search.bodyOfWater.value = bodyOfWater;
	//document.frm_search.boat.value = boat;
	document.frm_search.zip.value = zip;
	document.frm_search.city.value = city;
	document.frm_search.submit();
}

function goDetail(x,y,z){
		document.frm_search.hdnBoatID.value = x;
		document.frm_search.hdnMarinaID.value = y;
		document.frm_search.hdnRating.value = z;
		document.frm_search.action = "calendar.aspx";
		document.frm_search.submit();
	}


        </script>

<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
<script type="text/javascript">_uacct = "UA-872206-1";urchinTracker();</script>

</body>
</html>

