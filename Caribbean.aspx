<%@ Page language="C#" CodeFile="location.aspx.cs" Inherits="BoatRenting.Caribbean_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="includes/__dbconnection.aspx"-->
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

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
<title>BOAT RENTAL FLEET TOPS 200 LOCATIONS</title>
<style type="text/css" media="screen">
@import "br.css";.Estilo1 {font-size: 9px}
</style>
<meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
<meta name="description" content="BoatRenting.com, a web site featuring online boat rental reservations, has added nine locations in the US and Caribbean and now has more than 200 locations worldwide in its rental fleet. 
">
<meta name="robots" content="index, follow">
<meta name="revisit-after" content="15 days">
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<script language="JavaScript" src="https://seal.networksolutions.com/siteseal/javascript/siteseal.js" type="text/javascript"></script>

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<div id="container" style="width: 713; height: 698">
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
		<table cellpadding="0" cellspacing="0" width="777" height="25" style="background: url('images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; color: #666">
		<tr>
			<td width="29" height="25"></td>
			<td width="657" height="25">
			<a href="default.aspx">Home</a>&nbsp;| &nbsp;
			<a href="rentwithus.aspx">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="Articles.aspx">Articles</a>&nbsp;|&nbsp;
            <a href="In_the_News.aspx">Press Room</a>&nbsp;|&nbsp;
			<a href="sitemap.aspx">Site Map</a>
			</td>
			<td width="127" height="25">
			<div><a href="members.aspx" class="buttonMenu-Sign" style="color:white;"><b>
			  Manager Sign In</b></div></a></td>
		</tr>
		</table>
		<!-- SUB MENU -->		<!--<div id="sub_menu">
			<a href="default.aspx">Home</a>&nbsp;|&nbsp;<a href="rentwithus.aspx">Rent With Us</a>&nbsp;|&nbsp;<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;<a href="members.aspx">Members</a> <a href="members.aspx" class="button" ><b>Sign In</b></a>
		</div>
		-->		<!--
		<div id="main_boat_picture" style="width: 912; height: 35"><a href="http://www.discoverboating.com/contests/bestboatname.aspx" target="_blank"><img src="images/boat_home.jpg"></a></div>
		-->
		
		
		
		
		<div id="search_field_new">
			<div id="search_new" style="width: 800; height: 106">
				<h1> <font size="2" color="#0000A0"> <span> Step 1 &nbsp;&nbsp;&nbsp; </span></font><font size="2" color="#990000">  Find a Boat&nbsp;&nbsp;&nbsp;
                 <span style="font-weight: 400"><font face="Arial">Choose a location</font></span></font></h1>
					<form name="frm_search" action="" method="post">
					<input type="hidden" name="country" value = 0>
					<input type="hidden" name="state" value = 0>
					<input type="hidden" name="bodyOfWater" value = 0>
					<input type="hidden" name="zip" value = "">
					<input type="hidden" name="city" value = "">
					<input type="hidden" name="facility" value = 0>
					<input type="hidden" name="boat" value = 0>
					<!--<input type="hidden" name="txt_city" value = "">-->
					<input type="hidden" name="hdnBoatID">
					<input type="hidden" name="hdnMarinaID">
					<input type="hidden" name="hdnRating">


					<!-- Beginning of the Table Find a Boat -->
					<div align=center>
						<table align=left border="0" style="font-family: Arial; font-size: 10px" cellspacing="0" cellpadding="0" height="70">
							<tr>
								<td align="right" height="20">Country:&nbsp;&nbsp;</td>
								<td height="20" ><%
    Country();
%>
</td>
								<td align="right" height="20">&nbsp;&nbsp;State:&nbsp;&nbsp;</td>
								<td width="80px" height="20" ><%
    States();
%>
</td>
								
									<td  align="right" height="20">&nbsp;&nbsp;&nbsp;City:&nbsp;&nbsp;</td>
											<td style="text-indent: 5" height="20">

											<input type="text" name="txt_city" class="city1" tabindex="7" value="<%= Request.Form["txt_city"] %>" style="width:107px" size="20">
											&nbsp;&nbsp;
											</td>
											
									
											<td height="20">Zip Code 
											<input type="text" name="txt_zip" class="zip1" tabindex="2" value="<%= Request.Form["txt_zip"] %>" onchange="javascript:cmb_zip.value=30;" size="20">
											Within
											<select name="cmb_zip" class="water" tabindex="3" style="width:70px">
												<option value="0" <%
    if (Request.Form["cmb_zip"] == "")
    {
%>
selected<%
    }
