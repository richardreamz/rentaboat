<%@ Page language="C#" CodeFile="boats_list_reports_print.aspx.cs" Inherits="BoatRenting.boats_list_reports_print_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    multiple = Request["multiple"];
    cbo_BoatFacility = Request["cbo_BoatFacility"];
    TxtEndDate = Request["TxtEndDate"];
    TxtStartDate = Request["TxtStartDate"];
    TxtEndDate1 = Request["TxtEndDate1"];
    cbo_Week = Request["cbo_Week"];
    cbo_Monthly = Request["cbo_Monthly"];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<HTML>
<HEAD>
<TITLE>Welcome to BoatRenting.com!</TITLE>

<style>
body {
	font-family: Arial, Helvetica, Verdana, sans-serif;
	background-color: #FFFFFF;
	text-align: left;
	color: black;
	padding: 0;
	margin: 0;
	font-size: 0.6em;
	}

a:link {
	font-size: 8pt;
	color: #607489;
	}

a:visited {
	font-size: 8pt;
	color: #607489;
	}

a:hover {
	color: #FF9933;
	}

h1 {
	font-size: 1.2em;
	color: #496379;
	margin-top: 0px;
	margin-bottom: 10px;
	}

#container {
	background: red;
	margin: auto;
	width: 782px;
	/*border-width: 0px 1px 0px 1px;
	border-style: solid;
	border-color: #999;*/
	background: url(images/container_bg.gif) repeat-y;
	margin-top: 15px;
	}

#banner {
	margin-left: 1px;
	width: 780px;
	height: 78px;
	background: url(images/banner.gif) 10px 8px no-repeat #4D8DD5;
	}

#menu {
	margin-left: 1px;
	padding-left: 1px;
	width: 779px;
	height: 17px;
	background: #4D8DD5;
	overflow: hidden;
	}

#menu ul {
	margin:0;
	padding:0;
	list-style:none;
	}

#menu ul li {
	float: left;
	margin: 0px;
	padding: 0px;
	background: url(images/tab_right.gif) no-repeat top right;
	}

#menu a {
	float: left;
	padding: 0px 6px 0px 8px;
	display: block;
	font-size: 11px;
	font-weight: bold;
	line-height: 17px;
	background: url(images/tab_left.gif) no-repeat top left;
	color: #CCCCCC;
	}

/* Commented Backslash Hack hides rule from IE5-Mac \*/
#menu a {float:none;}
/* End IE5-Mac hack */

#menu a:hover {
	color: white;
	}

#menu #current {
	background: url(images/tab_current_right.gif) no-repeat top right;
	}

#menu #current a{
	background: url(images/tab_current_left.gif) no-repeat top left;
	color: #666;
	text-decoration: none;
	}

#menu #current a:hover{
	color: #333;
	}


#footer {
	padding-top: 28px;
	line-height: 10px;
	height: 12px;
	clear: both;
	margin-left: 1px;
	width: 780px;
	background: url(images/footer_bg.gif) repeat-x;
	}

#footer_details {
	padding-left: 8px;
	font-size: 7pt;
	color: white;
	height: 10px;
	line-height: 8px;
	}

#footer_details a{
	font-size: 8pt;
	color: #ccc;
	text-decoration: none;
	}

#footer_details a:hover {
	font-size: 8pt;
	color: white;
	font-weight: normal;
	}

#admin_menu {
	margin-left: 1px;
	width: 720px;
	text-align: left;
	margin-top: 10px;
	padding-left: 30px;
	padding-right: 30px;
	color: #666;
	height: 16px;
	line-height: 8px;
	background: url(images/sub_menu_bg.gif) bottom left repeat-x;
	}

#sub_menu {
	margin-left: 1px;
	width: 720px;
	text-align: left;
	margin-top: 10px;
	padding-left: 30px;
	padding-right: 30px;
	color: #666;
	height: 16px;
	line-height: 8px;
	background: url(images/sub_menu_bg.gif) bottom left repeat-x;
	}

#table_div {
	width:766;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 7px;
	}


#table_div table td{
	}

#facility_table {
	background-color: #E9EDF1;
	/*width: 722px;*/
	width: 100%;
	}

#facility_table td{
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 0px;
	padding-bottom: 0px;
	}

#facility_table input, #facility_table select {
	font-size: 8pt;
	}

.separator_tr {
	height: 15px;
	}

.align_top_right {
	vertical-align: top;
	text-align: right;
	}

#facility_table th {
	font-size: 12pt;
	color: #607489;
	font-weight: bold;
	padding-left: 10px;
	padding-top: 0px;
	padding-bottom: 0px;
	}

.align_right {
	text-align: right;
	}

.hilite {
	color: #FF9933;
	font-size: 1.5em;
	}

a.button {
	display: block;
	/*width: 45px;*/
	padding-top: 2px;
	padding-bottom: 2px;
	padding-left: 7px;
	padding-right: 7px;
	font-weight: bold;
	text-align: center;
	background-color: #6699CC;
	color: white;
	text-decoration: none;
	border-top: 1px solid white;
	border-bottom: 1px solid #369;
	border-right: 1px solid #369;
	border-left: 1px solid white;
	margin-right: 20px;
	margin-top: 20px;
	float: left;
	}

