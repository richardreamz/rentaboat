<!-- #include file="includes/__dbconnection.asp" -->
<!-- #include file="includes/__functions.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%

Session.Timeout=740

if ((session("Kart") = "") or (left(session("Kart"),3)="adm")) then
	Randomize
	varSession = ""
	for i = 0 to 50
		varSession = varSession & "" & Int((6 * Rnd) + 1)
	next
	session("Kart") = varSession
End if
countryID = 1
facilityID = 0
boatID = 0
bodyID = 0
cityVAL = ""
zipVAL =""
if not Request("country") = "" Then countryID = Request("country")
if not Request("boat") = "" Then boatID = Request("boat")
if not Request("facility") = "" Then facilityID = Request("facility")
if not Request("city")="" Then cityVAL = Request("city")
if not Request("zip")="" Then zipVAL = Request("zip")
if not Request("bodyOfWater") = "" Then bodyID = Request("bodyOfWater")



Set cmd=Server.CreateObject("ADODB.Command")
Set rs=Server.CreateObject("ADODB.Recordset")
With cmd
	Set .ActiveConnection=oConn
	.CommandText = "SP_BR_NEWBOATS_MONTH"
	.CommandType=adCmdStoredProc
End With

rs.cursortype = 3
rs.cursorlocation = 3
rs.Open cmd



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

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<div id="container">
		<div id="banner" style="width: 779; height: 102"></div>
		<div id="menu" style="width: 912; height: 246">
			<ul>
				<li id="current"><a href="default.asp">Home</a></li>

				<li id="<%=c12%>"><a href="javascript:QuickSearch(2)">Cabin</a></li>
				<li id="<%=c8%>"><a href="javascript:QuickSearch(3)">Charters</a></li>
				<li id="<%=c10%>"><a href="javascript:QuickSearch(5)">Diving</a></li>
				<li id="<%=c9%>"><a href="javascript:QuickSearch(6)">Excursions</a></li>
				<li id="<%=c1%>"><a href="javascript:QuickSearch(7)">Fishing</a></li>
				<li id="<%=c13%>"><a href="javascript:QuickSearch(8)">Houseboat</a></li>
				<li id="<%=c7%>"><a href="javascript:QuickSearch(9)">Jet Ski</a></li>
				<li id="<%=c4%>"><a href="javascript:QuickSearch(10)">Paddle</a></li>
				<li id="<%=c11%>"><a href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li id="<%=c2%>"><a href="javascript:QuickSearch(12)">Sailing</a></li>
				<li id="<%=c6%>"><a href="javascript:QuickSearch(13)">Speed</a></li>
				<li id="<%=c5%>"><a href="javascript:QuickSearch(14)">Yachts</a></li>

			</ul>
		</div>
		<!-- SUB MENU -->
		<table cellpadding="0" cellspacing="0" width="780" height="25" style="background: url('images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; color: #666">
		<tr>
			<td width="29" height="25"></td>
			<td width="657" height="25">
			<a href="default.asp">Home</a>&nbsp;| &nbsp;
			<a href="rentwithus.asp">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.asp">Contact Us</a>&nbsp;|&nbsp;
			<a href="members.asp">Facility</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.asp">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.asp">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="Articles.asp">Articles</a>&nbsp;|&nbsp;
			<a href="In_the_News.asp">In the News</a>&nbsp;|&nbsp;
			<a href="sitemap.asp">Site Map</a>
			</td>
			<td width="130" height="25">
			<div><a href="members.asp" class="buttonMenu-Sign" style="color:white;"><b>
			  Manager Sign In</b></div></a></td>
		</tr>
		</table>
		<!-- SUB MENU -->
		<!--<div id="sub_menu">
			<a href="default.asp">Home</a>&nbsp;|&nbsp;<a href="rentwithus.asp">Rent With Us</a>&nbsp;|&nbsp;<a href="contactus.asp">Contact Us</a>&nbsp;|&nbsp;<a href="members.asp">Members</a> <a href="members.asp" class="button" ><b>Sign In</b></a>
		</div>
		-->
		
		
		<!--
		<div id="main_boat_picture" style="width: 912; height: 35"><a href="http://www.discoverboating.com/contests/bestboatname.aspx" target="_blank"><img src="images/boat_home.jpg"></a></div>
		-->
		
		
		
		
		<div id="search_field_new">
			<div id="search_new" style="width: 779; height: 100">
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
						<table align=left border="0" style="font-family: Arial; font-size: 10px" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right">Country:&nbsp;&nbsp;</td>
								<td ><% Country()%></td>
								<td align="right">&nbsp;&nbsp;State:&nbsp;&nbsp;</td>
								<td width="80px" ><% States()%></td>
								
									<td  align="right">&nbsp;&nbsp;&nbsp;City:&nbsp;&nbsp;</td>
											<td style="text-indent: 5">

											<input type="text" name="txt_city" class="city1" tabindex="7" value="<%=request.Form("txt_city")%>" style="width:107px" size="20">
											&nbsp;&nbsp;
											</td>
											
									
											<td>Zip Code 
											<input type="text" name="txt_zip" class="zip1" tabindex="2" value="<%=request.Form("txt_zip")%>" onchange="javascript:cmb_zip.value=30;" size="20">
											Within
											<select name="cmb_zip" class="water" tabindex="3" style="width:70px">
												<option value="0" <%if request.Form("cmb_zip")="" then%>selected<%end if%>>- Miles -</option>
												<option value="5" <%if request.Form("cmb_zip")="5" then%>selected<%end if%>>
												05 miles</option>
												<option value="10" <%if request.Form("cmb_zip")="10" then%>selected<%end if%>>
												10 miles</option>
												<option value="20" <%if request.Form("cmb_zip")="20" then%>selected<%end if%>>
												20 miles</option>
												<option value="30" <%if request.Form("cmb_zip")="30" then%>selected<%end if%>>
												30 miles</option>
												<option value="50" <%if request.Form("cmb_zip")="50"  then%>selected<%end if%>>
												50 miles</option>
											</Select> of this Zip</td>
											
								
							</tr>
							
							
							
							<tr>
							<tr>
										<td colspan="3" align="center" height="20"  >
								                        &nbsp;    &nbsp;   &nbsp;
										</td>
						</tr>
							<tr>
							<td colspan="7" align="center">
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
									<h1><a href="./advancesearch.asp" target="_self" > Advance Search </a></h1>
									</td>
								</tr>
								
							</table>

							</td>
						</tr>
						
					
						
						<tr style="display:none">
								<td colspan="4" align="center">
									<table border="0" id="table1" style="font-family: Arial; font-size: 10px">
										
										
										<tr>
											<td width="94" align="right">Body of
											Water:</td>
											<td style="text-indent: 5"><% BodyWater()%>
											&nbsp;&nbsp;Optional
											</td>
										</tr>
										
										<tr>
											<td width="94" align="right">
											Facility:</td>
											<td style="text-indent: 5"><% Facility()%>
											&nbsp;&nbsp;Optional
											</td>
										</tr>
										<tr>
											<td colspan="2" style="font-size: 12px; font-family: Arial; font-weight: bold">
											<table border="0" width="100%" id="table6" cellspacing="0" cellpadding="0">
												<tr>
													<td width="56px"></td>
													<td></td>
												</tr>
											</table>
											</td>
										</tr>

										<tr style="display:none">
											<td width="94" align="right">Boat Type:</td>
											<td style="text-indent: 5"><% BoatType()%></td>
										</tr>
										<tr>
											<td colspan="2" style="font-family: Arial; font-size: 12px; font-weight: bold">
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
        <b><span style="font-size: 12.0pt; font-family: Times New Roman">
        BOATRENTING.COM ACQUIRES RENTABOAT.COM </span></b></p>
        <blockquote>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</table>
