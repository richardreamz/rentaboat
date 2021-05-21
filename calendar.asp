<!-- #include file="includes/__dbconnection.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%
session("strErr")=""
 Dim cmd, rs
Set cmd=Server.CreateObject("ADODB.Command")
Set rs=Server.CreateObject("ADODB.Recordset")
With cmd
	Set .ActiveConnection=oConn
	.CommandText = "SP_BR_BOAT_GET"
	.CommandType=adCmdStoredProc
	.Parameters(1)=request.Form("hdnBoatID")
	.Parameters(2)=request.Form("hdnMarinaID")
End With
rs.Open cmd


dim cmdF, rsF
set cmdF= Server.CreateObject("Adodb.command")
Set rsF=Server.CreateObject("ADODB.Recordset")
with cmdF
set .Activeconnection=oConn
.Commandtext="SP_BR_IMAGE_OTHERS_LIST"
.CommandType=adCmdStoredProc
.Parameters(1)=request.Form("hdnMarinaID")
.Parameters(2)=request.Form("hdnBoatID")
end with
rsF.cursortype = 3
rsF.cursorlocation = 3
rsF.open cmdF






%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />



<script language="JavaScript">

function areaMap(zipcode)
{


window.open("http://www.google.com/maps?q=" +zipcode +"&sa=X&oi=map&ct=title","_blank", "height=800,width=900,status=yes,toolbar=no,menubar=no,location=no");



}


function ViewVideo(filename,desc,name)
{
  
  window.open("./ViewVideo.asp?filename=" + filename, "_blank", "height=400,width=400,status=no,toolbar=no,menubar=no,location=no");
  
 // window.open("./boats/" + filename, "_blank", "height=400,width=400,status=no,toolbar=no,menubar=no,location=no");
  
  
  
}


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


function colocar(day,month,year) {
		var dia = new String(day);
		if (dia.length < 2) dia = "0" + dia;

		var mes = new String(month);
		if (mes.length < 2) mes = "0" + mes;
		var anio = new String(year);

	document.frm_boat.txt_date1.value=mes + "/" + dia + "/" + anio;
	document.frm_boat.txt_date1_day.value=day;
	document.frm_boat.txt_date1_month.value=month;
	document.frm_boat.txt_date1_year.value=year;
	document.frm_boat.txt_date2.value=mes + "/" + dia + "/" + anio;
    document.frm_boat.txt_date1_old.value=dia + "/" + mes + "/" + anio;
	document.frm_boat.txt_date2_old.value=dia + "/" + mes + "/" + anio;
	document.frm_boat.action="calendar2.asp";
	document.frm_boat.submit();

}


</script>