a.button:hover {
	background-color: #FF9933;
	border-color: #CC6633;
	border-top: 1px solid white;
	border-left: 1px solid white;
	color: white;
	}

a.button:visited {
	color: white;
	text-decoration: none;
	}

.list_table {
	width: 100%;
	/*width: 722px;*/
	padding: 0px;
	margin: 0px;
	}

.list_table th {
	color: #496379;
	background-color: #D3DCE4;
	font-weight: bold;
	font-size: 1.1em;
	padding-left: 3px;
	padding-top: 1px;
	padding-bottom: 1px;
	}

.list_table td {
	padding-left: 3px;
	padding-right: 3px;
	}

.list_table .box {
	width: 10px;
	padding: 0px;
	}

/* .list_table a:link{
	color: #496379;
	font-weight: bold;
	}*/

.bluerow {
	background-color: #EDF2FA;
	border-left: 1px solid white;
	}

.floatright {
	float: right;
	}

/* Edit Users */

.users_maint_catcolumn {
	width: 70px;
	text-align: right;
	}

.users_maint_textfield {
	width: 120px;
	}

.requiredfields {
	padding-left: 100px;
	}

/* CALENDAR */

#calendar {
	margin: 0px;
	width: auto;
	clear: both;
	}


#calendar th {
	width: 110px;
	padding-top: 5px;
	padding-bottom: 5px;
	color: #496379;
	background-color: #D3DCE4;
	text-align: center;
	font-weight: bold;
	font-size: 1.1em;
	border-right: 1px solid white;
	/*border-bottom: 1px solid #496379;*/
	border-bottom: 1px solid #336699;
	}

#calendar td {
	height: 70px;
	background: #E1EBF1;
	padding: 3px;
	margin: 0px;
	border-right: 1px solid white;
	border-bottom: 1px solid white;
	vertical-align: top;
	}

#calendar td p.calday {
	padding: 0px;
	margin: 0px;
	margin-bottom: 10px;
	font-size: 1.2em;
	}
#calendar p.calday a:link, #calendar p.calday a:visited {
	font-size: 1.2em;
	color: #0B3152;
	}

#calendar p.calday a:hover {
	color: #F93;
	}

#calendar td p {
	margin: 0px;
	margin-left: 10px;
	}

#calendar td.sat_sun_td a:link, #calendar td.sat_sun_td a:visited{
	color: #CC0000;
	}

#calendar td.sat_sun_td a:hover {
	color: #F93;
	}

#calendar td.next_prev_month_td {
	background-color: #DBDBDB;
	color: #666;
	}

#cal_menu {
	width: 725px;
	text-align: center;
	}


#cal_menu_div {
	margin-top: 7px;
	width: 100%;
	margin-left: 0px;
	text-align: center;
	}

.cal_prev_button_td {
	padding-right: 10px;
	text-align: right;
	width: 272px;
	}

.cal_month_td {
	width: 55px;
	}

.cal_year_td {
	width: 58px;
	}

.cal_next_button_td {
	padding-left: 10px;
	width:30px;
	text-align: left;
	}

.cal_boat_select_td {
	width: auto;
	}

.cal_boat_select {
	float: right;
	width: 200px;
	}

a.cal_button:link, a.cal_button:visited {
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 2px;
	padding-right: 2px;
	font-weight: bold;
	text-align: center;
	background-color: #6699CC;
	color: white;
	text-decoration: none;
	border-top: 1px solid white;
	border-bottom: 1px solid #369;
	border-right: 1px solid #369;
	border-left: 1px solid white;
	}

a.cal_button:hover {
	background-color: #FF9933;
	border-color: #CC6633;
	border-top: 1px solid white;
	border-left: 1px solid white;
	color: white;
	}

/* Form Formatting */
.contact_name {
	width: 150px;
	}

.body_of_water {
	width: 150px;
	}

.business_name {
	width: 150px;
	}

.phone_number {
	width: 80px;
	}

.facility_name {
	width: 150px;
	}

.fax {
	width: 80px;
	}

.address_line1 {
	width: 200px;
	}

.address_line2 {
	width: 200px;
	}

.city {
	width: 100px;
	}

.zipcode {
	width: 40px;
	}

.search_calendar_log {
	height: 13px;
	width: 114px;
	font-family: Arial, sans-serif;
	font-size: 8pt;
	font-weight: normal;
	padding: 1px;
	}
</style>

<FORM name="frmBR" method="POST">
<input type="hidden" name="hdnPag" value="<%= nPag %>">
<input type="hidden" name="hdnOrder" value="<%= nOrder %>">
<input type="hidden" name="hdnWay" value="<%= nWay %>">
	<div id="container">
		
		<div id="table_div">
				
				
				<p align="right"><a valign="middle"  href="javascript:window.print();"class="verd10Rollazu">