<br>	


LONG ISLAND, NY (USA) - BoatRenting.com, a web site featuring worldwide online boat rental reservations, has expanded its online presence with the acquisition of Rentaboat.com from eflorida.net. 
“Rentaboat.com will now serve as a portal to the BoatRenting.com reservations system and boat rental locations listed in the BoatRenting.com database will receive complimentary advertising on Rentaboat.com,” said Ken Hilderbrandt Jr., founder of BoatRenting.com. 
Boat rental locations list their available boats free on BoatRenting.com and customers pay a small, refundable fee to reserve boats through the web site’s live interactive calendar. The unique service helps to increase turnover for rental operators (especially in slow season). Each rental location can self-update their listings at any time. 
Rentaboat.com will now also offer boat rental operators related support services and products such as credit cards, standardized rental agreements and boat tracking devices.
For more information, visit www.boatrenting.com or www.rentaboat.com, or call 1+631.286.7816.
-0- 
News release prepared by Home Port Marine Marketing.
http://www.homeportmarine.com
</table>
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
	document.frm_search.action = "results.asp";
	document.frm_search.submit();
}

function Search(){
if (document.frm_search.txt_zip.value=="") {
	if (!(document.frm_search.cmb_zip.value=="0")){
		document.frm_search.cmb_zip.value=0;
	}
}

	document.frm_search.action = "results.asp";
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
		document.frm_search.action = "calendar.asp";
		document.frm_search.submit();
	}


        </script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>


