<%@ Page language="C#" CodeFile="calendar.aspx.cs" Inherits="BoatRenting.calendar_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
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
    Session.Timeout = 720;
        //Response.Write(nvl(Request.Form("rdCalView"),1))
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
    if (string.IsNullOrEmpty(Request.Form["hdnMonth"]))
    {
        nMonth = DateTime.Today.Month;
    }
    else
    {
        nMonth = Convert.ToInt32(Request.Form["hdnMonth"]);
    }
    if (string.IsNullOrEmpty(Request.Form["hdnYear"]))
    {
        nYear = DateTime.Today.Year;
    }
    else
    {
        nYear = Convert.ToInt32(Request.Form["hdnYear"]);
    }
    if (string.IsNullOrEmpty(Request.Form["hdnPag"]))
    {
        nPag = 1;
    }
    else
    {
        nPag = Convert.ToInt32(Request.Form["hdnPag"]);
    }
    nRegistros = 15;
        //Calculating the past month'
    if (Convert.ToInt32(nMonthnlastMonth) == 1)
    {
        nlastMonth = 12;
    }
    else
    {
        nlastMonth = nMonth - 1;
    }
        //Calculating the number of days of past month'
    if (nlastMonth == 2)
    {
        lastDiasMes = 28;
    }
    else
    {
        if (nlastMonth == 1 || nlastMonth == 3 || nlastMonth == 5 || nlastMonth == 7 || nlastMonth == 8 || nlastMonth == 10 || nlastMonth == 12)
        {
            lastDiasMes = 31;
        }
        else
        {
            lastDiasMes = 30;
        }
    }
        //Calculating the number of days of current month'
    if (nMonth == 2)
    {
        DiasMes = 28;
    }
    else
    {
        if (nMonth == 1 || nMonth == 3 || nMonth == 5 || nMonth == 7 || nMonth == 8 || nMonth == 10 || nMonth == 12)
        {
            DiasMes = 31;
        }
        else
        {
            DiasMes = 30;
        }
    }
    //Calculating  rest days of past month'
    Fecha = new DateTime(nYear, nMonth, 1);
    numday = DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
    lastweek = numday - 1;
    IniRestDays = lastDiasMes - lastweek + 1;
    FinRestDays = lastDiasMes;
    //Calculating  left days of next month'
    Fecha2 = new DateTime(nYear, nMonth, DiasMes);
    numday2 = DateAndTime.Weekday(Fecha2, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
    lastweek2 = 7 - numday2;
    IniRestDays2 = 1;
    FinRestDays2 = lastweek2;
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
function SomeMonth() {
	document.frmGTS.hdnMonth.value=document.frmGTS.cboMonth.value;

  	document.frmGTS.action="calendar.aspx";
  	document.frmGTS.submit();

}

function SomeYear() {
	document.frmGTS.hdnYear.value=document.frmGTS.cboYear.value;

  	document.frmGTS.action="calendar.aspx";
  	document.frmGTS.submit();

}
function Back2() {
    if (eval(document.frmGTS.hdnMonth.value)==1 )
	{	document.frmGTS.hdnMonth.value=12;
		document.frmGTS.hdnYear.value=eval(document.frmGTS.hdnYear.value)-1;
	}
	else
	{
	document.frmGTS.hdnMonth.value=eval(document.frmGTS.hdnMonth.value)-1;
	}
  	document.frmGTS.action="calendar.aspx";
  	document.frmGTS.submit();

}


function Next2() {
 	if (eval(document.frmGTS.hdnMonth.value)==12 )
	{	document.frmGTS.hdnMonth.value=1;
		document.frmGTS.hdnYear.value=eval(document.frmGTS.hdnYear.value)+1;
	}
	else
	{
	document.frmGTS.hdnMonth.value=eval(document.frmGTS.hdnMonth.value)+1;
	}
  	document.frmGTS.action="calendar.aspx";
  	document.frmGTS.submit();

}


function LogOut() {
  	document.frmGTS.action="logout.aspx";
  	document.frmGTS.submit();
}

function Edit(BoatID) {

  	document.frmGTS.action="boats_mant.aspx?BoatID=" + BoatID ;
  	document.frmGTS.submit();

}

function Recall() {

  	document.frmGTS.action="calendar.aspx";
  	document.frmGTS.submit();

}

</script>

<body>
<FORM name="frmGTS" method=POST>
<input type="hidden" name="hdnPag" value="<%= nPag %>"/>
<input type="hidden" name="hdnMonth" value="<%= nMonth %>"/>
<input type="hidden" name="hdnYear" value="<%= nYear %>"/>
<input type="hidden" name="hdn_Action" value="E"/>
<%
    BoatSelected = NVL(Request.Form["cbo_BoatID"], 0);
    MarinaID = NVL(Convert.ToString(Session["MarinaID"]), 0);
%>
	<div id="container">
		<div id="banner"></div>

		<!--div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="boats_list.aspx">Boat</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="calendar.ASP">Calendar</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="boats_list_reservation.ASP">New Reservation</a>
		</div-->
		<div id="menu">
			<ul>
			
<%
    if (Convert.ToDouble(Session["userLevelID"]) != 2.0)
    {
%>
			<li ><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li><a href="users_list.aspx">Add User</a></li>	
			<li><a href="boats_list.aspx">Boat List</a></li>
<%
    }
%>
			<li id="current"><a href="calendar.aspx">Calendar</a></li>
			<li><a href="boats_list_reservation.aspx">New Reservation</a></li>
			<li><a href="boats_list_reports.aspx">Reports</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu"><h1 style="font-size:8pt">Facility Calendar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <b><font size="2"  face="Verdana, Arial, Helvetica, sans-serif">
					 Welcome  <%= Session["BusinessName"] %> Marina</font></b>
		</h1>
		</div>
		<div id="cal_menu_div">
			<table id="cal_menu">
				<tr>
					<td align="left">
					
					<div style="color:blue;">Blue Hourly  </div>
					<div style="color:red;"> Red 1/2 Day AM </div>
					<div style="color:green;">Green 1/2 Day PM </div>
					<div style="color:black;">Black Full Day </div>
					
					
					
					</td>
					<!--td >	
					</td-->
					<td  colspan="4" align="center"><font size="+1">Facility Calendar</font>
					<!--/td>
					<td class="cal_year_td">
					</td>
					<td class="cal_next_button_td"--></td>
					<td><h1>Calendar View</h1></td>
				</tr>
				<tr>
				<!--
				<td align="left">
					<font size="2"  face="Verdana, Arial, Helvetica, sans-serif">To see days rental list<br>press the date in upper left corner</font></td>
				
				-->
				<td> </td>
					<td  class="cal_next_button_td">
					<a class="cal_button" href="javascript:Back2();">&nbsp;&lt;&nbsp;</a></td>
					<td class="cal_month_td">
						  <select name="cboMonth" class="cal_month"  onChange="javascript:SomeMonth();">
                        <option value=1 <%
    if (nMonth == 1)
    {
%>
 selected <%
    }
%>
 >Jan</option>
                        <option value=2 <%
    if (nMonth == 2)
    {
%>
 selected <%
    }
%>
  >Feb</option>
                        <option value=3 <%
    if (nMonth == 3)
    {
%>
 selected <%
    }
%>
  >Mar</option>
                        <option value=4 <%
    if (nMonth == 4)
    {
%>
 selected <%
    }
%>
  >Apr</option>
                        <option value=5 <%
    if (nMonth == 5)
    {
%>
 selected <%
    }
%>
  >May</option>
                        <option value=6 <%
    if (nMonth == 6)
    {
%>
 selected <%
    }
%>
  >Jun</option>
                        <option value=7 <%
    if (nMonth == 7)
    {
%>
 selected <%
    }
%>
  >Jul</option>
                        <option value=8 <%
    if (nMonth == 8)
    {
%>
 selected <%
    }
%>
  >Aug</option>
                        <option value=9 <%
    if (nMonth == 9)
    {
%>
 selected <%
    }
%>
  >Sep</option>
                        <option value=10 <%
    if (nMonth == 10)
    {
%>
 selected <%
    }
%>
  >Oct</option>
                        <option value=11 <%
    if (nMonth == 11)
    {
%>
 selected <%
    }
%>
  >Nov</option>
                        <option value=12 <%
    if (nMonth == 12)
    {
%>
 selected <%
    }
%>
  >Dec</option>
                      </select>
					</td>
					<td class="cal_year_td">
						 <select name="cboYear" class="cal_year" onChange="javascript:SomeYear();">
<%
    contYear = DateTime.Today.Year - 15;
    while(contYear <= DateTime.Today.Year)
    {
%>
					    <option  value=<%= contYear %><%
        if (nYear == contYear)
        {
%>
 selected <%
        }
%>
  ><%= contYear %></option>
<%
        contYear = contYear + 1;
    }
%>
                      </select>
					</td>
					
<%
    s1Check = "";
    s2Check = "";
    if (NVL(Request.Form["rdCalView"], 0) == "1")
    {
        s1Check = "CHECKED";
    }
    else
    {
        s2Check = "CHECKED";
    }
%>
					<td class="cal_next_button_td">
					<a class="cal_button" href="javascript:Next2();">&nbsp;&gt;&nbsp;</a></td>
					<td class="cal_boat_select_td">
					   <h1><input type="radio" name="rdCalView" value="1"  <%= s1Check %> onClick="javascript:Recall();" > View Available Boats</h1> 
						 <h1><input type="radio" name="rdCalView" value="2" <%= s2Check %> onClick="javascript:Recall();" > View Reserved Boats</h1>  
					</td>
				</tr>
			</table>
		</div>
			<div id="table_div">
				<table id="calendar" cellpadding="0" cellspacing="0">
					<tr>
						<th>Sunday</th>
						<th>Monday</th>
						<th>Tuesday</th>
						<th>Wednesday</th>
						<th>Thursday</th>
						<th>Friday</th>
						<th>Saturday</th>
					</tr>
					<tr>
<%
    //First week
    contrest = IniRestDays;
    while(contrest <= FinRestDays)
    {
%>
						<td class="next_prev_month_td">
						 <p class="calday">  <%= contrest %></p>
						 <!--p>&nbsp;</p>
						 <p>&nbsp;</p-->
						</td>
<%
        contrest = contrest + 1;
    }
    //Current Month
    cont = 1;
    finfirstweek = 7 - lastweek;
    while(cont <= finfirstweek)
    {
        nFecha = new DateTime(nYear, nMonth, cont);
        numday = DateAndTime.Weekday(nFecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
        cmd = new Command();
        rsReserve = new Recordset();
        cmd.ActiveConnection = oConn;
        if (NVL(Request.Form["rdCalView"], 0) == "1")
        {
            cmd.CommandText = "SP_BR_CALENDAR_FILTER_AVAILABLE";
        }
        else
        {
            cmd.CommandText = "SP_BR_CALENDAR_FILTER";
        }
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = nFecha;
        //cmd.Parameters[2] = BoatSelected;
        //cmd.Parameters[3] = MarinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@Date1", adVarChar, adParamInput, 18, 0));
        cmd.Parameters["@Date1"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", nFecha); //Convert.ToString(nFecha);
        cmd.Parameters.Append(cmd.CreateParameter("@MarinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@MarinaID"].Value = Convert.ToInt32(MarinaID);
        cmd.Parameters.Append(cmd.CreateParameter("@BoatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@BoatID"].Value = Convert.ToInt32(BoatSelected);
        rsReserve.CursorType = (nce.adodb.CursorType)3;
        rsReserve.CursorLocation = (nce.adodb.CursorLocation)3;
        rsReserve.Open(cmd);
        if (numday == 1 || numday == 7)
        {
%>
						<td>
<%
        }
        else
        {
%>
						<td >
<%
        }
%>
						<p class="calday">
<%
        if (!(rsReserve.Eof))
        {
            sLink = "log_calendar.aspx";
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
            }
            else
            {
                sLink = "log_calendar.aspx";
            }
%>
				    	<a href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= BoatSelected %>"><%= cont %></a>
					
<%
        }
        else
        {
%>
						<a href="#"><%= cont %></a>
<%
        }
%>
						</p>&nbsp;&nbsp;
						<p>
<%
        if (!(rsReserve.Eof))
        {
            sLink = "log_calendar.aspx";
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a>
<%
            rsReserve.MoveNext();
        }
%>
&nbsp;&nbsp;
<%
        if (!(rsReserve.Eof))
        {
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a>
<%
            rsReserve.MoveNext();
        }
%>
&nbsp;&nbsp;
<%
        if (!(rsReserve.Eof))
        {
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a><%
            rsReserve.MoveNext();
        }
%>
&nbsp;&nbsp;
						<a href="log_calendar.aspx?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= BoatSelected %>">
<%
        if (!(rsReserve.Eof))
        {
%>
...<%
        }
%>
						</a>
						</p>
						</td>
<%
        cont = cont + 1;
    }
%>
						<!--td class="sat_sun_td"><p class="calday"><a href="#">4</a></p></td-->
					</tr>
<%
    //3 next weeks
    Fecha = new DateTime(nYear, nMonth, 1);
    if (((DiasMes == 31) && ((DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday) == 6) || (DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday) == 7))) || ((DiasMes == 30) && (DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday) == 7)))
    {
        inter_week = 5;
    }
    else
    {
        inter_week = 4;
    }
    num_week = 2;
    while(num_week <= inter_week)
    {
%>
                <tr>
<%
        finweek = cont + 6;
        while(cont <= finweek)
        {
            //if cont<10 then aux1="0" else aux1="" end if
            //if nMonth<10 then aux2="0" else aux2="" end if
            //nFecha = aux1 & cont & "/" & aux2 & nMonth & "/" & nYear
            nFecha = new DateTime(nYear, nMonth, cont);
            numday = DateAndTime.Weekday(nFecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
            cmd = new Command();
            rsReserve = new Recordset();
            cmd.ActiveConnection = oConn;
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                cmd.CommandText = "SP_BR_CALENDAR_FILTER_AVAILABLE";
            }
            else
            {
                cmd.CommandText = "SP_BR_CALENDAR_FILTER";
            }
            cmd.CommandType = adCmdStoredProc;
            //cmd.Parameters[1] = nFecha;
            //cmd.Parameters[2] = BoatSelected;
            //cmd.Parameters[3] = MarinaID;
            cmd.Parameters.Append(cmd.CreateParameter("@Date1", adVarChar, adParamInput, 18, 0));
            cmd.Parameters["@Date1"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", nFecha);
            cmd.Parameters.Append(cmd.CreateParameter("@MarinaID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@MarinaID"].Value = Convert.ToInt32(MarinaID);
            cmd.Parameters.Append(cmd.CreateParameter("@BoatID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@BoatID"].Value = Convert.ToInt32(BoatSelected);
            rsReserve.CursorType = (nce.adodb.CursorType)3;
            rsReserve.CursorLocation = (nce.adodb.CursorLocation)3;
            rsReserve.Open(cmd);
            if (numday == 1 || numday == 7)
            {
%>
						<!--
						<td class="sat_sun_td">
						-->
						
						<td >
						
<%
            }
            else
            {
%>
						<td >
<%
            }
%>
						<p class="calday">
<%
            if (!(rsReserve.Eof))
            {
                if (NVL(Request.Form["rdCalView"], 0) == "1")
                {
                    sLink = "log_calendar_available.aspx";
                    style = "color: #0B3152;";
                }
                else
                {
                    sLink = "log_calendar.aspx";
                    if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                    {
                        style = "color:black;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                    {
                        style = "color:red;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                    {
                        style = "color:green;";
                    }
                    else
                    {
                        style = "color:blue;";
                    }
                }
%>
				    	<a href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= BoatSelected %>"><%= cont %></a>
<%
            }
            else
            {
%>
						<a href="#"><%= cont %></a>
<%
            }
%>
						</p>&nbsp;&nbsp;
						<p>
<%
            if (!(rsReserve.Eof))
            {
                if (NVL(Request.Form["rdCalView"], 0) == "1")
                {
                    sLink = "log_calendar_available.aspx";
                    style = "color: #0B3152;";
                }
                else
                {
                    sLink = "log_calendar.aspx";
                    if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                    {
                        style = "color:black;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                    {
                        style = "color:red;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                    {
                        style = "color:green;";
                    }
                    else
                    {
                        style = "color:blue;";
                    }
                }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a>
<%
                rsReserve.MoveNext();
            }
%>
&nbsp;&nbsp;
<%
            if (!(rsReserve.Eof))
            {
                if (NVL(Request.Form["rdCalView"], 0) == "1")
                {
                    sLink = "log_calendar_available.aspx";
                    style = "color: #0B3152;";
                }
                else
                {
                    sLink = "log_calendar.aspx";
                    if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                    {
                        style = "color:black;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                    {
                        style = "color:red;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                    {
                        style = "color:green;";
                    }
                    else
                    {
                        style = "color:blue;";
                    }
                }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a>
<%
                rsReserve.MoveNext();
            }
%>
&nbsp;&nbsp;
<%
            if (!(rsReserve.Eof))
            {
                if (NVL(Request.Form["rdCalView"], 0) == "1")
                {
                    sLink = "log_calendar_available.aspx";
                    style = "color: #0B3152;";
                }
                else
                {
                    sLink = "log_calendar.aspx";
                    if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                    {
                        style = "color:black;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                    {
                        style = "color:red;";
                    }
                    else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                    {
                        style = "color:green;";
                    }
                    else
                    {
                        style = "color:blue;";
                    }
                }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a><%
                rsReserve.MoveNext();
            }
%>
&nbsp;&nbsp;
						
						<a href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= BoatSelected %>">
						
<%
            if (!(rsReserve.Eof))
            {
%>
...<%
            }
%>
						</a>
						</p>
						</td>
<%
            cont = cont + 1;
        }
%>
						<!--td class="sat_sun_td"><p class="calday"><a href="#">4</a></p></td-->
					</tr>
<%
        num_week = num_week + 1;
    }
%>
					<tr>
<%
        //Last week
        //Current Month
    while(cont <= DiasMes)
    {
        nFecha = new DateTime(nYear, nMonth, cont);
        numday = DateAndTime.Weekday(nFecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
        cmd = new Command();
        rsReserve = new Recordset();
        cmd.ActiveConnection = oConn;
        if (NVL(Request.Form["rdCalView"], 0) == "1")
        {
            cmd.CommandText = "SP_BR_CALENDAR_FILTER_AVAILABLE";
        }
        else
        {
            cmd.CommandText = "SP_BR_CALENDAR_FILTER";
        }
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = nFecha;
        //cmd.Parameters[2] = BoatSelected;
        //cmd.Parameters[3] = MarinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@Date1", adVarChar, adParamInput, 18, 0));
        cmd.Parameters["@Date1"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", nFecha);
        cmd.Parameters.Append(cmd.CreateParameter("@MarinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@MarinaID"].Value = Convert.ToInt32(MarinaID);
        cmd.Parameters.Append(cmd.CreateParameter("@BoatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@BoatID"].Value = Convert.ToInt32(BoatSelected);
        rsReserve.CursorType = (nce.adodb.CursorType)3;
        rsReserve.CursorLocation = (nce.adodb.CursorLocation)3;
        rsReserve.Open(cmd);
        if (numday == 1 || numday == 7)
        {
%>
						<td >
<%
        }
        else
        {
%>
						<td >
<%
        }
%>

						<p class="calday">
<%
        if (!(rsReserve.Eof))
        {
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
				    	<a href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= BoatSelected %>"><%= cont %></a>
<%
        }
        else
        {
%>
						<a href="#"><%= cont %></a>
<%
        }
%>
						</p>&nbsp;&nbsp;
						<p>
<%
        if (!(rsReserve.Eof))
        {
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a>
<%
            rsReserve.MoveNext();
        }
%>
&nbsp;&nbsp;
<%
        if (!(rsReserve.Eof))
        {
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a>
<%
            rsReserve.MoveNext();
        }
%>
&nbsp;&nbsp;
<%
        if (!(rsReserve.Eof))
        {
            if (NVL(Request.Form["rdCalView"], 0) == "1")
            {
                sLink = "log_calendar_available.aspx";
                style = "color: #0B3152;";
            }
            else
            {
                sLink = "log_calendar.aspx";
                if (Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 1)
                {
                    style = "color:black;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 2)
                {
                    style = "color:red;";
                }
                else if( Convert.ToInt32(rsReserve.Fields["in_typerentid"].Value) == 3)
                {
                    style = "color:green;";
                }
                else
                {
                    style = "color:blue;";
                }
            }
%>
					 	<a style=<%= style %> href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= rsReserve.Fields["in_BoatID"].Value %>"><%= rsReserve.Fields["vc_Name"].Value %>
					  	</a><%
            rsReserve.MoveNext();
        }
%>
&nbsp;&nbsp;
						<a href="<%= sLink %>?dd=<%= cont %>&mm=<%= nMonth %>&aaaa=<%= nYear %>&txtFrom=<%= nFecha %>&txtTo=<%= nFecha %>&BoatID=<%= BoatSelected %>">
<%
        if (!(rsReserve.Eof))
        {
%>
...<%
        }
%>
						</a>
						</p>

						</td>
<%
        cont = cont + 1;
    }
    contrest2 = IniRestDays2;
    while(contrest2 <= FinRestDays2)
    {
%>
						<td class="next_prev_month_td">
						<p class="calday"> <%= contrest2 %></p>

						</td>
<%
        contrest2 = contrest2 + 1;
    }
%>
					</tr>
				</table>
				<div><span class="hilite">*</span> <span class="hilite_explain">Legend</span></div>
		<a class="button" href="boats_list.aspx">Cancel</a>
		
	
		<table width="80%" align=right>
		<tr>
		<td>
		<font size="2"  face="Verdana, Arial, Helvetica, sans-serif">To see days rental list<br>press the date in upper left corner</font>
		</td>
		
		<td class="cal_boat_select_td"><font size="+1">	Select Boat</font></td>
		
		
			<td class="cal_boat_select_td">
<%
    BoatName();
%>
					</td>
		</tr>
		
		
		</table>
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
