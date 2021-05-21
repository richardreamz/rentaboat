<%@ Page language="C#" CodeFile="default.aspx.cs" Inherits="BoatRenting.default_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
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
            varSession = varSession + "" + Convert.ToString(GetRandomNumber(999999));
            varSession = varSession + "" + Convert.ToString(GetRandomNumber(999999));
            varSession = varSession + "" + Convert.ToString(GetRandomNumber(999999));
            //}
        Session.Add("Kart", varSession.ToString());
    }
    countryID = 1;
    facilityID = 0;
    boatID = 0;
    bodyID = 0;
    cityVAL = "";
    zipVAL = "";
    //if (!(Request["country"] == ""))
    if (!(string.IsNullOrEmpty(Request["country"])))
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
    //con = "Provider=SQLOLEDB;Data Source=192.168.100.23;User Id=usr_boatrenting;Password=passboatrenting;Initial Catalog=BOATRENTING;";
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
    //*************
    debugTEST_Kart = Convert.ToString(Session["Kart"]);
    debugTEST_clientID = Convert.ToString(Session["clientID"]);
    //*************
    
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
<title>BOAT RENTALS, YACHT CHARTERS, SAILBOAT RENTAL and BOATS FOR HIRE </title>
<style type="text/css" media="screen">
@import "br.css";.Estilo1 {font-size: 9px}
.entrytabs { width:370px; margin:0 5px 0 0; float:left; min-height:230px; background:#FDF9ED; }
.regularentry .entrytabs { width:390px; }
.tabcontent { padding:15px 15px 5px 15px; }
</style>
<meta name="verify-v1" content="lxp2CDGQ4uG5xW8raIBEEBXNiErcLQsTdYzIkgVT/Ac=" >
<meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
<meta name="description" content="Find A Boat Rental, Sailboat Charters and Yacht Reservations in Miami, Bahamas, California, Florida, Ohio, Michigan, Maryland, Texas, Alabama, Arizona, New York, Maine, Carolina. View boat photos, availability and reserve online. Rated #1 in customer satisfaction">
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
	<div id="container" style="width: 914; height: 1452">
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
		<table cellpadding="0" cellspacing="0" width="775" height="25" style="background: url('images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; color: #666">
		<tr>
			<td width="28" height="25"></td>
			<td width="658" height="25">
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
			<td width="125" height="25">
			<div><a href="members.aspx" class="buttonMenu-Sign" style="color:white;"/><b>
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
			<div id="search_new" style="width: 779; height: 356">

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" height="0">
                  <tr>
                    <td width="100%" height="0"></td>
                  </tr>
                </table>




<h1> <font size="2" color="#0000A0"> <span> Step 1&nbsp;&nbsp;&nbsp;&nbsp; </span></font>
                <font size="5" color="#800000">  To Find Boat Rentals</font><font size="4" color="#800000">&nbsp;&nbsp;&nbsp; </font><font face="Arial">
                <font size="3" color="#800000">  Choose a location</font><span style="font-weight: 400"><font size="2" color="#800000">&nbsp;&nbsp; </font></span></font></h1>
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
								<td>&nbsp;</td>
								<td >&nbsp;</td>
								<td>&nbsp;</td>
								<td width="60px" >&nbsp;</td>
								
									<td>&nbsp;</td>
											<td style="text-indent: 5">

											&nbsp;</td>
											
									
											<td>&nbsp;</td>
											
								
							</tr>
							
							
							
							<tr>

											
								

								<td align="right">Country:&nbsp;&nbsp;</td>
								<td ><%
    Country();
%>
</td>
								<td align="right">&nbsp;&nbsp;State:&nbsp;&nbsp;</td>
								<td width="80px" ><%
    States();
%>
</td>
								
									<td  align="right">&nbsp;&nbsp;&nbsp;City:&nbsp;&nbsp;</td>
											<td style="text-indent: 5">

											<input type="text" onkeydown="if (event.keyCode == 13) Search()"

 name="txt_city" class="city1" tabindex="7" value="<%= Request.Form["txt_city"] %>" style="width:107px" size="20">
											&nbsp;&nbsp;
											</td>
											
									
											<td>Zip Code 
											<input type="text" name="txt_zip" class="zip1" tabindex="2" value="<%= Request.Form["txt_zip"] %>" onchange="javascript:cmb_zip.value=30;" size="20" onkeydown="if (event.keyCode == 13) Search()">
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
						</tr>



							<tr>
							<td colspan="7" align="center"height="51">
							<table border="0" id="table3" style="font-family: Arial; font-size: 10px" cellspacing="0" cellpadding="0">
								<tr>
									
									</tr>

									<td width="40" height="28"></td>
									<td width="133" height="28"><a href="./advancesearch.aspx" target="_self" > Advance Search </a></td>
									<td width="21" height="28">
									&nbsp;</td>
									
									

									</td>
									<td width="5" height="28">&nbsp;</td>
									<td width="260" height="28">
									<p align="center">
									<input type="button" value="Search For Boat Rentals" onclick="javascript:Search()">
									<td width="154" height="28">
									<h1>
									<input type="button" value="Clear" onclick="javascript:Clear()"></h1>
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
											<td style="text-indent: 5"><%
    BodyWater();
%>
											&nbsp;&nbsp;Optional
											</td>
										</tr>
										
										<tr>
											<td width="94" align="right">
											Facility:</td>
											<td style="text-indent: 5"><%
    Facility();
%>
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
											<td style="text-indent: 5"><%
    BoatType();
%>
</td>
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
		
		<div>
		<div id="ad_box_new"> <img src="images/discoverbanner.gif" width="385" height="78px" /></div>
		<div id="ad_box_new"> 
          <div id="ad_box_new"> <img src="images/rightbanner.gif" width="385" height="78px" /></div>		</div>
		<div id="ad_box">

 		
		<h1 style="text-align: center"><font color="#800000">How to Rent A Boat</font></h1>
        <ol>
          <li><font color="#800000"><b>Choose a</b></font><b><font color="#800000" size="2"> 
          Boating Location.</font></b></li>
          <li><b><font color="#800000" size="2">Click Search.</font></b></li>
          <li><b><font color="#800000" size="2">Click on Boat Picture.</font></b></li>
          <li><b><font color="#800000" size="2">Choose Date.</font></b></li>
          <li><b><font color="#800000" size="2">Click &quot;Book Now&quot; button</font></b></li>
        </ol>
        <p style="text-align: center">&nbsp;</p>
 		
        <div id="ad_box_list" style="width: 240; height: 447">
<p align="center"><b>
<a href="facilities_mant.aspx"><font size="3" color="#0000FF">Boat Rental Facilities</font></a></b></p>

				<ul>
                  <li>Join our network of sites;</li>
                  <li>
                  <a style="font-size: 12pt; font-family: Imprint MT Shadow; font-weight: bold; letter-spacing: 2pt; font-style: italic; color: #FF0000" href="http://www.rentaboat.com">
                  RentaBoat.com</a>
                  <a style="font-size: 12pt; font-family: Times New Roman; font-weight: bold; letter-spacing: 2pt; color: #0000A0" href="http://www.rentasailboat.com">
                  RentaSailboat.com</a>
                  <span style="letter-spacing: 2pt; text-decoration: underline">
                  <font face="Gill Sans MT" size="4" color="#FF0000">
                  RentaPWC.com</font></span> <b>
                  <font face="Californian FB" size="4" color="#0000FF">
                  YachtRenting.com</font></b></li> <b>
                  <font face="Tahoma" size="4" color="#FF0000">
                  <a href="http://www.miamirentaboat.com">
                  <font size="4" color="#FF0000">miami</font></a></font><a href="http://www.miamirentaboat.com"><font color="#000080"><font size="4" face="Tahoma"><i>rentaboat</i></font></b></font></a></b></li>

                  <li>
                  <a style="text-decoration:none;font-size:10pt;color:#000000" href="calendarad.aspx">Create & Manage Your Own Boat Page.</a></li>
                  <li>Upload Your Own Boat Pictures</li>
                  <li>
                  <a style="text-decoration:none;font-size:10pt;color:#000000" href="videoadminscreen.aspx">
					<b>New</b> - Upload you own <b>Videos</b></a></li>
                  <li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">
					No Obligation / No Contract</a></li>
                  <li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">
					24hr. Phone Reservation Service</a></li>
                  <li>
                  <a style="text-decoration:none;font-size:10pt;color:#000000" href="gps1.aspx">GPS Boat Tracking available</a></li>
                  <li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">
					Boat Scheduling Tool / Calendar</a></li>
                  <li>
                  <a href="facilitybusinessqa.aspx" style="font-weight:700">
                  <font size="2" color="#FF0000">Marine Liability Insurance</font></a></li>
</ul>
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" height="20">
						<div align="center">
						<table border="0">
							<tr>
								<td><a class="button" href="howto.htm">How To</a></td>
							</tr>
						</table>
						</div>
						</td>
					</tr>
					<tr>
						<td width="130" align="center" height="20"><a class="button" href="members.aspx">
						Facility Login</a></td>
						<td width="130" align="center" height="20"><a class="button" href="facilities_mant.aspx">
						New Facility</a></td>
					</tr>
					<tr>
						<td width="130" align="center"><a class="button" href="rentwithus.aspx">
						Learn More</a></td>
						<td width="130" align="center" height="20"><a class="button" href="#">
						New Captain</a></td>
					</tr>
				</table>

			</div>
		</div>
		<div id="bestprice" style="width: 572; height: 783">
		<h1 align="center"> 
        </h1>
        <p style="text-align: center"><strong>
        <font color="#FF0000" face="Arial Narrow" size="6">
        <a href="boatmoneymaker.aspx" style="text-decoration: none">
        <font color="#FF0000" size="5">Boat Ownership - Entrepreneur Opportunities</font></a></font></strong></p>
        <hr>
			<font size="4" color="#990000"> <center>
		<h1> 
        New Boats, New Locations This Month.</center></font>
			<br>
		<div id="results" style="overflow:auto; height:110; width:481; position:relative">
        <table class="results_table3" border="0" cellspacing="0" cellpadding="0" style="border-left-width: 1px; border-right-width: 1px; border-top: 1px solid #C0C0C0; border-bottom-width: 1px; width:446px">

<%
    while(!((rs.Eof || (IntMostrados == 6))))
    {
        IntMostrados = IntMostrados + 1;
        if (IntMostrados % 2 == 0)
        {
%>
				<tr class="normal">
<%
        }
        else
        {
%>
				<tr bgcolor="#FFFFCC" class="celda">
<%
        }
%>
				<td height="8" width="80"><%= NVL(rs.Fields["vc_bodywater"].Value, "- ") %></td>
				<!--td height="8" width="80"></td-->
				<td height="8" width="80"><%= NVL(rs.Fields["vc_city"].Value, "- ") %> , </td>
				<td height="8" width="80"><%= NVL(rs.Fields["vc_state"].Value, "-") %></td>
				<td width="120" height="50">
<%
            //=NVL(rs("vc_description"),"- ")
        if (!(Convert.IsDBNull(rs.Fields["in_boatID"].Value)))
        {
%>
				<a href="javascript:goDetail(<%= rs.Fields["in_boatID"].Value %>,<%= rs.Fields["in_marinaID"].Value %>,<%= rs.Fields["in_rating"].Value %>)">
				<img src="boats/<%= rs.Fields["vc_filename"].Value %>" width="80" height="50" alt="" border="0"></a>
<%
        //=rs("vc_nombre")
        }
%>
				</td>
				</tr>
<%
        rs.MoveNext();
    }
%>

		</table>
		</div>
		</div>
		<h1 style="text-align: center"><font color="#000000"><font size="5">New 
        at</font> <i>
        <font face="Tahoma" size="5">BoatRenting.com</font></i></font><hr color="#FFFFFF">
        <a target="_blank" href="http://www.youtube.com/watch?v=mgWBRk7oHcA">
		<img border="0" src="images/girlvideocroped.jpg" width="92" height="77"></a><hr color="#FFFFFF">
        &nbsp;<span style="letter-spacing: 1pt"><font face="Verdana" size="4" color="#0000FF"><a target="_blank" href="http://www.youtube.com/watch?v=mgWBRk7oHcA">See 
        Videos of </a></font>
        <font size="4" face="Verdana">
        <a target="_blank" href="http://www.youtube.com/watch?v=mgWBRk7oHcA">
        <font size="3">Boat Rentals</font></a></font></span></h1>
		<img border="0" src="images/creditcards.jpg"><br>
		&nbsp;&nbsp;<b><a href="#" class="button">Are you a boat captain? Looking for some work? We can use you</a>&nbsp; </b>
        <font face="Arial" size="2">
        <a href="saftey.aspx">Boating Safety/</a></font><p style="text-align: center">
        <b><font size="1">Like this site or need info on reservation software, we can custom 
        build software and a website with online reservations. Call us 
        631-286-7816.</font></b><font size="1">&nbsp; </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</table>
<br>		
<!--SiteSeal Html Builder Code:
Shows the logo at URL https://seal.networksolutions.com/images/basicrecblue.gif
Logo type is  ("NETSB")
//--><script language="JavaScript" type="text/javascript"> SiteSeal("https://seal.networksolutions.com/images/basicrecblue.gif", "NETSB", "none");</script>.</p>




		<p>
        <br>




		</p>




		<div id="footer">
			<div id="footer_details" style="width: 933; height: 26">
				BoatRenting.com � 320 South Country Road � Brookhaven/Bellport
				NY 11719 � 888-610-2628 � <a href="mailto:info@boatrenting.com">
				<font size="1">info@boatrenting.com</font></a>&nbsp; Web Design by
                <a href="contactus.aspx">
                <font size="1">Hilderbrandt Industries</font></a> <%--<a href="linkpage.aspx">
                <font size="1">Link 
                Page</font></a>--%></div>

			</div>
		</div>
	</div>
<%
        oConn.Close();
%>
<script language="JavaScript" type="text/javascript">
function QuickSearch(x){
	//Clear();
	document.frm_search.cmb_boat.selectedIndex = x;
	document.frm_search.action = "results.aspx";
	document.frm_search.submit();
}


  function doSubmit() {
      // omitted logic that sets the action on the form based on the selected option
      document.frmSearch.submit();
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