%>
>- Miles -</option>
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
										<td colspan="3" align="center" height="1"  >
								                        &nbsp;    &nbsp;   &nbsp;
										</td>
						</tr>
							<tr>
							<td colspan="7" align="center" height="17">
							<table border="0" id="table3" style="font-family: Arial; font-size: 10px" cellspacing="0" cellpadding="0">
								<tr>
									<td width="40px"></td>
									<td><a  href="javascript:Search()" class="button">
									Search</a></td>
									<td><a href="javascript:Clear()" class="button">
									Clear</a>

									</td>
									<td>&nbsp;    &nbsp;   &nbsp; </td>
									<td>
									<h1><a href="./advancesearch.aspx" target="_self" > Advance Search </a></h1>
									</td>
								</tr>
								
							</table>

							</td>
						</tr>
						
					
						
						<tr style="display:none">
								<td colspan="4" align="center" height="34">
									<table border="0" id="table1" style="font-family: Arial; font-size: 10px" height="22">
										
										
										<tr>
											<td width="94" align="right" height="4">Body of
											Water:</td>
											<td style="text-indent: 5" height="4"><%
    BodyWater();
%>
											&nbsp;&nbsp;Optional
											</td>
										</tr>
										
										<tr>
											<td width="94" align="right" height="1">
											Facility:</td>
											<td style="text-indent: 5" height="1"><%
    Facility();
%>
											&nbsp;&nbsp;Optional
											</td>
										</tr>
										<tr>
											<td colspan="2" style="font-size: 12px; font-family: Arial; font-weight: bold" height="1">
											<table border="0" width="100%" id="table6" cellspacing="0" cellpadding="0">
												<tr>
													<td width="56px"></td>
													<td></td>
												</tr>
											</table>
											</td>
										</tr>

										<tr style="display:none">
											<td width="94" align="right" height="12">Boat Type:</td>
											<td style="text-indent: 5" height="12"><%
    BoatType();
