<%@ Page language="C#" CodeFile="facilities_mant.aspx.cs" Inherits="BoatRenting.facilities_mant_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
 <form name="frm_facilities_mant" id="form1" runat="server">

 <%
    ////if (Convert.ToString(Session["userID"]) == "")
    ////{
    ////    Session.Abandon();
    ////    Response.Redirect("/members.aspx");
    ////}

    //con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    //Response.Expires = 0;
    //oConn = new Connection();
    //oConn.ConnectionString = con;
    //oConn.ConnectionTimeout = 500;
    //oConn.Open(null);

    //hdn_Action = "N";
    //txt_marinaID = Request["MarinaID"];
    ////'Response.write ("Action" & Request("hdn_Action") & "<BR>")
    ////'Response.write ("Action" & Request("MarinaID"))
    //hdn_Redirect = Request["hdn_Redirect"];
    //hdn_ChangeState = NVL(Request["hdn_ChangeState"], "");
    //countryID = 0;
    //if (!(Request["country"] == ""))
    //{
    //    countryID = Request["country"];
    //}
    //txt_ContactName = NVL(Request["txt_ContactName"], "");
    //txt_BusinessName = NVL(Request["txt_BusinessName"], "");
    //txt_MarinaName = NVL(Request["txt_MarinaName"], "");
    //txt_addressLine1 = NVL(Request["txt_addressLine1"], "");
    //txt_addressLine2 = NVL(Request["txt_addressLine2"], "");
    //txt_city = NVL(Request["txt_city"], "");
    //cbo_State = 0;
    ////'NVL(Request("cbo_State"),0)
    //txt_zip = NVL(Request["txt_zip"], "");
    //cbo_Country = NVL(Request["cbo_Country"], "0");
    //cbo_BodyWater = NVL(Request["cbo_BodyWater"], "");
    //txt_phone = NVL(Request["txt_phone"], "");
    //txt_fax = NVL(Request["txt_fax"], "");
    //txt_tax = NVL(Request["txt_tax"], "0");
    //txt_email = NVL(Request["txt_email"], "");
    //cbo_multipleLocations = NVL(Request["cbo_multipleLocations"], "");
    //cbo_accomodations = NVL(Request["cbo_accomodations"], "");
    //cbo_captain = NVL(Request["cbo_captain"], "");
    //txta_depositPolicy = NVL(Request["txta_depositPolicy"], "");
    //txta_facilityDirections = NVL(Request["txta_facilityDirections"], "");
    //txta_facilityArea = NVL(Request["txta_facilityArea"], "");
    //txt_start = NVL(Request["txt_start"], "");
    //txt_end = NVL(Request["txt_end"], "");
    //txt_rating = NVL(Request["txt_rating"], "0");
    //txt_facilitywebsite = NVL(Request["facilityWebsite"], "");
    //txt_displayadlandingpage = NVL(Request["displayadlandingpage"], "");
    //txt_displayadtype = NVL(Request["displayadtype"], "");
    //if (hdn_Action == "E" && !IsPostBack)
    //{
    //    Session.Add("MarinaID", txt_marinaID);
    //    cmd = new Command();
    //    rs = new Recordset();
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_MARINA_GET";
    //    cmd.CommandType = adCmdStoredProc;
    //    //cmd.Parameters[1].Value = Convert.ToInt32(txt_marinaID);
    //    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    //    cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_marinaID);
    //    rs = cmd.Execute();
    //    txt_ContactName = NVL(Convert.ToString(rs.Fields["vc_ContactName"].Value), "");
    //    txt_BusinessName = NVL(Convert.ToString(rs.Fields["vc_BusinessName"].Value), "");
    //    txt_MarinaName = NVL(Convert.ToString(rs.Fields["vc_MarinaName"].Value), "");
    //    txt_addressLine1 = NVL(Convert.ToString(rs.Fields["vc_addressLine1"].Value), "");
    //    txt_addressLine2 = NVL(Convert.ToString(rs.Fields["vc_addressLine2"].Value), "");
    //    txt_city = NVL(Convert.ToString(rs.Fields["vc_city"].Value), "");
    //    txt_zip = NVL(Convert.ToString(rs.Fields["ch_zip"].Value), "");
    //    if (hdn_ChangeState == "")
    //    {
    //        cbo_Country = NVL(Convert.ToString(rs.Fields["in_CountryID"].Value), "0");
    //        cbo_State = NVL(Convert.ToString(rs.Fields["in_StateID"].Value), "0");
    //    }
    //    if (Convert.ToInt32(cbo_State) > 51)
    //    {
    //        cbo_State = Convert.ToDouble(cbo_State) - 51.0;
    //    }
    //    countryID = cbo_Country;
    //    cbo_BodyWater = NVL(Convert.ToString(rs.Fields["vc_BodyWater"].Value), "");
    //    txt_phone = NVL(Convert.ToString(rs.Fields["vc_phone"].Value), "");
    //    txt_fax = NVL(Convert.ToString(rs.Fields["vc_fax"].Value), "");
    //    txt_tax = NVL(Convert.ToString(rs.Fields["nu_tax"].Value), "0");
    //    txt_email = NVL(Convert.ToString(rs.Fields["vc_email"].Value), "");
    //    cbo_multipleLocations = NVL(Convert.ToString(rs.Fields["ch_multipleLocations"].Value), "");
    //    cbo_accomodations = NVL(Convert.ToString(rs.Fields["ch_accomodations"].Value), "");
    //    //'	txt_explain = NVL(rs("vc_explain"),"")
    //    //'	cbo_securityDeposit = NVL(rs("ch_securityDeposit"),"")
    //    cbo_captain = NVL(Convert.ToString(rs.Fields["ti_captain"].Value), "");
    //    txta_depositPolicy = NVL(Convert.ToString(rs.Fields["vc_depositPolicy"].Value), "");
    //    txta_facilityDirections = NVL(Convert.ToString(rs.Fields["vc_facilityDirections"].Value), "");
    //    txta_facilityArea = NVL(Convert.ToString(rs.Fields["vc_facilityArea"].Value), "");
    //    txt_start = NVL(Convert.ToString(rs.Fields["vc_startHour"].Value), "");
    //    txt_end = NVL(Convert.ToString(rs.Fields["vc_endHour"].Value), "");
    //    txt_fee = NVL(Convert.ToString(rs.Fields["nu_fee"].Value), "15");
    //    txt_feeType = NVL(Convert.ToString(rs.Fields["ch_feeType"].Value), "1");
    //    txt_rating = NVL(Convert.ToString(rs.Fields["in_rating"].Value), "0");
    //    txt_facilitywebsite = NVL(Convert.ToString(rs.Fields["facilityWebsite"].Value), "");
    //    txt_displayadlandingpage = NVL(Convert.ToString(rs.Fields["displayadlandingpage"].Value), "");
    //    txt_displayadtype = NVL(Convert.ToString(rs.Fields["displayadtype"].Value), "");
    //}