<img border="0" src="images/printer.gif" WIDTH="15" HEIGHT="20" valign="middle">
&nbsp;Print&nbsp;
</a></p>
				<center><h1>Reports By Facility</h1></center>
				 
<%
    if (DateTime.Now.Day >= 1 && DateTime.Now.Day <= 9)
    {
        dia1 = "0" + Convert.ToString(DateTime.Now.Day);
    }
    else
    {
        dia1 = Convert.ToString(DateTime.Now.Day);
    }
    anio = DateTime.Now.Year;
    //if cbo_Monthly>=1 and cbo_Monthly<=9 then
    //cbo_Monthly="0"&cbo_Monthly
    //else
    //cbo_Monthly=cbo_Monthly
    //end if
    fecha = dia1 + "/" + cbo_Monthly + "/" + Convert.ToString(anio);
    if (multiple != "")
    {
%>
				<table  class="list_table" cellpadding="0" cellspacing="0">
<%
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);
        nLinea = 1;
        cmd = new Command();
        rs = new Recordset();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_REPORTDATE";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = Convert.ToInt32(cbo_BoatFacility);
        cmd.Parameters.Append(cmd.CreateParameter("@in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@in_boatID"].Value = Convert.ToInt32(cbo_BoatFacility);
        //cmd.Parameters[2] = Session["MarinaID"];
        cmd.Parameters.Append(cmd.CreateParameter("@in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@in_marinaID"].Value = Session["MarinaID"];
        if (multiple == "RadioButton1")
        {
            //cmd.Parameters[3] = ToMDY(TxtEndDate);
            cmd.Parameters.Append(cmd.CreateParameter("@dt_begindate", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@dt_begindate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtEndDate);
            //ConvierteFecha(TxtEndDate)
            //cmd.Parameters[4] = ToMDY(TxtEndDate);
            cmd.Parameters.Append(cmd.CreateParameter("@dt_Enddate", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@dt_Enddate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtEndDate);
            //ConvierteFecha(TxtEndDate)
        }
        if (multiple == "RadioButton2")
        {
            //cmd.Parameters[3] = ToMDY(TxtStartDate2);
            cmd.Parameters.Append(cmd.CreateParameter("@dt_begindate", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@dt_begindate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtStartDate);
            //ConvierteFecha(TxtStartDate2)
            //cmd.Parameters[4] = ToMDY(TxtEndDate3);
            cmd.Parameters.Append(cmd.CreateParameter("@dt_Enddate", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@dt_Enddate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtEndDate1);
            //ConvierteFecha(TxtEndDate3)
        }
        if (multiple == "RadioButton3")
        {
            //cmd.Parameters[3] = fecha;
            cmd.Parameters.Append(cmd.CreateParameter("@dt_begindate", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@dt_begindate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", fecha); //Convert.ToString(nFecha);
            //cmd.Parameters[4] = fecha;
            cmd.Parameters.Append(cmd.CreateParameter("@dt_Enddate", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@dt_Enddate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", fecha); //Convert.ToString(nFecha);
        }
        //cmd.Parameters[5] = Convert.ToInt32(multiple);
        cmd.Parameters.Append(cmd.CreateParameter("@flat", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@flat"].Value = Convert.ToInt32(multiple.Substring(11, 1));
        rs.CursorType = (nce.adodb.CursorType)3;
        rs.CursorLocation = (nce.adodb.CursorLocation)3;
        rs.Open(cmd);
%>
				<tr>
			 <th ></th>
			  <th colspan="11">
				
			  	</th>
				  </tr>
					<tr >
						<th>Boat</th>
						<th>FirstName</th>
						<th>LastName</th>
						<th>Phone</th>
						<th>E-Mail</th>
						<th>Begin date</th>
						<th>End Date</th>
						<th>&nbsp;</th>
					</tr>
<%
        //response.Write(cbo_BoatFacility&"--"&Session("MarinaID")&"--"&TxtEndDate&"--"&fecha&"--"&cbo_Week&"--"&cbo_Monthly&"--"&multiple)
        //response.End()
        while(!(rs.Eof))
        {
            if (nLinea == 1)
            {
                sColor = "#FBFBF9";
                sColor = "";
                nLinea = 0;
            }
            else
            {
                sColor = "bluerow";
                nLinea = 1;
            }
%>
				<tr class="<%= sColor %>" >
					<td><%= rs.Fields["vc_name"].Value %></td>
					<td><%= rs.Fields[1].Value %></td>
					<td><%= rs.Fields[2].Value %></td>
					<td><%= rs.Fields[3].Value %></td>
					<td> <%= rs.Fields[4].Value %></td>
					<td><%= rs.Fields[5].Value %></td>
					<td><%= rs.Fields[6].Value %></td>
				</tr>

<%
            rs.MoveNext();
        }
%>
				 	
				</table>
<%
    }
%>
		</div>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; 
			</div>
		</div>
	</div>
	</form>
</body>
</html>
