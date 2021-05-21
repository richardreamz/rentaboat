<%@ Page language="C#" CodeFile="boats_pre_mant.aspx.cs" Inherits="BoatRenting.boats_pre_mant_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--#include file="__functions.aspx"-->
--%><%
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);
        
    txt_BoatID = Request["BoatID"];
    Session.Add("strErr", "");
    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOAT_GET";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = Request["BoatID"];
    //cmd.Parameters[2] = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Session["MarinaID"]);
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Request["BoatID"]);
    rs.Open(cmd);
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
<script language="JavaScript">
function FCalendario(num_campo)
{
	var matParam = new Array(2);
	campo = num_campo;
	matParam[0] = window;
	switch (campo)
	{
		case 0:
			matParam[1] = "txt_date1"; break;
		case 1:
			matParam[1] = "txt_date2"; break;
	}
		window.showModalDialog("calendar.html",matParam,"dialogHeight:210px; dialogWidth:280px; center:yes; help:no; resizable:no; status:no");
}

function LogOut() {
  	document.frm_boat.action="logout.aspx";
  	document.frm_boat.submit();
}
</script>

</head>
<body>
<form name="frm_boat" method="post">
<input type="hidden" name="hdnBoatID" value="<%= Request.Form["hdnBoatID"] %>">
<input type="hidden" name="hdnMarinaID" value="<%= Request.Form["hdnMarinaID"] %>">
<input type="hidden" name="cmb_boat">
<input type="hidden" name="cmb_country">
<input type="hidden" name="cmb_body">
<input type="hidden" name="cmb_facility">
<input type="hidden" name="cmb_state">
<input type="hidden" name="txt_date1">
<input type="hidden" name="txt_date2">
<input type="hidden" name="txt_date1_day">
<input type="hidden" name="txt_date1_month">
<input type="hidden" name="txt_date1_year">
<input type="hidden" name="txt_date1_old">
<input type="hidden" name="txt_date2_old">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
						<li ><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li id="current"><a href="boats_list.aspx">Boat List</a></li>

			<li><a href="calendar.aspx">Calendar</a></li>

			<li><a href="boats_list_reservation.aspx">New Reservation</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu"><h1 style="font-size:8pt">Facility Boat Listings</h1></div>
		<div class="calendar_boatimage">
			<img src="../boats/<%= rs.Fields["vc_filename"].Value %>" alt="<%= rs.Fields["vc_nombre"].Value %>"/>
		</div>
		<div class="calendar_calendardiv">
			<div style="float: left;">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td>
						  <!--iframe marginheight="0" marginwidth="0" name="i_calendar"   src="calendar_i.aspx?hdnBoat=<%= rs.Fields["in_boatID"].Value %>&hdnMarina=<%= rs.Fields["in_marinaID"].Value %>" frameborder="0" scrolling="no" height="165" width="205"></iframe-->
						</td>
					</tr>
				</table>
			</div>
			<!--div class="explanation">
				<div class="exp_title">Please select a date!</div>
				<span id="calendar_dates_available">Available Days</span><br>
				<span id="calendar_dates_partially_available">Partially Available Days</span>
			</div-->
		</div>
		&nbsp;&nbsp;<%= rs.Fields["StateName"].Value %>
