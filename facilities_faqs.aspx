<%@ Page language="C#" CodeFile="facilities_faqs.aspx.cs" Inherits="BoatRenting.facilities_faqs_aspx_cs"  Debug="true" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="includes/__dbconnection.aspx"-->
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    Session.Timeout = 740;
    if (((Convert.ToString(Session["Kart"]) == "") || ((Convert.ToString(Session["Kart"])).Substring(0, 3) == "adm")))
    {
        //VBMath.Randomize();
        varSession = "";
        //for(i = 0; i <= 50; i += 1)
        //{
        //varSession = varSession + "" + Convert.ToString(Conversion.Int(((float)6.0 * VBMath.Rnd()) + (float)1.0));
        varSession = varSession + "" + Convert.ToString(GetRandomNumber(999999));
        //}
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
<script language="JavaScript" src="https://seal.networksolutions.com/siteseal/javascript/siteseal.js" type="text/javascript"></script>
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
	<div id="container" style="width: 713; height: 698">
		<div id="banner" style="width: 779; height: 102"></div>
		<div id="menu" style="width: 778px; height: 17px">
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
		<br>
		&nbsp;&nbsp;
        <blockquote>
			<h1><font size="5">Boat Rental </font></h1>
			<h2>Facility Questions & Answers </h2>
			<p>
			<font color="#990000">
			<b>1. What is BoatRenting.com?</b></font><br>
			A clearinghouse of rentable boats located in different parts of the word. If you have a boat you want to rent, list it with us we can help you rent it.<br>

			<font color="#990000">

			<b>2. How does it work?</b></font><br>
			The unique service helps to increase turnover for rental operators 
            (especially in slow season). Each rental location can self-update 
            their listings at any time.<br>

			<font color="#990000">

			<b>3. Who&#8217;s boats?</b></font><br>
			Most are independent boat renting facilities, though we do have privately owned vessels also.<br>

			<font color="#990000">

			<b>4. Is it a club or Membership?</b></font><br>
			No, Anyone can use the service.<br>

			<font color="#990000">

			<b>5. Why would someone rent from BoatRenting.com instead of going directly to my facility?</b></font><br>
			Finding us first, ease of on-line reservations and worldwide name recognition.<br>

			<font color="#990000">

			<b>6. How easily is it to join?</b></font><br>
			Facilities can self enroll through our website. <a href="facilities_mant.aspx" title="Enter" class="buttonMenu-Sign1" style="color:white">Sign on</a><br>

			<font color="#990000">

			<b>7. How long does it take to be approved?</b></font><br>
			48 hours<br>

			<font color="#990000">

			<b>8. Is there an advertising fee?</b></font><br>
			No<br>

			<font color="#990000">

			<b>9. Does it cost more to rent a boat through BoatRenting.com?</b></font><br>
			No<br>

			<font color="#990000">

			<b>10. Is there a fee to reserve on-line?</b></font><br>
			Yes, renter will need a credit card.<br>

			<font color="#990000">

			<b>11. Is this fee used as a deposit to hold the boat?</b></font><br>
			Yes, only temporarily though. You, the facility can require an additional deposit to hold your boat.<br>

			<font color="#990000">

			<b>12. Is the fee deducted from the rental price?</b></font><br>
			Yes, You are required to deduct the broker fee from your advertised rental price.<br>

			<font color="#990000">

			<b>13. Who collects the Deposits and or Security?</b></font><br>
			You the rental facility are responsible to collect any additional deposits of securities.<br>

			<font color="#990000">

			<b>14. Do I have to contact the renter before the rental date?</b></font><br>
			Yes, we recommend you contact the renter. We will send you all renter info and post rental info to your system.<br>

			<font color="#990000">

			<b>15. Will the renter be required to contact me, the facility?</b></font><br>
			Yes, the renter is sent an on-line rental agreement and directions to contact you. We will also send information on local restaurants, hotels and other types of related entertainment.<br>

			<font color="#990000">

			<b>16. I have a web site already, why join?</b></font><br>
			As a accessory to your web site, we add on-line reservations, advertising and marketing.<br>

			<font color="#990000">

			<b>17. How are the online reservations updated with our current in-house reservation systems?</b></font><br>
			The facility is encourage to use our computerized program as there in-house reservation system
			or we<br>
			can update from your system.<br>

			<font color="#990000">

			<b>18. How expensive is the program and what are the monthly maintenance fees?</b></font><br>
			The program is free to the facility and there are NO maintenance fees.<br>

			<font color="#990000">

			<b>19. Does it work like a regular office program? What other benefits does a boat rental facility get?</b></font><br>
			Yes, you are able to print receipts, contracts, rental reports, keep customer records, see live reservation calendars and administer different users.<br>

			<font color="#990000">

			<b>20. How do I list my boats?</b></font><br>
			Sign onto our website using your password and fill in the &#8220;Add new boat form&#8221;. <a href="members.aspx" title="Enter" class="buttonMenu-Sign1" style="color:white">Facility Sign In</a><br>

			<font color="#990000">

			<b>21. How is the renter qualified to rent my boats?</b></font><br>
			We qualify them by past rental experiences and by your posted requirements. Facilities are able to &#8220;Black List&#8221; a renter. If a customer is &#8220;Blacked Listed&#8221; you will be noted in rental info email.<br>

			<font color="#990000">

			<b>22. What if the boat is not available the day of contract?</b></font><br>
			If you can not satisfy the customer, all broker fees will be refunded. Please keep in mind that customers will be rating your service.<br>

            <font color="#990000">

<b>23. Can BoatRenting.com collect the complete rental fee then mail me a check?</b></font><p>
<br>

		  </p>
        </blockquote>

		<div id="footer">
			<div id="footer_details">
				BoatRenting.com � 320 South Country Road � Brookhaven/Bellport
				NY 11719 � 631-286-7816 � <a href="mailto:info@boatrenting.com">
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


</body>
</html>