</head>
<body>
<form name="frm_boat" method="post">
<input type="hidden" name="hdnBoatID"  id="hdnBoatID" value="<%=request.Form("hdnBoatID")%>">
<input type="hidden" name="hdnMarinaID" id="hdnMarinaID" value="<%=request.Form("hdnMarinaID")%>">
<input type="hidden" name="cmb_boat"  id="cmb_boat">
<input type="hidden" name="cmb_country" id="cmb_country">
<input type="hidden" name="cmb_body" id="cmb_body">
<input type="hidden" name="cmb_facility" id="cmb_facility">
<input type="hidden" name="cmb_state" id="cmb_state">
<input type="hidden" name="cmb_zip"  id="cmb_zip">
<input type="hidden" name="txt_date1" id="txt_date1">
<input type="hidden" name="txt_date2" id="txt_date2">
<input type="hidden" name="txt_date1_day">
<input type="hidden" name="txt_date1_month">
<input type="hidden" name="txt_date1_year">
<input type="hidden" name="txt_date1_old">
<input type="hidden" name="txt_date2_old">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
				<li id="current"><a href="default.asp">Home</a></li>
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
				<!--li><a href="javascript:QuickSearch(13)">Houseboat</a></li-->
			</ul>
		</div>
		<div id="sub_menu"></div>
		<div class="calendar_boatimage">
			<img name="mainboatpic" src="boats/<%=rs("vc_filename")%>" alt="<%=rs("vc_nombre")%>" width="373" height="216"/>
		    <input type="hidden" name="hpicmain" value="boats/<%=rs("vc_filename")%>" >
		    <iframe marginheight="0" marginwidth="0" scrolling="auto" name="f_morePic" width="390" height="108" src="picscroll.asp?hdnBoat=<%=rs("in_boatID")%>&hdnMarina=<%=rs("in_marinaID")%>"> 
			</iframe>
		</div>
				
		
		
			<% if (rs("ch_feeType") = 3) then %>
				<div class="calendar_calendardiv">
			
			<div align=center>
					<h4><br><br>
			
					  <%=rs("StateName")%>
					<%if not rs("vc_city")="" then%>&nbsp;-&nbsp;<%=rs("vc_city")%><%end if%> 
					<%if not rs("ch_zip")="" then%>&nbsp;-&nbsp;<%=rs("ch_zip")%><%end if%>
					<br>
					<br>
					<%if not rs("vc_bodywater")="" then%>&nbsp;&nbsp;<%=rs("vc_bodywater")%><%end if%>
					 <br>
					 <br>
					 </h4>
					 <button onmouseover="this.style.cursor='hand'" style="width:300;height:72;font:bold 20px Arial;color: red" onclick="javascript:window.open('http://<%= rs("displayAdLandingPage") %>')"   >MORE INFORMATION </button>
											
			</div>
		
	
		
			
			
			<% else %>
		
		
		
		
			<div class="calendar_calendardiv" style="float:right;position:absolute; left:510px; top:130px">
				
					<!--	<div style="float: left;"> -->
					
						<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
									 <iframe marginheight="0" marginwidth="0" name="i_calendar"   src="calendar_i.asp?hdnBoat=<%=rs("in_boatID")%>&hdnMarina=<%=rs("in_marinaID")%>" frameborder="0" scrolling="no" height="165" width="205"></iframe>
									</td>
									<td>
										<br>
										&nbsp;&nbsp;
									<img src="images/booknow.gif"  onclick="javascript:colocar(<%=Day(Date())%>,<%=Month(Date())%>,<%=Year(Date())%>)" onmouseover="style.cursor='hand'"/>
										<br>Click on 
										your desired date
			
					
				
					
						<!--	</div> -->
			
			
						<span id="calendar_dates_available">Green = Available</span><br>
						<span id="calendar_dates_partially_available">Orange = 1/2 Day</span>
                
							<h5 style="text-align: center">1-888-610-BOAT (2628)</h5>
				
				
							</td>
										
							</tr>
							</table>
				
				
			
						<%  Dim cmdP, rsP
								Set cmdP=Server.CreateObject("ADODB.Command")
								Set rsP=Server.CreateObject("ADODB.Recordset")
								With cmdP
									Set .ActiveConnection=oConn
									.CommandText = "SP_BR_PRICExBOATxTYPERENT_LIST"
									.CommandType=adCmdStoredProc
									.Parameters(1)=rs("in_boatID")
									.Parameters(2)=rs("in_marinaID")
								End With
								rsP.Open cmdP %>
							
		
				<table border="1" cellspacing="0" cellpadding="0" align="center">
					
							<% 
							
							i =0
							
							
							do until rsP.eof 
							
							if  (i=0) then
							
							%>
							
							<tr>
							<td>
							</td>
							
							<td>
							
							Weekday</td>
							<td>
							
							Weekend</td>
							<td>
							Holiday	</td>
							<td>
							Hours
							</td>
							
							</tr>
							
							
							<%
							end if
							i=i+1
							
							%>
								<tr>
									<td>
									<%=rsP("vc_description")%>&nbsp;price:
									</td>
									<td>
										<%if CDBL(rsP("nu_precioDayWeek"))>0.00 then%>$<%=rsP("nu_precioDayWeek")%>&nbsp;&nbsp;<%end if%>
									</td>
									<td>
										<%if CDBL(rsP("nu_precioDayWeekend"))>0.00 then%>$<%=rsP("nu_precioDayWeekend")%>&nbsp;&nbsp;<%end if%>
									</td>
									<td>
										<%if CDBL(rsP("nu_precioHolyday"))>0.00 then%>$<%=rsP("nu_precioHolyday")%><%end if%>
									</td>
									<td>
									<%if rsP("hours_from") <> "" then%><%=rsP("hours_from")%> <% end if
									
									if  rsP("hours_to") <> "" then %> TO <%=rsP("hours_to")%>
									
									<% end if %>
									</td>
									
								</tr>
							<% rsP.MoveNext
							   loop %>
							<% rsP.close
							   set rsP = nothing %>
                
                </table>
              
			
		</div>


    <!----         </div>  ---->
    
    
    

		
	
                
                
        
			
		
		
		<% end if %>	
		
		
	
	
	
	
		<div style="position:absolute;top:420px;left:120px;">
	
				<table cellpadding="0" cellspacing="0" border="0" width="800">
						
						
						<%  dim cmdF2, rsF2
						set cmdF2= Server.CreateObject("Adodb.command")
						Set rsF2=Server.CreateObject("ADODB.Recordset")
						with cmdF2
						set .Activeconnection=oConn
						.Commandtext="SP_BR_IMAGE_OTHERS_LIST"
						.CommandType=adCmdStoredProc
						.Parameters(1)=request.Form("hdnMarinaID")
						.Parameters(2)=request.Form("hdnBoatID")
						set rsF2= .execute()
						end with %>
						
						
						<%  dim cmdVideo, rsVideo
						set cmdVideo= Server.CreateObject("Adodb.command")
						Set rsVideo=Server.CreateObject("ADODB.Recordset")
						with cmdVideo
						set .Activeconnection=oConn
						.Commandtext="SP_BR_VIDEO_LIST"
						.CommandType=adCmdStoredProc
						.Parameters(1)=request.Form("hdnMarinaID")
						.Parameters(2)=request.Form("hdnBoatID")
						set rsVideo= .execute()
						end with %>
						
						
						<tr>
						
						<td align="left" width="900"  colspan=2>
						
						Boat # : <%= request.Form("hdnBoatID") %>  &nbsp;&nbsp;&nbsp;&nbsp;
						
							<%for i=1 to request.form("hdnRating") %>
															     <img src="images/staryellow.gif" width="20" height="20" />
													    <%next%>
						<%for i=1 to 5-request.form("hdnRating") %>
													     <img src="images/starwhite.gif" width="20" height="20" />
													    <%next%>
						</td>			
						</tr>
					
								
						<tr>
							<td width="900" >&nbsp;&nbsp;<%=rs("StateName")%>
								<%if not rs("vc_city")="" then%>&nbsp;-&nbsp;<%=rs("vc_city")%><%end if%>
								<%if not rs("ch_zip")="" then%>&nbsp;-&nbsp;<%=rs("ch_zip")%><%end if%>
								<%if not rs("vc_bodywater")="" then%>&nbsp;-&nbsp;<%=rs("vc_bodywater")%><%end if%>
							
							<div id="area_map" align="left">
							
							<input type="button" value="AREA MAP" onclick="javascript:areaMap('<%=rs("ch_zip")%>')">
							
							<% if not rsVideo.eof then %>
							
							&nbsp;&nbsp; <input type="button" value="See Boat Video" onclick="javascript:ViewVideo('<%=rsVideo("vc_filename")%>','<%=rsVideo("vc_description")%>','<%=rsVideo("vc_nombre")%>')" >
							
							<%
							end if 
							%>
							
							</div>
						
							
							</td>
							
						</tr>
						
						
						
			</table>	
		
		
		<div>
		
		
	
		
		
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
								<td class="boatcat_detail"><%=rs("vc_name")%></td>
							</tr>
							<tr>
								<td class="boatcat_title">Make:</td>
								<td class="boatcat_detail"><%=rs("vc_make")%></td>
							</tr>
							<tr>
								<td class="boatcat_title">Model:</td>
								<td class="boatcat_detail"><%=rs("vc_model")%></td>
							</tr>
							<tr>
								<td class="boatcat_title">Length:</td>
								<td class="boatcat_detail"><%=rs("vc_size")%></td>
							</tr>
							<tr>
								<td class="boatcat_title">Passengers:</td>
								<td class="boatcat_detail"><%=rs("in_maxPassengers")%></td>
							</tr>
							
							
							<%  
							
							if rs("Is_boat_sale") = 1 then %>
							
							<tr>
							
								<td class="boatcat_title">This Boat is for Sale:</td>
								<td class="boatcat_detail">$<%=rs("boat_sale_amount")%></td>
							
							</tr>
							
							<%end if %>
							
							
							<tr>
								<td class="boatcat_title">Captain&nbsp;or&nbsp;Guide Available&nbsp;for&nbsp;Hire:</td>
								<td class="boatcat_detail"><%if rs("ti_captain")=1 then%>Yes<%else%>No<%end if%></td>
							</tr>
							<tr>
								<td class="boatcat_title" valign="top">Description:</td>
								<td class="boatcat_detail"><%=rs("vc_description")%></td>
							</tr>
							<tr>
								<td class="boatcat_title" valign="top">Facility Area & Attractions:</td>
								<td class="boatcat_detail"><%=rs("vc_facilityArea")%></td>
							</tr>
							
						
						</table>
						
						
					</td>
					
					
					
					
					<td valign="top"  bgcolor="F1F5F5">
						<table class="boatdetails_table" cellpadding="0" cellspacing="0" width="370" border="0">
							<tr>
								<th colspan="2" bgcolor="white">Rental Details</th>
							</tr>
							<tr>
								<td style="width: 153px" class="boatcat_title">Requirements:</td>
								<td style="width: 217px" class="rentdetails"><%=rs("vc_requirements")%></td>
							</tr>
							
							<tr>
								<td class="boatcat_title">Facility #</td>
								<td class="rentdetails"><%=rs("in_marinaID")%> </td>
							
							 </tr>
							 
							 <tr>
								<td class="boatcat_title">More From this Facility</td>
								<td class="rentdetails">
								
								<input type="button" value="search" onclick="document.location.href='./facility.asp?id=<%=rs("in_marinaID")%>'" id=button1 name=button1>
								
								</td>
							
							 </tr>
						
							<tr>
								<td class="boatcat_title">Tax Rates:</td>
								<td class="rentdetails"><%=rs("nu_tax")%> %</td>
							</tr>
							<tr>
								<td class="boatcat_title">Reservation&nbsp;Deposit:</td>
								<td class="rentdetails"><%=rs("nu_reservation")%></td>
							</tr>
							<tr>
								<td class="boatcat_title">Security Deposit:</td>
								<td class="rentdetails"><%=rs("nu_deposit")%></td>
							</tr>
							<tr>
								<td class="boatcat_title" valign="top">Facility&nbsp;Cancellation&nbsp;Policy:</td>
								<td class="rentdetails"><%=rs("vc_depositPolicy")%></td>
							</tr>
							<tr>
								<td colspan="2" align="right"><font size="1" face="Arial"><br>
                                &nbsp;</font></td>
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
window.open('morepics.asp?marina=<%=request.Form("hdnMarinaID")%>&boat=<%=request.Form("hdnBoatID")%>','morePics','width=383,height=200,location=0');
}

function QuickSearch(x){
	document.frm_boat.cmb_boat.value = x;
	document.frm_boat.cmb_country.value = 0;
	document.frm_boat.cmb_body.value = 0;
	document.frm_boat.cmb_facility.value = 0;
	document.frm_boat.cmb_state.value = 0;
	document.frm_boat.cmb_zip.value = 0;
	document.frm_boat.action = "results.asp";
	document.frm_boat.submit();
}

</script>

<script src="http://www.google-analytics.com/urchin.js" type="text/java_script">
</script>
<script type="text/java_script">
_uacct = "UA-872206-1";
urchinTracker();
</script>

</html>