<%
    if (!(Convert.ToString(rs.Fields["vc_city"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_city"].Value %><%
    }
    if (!(Convert.ToString(rs.Fields["ch_zip"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["ch_zip"].Value %><%
    }
    if (!(Convert.ToString(rs.Fields["vc_bodywater"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_bodywater"].Value %><%
    }
%>
		<div class="calendar_boatdetails">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top" bgcolor="F1F5F5">
						<table class="boatdetails_table" cellpadding="0" cellspacing="0" width="370">
							<tr>
								<th colspan="2" bgcolor="white">Boat Details</th>
							</tr>
							<tr>
								<td class="boatcat_title">Boat Name:</td>
								<td class="boatcat_detail"><%= rs.Fields["vc_name"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title">Make:</td>
								<td class="boatcat_detail"><%= rs.Fields["vc_make"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title">Model:</td>
								<td class="boatcat_detail"><%= rs.Fields["vc_model"].Value %></td>
							</tr>														
							<tr>
								<td class="boatcat_title">Length:</td>
								<td class="boatcat_detail"><%= rs.Fields["vc_size"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title">Passengers:</td>
								<td class="boatcat_detail"><%= rs.Fields["in_maxPassengers"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title">Captain&nbsp;or&nbsp;Guide Available&nbsp;for&nbsp;Hire:</td>
								<td class="boatcat_detail"><%
    if (Convert.ToInt32(rs.Fields["ti_captain"].Value) == 1)
    {
%>
Yes<%
    }
    else
    {
%>
No<%
    }
%>
</td>
							</tr>							
							<tr>
								<td class="boatcat_title" valign="top">Description:</td>
								<td class="boatcat_detail"><%= rs.Fields["vc_description"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title" valign="top">Facility Area & Attractions:</td>
								<td class="boatcat_detail"><%= rs.Fields["vc_facilityArea"].Value %></td>
							</tr>
<%
    cmdF = new Command();
    rsF = new Recordset();
    cmdF.ActiveConnection = oConn;
    cmdF.CommandText = "SP_BR_IMAGE_OTHERS_LIST";
    cmdF.CommandType = adCmdStoredProc;
    //cmdF.Parameters[1] = Session["MarinaID"];
    //cmdF.Parameters[2] = Request["BoatID"];
    cmdF.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmdF.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Session["MarinaID"]);
    cmdF.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmdF.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Request["BoatID"]);
    rsF = cmdF.Execute();
    if (!(rsF.Eof))
    {
%>
							<tr>
								<td class="boatcat_title" height="20"></td>
								<td class="boatcat_detail"><a href="javascript:Pics()">More Pictures!</a></td>
							</tr>	
<%
    }
%>
														
						</table>
					</td>
					<td valign="top"  bgcolor="F1F5F5">
						<table class="boatdetails_table" cellpadding="0" cellspacing="0" width="370">
							<tr>
								<th colspan="2" bgcolor="white">Rent Details</th>
							</tr>
							<tr>
								<td class="boatcat_title">Requirements:</td>
								<td class="rentdetails"><%= rs.Fields["vc_requirements"].Value %></td>
							</tr>
<%
    cmdP = new Command();
    rsP = new Recordset();
    cmdP.ActiveConnection = oConn;
    cmdP.CommandText = "SP_BR_PRICExBOATxTYPERENT_LIST";
    cmdP.CommandType = adCmdStoredProc;
    //cmdP.Parameters[1] = rs.Fields["in_boatID"].Value;
    //cmdP.Parameters[2] = rs.Fields["in_marinaID"].Value;
    cmdP.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmdP.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(rs.Fields["in_marinaID"].Value);
    cmdP.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmdP.Parameters["@p_in_boatID"].Value = Convert.ToInt32(rs.Fields["in_boatID"].Value);
    rsP.Open(cmdP);
    while(!(rsP.Eof))
    {
%>
								<tr>
									<td class="boatcat_title"><%= rsP.Fields["vc_description"].Value %>&nbsp;price:</td>
									<td class="rentdetails">
<%
        if (Convert.ToDouble(rsP.Fields["nu_precioDayWeek"].Value) > 0.00)
        {
%>
<font size="1">WD</font>&nbsp;$<%= rsP.Fields["nu_precioDayWeek"].Value %>&nbsp;&nbsp;<%
        }
        if (Convert.ToDouble(rsP.Fields["nu_precioDayWeekend"].Value) > 0.00)
        {
%>
<font size="1">WE</font>&nbsp;$<%= rsP.Fields["nu_precioDayWeekend"].Value %>&nbsp;&nbsp;<%
        }
        if (Convert.ToDouble(rsP.Fields["nu_precioHolyday"].Value) > 0.00)
        {
%>
<font size="1">HO</font>&nbsp;$<%= rsP.Fields["nu_precioHolyday"].Value %><%
        }
%>
									</td>
								</tr>
<%
        rsP.MoveNext();
    }
    rsP.Close();
    rsP = null;
%>
							<tr>
								<td class="boatcat_title">Tax Rates:</td>
								<td class="rentdetails"><%= rs.Fields["nu_tax"].Value %> %</td>
							</tr>							   
							<tr>
								<td class="boatcat_title">Reservation:</td>
								<td class="rentdetails"><%= rs.Fields["nu_reservation"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title">Security Deposit:</td>
								<td class="rentdetails"><%= rs.Fields["nu_deposit"].Value %></td>
							</tr>
							<tr>
								<td class="boatcat_title" valign="top">Facility&nbsp;Cancelation&nbsp;Policy:</td>
								<td class="rentdetails"><%= rs.Fields["vc_depositPolicy"].Value %></td>
							</tr>							
							<tr>
								<td colspan="2" align="right"><font size="1" face="Arial"><br>WD: Week Day&nbsp;&nbsp;&nbsp;WE: Weekend Day&nbsp;&nbsp;&nbsp;HO: Holidays&nbsp;&nbsp;</font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
	</div> <!-- Container Ends Here -->
</form>
</body>
<script language="JavaScript">
function Pics(){
window.open('morepics.aspx?marina=<%= Session["MarinaID"] %>&boat=<%= Request["BoatID"] %>','morePics','width=383,height=200,location=0');
}

function QuickSearch(x){
	document.frm_boat.cmb_boat.value = x;
	document.frm_boat.cmb_country.value = 0;
	document.frm_boat.cmb_body.value = 0;
	document.frm_boat.cmb_facility.value = 0;
	document.frm_boat.cmb_state.value = 0;
	document.frm_boat.action = "results.aspx";
	document.frm_boat.submit();
}

</script>
</html>
