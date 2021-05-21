<%@ Page language="C#" CodeFile="boats_search_reservation.aspx.cs" Inherits="BoatRenting.boats_search_reservation_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }    
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>
<script language="javascript">

function Search() {
  	document.frm_boats_search.action="boats_list_reservation.aspx";
  	document.frm_boats_search.submit();
}

function PressEnter(oEvento) {
var iAscii;

     if (oEvento.keyCode)
         iAscii = oEvento.keyCode;
     else if (oEvento.which)
         iAscii = oEvento.which;
     else
         return false;

    if (iAscii==13)
	{
  	document.frm_boats_search.action="boats_list_reservation.aspx";
  	document.frm_boats_search.submit();
	}
}


function LogOut() {
  	document.frm_boats_search.action="logout.aspx";
  	document.frm_boats_search.submit();
}
</script>

<body>
<FORM name="frm_boats_search" method="POST">
<input type="hidden" name="hdn_Action" value="N">
	<div id="container">
		<div id="banner"></div>
		<div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="boats_search.ASP">Boat List</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="calendar.aspx">Calendar</a>
			&nbsp;&nbsp;&nbsp;&nbsp;			
			<a href="boats_search_reservation.aspx">New Reservation</a>
			
		</div>
			<div id="table_div">

				<table id="facility_table" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="2">Boats Search </th>
					</tr>
					<tr>
						<td class="align_right">Name</td>
						<td><input name="txt_Name" type="text"  id="txt_Name" /></td>
					</tr>
					<tr>
						<td class="align_top_right">Description</td>
						<td><input name="txt_Description" type="text" id="txt_Description" size="50" maxlength="255"/></td>
					<tr>
						<td class="align_right">Make</td>
						<td><input name="txt_Make" type="text"  id="txt_Make" /></td>
					</tr>
					<tr>
						<td class="align_right">Model</td>
						<td><input name="txt_Model" type="text"  id="txt_Model" /></td>
					</tr>
					<tr>
						<td class="align_right">City</td>
						<td><input name="txt_city" type="text" id="txt_city" /></td>
					</tr>
					<tr>
						<td class="align_right">State/Province</td>
						<td><%
    StateName();
%>
						</td>
					</tr>
					
					<tr>
						<td class="align_right">Country</td>
						<td><%
    CountryName();
%>
						</td>
					</tr>
					<tr>
						<td class="align_right">Boat Type</td>
						<td>
<%
    BoatTypeName();
%>
						</td>
					</tr>
					
				</table>
		<a  href="javascript:Search();" class="button">Search</a>
		

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