%>
</td>
										</tr>
										<tr>
											<td colspan="2" style="font-family: Arial; font-size: 12px; font-weight: bold" height="12">
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
		<p align="center">
		<br>
		<font size="5">&nbsp;&nbsp; </font><b><font size="4">BOATRENTING.COM 
        TOPS 200 LOCATIONS<br>
        IN BOAT RENTAL FLEET</font></b></p>
        <blockquote>
          <p>LONG ISLAND, NY (USA) MAY 11, 2007 - BoatRenting.com, a web site 
          featuring online boat rental reservations, has added nine locations in 
          the US and Caribbean and now has more than 200 locations worldwide in 
          its rental fleet. </p>
          <p>Boat rental operators list their available boats free on 
          BoatRenting.com. Customers pay a small fee to reserve boats through 
          the web site's live interactive calendar, which is later refunded by 
          the rental operator. The unique service helps to increase turnover for 
          rental operators (especially in slow season). Each rental location can 
          self-update their listings at any time. </p>
          <p>Boat rental locations just added to the BoatRenting.com database 
          are: </p>
          <p>
          <a href="http://www.boatrenting.com/client/RhodeIsland-boat-rentals.htm">
          · Steve's Boat Rentals - Warren, Rhode Island</a><br>
          <a href="http://www.boatrenting.com/client/Pennsylvania-boat-rentals.htm">
          · Lighthouse Harbor Marina - Greentown, Pennsylvania</a><br>
          ·<a href="http://www.boatrenting.com/client/Florida-boat-rentals.htm"> 
          Dinner Key Marina - Miami, Florida </a><br>
          ·<a href="http://www.boatrenting.com/client/bahamas.aspx"> Dorado Boat 
          Rentals - Marsh Harbor, Abaco</a><br>
          ·<a href="http://www.boatrenting.com/client/NewHampshire-boat-rentals.htm"> 
          Glendale Marine - Gilford, New Hampshire</a><br>
          ·<a href="http://www.boatrenting.com/client/NewHampshire-boat-rentals.htm"> 
          Harborside Marine - Jersey City, New Jersey</a><br>
          <a href="http://www.boatrenting.com/client/Florida-boat-rentals.htm">· 
          Cool Breeze Boat Rentals - Sarasota, Florida</a><br>
          <a href="http://www.boatrenting.com/client/Florida-boat-rentals.htm">· 
          S&amp;C Rentals - Clearwater, Florida</a><br>
          <a href="http://www.boatrenting.com/client/Michigan-boat-rentals.htm">
          · H2O Limos - Mt. Clemens, Michigan </a></p>
          <p>For more information about BoatRenting.com, visit 
          www.boatrenting.com or call 1+631.286.7816.<br>
          -0- </p>
          <p><font size="-1">News release prepared by Home Port Marine 
          Marketing.<br>
          http://www.homeportmarine.com</font> </p>
          <p>FOR IMMEDIATE RELEASE<br>
          April 25, 2007<br>
          Contact: JR Hilderbrandt or Travis O'Shaughnessy<br>
          BoatRenting.com<br>
          1+631.286.7816</p>
        </blockquote>
        <blockquote>
          <ol>
            <li> 
            <font size="2">
            <a href="https://www.rentaboat.com/locations.aspx">
            September 2005&nbsp; BOATRENTING.COM ADDS 18 LOCATIONS TO BOAT 
            RENTAL FLEET</a></font></li>
            <li> <a href="https://www.rentaboat.com/presstriumph.aspx">
            November 2005<b> /&nbsp; BOATRENTING.COM ADDS TRIUMPH BOAT RENTAL 
            LOCATIONS IN CALIFORNIA TO ONLINE RENTAL FLEET</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/pressmiami07.aspx">
            December 2005<b> /&nbsp; BOATRENTING.COM TO DEMONSTRATE&nbsp; AT 
            MIAMI BOAT SHOW (Booth #1742)</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/presspalmbeach07.aspx">
            February 2006<b> / BOATRENTING.COM TO DEMONSTRATE&nbsp; AT PALM 
            BEACH BOAT SHOW (Evernia Booth #203)</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/pressinternational.aspx">
            March 2006<b> / BOATRENTING.COM GOES INTERNATIONAL</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/presslocations.aspx">
            March 2006<b> /&nbsp; BOATRENTING.COM ADDS 10 LOCATIONS TO 
            NATIONWIDE BOAT RENTAL FLEET</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/presscanada.aspx">
            May 2006<b> / BOATRENTING.COM ADDS CANADA &amp; 10 MORE US LOCATIONS</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/pressbahamas.aspx">
            July 2006<b> / BOATRENTING.COM ADDS SEVEN US LOCATIONS ONE BAHAMAS</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/pressmexico.aspx">
            September 2006<b> / BOATRENTING.COM ADDS 6 LOCATIONS IN US ONE 
            MEXICO</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/addsfirsteuropelocation.aspx">
            December 2006<b> / BOATRENTING.COM ADDS FIRST EUROPE LOCATIONS</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/pressrating.aspx">
            January 2007<b> / BoatRenting.com Launches Rating Feature Plus Adds 
            Five Locations</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/boatrentingcomdiscoverboating.aspx">
            February 2007<b> / BoatRenting.com Added To Discover Boating Web 
            Site</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/boatrentingaquiresrentaboat.aspx">
            March 2007 / <b>BoatRenting.com Acquires Rentaboat.com</b></a></li>
            <li> 
            <a href="http://www.boatrenting.com/client/pressdiscoverboating.aspx">
            APRIL 2007<b> / BoatRenting.com Sponsors Discover BoatingBest Boat 
            Name Contest</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/location.aspx">MAY 
            2007<b> / BOATRENTING.COM TOPS 200 LOCATIONS IN BOAT RENTAL FLEET</b></a></li>
            <li> <a href="http://www.boatrenting.com/client/pressfeatures.aspx">
            JULY 2007<b> / BOATRENTING.COM ADDS NEW FEATURES TO WEB SITE</b></a></li>
          </ol>
          <p>
<br>

		  </p>
        </blockquote>

		<div id="footer">
			<div id="footer_details">
				BoatRenting.com · 320 South Country Road · Brookhaven/Bellport
				NY 11719 · 631-286-7816 · <a href="mailto:info@boatrenting.com">
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

