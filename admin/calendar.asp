<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
 <!-- #include file="__dbConnection.asp" -->
<!-- #include file="__functions.asp" -->
<!-- #include file="__validateSession.asp" -->
<%
Session.Timeout=720

'Response.Write(nvl(Request.Form("rdCalView"),1))



If Request.form("hdnMonth")="" then
	nMonth=month(Date())
Else
	nMonth=CInt(Request.Form("hdnMonth"))
end if
If Request.form("hdnYear")="" then
	nYear=Year(Date())
Else
	nYear=CInt(Request.Form("hdnYear"))
end if

If Request.form("hdnPag")="" then
	nPag=1
Else
	nPag=CInt(Request.Form("hdnPag"))
end if

nRegistros = 15
    'Calculating the past month'
	if nMonthnlastMonth=1 then
	   nlastMonth=12
	else
	   nlastMonth=nMonth-1
    end if

	'Calculating the number of days of past month'
	if nlastMonth =2 then
	    lastDiasMes=28
	else
	   if nlastMonth=1 or nlastMonth=3 or nlastMonth=5 or nlastMonth=7 or nlastMonth=8  or nlastMonth=10 or nlastMonth=12 then
	      lastDiasMes=31
		else
	      lastDiasMes=30
		end if
	end if

	'Calculating the number of days of current month'
	if nMonth =2 then
	    DiasMes=28
	else
	   if nMonth=1 or nMonth=3 or nMonth=5 or nMonth=7 or nMonth=8  or nMonth=10 or nMonth=12 then
	      DiasMes=31
		else
	      DiasMes=30
		end if
	end if

	'Calculating  rest days of past month'
	Fecha=DateSerial(nYear,nMonth,1)
	numday=WeekDay(Fecha)
	lastweek=numday-1
	IniRestDays=lastDiasMes-lastweek+1
	FinRestDays=lastDiasMes

	'Calculating  left days of next month'
	Fecha2=DateSerial(nYear,nMonth,DiasMes)
	numday2=WeekDay(Fecha2)
	lastweek2=7-numday2
	IniRestDays2=1
	FinRestDays2=lastweek2

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

	document.frmGTS.action = "calendar.aspx";
  	document.frmGTS.submit();

}

function SomeYear() {
	document.frmGTS.hdnYear.value=document.frmGTS.cboYear.value;

	document.frmGTS.action = "calendar.aspx";
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
document.frmGTS.action = "calendar.aspx";
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
document.frmGTS.action = "calendar.aspx";
  	document.frmGTS.submit();

}


function LogOut() {
    document.frmGTS.action = "logout.aspx";
  	document.frmGTS.submit();
}

function Edit(BoatID) {

    document.frmGTS.action = "boats_mant.aspx?BoatID=" + BoatID;
  	document.frmGTS.submit();

}

function Recall() {

    document.frmGTS.action = "calendar.aspx";
  	document.frmGTS.submit();

}

</script>

