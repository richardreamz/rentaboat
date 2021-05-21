<%@ Page language="C#" CodeFile="saftey.aspx.cs" Inherits="BoatRenting.saftey_aspx_cs" %>
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
<title>Boat Rental Boating Safety </title>
<style type="text/css" media="screen">
@import "br.css";.Estilo1 {font-size: 9px}
h2
	{margin-right:0in;
	margin-left:0in;
	font-size:18.0pt;
	font-family:"Times New Roman";
	font-weight:bold}
</style>
<meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
<meta name="description" content="Safety is the key when renting any boat. If you follow the basic tips on this page, you will be more relaxed, and have more fun and more pleasurable cruise.
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
		<table cellpadding="0" cellspacing="0" width="777" height="25" style="background: url('../BoatRenting%20Web%20Files/Boatrenting%209-22-07/client/images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; color: #666">
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
        <blockquote>
          <p class="MsoNormal" align="center"><b><font size="5">Boat Rental Boating Safety</font></b><span style="color:black">&nbsp;</span></p>
          <p class="MsoNormal"><span style="color:black"><b><font size="3">How 
          many boating accidents are related to boat rentals?</font></b> </span>
         
          <span style="color:black"><br>Out of 6,753 boating 
          accidents reported in 2006 only 211 were related to Boat rentals. 
          That뭩 less then 4% of all US boating accidents.&nbsp; (2006 U.S. Coast 
          Guard Accident Statistics). </span></p>
          <p class="MsoNormal"><span style="color:black; font-weight:700">
          <font size="3">Why are there less 
          boating accidents related to boat rentals?</font></span>
         <span style="color:black"><br>Most boat rental 
          facilities inspect their safety equipment after every rental. They 
          review safety procedures and navigation rules to most every renter 
          before they leave. Regardless of the renters alleged boating 
          experience. Most facilities today have GPS tracking devices that alert 
          the facility via cell phone alert when a boat is out of range has 
          excessive water or possible engine problems.&nbsp;&nbsp; </span></p>
          <h2 align="center"><span style="color: black">Boat Rental 
          Tips</span></h2>
          <p align="left">
          <span style="color: black"><font size="3" face="Times New Roman"><b>
          Safety is the key </b></font><b><font face="Times New Roman">when 
          renting any boat</font></b></span><font size="2"><span style="font-family: Arial; color: black">.</span></font></p>
          <p align="left">
          <font size="2">
          <span style="font-family: Arial; color: black">&nbsp;If you follow the 
          basic tips on this page, you will be more relaxed, and have more fun 
          and more pleasurable cruise.</span></font></p>
          <ul>
            <li>
          <p style="text-indent: -.25in; margin-left: .5in" align="left">
          <span style="font-family: Arial; color: black">
          <font size="2">Check to make sure it has <b>all the required safety 
          equipment.</b> This is set in law by the&nbsp; Coast Guard. Boat Rentals 
          from 8 m to 12 m (26 to 39 feet) in length require life jackets or 
          PFDs (one each of an appropriate size for each person on board); a 
          buoyant heaving line of at least 15 m in length; a life buoy with 15 m 
          of buoyant line; a rebounding device (ie. ladder); an anchor with at 
          least 30m of cable, rope, or chain; one bailer or one manual pump; a 
          class 10BC fire extinguisher (if Boat Rental is powered or has cooking 
          or refrigerating appliances); distress signals (watertight flashlight 
          and 12 Canadian-approved flares of which six must be either Type A, B, 
          or C and at least two of Type D; and navigation equipment consisting 
          of a signaling device and navigation lights that comply with Collision 
          Regulations. If the Boat Rental is from 12 m to 20 m (39 to 65.5 feet) 
          in length, then it requires all the above together with the following: 
          a bilge pump instead of manual bailer, fire extinguishers (class 10BC, 
          one at each entrance space where a cooking or refrigeration appliance 
          is located, one at the entrance to the cabin and one at the entrance 
          of the engine compartment); and two fire buckets. </font></span></p>
            </li>
            <li>
          <p style="text-indent: -.25in; margin-left: .5in" align="left">
          <span style="font-family: Arial; color: black">
          <font size="2">Check to see what <b>communication equipment</b> it has 
          on board. If you have a cell phone, make sure to bring it along. Have 
          a list of local contact numbers (marinas, locks) to carry with you.
          </font></span></p>
            </li>
            <li>
          <p style="text-indent: -.25in; margin-left: .5in" align="left">
          <span style="font-family: Arial; color: black">
          <font size="2">Is the <b>boat Rental well maintained</b> - see if the 
          boat looks like it has been maintained. </font></span></p>
            </li>
            <li>
          <p style="text-indent: -.25in; margin-left: .5in" align="left">
          <span style="font-family: Arial; color: black">
          <font size="2">Make sure the Boat Rental comes fully equipped with the 
          most <b>up to date charts</b> of the waterway </font></span></p>
            </li>
            <li>
          <p style="text-indent: -.25in; margin-left: .5in" align="left">
          <span style="font-family: Arial; color: black">
          <font size="2">Check to make sure the Boat Rental has a good <b>First 
          Aid Kit</b>, if in doubt, bring your own. </font></span></p>
            </li>
          </ul>
          <p align="left"><b><span style="font-family: Times New Roman">Boating 
          knowledge</span></b><font face="Arial" size="2"> - what is your 
          level of experience? If you are a complete novice, you might want to 
          consider a safe boating course from your local branch of the sail and 
          power squadrons. At the very least, make sure the boat renter will 
          take you out on the water for a familiarization tour of your rental 
          boat and fully explain all the rules of the road, including how to 
          read charts and navigate the waterway. <br>
          </font><span style="font-size: 12.0pt; font-family: Times New Roman"><![if !supportLineBreakNewLine]>
          <br>
          <![endif]></span>
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

<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
<script type="text/javascript">_uacct = "UA-872206-1";urchinTracker();</script>

</body>
</html>

