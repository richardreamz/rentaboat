<%@ Page language="C#" CodeFile="newuser.aspx.cs" Inherits="BoatRenting.newuser_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }
    
    countryID = 0;
    firstName = Request.Form["firstName"];
    lastName = Request.Form["lastName"];
    password = Request.Form["password"];
    password2 = Request.Form["password2"];
    email = Request.Form["email"];
    email2 = Request.Form["email2"];
    adress = Request.Form["adress"];
    phone = Request.Form["phone"];
    phone2 = Request.Form["phone2"];
    mobilephone = Request.Form["mobilephone"];
    fax = Request.Form["fax"];
    zip = Request.Form["zip"];
    city = Request.Form["city"];
    if (!(Request.Form["new_user_country"] == ""))
    {
        countryID = Request.Form["new_user_country"];
    }
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import url(../br.css);</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>
<body>
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
<%
    if (Convert.ToDouble(Session["userLevelID"]) != 2.0)
    {
%>
			<li ><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li><a href="users_list.aspx">Add User</a></li>
			<li ><a href="boats_list.aspx">Boat List</a></li>
<%
    }
%>
			<li><a href="calendar.aspx">Calendar</a></li>
			<li id="current"><a href="boats_list_reservation.aspx">New Reservation</a></li>
			<li><a href="boats_list_reports.aspx">Reports</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu">&nbsp;  </div>
		<div id="new_user_creation">
			<form name="frm_newuser" method="post">
			<input type="hidden" name="cmb_boat" value =<%= Request.Form["cmb_boat"] %>>
			<input type="hidden" name="cmb_country" value = "<%= Request.Form["cmb_country"] %>" >
			<input type="hidden" name="cmb_body" value = "">
			<input type="hidden" name="cmb_facility">
			<input type="hidden" name="city" value = "<%= Request.Form["city"] %>">
			<input type="hidden" name="zip" value = "<%= Request.Form["zip"] %>">
			<input type="hidden" name="firstName" value = "<%= Request.Form["firstName"] %>" >
			<input type="hidden" name="lastName" value = "<%= Request.Form["lastName"] %>">
			<input type="hidden" name="password" value = "<%= Request.Form["password"] %>">
			<input type="hidden" name="password2" value = "<%= Request.Form["password2"] %>">
			<input type="hidden" name="email" value = "<%= Request.Form["email"] %>">
			<input type="hidden" name="email2" value = "<%= Request.Form["email2"] %>">
			<input type="hidden" name="adress" value = "<%= Request.Form["adress"] %>">
			<input type="hidden" name="phone" value = "<%= Request.Form["phone"] %>">
			<input type="hidden" name="phone2" value = "<%= Request.Form["phone2"] %>">
			<input type="hidden" name="mobilephone" value = "<%= Request.Form["mobilephone"] %>">
			<input type="hidden" name="fax" value = "<%= Request.Form["fax"] %>">
			<!-- Esta e sla diferencia con el del cliente -->			<input type="hidden" name="hdnBoatID" value="<%= Request.Form["hdnBoatID"] %>">
			<table id="new_user_table" cellpadding="0" cellspacing="0">
				<tr>
					<th colspan="4">New User</th>
				</tr>
				<tr>
					<td class="align_right">First Name</td>
					<td><input type="text" name="new_user_first_name" class="form_firstname"  maxlength="50"/> *</td>
					<script> document.frm_newuser.new_user_first_name.value = document.frm_newuser.firstName.value </script>
					<td class="align_right">Last Name</td>
					<td><input type="text" name="new_user_last_name" class="form_lastname" maxlength="50" value = "<%= lastName %>" /> *</td>
				<tr>
				<tr>
					<td class="align_right">Email Address:</td>
					<td><input type="text" name="new_user_email" class="form_email" maxlength="100" value ="<%= email %>" /> *</td>
					<td class="align_right">Confirm Email:</td>
					<td><input type="text" name="new_user_confirm_email" class="form_email" maxlength="100" value ="<%= email2 %>"/></td>
				</tr>
				<tr>
					<td class="align_right">Password:</td>
					<td><input type="password" name="new_user_password" class="form_firstname" maxlength="30" value ="<%= password %>"/> *</td>
					<td class="align_right">Confirm Password:</td>
					<td><input type="password" name="new_user_confirm_password" class="form_firstname" maxlength="30" value ="<%= password2 %>" /></td>
				</tr>
				<tr>
					<td class="align_right">Adress:</td>
					<td colspan="2"><input type="text" name="new_user_address" class="form_address" maxlength="100" value ="<%= adress %>"/> *</td>
					<td></td>
				</tr>
				<tr>
					<td class="align_right">City:</td>
					<td colspan="2"><input type="text" name="new_user_city" class="form_city" maxlength="50" value ="<%= city %>" /> *</td>
					<td></td>
				</tr>
				<tr>
					<td class="align_right">Country:</td>
					<td><%
    Country();
%>
 *</td>
				</tr>
				<tr>
					<td class="align_right">State:</td>
					<td><%
    States();
