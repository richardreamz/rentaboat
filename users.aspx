<%@ Page language="C#" CodeFile="users.aspx.cs" Inherits="BoatRenting.users_aspx_cs" %>
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
<title>Boat Rentals, Worldwide Yacht Charters and Sailboat Rental </title>
<style type="text/css" media="screen">
@import "br.css";.Estilo1 {font-size: 9px}
</style>
<meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, 

sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat 

rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht 

charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
<meta name="description" content="Find Online Boat Rental, Sailboat Charters and Yacht 

Reservations. View boat photos, availability and reserve online. Rated #1 in customer 

satisfaction">
<meta name="robots" content="index, follow">
<meta name="revisit-after" content="15 days">
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<script language="JavaScript" 

src="https://seal.networksolutions.com/siteseal/javascript/siteseal.js" 

type="text/javascript"></script>

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
	<div id="container" style="width: 848; height: 726">
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
		<table cellpadding="0" cellspacing="0" width="779" height="25" 

style="background: url('New%20Folder%20(2)/images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; 

color: #666">
		<tr>
			<td width="29" height="25"></td>
			<td width="725" height="25">
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
			<div id="search_new" style="width: 779; height: 155">
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


				
					</form>
						</div>
				
 		
				</div>
		<br>
						

		<div id="sub_menu"></div>
			<div id="new_users">
				<div class="users_title">New Users </div>
				<div id="new_users_explanation">Please, click Continue to register and sign in 
                  or call for assistance 631-286-7816.</div>
				<div class="link">
					<a class="button" href="newuser.aspx">Continue &raquo;</a>
				</div>
			</div>

			<div id="returning_customers">
				<div class="users_title">Returning Customers</div>
				<div id="returning_customers_forms">
					<form name="frm_users" method="post">
					<input type="hidden" name="cmb_boat">
					<input type="hidden" name="cmb_country">
					<input type="hidden" name="cmb_body">
					<input type="hidden" name="cmb_facility">
					<input type="hidden" name="cmb_state">
					<input type="hidden" name="cmb_zip">
					Email Address:
					
					
					<input type="text" name="txt_email" id="txt_email" maxlength="100" size="20">
					
					<!--
					Password:
					<input type="password" id="txt_password" name="txt_password" maxlength="30">
					-->
					
					
					</form>
			<!--		
                       <a href="forgottenpassword.aspx">Forgot your Password?</a>
			-->
	

			</div>
				<div class="link">
					<a class="button" href="javascript:UserLogin()">Sign In &raquo;</a>
				</div>
			</div>
			<div align="right" class="searchtitlesmall"><font color="darkred"><%
    if (Request.QueryString["ans"] == "ko")
    {
%>
Login failure&nbsp;&nbsp;&nbsp;<%
    }
%>
</font></div>





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
function Validar () {
    var chk=false;

	//Initialise variables
	var errorMsg = "";

	if (document.getElementById("txt_email").value == ""){
		errorMsg += "\n\t User \t\t                  - Enter your E-mail address";
	}

	if (document.getElementById("txt_email").value != "")
	{
		strEmail = document.getElementById("txt_email").value;
		if (strEmail.length>0)
		{
			if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
			{
				errorMsg += "\n\t User \t\t          -  Your E-mail address is invalid";
			}
		}
	}

	//if (document.getElementById("txt_password").value == ""){
		//errorMsg += "\n\t Password \t\t  - Enter your Password";
	//}

	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "______________________________________________________________\n\n";
		msg += "Your enquiry has not been sent because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "______________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected:\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	return true;
}

function UserLogin(){
	if (Validar()){
	  	document.frm_users.action="returning_user.aspx";
	  	document.frm_users.submit();
	}
}
function Contact(){
	document.frm_users.action = "contactus.aspx";
	document.frm_users.submit();
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

