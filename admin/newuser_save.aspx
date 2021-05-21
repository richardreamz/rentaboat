<%@ Page language="C#" CodeFile="newuser_save.aspx.cs" Inherits="BoatRenting.newuser_save_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="__dbConnection.aspx"-->
<!--#include file="__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }
    
    Session.Add("Name", Request["new_user_first_name"]);
    Session.Add("Lastname", Request["new_user_last_name"]);
    Session.Add("Address", Request["new_user_address"]);
    cmd2 = new Command();
    rs2 = new Recordset();
    cmd2.ActiveConnection = oConn;
    cmd2.CommandText = "SP_BR_CLIENT_USERNAME_EXISTS";
    cmd2.CommandType = adCmdStoredProc;
    cmd2.Parameters[1].Value = Request.Form["new_user_email"];
    rs2.Open(cmd2);
    if (Convert.ToString(rs2.Fields[0].Value) == "0")
    {
        cmd = new Command();
        rs = new Recordset();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_CLIENT_REGISTRATION";
        cmd.CommandType = adCmdStoredProc;
        cmd.Parameters[1].Value = Request.Form["new_user_first_name"];
        cmd.Parameters[2].Value = Request.Form["new_user_last_name"];
        cmd.Parameters[3].Value = Request.Form["new_user_email"];
        cmd.Parameters[4].Value = Request.Form["new_user_password"];
        cmd.Parameters[5].Value = Request.Form["new_user_address"];
        cmd.Parameters[6].Value = Request.Form["new_user_city"];
        cmd.Parameters[7].Value = Request.Form["new_user_zipcode"];
        cmd.Parameters[8].Value = Request.Form["new_user_state"];
        cmd.Parameters[9].Value = Request.Form["new_user_country"];
        cmd.Parameters[10].Value = Request.Form["new_user_phone_number"];
        cmd.Parameters[11].Value = Request.Form["new_user_secondary_number"];
        cmd.Parameters[12].Value = Request.Form["new_user_cell_phone"];
        cmd.Parameters[13].Value = Request.Form["new_user_fax_number"];
        rs.Open(cmd);
        cmd3 = new Command();
        rs3 = new Recordset();
        cmd3.ActiveConnection = oConn;
        cmd3.CommandText = "SP_BR_CLIENT_LOGIN";
        cmd3.CommandType = adCmdStoredProc;
        cmd3.Parameters[1].Value = Request.Form["new_user_email"];
        cmd3.Parameters[2].Value = Request.Form["new_user_password"];
        rs3.Open(cmd3);
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

<%
    if (Convert.ToString(rs2.Fields[0].Value) == "0")
    {
%>
	<form name="frm_insert" method="post">
		<input type="hidden" name="hdn_clientID">
		<input type="hidden" name="txt_email" value=<%= Request.Form["new_user_email"] %>>
		<input type="hidden" name="txt_password" value=<%= Request.Form["new_user_password"] %>>
		<!-- Esta e sla diferencia con el del cliente -->		<input type="hidden" name="hdnBoatID" value="<%= Request.Form["hdnBoatID"] %>">
	</form>
<script language="JavaScript">		document.frm_insert.hdn_clientID.value = <%= rs3.Fields["in_clientID"].Value %>;
		document.frm_insert.action = "reserve.aspx";
		document.frm_insert.submit();
	</script>
<%
    }
    else
    {
%>
	<div id="container">
		<div id="banner"></div>
	<div id="menu">
			<ul>
<%
        if (Convert.ToDouble(Session["userLevelID"]) != 2.0)
        {
%>
			<li ><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li ><a href="boats_list.aspx">Boat List</a></li>
<%
        }
%>
			<li><a href="calendar.aspx">Calendar</a></li>
			<li id="current"><a href="boats_list_reservation.ASP">New Reservation</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu">&nbsp;  </div>
		<div id="new_user_creation">
			<form name="frm_newuser" method="post">
			<input type="hidden" name="cmb_boat">
			<input type="hidden" name="cmb_country">
			<input type="hidden" name="cmb_body">
			<input type="hidden" name="cmb_facility">
			<input type="hidden" name="cmb_state">
			
			
			<table id="new_user_table">
				<tr>
					<th>New User</th>
				</tr>
				<tr>
					<td height="20">&nbsp; </td>
				</tr>
				<tr>
					<td><font style="font-weight:normal">The <b>E-mail</b> you entered as username is already registered in the system, you can:</font></td>
				</tr>
				<tr>
					<td><font style="font-weight:normal">- Press <b>Go Back</b>, if you want to register as a new user using a different E-mail address.</font></td>
				</tr>
				<!--tr>
					<td><font style="font-weight:normal">- Press <b>Password Help</b>, if you are already registered but don't remember your Password.</font></td>
				</tr-->
				<tr>
					<td height="30">&nbsp;</td>
				</tr>
			</table>

			<a href="javascript:goBack()" class="button">Go back &raquo;</a>
			<!--a href="forgottenpassword.aspx" class="button">Password help &raquo;</a-->
			</form>
		</div>

		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
	</div> <!-- Container Ends Here --><%
    }
%>
</body>
<script language="JavaScript">
function goBack(){
	window.history.back();
}


</script>
</html>