%>
 *</td>
					<td class="align_right">Zip Code:</td>
					<td colspan="2"><input type="text" name="new_user_zipcode" class="form_zipcode" maxlength="5" value ="<%= zip %>" /> *</td>
				</tr>
				<tr>
					<td class="align_right">Phone Number:</td>
					<td colspan="2"><input type="text" name="new_user_phone_number" class="form_phone" value ="<%= phone %>" maxlength="20"/> *</td>
					<td></td>
				</tr>
				<tr>
					<td class="align_right">Additional Phone Number:</td>
					<td colspan="2"><input type="text" name="new_user_secondary_number" class="form_phone"  value ="<%= phone2 %>"maxlength="20"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="align_right">Mobile Phone:</td>
					<td colspan="2"><input type="text" name="new_user_cell_phone" class="form_phone" value ="<%= mobilephone %>" maxlength="20"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="align_right">Fax Number:</td>
					<td colspan="2"><input type="text" name="new_user_fax_number" class="form_phone" value ="<%= fax %>" maxlength="20"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="align_right"></td>
					<td colspan="2"></td>
					<td><font size="1">* Required Information</font></td>
				</tr>
			</table>
			<a href="javascript:Clean()" class="button">Reset &raquo;</a>
			<a href="javascript:Register()" class="button" style="width:200px">Print Agreement & Reserve</a>
			</form>
		</div>

		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
	</div> <!-- Container Ends Here -->
</body>
<script language="JavaScript">
function LogOut() {
  	document.frm_newuser.action="logout.aspx";
  	document.frm_newuser.submit();
}

function Clean(){
	document.frm_newuser.reset();
}

function Validar () {
    var chk=false;

	//Initialise variables
	var errorMsg = "";

	if (document.getElementById("new_user_first_name").value == ""){
		errorMsg += "\n\t First Name \t                  - Write your First name";
	}

	if (document.getElementById("new_user_last_name").value == ""){
		errorMsg += "\n\t Last Name \t                  - Write your Last name";
	}

	if (document.getElementById("new_user_email").value == ""){
		errorMsg += "\n\t E-mail \t\t                  - Write your E-mail";
	}

	if (document.getElementById("new_user_email").value != "")
	{
		strEmail = document.getElementById("new_user_email").value;
		if (strEmail.length>0)
		{
			if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
			{
				errorMsg += "\n\t E-mail \t\t                  - Your E-mail address is invalid";
			}
		}
	}

	if (document.getElementById("new_user_email").value != document.getElementById("new_user_confirm_email").value){
		errorMsg += "\n\t E-mail \t\t                  - Your confirmation E-mail is not correct";
	}

	if (document.getElementById("new_user_password").value == ""){
		errorMsg += "\n\t Password \t                  - Write your password";
	}

	if (document.getElementById("new_user_password").value != document.getElementById("new_user_confirm_password").value){
		errorMsg += "\n\t Password \t                  - Your confirmation password is not correct";
	}

	if (document.getElementById("new_user_address").value == ""){
		errorMsg += "\n\t Address \t\t                  - Write your Address";
	}

	if (document.getElementById("new_user_city").value == ""){
		errorMsg += "\n\t City \t\t                  - Write your City";
	}

	if (document.getElementById("new_user_state").value == "0"){
		errorMsg += "\n\t State \t\t                  - Select your State";
	}

	if (document.getElementById("new_user_zipcode").value == ""){
		errorMsg += "\n\t Zip code \t\t                  - Write your Zip code";
	}

	if (document.getElementById("new_user_country").value == "0"){
		errorMsg += "\n\t Country \t\t                  - Select your Country";
	}

	if (document.getElementById("new_user_phone_number").value == ""){
		errorMsg += "\n\t Phone Number \t                  - Write your Phone number";
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

function Register(){
	if (Validar()){
	  	document.frm_newuser.action="newuser_save.aspx";
	  	document.frm_newuser.submit();
		launchpopup('boats_PrintAgreement2.aspx?BoatID=<%= Request.Form["hdnBoatID"] %>');

	}
}
function LoadStates(){

	document.frm_newuser.cmb_country.value = document.frm_newuser.new_user_country.selectedIndex;
	document.frm_newuser.firstName.value = document.frm_newuser.new_user_first_name.value;
	document.frm_newuser.lastName.value = document.frm_newuser.new_user_last_name.value;
	document.frm_newuser.password.value = document.frm_newuser.new_user_password.value;
	document.frm_newuser.password2.value = document.frm_newuser.new_user_confirm_password.value;
	document.frm_newuser.email.value = document.frm_newuser.new_user_email.value;
	document.frm_newuser.email2.value = document.frm_newuser.new_user_confirm_email.value;
	document.frm_newuser.adress.value = document.frm_newuser.new_user_address.value;
	document.frm_newuser.city.value = document.frm_newuser.new_user_city.value;
	document.frm_newuser.zip.value = document.frm_newuser.new_user_zipcode.value;
	document.frm_newuser.phone.value = document.frm_newuser.new_user_phone_number.value;
	document.frm_newuser.phone2.value = document.frm_newuser.new_user_secondary_number.value;
	document.frm_newuser.mobilephone.value = document.frm_newuser.new_user_cell_phone.value;
  	document.frm_newuser.fax.value = document.frm_newuser.new_user_fax_number.value;

	document.frm_newuser.action = "newuser.aspx";
	document.frm_newuser.submit();
}

function launchpopup(url){
 popup=window.open(url,"lookup","width=650,height=500,top=10,left=60,resizable=yes,scrollbars=yes")
//popup=window.open(url,"popup","width=700,height=500,top=10,left=30,resizable=yes,scrollbars=yes,m//enubar=yes,toolbar=no,status=no,location=no")
}
</script>
</html>
