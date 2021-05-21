<%@ Page language="C#" CodeFile="calendar_i.aspx.cs" Inherits="BoatRenting.calendar_i_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>

//<!--#include file="includes/__dbconnection.aspx"-->
<%
    Response.Buffer = true;
    Response.Clear();
    Response.Expires = 0;
    boatID = Request["hdnBoat"];
    marinaID = Request["hdnMarina"];
    //if (Request.Form["hdnMonth"] == "")
    if (Request.Form["hdnMonth"] == null)
        {
        nMonth = DateTime.Today.Month;
    }
    else
    {
        nMonth = Convert.ToInt32(Request.Form["hdnMonth"]);
    }
    //if (Request.Form["hdnYear"] == "")
    if (Request.Form["hdnYear"] == null)
        {
        nYear = DateTime.Today.Year;
    }
    else
    {
        nYear = Convert.ToInt32(Request.Form["hdnYear"]);
    }

    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
    
    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOOKDATExBOAT_CALENDAR";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = boatID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_boatID"].Value = boatID;
    //cmd.Parameters[2] = marinaID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_marinaID"].Value = marinaID;
    //cmd.Parameters[3] = nMonth;
    cmd.Parameters.Append(cmd.CreateParameter("@p_month", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_month"].Value = nMonth;
    //cmd.Parameters[4] = nYear;
    cmd.Parameters.Append(cmd.CreateParameter("@p_year", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_year"].Value = nYear;
    rs.Open(cmd);
    ArrDaysStyle = new string[32];
    for(i = 0; i <= 31; i += 1)
    {
        //TODO Redim Preserve not supported.
        //ArrDaysStyle = new string[i + 1];
        ArrDaysStyle[i] = "calendar_day_available";
    }
    while(!(rs.Eof))
    {
        if (Convert.ToInt32(rs.Fields["in_hours"].Value) == 24)
        {
            ArrDaysStyle[Convert.ToInt32(rs.Fields["dday"].Value)] = "calendar_day";
        }
        else
        {
            ArrDaysStyle[Convert.ToInt32(rs.Fields["dday"].Value)] = "calendar_day_partially_available";
        }
        rs.MoveNext();
    }
    //List Holidays for Boat
    cmd1 = new Command();
    rs1 = new Recordset();
    cmd1.ActiveConnection = oConn;
    cmd1.CommandText = "SP_BR_BOAT_HOLIDAYS";
    cmd1.CommandType = adCmdStoredProc;
    //cmd1.Parameters[1] = boatID;
    cmd1.Parameters.Append(cmd1.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd1.Parameters["@p_in_boatID"].Value = boatID;
    //cmd1.Parameters[2] = marinaID;
    cmd1.Parameters.Append(cmd1.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd1.Parameters["@p_in_marinaID"].Value = marinaID;
    //cmd1.Parameters[3] = nMonth;
    cmd1.Parameters.Append(cmd1.CreateParameter("@p_month", adInteger, adParamInput, 4, 0));
    cmd1.Parameters["@p_month"].Value = nMonth;
    //cmd1.Parameters[4] = nYear;
    cmd1.Parameters.Append(cmd1.CreateParameter("@p_year", adInteger, adParamInput, 4, 0));
    cmd1.Parameters["@p_year"].Value = nYear;
    rs1.Open(cmd1);
    for(i = 0; i <= 31; i += 1)
    {
        //TODO Redim Preserve not supported.
        ArrHolidayStyle = new string[i + 1];
        ArrHolidayStyle[i] = "";
    }
    while(!(rs1.Eof))
    {
        ArrHolidayStyle[Convert.ToInt32(rs1.Fields["dday"])] = "*";
        rs1.MoveNext();
    }
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
    numday = Microsoft.VisualBasic.DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
    lastweek = numday - 1;
    IniRestDays = lastDiasMes - lastweek + 1;
    FinRestDays = lastDiasMes;
    //Calculating  left days of next month'
    Fecha2 = new DateTime(nYear, nMonth, DiasMes);
    numday2 = Microsoft.VisualBasic.DateAndTime.Weekday(Fecha2, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
    lastweek2 = 7 - numday2;
    IniRestDays2 = 1;
    FinRestDays2 = lastweek2;
%>
<html>
<head>
<title></title>
<style type="text/css" media="screen">@import "br.css";</style>
<script language="javascript">
function SomeMonth() {
	document.frmGTS.hdnMonth.value=document.frmGTS.cboMonth.value;

  	document.frmGTS.action="calendar_i.aspx";
  	document.frmGTS.submit();

}

function SomeYear() {
	document.frmGTS.hdnYear.value=document.frmGTS.cboYear.value;

  	document.frmGTS.action="calendar_i.aspx";
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
  	document.frmGTS.action="calendar_i.aspx";
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
  	document.frmGTS.action="calendar_i.aspx";
  	document.frmGTS.submit();

}


function colocar(day,month,year) {
		var dia = new String(day);
		if (dia.length < 2) dia = "0" + dia;

		var mes = new String(month);
		if (mes.length < 2) mes = "0" + mes;
		var anio = new String(year);

	
	var months = new Array(13);
   months[0]  = "Jan";
   months[1]  = "Feb";
   months[2]  = "Mar";
   months[3]  = "Apr";
   months[4]  = "May";
   months[5]  = "Jun";
   months[6]  = "Jul";
   months[7]  = "Aug";
   months[8]  = "Sep";
   months[9]  = "Oct";
   months[10] = "Nov";
   months[11] = "Dec";

	
	
	
	parent.document.frm_boat.txt_date1.value= months[month-1] + "-"+dia+"-" + year;
	
	parent.document.frm_boat.TxtToDate.value= parent.document.frm_boat.txt_date1.value;
	
	parent.document.getElementById("txtCalendarFrom").style.backgroundColor='yellow';
	parent.document.getElementById("lblCalendarFrom").style.backgroundColor='yellow';
	Blink('divTo');
	parent.document.getElementById("txtCalendarTo").focus();
	
	parent.document.getElementById("txtCalendarTo").style.backgroundColor='silver';
	parent.document.getElementById("lblCalendarTo").style.backgroundColor='silver';
	
	parent.document.frm_boat.txt_date1_day.value=day;
	parent.document.frm_boat.txt_date1_month.value=month;
	parent.document.frm_boat.txt_date1_year.value=year;
	
	//parent.document.frm_boat.txt_date2.value=mes + "/" + dia + "/" + anio;
	//parent.document.frm_boat.txt_date1_old.value=dia + "/" + mes + "/" + anio;
	//parent.document.frm_boat.txt_date2_old.value=dia + "/" + mes + "/" + anio;
	
	
	
	//alert("Value " + parent.document.frm_boat.txt_date1.value);
	
	//parent.document.frm_boat.action="calendar2.aspx";
	//parent.document.frm_boat.submit();


}




</script>


<SCRIPT LANGUAGE="JavaScript">


var tout;

window.onerror = null;
 var bName = navigator.appName;
 var bVer = parseInt(navigator.appVersion);
 var NS4 = (bName == "Netscape" && bVer >= 4);
 var IE4 = (bName == "Microsoft Internet Explorer" 
 && bVer >= 4);
 var NS3 = (bName == "Netscape" && bVer < 4);
 var IE3 = (bName == "Microsoft Internet Explorer" 
 && bVer < 4);
 var blink_speed=100;
 var i=0;
 
if (NS4 || IE4) {
 if (navigator.appName == "Netscape") {
 layerStyleRef="parent.layer.";
 layerRef="parent.document.layers";
 styleSwitch="";
 }else{
 layerStyleRef="parent.layer.style.";
 layerRef="parent.document.all";
 styleSwitch=".style";
 }
}

//BLINKING
function Blink(layerName){
 if (NS4 || IE4) { 
 if(i%2==0)
 {
 eval(layerRef+'["'+layerName+'"]'+
 styleSwitch+'.visibility="visible"');
 }
 else
 {
 eval(layerRef+'["'+layerName+'"]'+
 styleSwitch+'.visibility="hidden"');
 }
 } 
 if(i<1)
 {
 i++;
 } 
 else
 {
 i--
 }
tout= setTimeout("Blink('"+layerName+"')",blink_speed);
}
//  End -->


function StopBlink()
{
clearTimeout(tout);
 eval(layerRef+'["divTo"]'+
 styleSwitch+'.visibility="visible"');
}
</script>


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
<FORM name="frmGTS" method="POST">
<input type="hidden" name="hdnMonth" value="<%= nMonth %>">
<input type="hidden" name="hdnYear" value="<%= nYear %>">
<input type="hidden" name="hdnBoat" value="<%= boatID %>">
<input type="hidden" name="hdnMarina" value="<%= marinaID %>">
<table border="0" cellspacing="0" cellpadding="0" width="170">
<tr>
  <%--<td width="205" height="170" bgcolor="#F1F5F5" valign="top">--%>
      <td width="170" height="170" bgcolor="#F1F5F5" valign="top">
<table border="0" cellspacing="0" cellpadding="0" class="calendar_date_select">
<tr>
  <td bgcolor="#F1F5F5" align="center">
	<a href="javascript:Back2();"><img src="imagescal/btn_del_small.gif" alt="btn del small"/ border="0"></a>&nbsp;
		<select name="cboMonth" class="claimcal3"  onChange="javascript:SomeMonth();">
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
	  <select name="cboYear" class="claimcal3" onChange="javascript:SomeYear();">
<%
    contYear = DateTime.Today.Year - 15;
    while(contYear <= DateTime.Today.Year + 10)
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
	  &nbsp;<a href="javascript:Next2();"><img src="imagescal/btn_close_small.gif.gif" alt="small gif"/ border="0"></a>
	 </td>
 </tr>
</table>


<table id="calendar" cellspacing="0" border="0">
	<tr>
	  <th>S</th>
	  <th>M</th>
	  <th>T</th>
	  <th>W</th>
	  <th>Th</th>
	  <th>F</th>
	  <th>S</th>
	</tr>
	<tr align="center" valign="middle">
<%
    //'Start Change 16/12/05
    nDDay = DateTime.Today.Day;
    nMDay = DateTime.Today.Month;
    nYDay = DateTime.Today.Year;
    nM = nlastMonth;
    if (nM == 12)
    {
        nY = nYear - 1;
    }
    else
    {
        nY = nYear;
    }
    Hoy = new DateTime(nYDay, nMDay, nDDay);
    //'End  Change 16/12/05
    //First week
    contrest = IniRestDays;
    while(contrest <= FinRestDays)
    {
        if (new DateTime(nY, nM, contrest) < Hoy)
        {
%>
			<td class="calendar_day_past"><%= contrest %></td>
<%
        }
        else
        {
%>
			<td class="calendar_prev_month"><%= contrest %></td>
<%
        }
        contrest = contrest + 1;
    }
    //Current Month
    cont = 1;
    finfirstweek = 7 - lastweek;
    while(cont <= finfirstweek)
    {
        if (ArrDaysStyle[cont] == "calendar_day")
        {
            //'if DateSerial(nYear,nMonth,cont)< Hoy then
%>
				<!--td class="calendar_day_past"><%
            //'=cont
%>
</td-->
<%
            //'else
%>
				<td class="<%= ArrDaysStyle[cont] %>"><%= cont %><%= ArrHolidayStyle[cont] %> </td>
<%
            //'end if
        }
        else
        {
            if (new DateTime(nYear, nMonth, cont) < Hoy)
            {
%>
				<td class="calendar_day_past">	<%= cont %><%= ArrHolidayStyle[cont] %> </td>

<%
            }
            else
            {
%>
				<td class="<%= ArrDaysStyle[cont] %>">
			    <a href="javascript:colocar(<%= cont %>,<%= nMonth %>,<%= nYear %>)"><%= cont %><%= ArrHolidayStyle[cont] %></a></td>
<%
            }
        }
        cont = cont + 1;
    }
%>
	</tr>
<%
    //3 next weeks'
    Fecha = new DateTime(nYear, nMonth, 1);
    if (((DiasMes == 31) && ((Microsoft.VisualBasic.DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday) == 6) || (Microsoft.VisualBasic.DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday) == 7))) || ((DiasMes == 30) && (Microsoft.VisualBasic.DateAndTime.Weekday(Fecha, Microsoft.VisualBasic.FirstDayOfWeek.Sunday) == 7)))
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
            if (ArrDaysStyle[cont] == "calendar_day")
            {
                //'if DateSerial(nYear,nMonth,cont)< Hoy then
%>
				<!--td class="calendar_day_past"><%
                //'=cont
%>
</td-->
<%
                //'else
%>
				<td class="<%= ArrDaysStyle[cont] %>"><%= cont %><%= ArrHolidayStyle[cont] %></td>
<%
                //'end if
            }
            else
            {
                if (new DateTime(nYear, nMonth, cont) < Hoy)
                {
%>
				<td class="calendar_day_past"><%= cont %><%= ArrHolidayStyle[cont] %> </td>
<%
                }
                else
                {
%>
				<td class="<%= ArrDaysStyle[cont] %>"><a href="javascript:colocar(<%= cont %>,<%= nMonth %>,<%= nYear %>)"><%= cont %><%= ArrHolidayStyle[cont] %> </a></td>
<%
                }
            }
            cont = cont + 1;
        }
%>
		</tr>
<%
        num_week = num_week + 1;
    }
%>
	  <tr align="center" valign="middle">
<%
    //Last week
    //Current Month
    while(cont <= DiasMes)
    {
        if (ArrDaysStyle[cont] == "calendar_day")
        {
            //'if DateSerial(nYear,nMonth,cont)< Hoy then
%>
				<!--td class="calendar_day_past"><%
            //'=cont
%>
</td-->
<%
            //'else
%>
				<td class="<%= ArrDaysStyle[cont] %>"><%= cont %><%= ArrHolidayStyle[cont] %>   </td>
<%
            //'end if
        }
        else
        {
            if (new DateTime(nYear, nMonth, cont) < Hoy)
            {
%>
				<td class="calendar_day_past"><%= cont %><%= ArrHolidayStyle[cont] %> </td>
<%
            }
            else
            {
%>
				<td class="<%= ArrDaysStyle[cont] %>"><a href="javascript:colocar(<%= cont %>,<%= nMonth %>,<%= nYear %>)"><%= cont %><%= ArrHolidayStyle[cont] %> </a></td>
<%
            }
        }
        cont = cont + 1;
    }
    contrest2 = IniRestDays2;
    while(contrest2 <= FinRestDays2)
    {
        if (nMonth == 12)
        {
            nNextM = 1;
            nNextY = nYear + 1;
        }
        else
        {
            nNextM = nMonth + 1;
            nNextY = nYear;
        }
        if (new DateTime(nNextY, nNextM, contrest2) < Hoy)
        {
%>
			<td class="calendar_day_past"><%= contrest2 %></td>
<%
        }
        else
        {
%>
			<td class="calendar_prev_month"><%= contrest2 %></td>
<%
        }
        contrest2 = contrest2 + 1;
    }
%>
	</tr>
</table>
</td>
</tr>
</table>
<!--div id="calendar_dates_available">&nbsp;Dates Available</div>
<div id="calendar_dates_partially_available">&nbsp;Dates Partially Available</div--><!--<div class="explanation">
				<div class="exp_title">Please select a date!</div>
				<span id="calendar_dates_available">Available Days</span><br/>
				<span id="calendar_dates_partially_available">Partially Available Days</span>
</div>-->

</form>
</body>
</html>