%>

<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";
    .style3
    {
        text-align: right;
        height: 20px;
    }
    .style4
    {
        height: 20px;
    }
    #txta_depositPolicy
    {
        height: 36px;
    }
    #txta_facilityArea
    {
        height: 36px;
    }
    #txta_facilityDirections
    {
        height: 36px;
    }
    </style>
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

function Validar () {
    var chk=false;
	var errorMsg = "";
	
	var s="Phone numbers or web address Characters Sequence are not allowed in text form.Please remove any Phone numbers or web address Character Sequences";

	if (document.getElementById("txt_contactName").value == ""){
		errorMsg += "\n\t Contact Name \t                  - Enter your Contact Name";
	}

	if (document.getElementById("txt_businessName").value == ""){
		errorMsg += "\n\t Bussiness Name \t                  - Enter your Bussiness Name";
	}

	if (document.getElementById("cbo_State").value == "0" &&
		(document.getElementById("cbo_Country").value == "1"  ||/*USA*/
		 document.getElementById("cbo_Country").value == "5" /*Canada*/
		)
		){
		errorMsg += "\n\t State Name \t                  - Enter State";
	}
	if (document.getElementById("cbo_Country").value == "0"){
		errorMsg += "\n\t Country Name \t                  - Enter Country";
	}
	if (document.getElementById("cbo_BodyWater").value == ""){
		errorMsg += "\n\t Body of Water \t                  - Enter Body of Water";
	}


if ( IsFieldContainsEmail(document.getElementById("txt_addressLine1").value))
{
		errorMsg += "\n\t Address Line 1  \t\t                 "+s;
		
 
}


if ( IsFieldContainsPhone(document.getElementById("txt_addressLine1").value))
{
		errorMsg += "\n\t Address Line 1 \t\t                 "+s;
 
}

if ( IsFieldContainsWeb(document.getElementById("txt_addressLine1").value))
{
		errorMsg += "\n\t Address Line 1 \t\t           "+s;
 
}



if ( IsFieldContainsEmail(document.getElementById("txta_facilityDirections").value))
{
		errorMsg += "\n\t Facility Direction  \t\t                "+s;
}


if ( IsFieldContainsPhone(document.getElementById("txta_facilityDirections").value))
{
		errorMsg += "\n\t Facility Direction  \t\t              "+s;
}

if ( IsFieldContainsWeb(document.getElementById("txta_facilityDirections").value))
{
		errorMsg += "\n\t Facility Direction  \t\t               "+s;
}



if ( IsFieldContainsEmail(document.getElementById("txta_depositPolicy").value))
{
		errorMsg += "\n\t Facility Cancellation Policy  \t\t                "+s;
		
}


if ( IsFieldContainsPhone(document.getElementById("txta_depositPolicy").value))
{
		errorMsg += "\n\t Facility Cancellation Policy  \t\t              "+s;
}

if ( IsFieldContainsWeb(document.getElementById("txta_depositPolicy").value))
{
		errorMsg += "\n\t Facility Cancellation Policy  \t\t            "+s;
		
}



if ( IsFieldContainsEmail(document.getElementById("txta_facilityArea").value))
{
		errorMsg += "\n\t Facility Area + Attraction  \t\t                "+s;
		
 
}


if ( IsFieldContainsPhone(document.getElementById("txta_facilityArea").value))
{
		errorMsg += "\n\t Facility Area + Attraction  \t\t            "+s;
		
 
}

if ( IsFieldContainsWeb(document.getElementById("txta_facilityArea").value))
{
		errorMsg += "\n\t Facility Area + Attraction  \t\t  " + s;
		
 
}


	if (document.getElementById("txt_phone").value == ""){
		errorMsg += "\n\t Phone \t\t                  - Enter Phone";
	}

	if (document.getElementById("txt_email").value == ""){
		errorMsg += "\n\t E-mail \t\t                  - Write your E-mail";
	}

/*
	if (document.getElementById("txt_email").value != "")
	{
		strEmail = document.getElementById("txt_email").value;
		if (strEmail.length>0)
		{
			if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
			{
				errorMsg += "\n\t E-mail \t\t                  - Your E-mail address is invalid";
			}
		}
	}
*/

	if (document.getElementById("txt_tax").value == ""){
		errorMsg += "\n\t Tax rate \t\t                  - Enter Tax Rate";
	}

	if (document.frm_facilities_mant.rdo_fee[0].checked == true){
		if (document.getElementById("txt_fee").value == ""){
			errorMsg += "\n\t Commission Fee \t\t  - Enter Percentage";
		}
	}

	if (document.frm_facilities_mant.rdo_fee[1].checked == true){
		if (document.getElementById("txt_fee2").value == ""){
			errorMsg += "\n\t Commission Fee \t\t  - Enter Flat Rate";
		}
	}

if (document.frm_facilities_mant.rdo_fee[2].checked == true){
		if (document.getElementById("txt_fee3").value == ""){
			errorMsg += "\n\t Display Ad Fee \t\t  - Enter Display Ad";
		}
		
		if ((document.frm_facilities_mant.txt_displayadtype[0].checked == false) && (document.frm_facilities_mant.txt_displayadtype[1].checked == false)) 
	
	    {
	     errorMsg += "\n\t Display Ad Type \t\t- Enter Display Ad Type";
	     
	    }
	
	
	}



	if (document.getElementById("txt_facilitywebsite").value == ""){
		errorMsg += "\n\t Facility Web Site \t\t  - Enter Your Website address. If you dont have a Website, enter www.BoatRenting.com";
	}
	
	
	if (document.getElementById("txt_start").value == ""){
		errorMsg += "\n\t Business Hours \t\t  - Open";
	}


	if (document.getElementById("txt_end").value == ""){
		errorMsg += "\n\t Business Hours \t\t  - Closed";
	}

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

function IsFieldContainsEmail(str)
{
var em = /([a-zA-Z0-9])+([\.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(\.[a-zA-Z0-9_-]+)+/



if (em.test(str))
return true;
else 
return false;


}

                  
function IsFieldContainsPhone(str)
{
var ph = /((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}/
  
if (ph.test(str))
return true;
else 
return false;

}


function IsFieldContainsWeb(str)
{
var we = /(http:\/\/www.|https:\/\/www.|ftp:\/\/www.|www.){1}([\w]+)(.[\w]+){1,2}/; 
  


if (we.test(str))
return true;
else 
return false;


}



function Save() {
	if (Validar()){
	  	document.frm_facilities_mant.action="facilities_save.aspx";
	  	document.frm_facilities_mant.submit();
	}
}

function ChangeFeeType(x) {
	if (x==1){
		document.frm_facilities_mant.txt_fee.disabled = false;
		document.frm_facilities_mant.txt_fee2.value = "";
		document.frm_facilities_mant.txt_fee2.disabled = true;
			document.frm_facilities_mant.txt_fee3.disabled = true;
			 document.getElementById("divAdType").style.visibility="hidden";
	}
	if (x==2){
		document.frm_facilities_mant.txt_fee.value = "";
		document.frm_facilities_mant.txt_fee.disabled = true;
		document.frm_facilities_mant.txt_fee2.disabled = false;
			document.frm_facilities_mant.txt_fee3.disabled = true;
			 document.getElementById("divAdType").style.visibility="hidden";
		
	}
	
	if (x==3){
		document.frm_facilities_mant.txt_fee.value = "";
		document.frm_facilities_mant.txt_fee.disabled = true;
		document.frm_facilities_mant.txt_fee2.disabled = true;
		document.frm_facilities_mant.txt_fee3.disabled = false;
	
		
		 document.getElementById("divAdType").style.visibility="visible";
	}
	
}


function ChangeDisplayType(y)
{
  
  if (y==1)
    document.frm_facilities_mant.txt_displayadtype.value="M"
  if (y==2)
   document.frm_facilities_mant.txt_displayadtype.value="Y"
     
}

function Cancel() {
  //	document.frm_facilities_mant.action="facilities_list.aspx";
  //	document.frm_facilities_mant.submit();
 history.go(-1);
}

function LogOut() {
  	document.frm_facilities_mant.action="logout.aspx";
  	document.frm_facilities_mant.submit();
}

function ShowHelp(opt){
	if (opt==1){
		text='Name the body of water in which your boat is located. Please be specific. For example, if your facility is located on the East Coast, you would not say Atlantic Ocean, but rather the particular bay, cove or river where your boat is located.'
	}
	if (opt==2){
		text='If your facility has multiple locations you must enroll each individual location as a separate facility with its own user name and password. You may keep the Contact name and Business name the same, but user name and password must be unique. ***IMPORTATNT*** Please remember what user name and password go with each facility.'
}
	if (opt==3){
		text='This is where you can explain the benefits of your area. For example, if your facility has a bait and tackle store or ship store you can include it here. Also, if there are any restaurants, parks, beaches, or other local attractions that would interest a customer you can list them or include a short explanation.'
	}
	window.open('help.aspx?text='+text, 'help'+opt, 'scrollbars=no,height=220,width=300,status=no');
}

function cuenta1(FORM1) {
var n = document.frm_facilities_mant.txta_depositPolicy.value.length;
if (n>=1000)
{
	window.event.keyCode = 0;
	alert('The field facility cancellation policy can not contain more than 1000 characters');
	return false;
}
return true;
}

function cuenta2(FORM1) {
var n = document.frm_facilities_mant.txta_facilityArea.value.length;
if (n>=1000)
{
	window.event.keyCode = 0;
	alert('The field facility area + atractions can not contain more than 1000 characters');
	return false;
}
return true;
}

function cuenta3(FORM1) {
var n = document.frm_facilities_mant.txta_facilityDirections.value.length;
if (n>=1000)
{
	window.event.keyCode = 0;
	alert('The field facility directions can not contain more than 1000 characters');
	return false;
}
return true;
}


function OnlyNumbers() {
	var key=window.event.keyCode;
		if ((key < 48 || key > 57) && key!=46 ){
		window.event.keyCode=0;
		alert('Type only numbers');
	}
}
function LoadStates() {

    
//	var country = document.frm_facilities_mant.cbo_Country.selectedIndex;
//	document.frm_facilities_mant.country.value = country;
//	document.frm_facilities_mant.action = "facilities_mant.aspx";
//	//document.frm_facilities_mant.hdn_Action.value = "E";
//	document.frm_facilities_mant.hdn_ChangeState.value = "CHANGE";
    //	document.frm_facilities_mant.submit();
}

function ShowTC() {
    window.open('termsconditions.aspx', 'tc', 'scrollbars=yes,height=450,width=500,status=no');
}


</script>
<body>
<input type="hidden" name="hdnPag" value="<%= nPag %>"/>
<input type="hidden" name="hdn_Action" value="<%= hdn_Action %>"/>
<input type="hidden" name="hdn_MarinaID" value="<%= txt_marinaID %>"/>
<input type="hidden" name="hdn_Redirect" value="<%= hdn_Redirect %>"/>
<input type="hidden" name="MarinaID" value="<%= txt_marinaID %>"/>
<input type="hidden" name="hdn_ChangeState" value=""/>
<input type="hidden" name="country" value=0/>
	<div id="container">
		<div id="banner"></div>
		<!--div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="FACILITIES_SEARCH.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="users_list.aspx">Add User</a>
		</div-->
		<div id="menu">
			<ul>
				<li id="current"><a href="index.aspx">Home</a></li>
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
		<div id="sub_menu">
				<a href="index.aspx">Home</a>&nbsp;| &nbsp;
			<a href="rentwithus.aspx">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="Articles.aspx">Articles</a>&nbsp;|&nbsp;
            <a href="In_the_News.aspx">Press Room</a>&nbsp;|&nbsp;
			<a href="sitemap.aspx">Site Map</a></div>
			<div id="table_div">
				<table id="facility_table" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="4">
                            <%
    if (hdn_Action == "N")
    {
%>List Your Boat - Free
<%
    }
    else
    {
%>Edit Facility
<%
    }
%>
						</th>
					</tr>
					<tr>
						<td class="align_right">Contact Name<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_contactName" type="text" class="contact_name" id="txt_contactName" value="<%= txt_ContactName %>" maxlength="100"  tabindex="1" size="20" /></td>
					</tr>
					<tr>
						<td class="align_right">Facility or Proprietor Name<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_businessName" type="text" class="business_name" id="txt_businessName" value="<%= txt_BusinessName %>" maxlength="100" tabindex="2" size="20" /></td>
					</tr>
					<tr>
						<td class="align_right">Marina Name if not the same</td>
						<td colspan="3">
                        <input name="txt_marinaName" type="text" class="facility_name" id="txt_marinaName" value="<%= txt_MarinaName %>" maxlength="100" tabindex="3" size="20" /></td>
					</tr>
					<tr>
						<td class="align_right">E-mail or User Name<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_usser" type="text" maxlength="100" tabindex="4" size="20" /></td>
					</tr>

					<tr>
						<td class="align_right">Password<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_pass" type="password" maxlength="30" tabindex="5" size="20" /></td>
					</tr>
					<tr>
						<td class="align_right">Address 1<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_addressLine1" type="text" class="address_line1" 
                                id="txt_addressLine1" value="<%= txt_addressLine1 %>" maxlength="200" 
                                tabindex="6" size="20" /></td>
					</tr>
					<tr>
						<td class="align_right">Address 2</td>
						<td colspan="3">
                        <input name="txt_addressLine2" type="text" class="address_line2" 
                                id="txt_addressLine2" value="<%= txt_addressLine2 %>" maxlength="200" 
                                tabindex="7" size="20" /></td>
					</tr>
					<tr>
					  <td class="align_right">Country<span class="hilite">*</span></td>
					  <td colspan="3">
                          <%--
    CountryName();
--%>
                          <asp:DropDownList ID="cboCountry" runat="server" AutoPostBack="True" 
                              onselectedindexchanged="cboCountry_SelectedIndexChanged">
                          </asp:DropDownList>
                      </td>
					</tr>

					<tr  >
						<td class="align_right">State/Province<span class="hilite">*</span></td>
						<td colspan="3">
<%--                            <%
    StateName();
%>
--%>                          <asp:DropDownList ID="cboStates" runat="server" AutoPostBack="False" >
                          </asp:DropDownList>
						</td>
					</tr>


					<tr>
						<td class="style3">City/Region</td>
						<td colspan="3" class="style4">
                        <input name="txt_city" type="text" class="city" id="txt_city" 
                                value="<%= txt_city %>" maxlength="50" tabindex="8" size="20"  /></td>
					</tr>

					<tr>
						<td class="align_right">Zip/Postal Code</td>
						<td colspan="3">
                        <input name="txt_zip" type="text" class="zipcode" id="txt_zip" 
                                value="<%= txt_zip %>" maxlength="5" tabindex="9" size="20" /></td>
					</tr>



					<tr>
						<td class="align_right">Body of Water<span class="hilite">*</span>&nbsp;<a href="javascript:ShowHelp(1);" tabindex="29" ><img src="images/help.png" border="0" alt="Help!" /></a></td>
						<td colspan="3">
							<input name="cbo_BodyWater" class="body_of_water"  value="<%= cbo_BodyWater %>" 
                                maxlength="200" tabindex="10" size="20"  />

						</td>
					</tr>
					<tr>
						<td class="align_right">Phone<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_phone" type="text" class="phone_number" id="txt_phone" 
                                value="<%= txt_phone %>" maxlength="20" tabindex="11" size="20" /></td>
					</tr>

					<tr>
						<td class="align_right">Fax</td>
						<td colspan="3">
                        <input name="txt_fax" type="text" class="fax" id="txt_fax" value="<%= txt_fax %>" 
                                maxlength="20" tabindex="12" size="20" /></td>
					</tr>
					<tr>
						<td class="align_right">Reservation E-mail<a href="javascript:ShowHelp(4)" tabindex="30"><img src="images/help.png" alt=" This is the E-mail address were you want your tentative reservations alerts sent to. You may have multiple alerts sent to multiple E-mail address once you assign additional users on your account. " border="0" /></a><span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_email" type="text" class="address_line2" id="txt_email" value="<%= txt_email %>" maxlength="100" tabindex="14" size="20" /></td>
					</tr>
					
					<tr>
						<td class="align_right">Tax Rate<span class="hilite">*</span></td>
						<td colspan="3">
                        <input name="txt_tax" type="text" class="fax" id="txt_tax" value="<%= txt_tax %>" tabindex="15" onkeypress="javascript:OnlyNumbers();" size="20" />%</td>
					</tr>

					<tr>
					  <td class="align_right">Multiple Locations&nbsp; <a href="javascript:ShowHelp(2)" tabindex="30"><img src="images/help.png" alt=" If your facility has multiple locations you must enroll each individual location as a separate facility with its own user name and password. You may keep the Contact name and Business name the same, but user name and password must be unique " border="0" /></a></td>
					  <td colspan="3"><select name="cbo_multipleLocations" class="multiple_locations" id="cbo_multipleLocations" tabindex="16">
                            <option value="0" <%
    if (cbo_multipleLocations == "0")
    {
%>
selected <%
    }
%>
>No</option>
                            <option value="1" <%
    if (cbo_multipleLocations == "1")
    {
%>
selected <%
    }
%>
>Yes</option>
                          </select>
                        </td>
					</tr>

					<tr>
						<td class="align_right">Do you offer accomodations?</td>
						<td colspan="3"><select name="cbo_accomodations" class="accomodations" id="cbo_accomodations"  tabindex="17">
                            <option value="0" <%
    if (cbo_accomodations == "0")
    {
%>
selected <%
    }
%>
>No</option>
                            <option value="1" <%
    if (cbo_accomodations == "1")
    {
%>
selected <%
    }
%>
>Yes</option>
                          </select>
                        </td>
					</tr>

					<tr>
						<!--td class="align_right">If 'yes', please explain:</td>
					  <td><input name="txt_explain" type="text" class="accomodations_explain" id="txt_explain" value="<%= txt_explain %>"/>
                      </td-->
					  <td class="align_right">Do you offer captain or guide?</td>
					  <td colspan="3"><select name="cbo_captain" id="cbo_captain"  tabindex="18">
                            <option value="0" <%
    if (cbo_captain == "0")
    {
%>
selected <%
    }
%>
>No</option>
                            <option value="1" <%
    if (cbo_captain == "1")
    {
%>
selected <%
    }
%>
>Yes</option>
                          </select>
					  </td>
					</tr>
					<!--tr>
						<td class="align_right">Security Deposit</td>
						<td>
							<select name="cbo_SecurityDeposit">
								<option value="0" selected >Yes</option>
								<option value="1"  selected >No</option>
							</select>
						</td>
						<td colspan="2">
					</tr-->

					<tr>
					  <td class="align_right">Business Hours: Open<span class="hilite">*</span></td>
					  <td colspan="3">
                      <input name="txt_start" type="text" class="fax" id="txt_start" value="<%= txt_start %>" maxlength="8" tabindex="20" size="20"/>
            			&nbsp;<font size="1">Example. 09:30 am</font></td>
					</tr>
					<tr>
					  <td class="align_right">Closed<span class="hilite">*</span></td>
					  <td colspan="3">
                      <input name="txt_end" type="text" class="fax" id="txt_end" value="<%= txt_end %>" maxlength="8" tabindex="21" size="20"/>
					  	&nbsp;<font size="1">Example. 05:00 pm</font></td>
					</tr>
					<tr>
						<td class="align_top_right">Facility Cancellation Policy</td>
						<td colspan="3">
							<textarea name="txta_depositPolicy" cols="60" rows="2" id="txta_depositPolicy"  tabindex="22" onkeypress="javascript:cuenta1();" ><%= txta_depositPolicy %></textarea>
						</td>
					</tr>
					<tr>
					  <td class="align_top_right">Facility Area
				          + Atractions&nbsp;<a href="javascript:ShowHelp(3);" tabindex="31"><img src="images/help.png" border="0" alt=" This is where you can explain the benefits of your area. For example, if your facility has a bait and tackle store or ship store you can include it here. Also, if there are any restaurants, parks, beaches, or other local attractions that would interest a customer you can list them or include a short explanation. " /></a></td>
					  <td colspan="3"><textarea name="txta_facilityArea" cols="60" rows="2" id="txta_facilityArea"  tabindex="23" onkeypress="javascript:cuenta2();" ><%= txta_facilityArea %></textarea></td>
					</tr>
					<tr>
					  <td class="align_top_right">Facility Directions</td>
						<td colspan="3">
							<textarea name="txta_facilityDirections" cols="60" rows="2" id="txta_facilityDirections" tabindex="24" onkeypress="javascript:cuenta3();"  ><%= txta_facilityDirections %></textarea>
						</td>
					</tr>
					<tr>
					  <td class="align_top_right">&nbsp;</td>
					  <td colspan="3">&nbsp;</td>
				  </tr>
				</table>
				<div><span class="hilite">*</span>
				 <span class="hilite_explain">Required fields</span></div>
				<div style="font-size: 12pt; margin-top: 6px; padding-left: 20px;">
				<input type="checkbox" name="chk_accept" tabindex="25" value="ON" />I accept the <a style="font-size: 12pt;" href="javascript:ShowTC()" tabindex="26">Terms and Conditions</a> and agree with them.<br />
                    <br />
                </div>	


	            <asp:Button ID="btnSave" runat="server" onclick="Button1_Click" Text="Save" 
                    BackColor="#6699CC" ForeColor="White" Height="20px" Width="60px" />

                &nbsp; &nbsp; &nbsp;
	            
	            <asp:Button ID="btnCancel" runat="server" 
                    OnClientClick="JavaScript: window.history.back(1); return false;" Text="Cancel" 
                    BackColor="#6699CC" ForeColor="White" Height="20px" Width="60px" 
                    onclick="btnCancel_Click" />
	

	  </div>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
	</div>
    </body>
	</form>
<script type="text/javascript" type="text/javascript"><![CDATA[
//    function ShowTC() {
//        window.open('termsconditions.aspx', 'tc', 'scrollbars=yes,height=450,width=500,status=no');
//    }

    function ShowHelp(opt) {
        if (opt == 1) {
            text = 'Name the body of water in which your boat is located. Please be specific. For example, if your facility is located on the East Coast, you would not say Atlantic Ocean, but rather the particular bay, cove or river where your boat is located.'
        }
        if (opt == 2) {
            text = 'If your facility has multiple locations you must enroll each individual location as a separate facility with its own user name and password. You may keep the Contact name and Business name the same, but user name and password must be unique.<br><u>IMPORTANT</u>br>Please remember what user name and password go with each facility.'
        }
        if (opt == 3) {
            text = 'This is where you can explain the benefits of your area. For example, if your facility has a bait and tackle store or ship store you can include it here. Also, if there are any restaurants, parks, beaches, or other local attractions that would interest a customer you can list them or include a short explanation.'
        }
        if (opt == 4) {
            text = 'This is the E-mail address were you want your tentative reservations alerts sent to. You may have multiple alerts sent to multiple E-mail address once you assign additional users on your account.'
        }

        window.open('/help.aspx?text=' + text, 'help' + opt, 'scrollbars=no,height=220,width=300,status=no');
    }

    function QuickSearch(x) {
        document.frm_facilities_mant.cmb_boat.value = x;
        document.frm_facilities_mant.cmb_country.value = 0;
        document.frm_facilities_mant.cmb_body.value = 0;
        document.frm_facilities_mant.cmb_facility.value = 0;
        document.frm_facilities_mant.cmb_state.value = 0;
        document.frm_facilities_mant.cmb_zip.value = 0;
        document.frm_facilities_mant.action = "results.aspx";
        document.frm_facilities_mant.submit();
    }
    function LoadStates() {
        var country = document.frm_facilities_mant.cbo_Country.selectedIndex;
        document.frm_facilities_mant.country.value = country;
        document.frm_facilities_mant.action = "facilities_mant.aspx";
        document.frm_facilities_mant.submit();
    }

]]></script>



</html>

