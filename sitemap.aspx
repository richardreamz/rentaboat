<%@ Page language="C#" CodeFile="sitemap.aspx.cs" Inherits="BoatRenting.sitemap_aspx_cs" Debug="true" %>
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

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<div id="container" style="width: 713; height: 698">
		<div id="banner" style="width: 779; height: 102"></div>
		<div id="menu" style="width: 779px; height: 14px">
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
			<a href="In_the_News.aspx">In the News</a>&nbsp;|&nbsp;
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
&nbsp;</p>
        </blockquote>
<a href="Miami-Columbus-Day-Regatta.aspx">Special 
Events Around the Word</a><p style="text-align: center"><b><font size="4">United 
        States</font></b><BR></TD></TR>
<TR>
<TD><B>Search for boat rentals by state</B><BR><BR>
        </p>
<TABLE width="783" height="159">
<TBODY>
<TR vAlign=center>
<TD vAlign=middle align=middle width=36 height="27" bordercolor="#000000"><A href="Alabama-boat-rentals.aspx">
Alabama</A></TD>
<TD vAlign=middle align=middle width=44 height="27" bordercolor="#000000"><A href="Connecticut.htm">Connecticut</A></TD>
<TD vAlign=middle align=middle width=48 height="27" bordercolor="#000000">
<font face="ms sans serif" color="#000000" size="1"><strong>
<font face="ms sans serif,arial" size="1">Iowa</font></strong></font></TD>
<TD vAlign=middle align=center width=1 height="27" bordercolor="#000000">
<a href="Maine-boat-rentals.aspx">Maine</a></TD>
<TD vAlign=middle align=middle width=85 height="27" bordercolor="#000000"><A href="Missouri-boat-rentals.htm">
Montana</A></TD>
<TD vAlign=middle align=middle width=68 height="27" bordercolor="#000000"><A href="NewYork_boat_rentals.aspx">
New York</A></TD>
<TD vAlign=middle align=middle width=81 height="27" bordercolor="#000000"><A href="Pennsylvania-boat-rentals.htm">
Pennsylvania</A></TD>
<TD vAlign=middle align=middle width=83 height="27" bordercolor="#000000"><A href="Virginia-boat-rentals.htm">
Virginia</A></TD>
</TR>
<TR vAlign=center>
<TD vAlign=middle align=middle width=36 height="28" bordercolor="#000000"><A href="Alaska-boat-rentals.htm">
Alaska</A></TD>
<TD vAlign=middle align=middle width=44 height="28" bordercolor="#000000"><A href="Delaware-boat-rentals.htm">Delaware</A></TD>
<TD vAlign=middle align=middle width=48 height="28" bordercolor="#000000"><A href="Illinois-boat-rentals.htm">
Illinois</A></TD>
<TD vAlign=middle align=center width=1 height="28" bordercolor="#000000">
<a href="Maine-boat-rentals.htm">Maryland</a></TD>
<TD vAlign=middle align=middle width=85 height="28" bordercolor="#000000"><A href="Nebraska-boat-rentals.htm">
Nebraska</A></TD>
<TD vAlign=middle align=middle width=68 height="28" bordercolor="#000000"><A href="NorthCarolina-boat-rentals.htm">
North Carolina</A></TD>
<TD vAlign=middle align=middle width=81 height="28" bordercolor="#000000"><A href="RhodeIsland-boat-rentals.htm">
Rhode Island</A></TD>
<TD vAlign=middle align=middle width=83 height="28" bordercolor="#000000"><A href="Vermont-boat-rentals.htm">
Vermont</A></TD>
</TR>
<TR vAlign=center>
<TD vAlign=middle align=middle width=36 height="28" bordercolor="#000000"><A href="Arizona-boat-rentals.aspx">Arizona</A></TD>
<TD vAlign=middle align=middle width=44 height="28" bordercolor="#000000">
<a href="Florida-boat-rentals.aspx">Florida</a></TD>
<TD vAlign=middle align=middle width=48 height="28" bordercolor="#000000"><A href="Indiana-boat-rentals.htm">
Indiana</A></TD>
<TD vAlign=middle align=center width=1 height="28" bordercolor="#000000"><A href="Maryland-boat-rentals.htm">
Massachusetts</A></TD>
<TD vAlign=middle align=middle width=85 height="28" bordercolor="#000000"><A href="Nevada-boat-rentals.htm">
Nevada</A></TD>
<TD vAlign=middle align=middle width=68 height="28" bordercolor="#000000"><A href="NorthDakota-boat-rentals.htm">
North Dakota</A></TD>
<TD vAlign=middle align=middle width=81 height="28" bordercolor="#000000"><A href="SouthCarolina-boat-rentals.aspx">
South Carolina</A></TD>
<TD vAlign=middle align=middle width=83 height="28" bordercolor="#000000"><A href="Washington-boat-rentals.htm">
Washington</A></TD>
</TR>
<TR vAlign=center>
<TD vAlign=middle align=middle width=36 height="28" bordercolor="#000000"><A href="Arkansas-boat-rentals.htm">Arkansas</A></TD>
<TD vAlign=middle align=middle width=44 height="28" bordercolor="#000000"><A href="Georgia-boat-rentals.htm">
Georgia</A></TD>
<TD vAlign=middle align=middle width=48 height="28" bordercolor="#000000"><A href="Kansas-boat-rentals.htm">
Kansas</A></TD>
<TD vAlign=middle align=center width=1 height="28" bordercolor="#000000"><A href="Michigan-boat-rentals.htm">
Michigan</A></TD>
<TD vAlign=middle align=middle width=85 height="28" bordercolor="#000000"><A href="NewHampshire-boat-rentals.htm">
New Hampshire</A></TD>
<TD vAlign=middle align=middle width=68 height="28" bordercolor="#000000"><A href="Ohio-boat-rentals.aspx">
Ohio</A></TD>
<TD vAlign=middle align=middle width=81 height="28" bordercolor="#000000"><A href="SouthDakota-boat-rentals.htm">
South Dakota</A></TD>
<TD vAlign=middle align=middle width=83 height="28" bordercolor="#000000"><A href="WestVirginia-boat-rentals.htm">
West Virginia</A></TD>
</TR>
<TR vAlign=center>
<TD vAlign=middle align=middle width=36 height="28" bordercolor="#000000">
<a href="California-boat-rentals.aspx">California</a></TD>
<TD vAlign=middle align=middle width=44 height="28" bordercolor="#000000">
<a href="Hawaii-boat-rentals.aspx">Hawaii</a></TD>
<TD vAlign=middle align=middle width=48 height="28" bordercolor="#000000"><A href="Kentucky-boat-rentals.htm">
Kentucky</A></TD>
<TD vAlign=middle align=center width=1 height="28" bordercolor="#000000"><A href="Minnesota-boat-rentals.htm">
Minnesota</A></TD>
<TD vAlign=middle align=middle width=85 height="28" bordercolor="#000000"><A href="NewJersey-boat-rentals.htm">
New Jersey</A></TD>
<TD vAlign=middle align=middle width=68 height="28" bordercolor="#000000"><A href="Oklahoma-boat-rentals.htm">
Oklahoma</A></TD>
<TD vAlign=middle align=middle width=81 height="28" bordercolor="#000000">
<a href="Texas-boat-rentals.htm">Texas</a></TD>
<TD vAlign=middle align=middle width=83 height="28" bordercolor="#000000"><A href="Wisconsin-boat-rentals.htm">
Wisconsin</A></TD>
</TR>
<TR vAlign=center>
<TD vAlign=middle align=middle width=36 height="28" bordercolor="#000000"><A href="Colorado-boat-rentals.htm">Colorado</A></TD>
<TD vAlign=middle align=middle width=44 height="28" bordercolor="#000000"><A href="Idaho-boat-rentals.htm">
Idaho</A></TD>
<TD vAlign=middle align=middle width=48 height="28" bordercolor="#000000"><A href="Louisiana-boat-rentals.htm">
Louisiana</A></TD>
<TD vAlign=middle align=center width=1 height="28" bordercolor="#000000"><A href="Mississippi-boat-rentals.htm">
Mississippi</A></TD>
<TD vAlign=middle align=middle width=85 height="28" bordercolor="#000000"><A href="NewMexico-boat-rentals.htm">
New Mexico</A></TD>
<TD vAlign=middle align=middle width=68 height="28" bordercolor="#000000"><A href="Oregon-boat-rentals.htm">
Oregon</A></TD>
<TD vAlign=middle align=middle width=81 height="28" bordercolor="#000000"><A href="Utah-boat-rentals.htm">
Utah</A></TD>
<TD vAlign=middle align=middle width=83 height="28" bordercolor="#000000"><A href="Wyoming-boat-rentals.htm">
Wyoming</A></TD>
</TR></TBODY></TABLE>&nbsp;<p style="text-align: center"><b><font size="4">
        Mexico</font></b></p>
        <p style="text-align: center"><BR>
        </p>