<body>
<FORM name="frmGTS" method=POST>
<input type="hidden" name="hdnPag" value="<%=nPag%>">
<input type="hidden" name="hdnMonth" value="<%=nMonth%>">
<input type="hidden" name="hdnYear" value="<%=nYear%>">
<input type="hidden" name="hdn_Action" value="E">
<%
BoatSelected=NVL(Request.form("cbo_BoatID"),0)
MarinaID=NVL(Session("MarinaID"),0)
%>
	<div id="container">
		<div id="banner"></div>

		<!--div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="boats_list.ASP">Boat</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="calendar.ASP">Calendar</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="boats_list_reservation.ASP">New Reservation</a>
		</div-->
		<div id="menu">
			<ul>
			
			<%if Session("userLevelID")<>2 then%>
			<li ><a href="facilities_mant.asp?MarinaID=<%=Session("MarinaID")%>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li><a href="users_list.aspx">Add User</a></li>	
			<li><a href="boats_list.aspx">Boat List</a></li>
			<%end if%>
			<li id="current"><a href="calendar.aspx">Calendar</a></li>
			<li><a href="boats_list_reservation.aspx">New Reservation</a></li>
			<li><a href="boats_list_reports.aspx">Reports</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu"><h1 style="font-size:8pt">Facility Calendar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <b><font size="2"  face="Verdana, Arial, Helvetica, sans-serif">
					 Welcome  <%=Session("BusinessName")%> Marina</font></b>
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
                        <option value=1 <%if nMonth=1 then%> selected <%end if%> >Jan</option>
                        <option value=2 <%if nMonth=2 then%> selected <%end if%>  >Feb</option>
                        <option value=3 <%if nMonth=3 then%> selected <%end if%>  >Mar</option>
                        <option value=4 <%if nMonth=4 then%> selected <%end if%>  >Apr</option>
                        <option value=5 <%if nMonth=5 then%> selected <%end if%>  >May</option>
                        <option value=6 <%if nMonth=6 then%> selected <%end if%>  >Jun</option>
                        <option value=7 <%if nMonth=7 then%> selected <%end if%>  >Jul</option>
                        <option value=8 <%if nMonth=8 then%> selected <%end if%>  >Aug</option>
                        <option value=9 <%if nMonth=9 then%> selected <%end if%>  >Sep</option>
                        <option value=10 <%if nMonth=10 then%> selected <%end if%>  >Oct</option>
                        <option value=11 <%if nMonth=11 then%> selected <%end if%>  >Nov</option>
                        <option value=12 <%if nMonth=12 then%> selected <%end if%>  >Dec</option>
                      </select>
					</td>
					<td class="cal_year_td">
						 <select name="cboYear" class="cal_year" onChange="javascript:SomeYear();">
                       <%contYear=Year(Date())-15
					   do while contYear<=Year(Date()) %>
					    <option  value=<%=contYear%> <%if nYear=contYear then%> selected <%end if%>  ><%=contYear%></option>
                        <%contYear=contYear+1
						 loop%>
                      </select>
					</td>
					
						<% 
		
		s1Check=""
		s2Check=""
		if nvl(Request.Form("rdCalView"),0) = 1 then s1Check="CHECKED" else s2Check="CHECKED" end if
		%>
					<td class="cal_next_button_td">
					<a class="cal_button" href="javascript:Next2();">&nbsp;&gt;&nbsp;</a></td>
					<td class="cal_boat_select_td">
					   <h1><input type="radio" name="rdCalView" value="1"  <%=s1Check%> onClick="javascript:Recall();" > View Available Boats</h1> 
						 <h1><input type="radio" name="rdCalView" value="2" <%=s2Check%> onClick="javascript:Recall();" > View Reserved Boats</h1>  
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
					 	<% 'First week
				    	contrest=IniRestDays
			  			do while contrest<=FinRestDays
				  		%>
						<td class="next_prev_month_td">
						 <p class="calday">  <%=contrest%></p>
						 <!--p>&nbsp;</p>
						 <p>&nbsp;</p-->
						</td>
             			<%contrest=contrest+1
			   			loop%>

						<% 'Current Month
						cont=1
						finfirstweek=7-lastweek
				  		do while cont<=finfirstweek
							nFecha = DateSerial(nYear,nMonth,cont)
							numday=WeekDay(nFecha)
						    Set cmd=Server.CreateObject("ADODB.Command")
							Set rsReserve=Server.CreateObject("ADODB.Recordset")
							With cmd
								Set .ActiveConnection=oConn
								
								
								
								if nvl(Request.Form("rdCalView"),0) = 1 then 
							
								.CommandText = "SP_BR_CALENDAR_FILTER_AVAILABLE"
							else
							
								.CommandText = "SP_BR_CALENDAR_FILTER"
							end if
								
								
								.CommandType=adCmdStoredProc
								.Parameters(1)=nFecha
								.Parameters(2)=BoatSelected
								.Parameters(3)=MarinaID
							End With
							rsReserve.cursortype=3
							rsReserve.cursorlocation=3
							rsReserve.Open cmd
						%>
						<%if numday=1 or numday=7 then %>
						<td >
						<%else%>
						<td >
						<%end if%>
						<p class="calday">
						<%if not rsReserve.eof then
						
						sLink="log_calendar.aspx"
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.aspx"
						else
						
						 sLink ="log_calendar.aspx"
						 
						end if
						
						 %>
				    
				    	<a href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=BoatSelected%>"><%=cont%></a>
					
						<%else%>
						<a href="#"><%=cont%></a>
						<%end if%>
						</p>&nbsp;&nbsp;
						<p>
						<%if not rsReserve.eof then
						
						sLink="log_calendar.aspx"
						
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.aspx"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						 elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a>
						<%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<%if not rsReserve.eof then
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						  elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a>
						<%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<%if not rsReserve.eof then
						
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						  elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a><%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<a href="log_calendar.aspx?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=BoatSelected%>">
						<%if not rsReserve.eof then%>...<%end if%>
						</a>
						</p>
						</td>
             			<%cont=cont+1
			   			loop%>
						<!--td class="sat_sun_td"><p class="calday"><a href="#">4</a></p></td-->
					</tr>
					  <%  '3 next weeks
				 Fecha=DateSerial(nYear,nMonth,1)
				  if ( (DiasMes=31) and ((WeekDay(Fecha) = 6 ) or (WeekDay(Fecha) = 7) ))  or  ((DiasMes =30) and  (WeekDay(Fecha) = 7))  then
					  inter_week=5
				else
						  inter_week=4
				end if
				    num_week=2
				  do while  num_week<=inter_week
				  %>
                <tr>
				  <%
				    finweek=cont+6
				    do while cont<=finweek
				  %>
				  <%
				    'if cont<10 then aux1="0" else aux1="" end if
					'if nMonth<10 then aux2="0" else aux2="" end if
					'nFecha = aux1 & cont & "/" & aux2 & nMonth & "/" & nYear
				    nFecha = DateSerial(nYear,nMonth,cont)
					numday=WeekDay(nFecha)
					Set cmd=Server.CreateObject("ADODB.Command")
							Set rsReserve=Server.CreateObject("ADODB.Recordset")
							With cmd
								Set .ActiveConnection=oConn
								
								
								if nvl(Request.Form("rdCalView"),0) = 1 then 
							
								.CommandText = "SP_BR_CALENDAR_FILTER_AVAILABLE"
							else
							
								.CommandText = "SP_BR_CALENDAR_FILTER"
							end if
								.CommandType=adCmdStoredProc
								.Parameters(1)=nFecha
								.Parameters(2)=BoatSelected
								.Parameters(3)=MarinaID								
							End With
							rsReserve.cursortype=3
							rsReserve.cursorlocation=3
							rsReserve.Open cmd


				  %>


						<%if numday=1 or numday=7 then %>
						
						<!--
						<td class="sat_sun_td">
						-->
						
						<td >
						
						<%else%>
						<td >
						<%end if%>
						<p class="calday">
						<%if not rsReserve.eof then 
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
				    	<a href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=BoatSelected%>"><%=cont%></a>
						<%else%>
						<a href="#"><%=cont%></a>
						<%end if%>
						</p>&nbsp;&nbsp;
						<p>
						<%if not rsReserve.eof then
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						   elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a>
						<%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<%if not rsReserve.eof then
						
					if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						 elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a>
						<%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<%if not rsReserve.eof then
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						 elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a><%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						
						<a href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=BoatSelected%>">
						
						<%if not rsReserve.eof then%>...<%end if%>
						</a>
						</p>
						</td>
             			<%cont=cont+1
			   			loop%>
						<!--td class="sat_sun_td"><p class="calday"><a href="#">4</a></p></td-->
					</tr>
					  <%num_week=num_week+1
					   loop%>
					<tr>
					 <% 'Last week

				   'Current Month
			  		do while cont<=DiasMes
				  %>
				  <%

				    nFecha = DateSerial(nYear,nMonth,cont)
					numday=WeekDay(nFecha)
					Set cmd=Server.CreateObject("ADODB.Command")
							Set rsReserve=Server.CreateObject("ADODB.Recordset")
							With cmd
								Set .ActiveConnection=oConn
							
							if nvl(Request.Form("rdCalView"),0) = 1 then 
							
								.CommandText = "SP_BR_CALENDAR_FILTER_AVAILABLE"
							else
							
								.CommandText = "SP_BR_CALENDAR_FILTER"
							end if
							
								.CommandType=adCmdStoredProc
								.Parameters(1)=nFecha
								.Parameters(2)=BoatSelected
								.Parameters(3)=MarinaID
							End With
							rsReserve.cursortype=3
							rsReserve.cursorlocation=3
							rsReserve.Open cmd

				  %>
						<%if numday=1 or numday=7 then %>
						<td >
						<%else%>
						<td >
						<%end if%>

						<p class="calday">
						<%if not rsReserve.eof then 
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.aspx"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						  elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						
						%>
				    	<a href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=BoatSelected%>"><%=cont%></a>
						<%else%>
						<a href="#"><%=cont%></a>
						<%end if%>
						</p>&nbsp;&nbsp;
						<p>
						<%if not rsReserve.eof then
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.aspx"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						   elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 end if
						
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a>
						<%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<%if not rsReserve.eof then
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.asp"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						 elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a>
						<%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<%if not rsReserve.eof then
						
						
						if nvl(Request.Form("rdCalView"),0) = 1 then 
						  sLink= "log_calendar_available.aspx"
						  style="color: #0B3152;"

						else
						 sLink ="log_calendar.aspx"
					    if  rsReserve("in_typerentid") = 1 then
						   style="color:black;"
						  elseif rsReserve("in_typerentid") = 2 then
						   style = "color:red;"
						 elseif rsReserve("in_typerentid") = 3 then
						    style ="color:green;"
						 else
						    style="color:blue;"
						 end if
						 
						 
						 end if
						
						%>
					 	<a style=<%=style%> href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=rsReserve("in_BoatID")%>"><%=rsReserve("vc_Name")%>
					  	</a><%rsReserve.movenext
						end if%>&nbsp;&nbsp;
						<a href="<%=sLink%>?dd=<%=cont%>&mm=<%=nMonth%>&aaaa=<%=nYear%>&txtFrom=<%=nFecha%>&txtTo=<%=nFecha%>&BoatID=<%=BoatSelected%>">
						<%if not rsReserve.eof then%>...<%end if%>
						</a>
						</p>

						</td>
						<%cont=cont+1
			   			loop%>

  						<%contrest2=IniRestDays2
			  			do while contrest2<=FinRestDays2
				    	%>
						<td class="next_prev_month_td">
						<p class="calday"> <%=contrest2%></p>

						</td>
						<%contrest2=contrest2+1
			   			loop%>
					</tr>
				</table>
				<div><span class="hilite">*</span> <span class="hilite_explain">Legend</span></div>
		<a class="button" href="boats_list.asp">Cancel</a>
		
	
		<table width="80%" align=right>
		<tr>
		<td>
		<font size="2"  face="Verdana, Arial, Helvetica, sans-serif">To see days rental list<br>press the date in upper left corner</font>
		</td>
		
		<td class="cal_boat_select_td"><font size="+1">	Select Boat</font></td>
		
		
			<td class="cal_boat_select_td">
					    <%BoatName()%>
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
<%Function BoatName()
	Dim rs, cmd
	Set cmd=Server.CreateObject("ADODB.Command")
	With cmd
		Set .ActiveConnection=oConn
		.CommandText = "SP_BR_BOATxMARINA_RESERVATION_LIST"
		.CommandType=adCmdStoredProc
		.Parameters(1)=Session("MarinaID")
		Set rs = .Execute()
	End With
%>
	<select name="cbo_BoatID" class="cal_boat_select" onChange="javascript:Recall();">
	<option value="0">[All]</option>
	<%Do while not rs.eof
	if rs("in_BoatID")=CInt(BoatSelected) then scadena="selected" else scadena="" end if%>
	         <option value="<%=rs("in_BoatID")%>" <%=scadena%>><%=rs("vc_Name")%></option>
	<% rs.movenext%>
  	<%Loop%>
  	</select>
<%End function%>