</body>
</html>

<%Function Country()
	Dim rs, cmd
	Set cmd=Server.CreateObject("ADODB.Command")
	With cmd
		Set .ActiveConnection=oConn
		.CommandText = "SP_BR_COUNTRY_LIST"
		Set rs = .Execute()
	End With
%>
	<select name="cmb_country" class="water" tabindex="1" onchange="javascript:LoadStates()">
	<option value="0">- All Countries -</option>
	<%Do while not rs.eof %>
	         <option value= "<%=rs("in_countryID")%>" ><%=rs("vc_name")%></option>
	<% rs.movenext%>
  	<%Loop%>
  	</select>
	<script> document.frm_search.cmb_country.selectedIndex = <%=countryID%> </script>
<%End function%>

<%Function States()
	Dim rs, cmd

	Set cmd=Server.CreateObject("ADODB.Command")
	With cmd
		Set .ActiveConnection=oConn
		.CommandText = "SP_BR_STATE_LIST"
		.CommandType=adCmdStoredProc
		.Parameters.Refresh
		.Parameters("@CountryID") = countryID
		Set rs = .Execute()
	End With
%>
	<select name="cmb_state" class="state1" tabindex="6" style="width:113px" onchange="javascript:Search()">
	<option value="0">* State Required -</option>
	<%Do while not rs.eof %>
	         <option value="<%=rs("in_stateID")%>"><%=rs("vc_name")%></option>
	<% rs.movenext%>
  	<%Loop%>
  	</select>

<%End function%>

<%Function Facility()
	Dim rs, cmd
	Set cmd=Server.CreateObject("ADODB.Command")
	With cmd
		Set .ActiveConnection=oConn
		.CommandText = "SP_BR_MARINA_LIST"
		Set rs = .Execute()
	End With
%>
	<select name="cmb_facility" class="water" tabindex="4" onchange="javascript:ClearFileds(1)">
	<option value="0">- Optional -</option>
	<%Do while not rs.eof %>
	         <option value="<%=rs("in_marinaID")%>"><%=rs("vc_businessName")%></option>
	<% rs.movenext%>
  	<%Loop%>
  	</select>
	<script> document.frm_search.cmb_facility.selectedIndex = <%=facilityID%> </script>
<%End function%>

<%Function BoatType()
	Dim rs, cmd
	Set cmd=Server.CreateObject("ADODB.Command")
	With cmd
		Set .ActiveConnection=oConn
		.CommandText = "SP_BR_BOATTYPE_LIST"
		Set rs = .Execute()
	End With
%>
	<select name="cmb_boat" class="water" tabindex="5">
	<option value="0">- Any Boat Types -</option>
	<%Do while not rs.eof %>
	         <option value="<%=rs("in_boatTypeID")%>"><%=rs("vc_description")%></option>
	<% rs.movenext%>
  	<%Loop%>
  	</select>
	<script> document.frm_search.cmb_boat.selectedIndex = <%=boatID%> </script>
<%End function%>

<%Function BodyWater()
	Dim rs, cmd
	Set cmd=Server.CreateObject("ADODB.Command")
	With cmd
		Set .ActiveConnection=oConn
		.CommandText = "SP_BR_BODYWATER_LIST"
		Set rs = .Execute()
	End With
%>
	<select name="cmb_body" class="water" tabindex="3" onchange="javascript:ClearFileds(2)">
	<option value="0"> - Optional - </option>
	<%Do while not rs.eof %>
	         <option value="<%=rs("vc_bodywater")%>" ><%=rs("vc_bodywater")%></option>
	<% rs.movenext%>
  	<%Loop%>
  	</select>
	<script> document.frm_search.cmb_body.selectedIndex = <%=bodyID%> </script>
<%End function%>