<TABLE width="782" height="31">
<TR vAlign=center>
<TD vAlign=middle align=middle width=88 height="1" bordercolor="#000000">
<font size="1"><a href="Cabo%20San%20Lucas쟟oat%20rentals쟋exico잹ahia.htm">Cabo San 
Lucas</a></font></TD>
<TD vAlign=middle align=middle width=1 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=66 height="1" bordercolor="#000000">
<font size="1">
<a href="La%20Paz%20-%20mexico%20boat%20rentals%20Sea%20of%20Cortez.htm">La Paz&nbsp;
</a></font>
</TD>
<TD vAlign=middle align=center width=1 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=85 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=68 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=81 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=71 height="1" bordercolor="#000000"></TD>
</TR>
        </TABLE>
        <h1 style="text-align: center"><BR></TD></TR>
<TR>
        <font size="4">Bahamas</font></h1>
<TABLE width="788" height="31">
<TR vAlign=center>
<TD vAlign=middle align=middle width=88 height="1" bordercolor="#000000">
<a href="bahamas-abaco.aspx">Abaco</a></TD>
<TD vAlign=middle align=middle width=1 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=121 height="1" bordercolor="#000000">
<a href="bahamas-providence-nassau.aspx">Providence/Nassau</a></TD>
<TD vAlign=middle align=center width=1 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=122 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=1 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=81 height="1" bordercolor="#000000"></TD>
<TD vAlign=middle align=middle width=71 height="1" bordercolor="#000000"></TD>
</TR>
        </TABLE>
        <blockquote>
          <p>
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

