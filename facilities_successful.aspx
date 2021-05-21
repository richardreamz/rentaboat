<%@ Page language="C#" CodeFile="facilities_successful.aspx.cs" Inherits="BoatRenting.facilities_successful_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--#include file="__functions.aspx"-->
<%
    TxtContactName = Request["TxtContactName"];
%>

<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />

    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>

</head>
<script language="javascript">

function Redirect() {
	document.frm_facilities_successful.action="members.aspx";
	document.frm_facilities_successful.submit();
}

function QuickSearch(x){
	document.frm_facilities_successful.cmb_boat.value = x;
	document.frm_facilities_successful.cmb_country.value = 0;
	document.frm_facilities_successful.cmb_body.value = 0;
	document.frm_facilities_successful.cmb_facility.value = 0;
	document.frm_facilities_successful.cmb_state.value = 0;
	document.frm_facilities_successful.cmb_zip.value = 0;
	document.frm_facilities_successful.action = "results.aspx";
	document.frm_facilities_successful.submit();
}
</script>




<body>

<FORM name="frm_facilities_successful" method=POST>
<input type="hidden" name="hdnPag" value="<%= nPag %>">
<input type="hidden" name="hdn_Action" value="<%= hdn_Action %>">
<input type="hidden" name="hdn_MarinaID" value="<%= txt_MarinaID %>">
<input type="hidden" name="cmb_boat">
<input type="hidden" name="cmb_country">
<input type="hidden" name="cmb_body">
<input type="hidden" name="cmb_facility">
<input type="hidden" name="cmb_state">
<input type="hidden" name="cmb_zip">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
				<li id="current"><a href="default.aspx">Home</a></li>
				<li><a href="javascript:QuickSearch(3)">Boating Clubs</a></li>
				<li><a href="javascript:QuickSearch(12)">Cabin</a></li>
				<li><a href="javascript:QuickSearch(8)">Charters</a></li>
				<li><a href="javascript:QuickSearch(10)">Dinner</a></li>
				<li><a href="javascript:QuickSearch(9)">Excursions</a></li>
				<li><a href="javascript:QuickSearch(1)">Fishing</a></li>
				<li><a href="javascript:QuickSearch(7)">Jet Ski</a></li>
				<li><a href="javascript:QuickSearch(4)">Paddle</a></li>
				<li><a href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li><a href="javascript:QuickSearch(2)">Sailing</a></li>
				<li><a href="javascript:QuickSearch(6)">Speed</a></li>
				<li><a href="javascript:QuickSearch(5)">Yachts</a></li>
				<!--li><a href="javascript:QuickSearch(8)">Houseboat</a></li-->
			</ul>
		</div>
		<!-- SUB MENU -->
		<table cellpadding="0" cellspacing="0" width="780" height="25" style="background: url('images/sub_menu_bg.gif') repeat-x bottom left; margin-left: 1px; color: #666">
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
			<a href="sitemap.aspx">Site Map</a>
			</td>
			<td width="130" height="25">
			<div><a href="members.aspx" class="buttonMenu-Sign" style="color:white;"><b>
			  Manager Sign In</b></div></a></td>
		</tr>
		</table>
			<div id="table_div">
				<table id="facility_table" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="4">New Facility</th>
					</tr>
					<tr>
						<td class="align_right" height="30"></td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="align_right"></td>
          					<td colspan="3">
						  <font size="4">Thanks for your registration on our site. We will process your request shortly.
						Please wait for our email validating your password. If you don't receive the confirmation email within 10 minutes, please check your spam 
                          folder.</font><p><font size="4">&nbsp;Here are some of the great benefits as a BoatRenting.com advertiser; </font>
                          </p>
                          <ul>
                            <li>
                            <font size="4">Choose our commission based or a display ad.</font></li>
                            <li>
                            <font size="4">Free Rental scheduling/calendar web-base software, accessible any were any time.</font></li>
                            <li>
                            <font size="4">Printable daily, weekly and monthly scheduled rental report. </font>
                            </li>
                            <li>
                            <font size="4">24/7 phone &amp; web reservation service. </font>
                            </li>
                            <li>
                            <font size="4">Chose to suspend your boats off the system anytime. (Repairs, break-downs, holidays).</font></li>
                            <li>
                            <font size="4">You and your customer can print custom rental agreements from the website.</font></li>
                            <li>
                            <font size="4">Link button from your web site linking your customers to only your rentable boats.</font></li>
                            <li>
                            <font size="4">Your own custom boat page with online reservations button.</font></li>
                            <li>
                            <font size="4">Add an online reservation button to your site with our page wizard.</font></li>
                            <li>
                            <font size="4">No Credit Card fees, applications, charge backs or percentages to pay. </font>
                            </li>
                            <li>
                            <font size="4">Direct mail campaigns, Your Customers/ Your Company Name.</font></li>
                            <li>
                            <font size="4">Easy customer data retrieval.</font></li>
                            <li>
                            <font size="4">Improve your quality of renter through our renter boat history report.</font></li>
                            <li>
                            <font size="4">Desk top button or link to your rental boat system.</font></li>
                            <li>
                            <font size="4">Free listing on www.rentaboat.com and all our other sites.</font></li>
                            <li>
                            <font size="4">Top ten search engine placement.</font></li>
                            <li>
                            <font size="4">Rental receipt with, directions, hours, phone # and contact info emailed to customers.</font></li>
                            <li>
                            <font size="4">We alert current BoatRenting.com customers in your area about your rentable boats.</font></li>
                            <li>
                            <font size="4">BoatRenting.com customers are alerted to any boat changes or additions with in there area code.</font></li>
                            <li>
                            <font size="4">National Yellow page listing.</font></li>
                            <li>
                            <font size="4">World Wide marketing.</font></li>
                            <li>
                            <font size="4">Online boating courses - Coming soon!!</font></li>
                            <li>
                            <font size="4">New - Stream Line video of your boats uploadable from your computer. </font>
                            </li>
                          </ul>
                          <p><font size="4">Feel free to contact us with any questions at [888-610-BOAT] 2628.</font></p>
                          <p><font size="4">&nbsp;</font></p>
                          <p><font size="4">We're here to help you!</font></p>
                          <p><font size="4">&nbsp;</font></p>
                          <p><font size="4">Sincerely, </font></p>
                          <address><font size="4">Ken Hilderbrandt JR</font></address>
                          <address><font size="4">BoatRenting.com Inc. </font>
                          </address>
                          <address><font size="4">320 South Country Road</font></address>
                          <address><font size="4">Brookhaven NY 11719</font></address>
                          <address><font size="4">631-286-7816 ext 10 </font>
                          </address>
                          <p> 
<br>
						</td>
					</tr>
					<tr>
					  <td class="align_top_right" height="100">&nbsp;</td>
					  <td colspan="3" align="center"></td>
				  </tr>
				</table>
				<a href="javascript:Redirect();" class="button"> Accept</a>
	  </div>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
	</div>
	</form>
</body>
</html>
