<%@ Page language="C#" CodeFile="boats_list_reservation.aspx.cs" Inherits="BoatRenting.boats_list_reservation_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"><%
    if (Request.Form["hdnPag"] == "" || Convert.ToInt32(Request.Form["hdnPag"]) == 0)
    {
        nPag = 1;
    }
    else
    {
        nPag = Convert.ToInt32(Request.Form["hdnPag"]);
    }
    nRegistros = 20;
    if (Request.Form["hdnOrder"] == "")
    {
        nOrder = 4;
    }
    else
    {
        nOrder = Convert.ToInt32(Request.Form["hdnOrder"]);
    }
    if (Request.Form["hdnWay"] == "")
    {
        nWay = 2;
    }
    else
    {
        nWay = Convert.ToInt32(Request.Form["hdnWay"]);
    }
    txt_Name = NVL(Request.Form["txt_Name"], "");
    txt_Description = NVL(Request.Form["txt_Description"], "");
    txt_Make = NVL(Request.Form["txt_Make"], "");
    txt_Model = NVL(Request.Form["txt_Model"], "");
    txt_size = NVL(Request.Form["txt_size"], "");
    txt_city = NVL(Request.Form["txt_city"], "");
    cbo_State = NVL(Request.Form["cbo_State"], "0");
    cbo_Country = NVL(Request.Form["cbo_Country"], "0");
    cbo_BoatType = NVL(Request.Form["cbo_BoatType"], "0");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";</style>

<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>


<script type="text/javascript">
function Previous() {

	document.frm_boats_list.hdnPag.value=eval(document.frm_boats_list.hdnPag.value)-1;
  	document.frm_boats_list.action="boats_list_reservation.aspx";
  	document.frm_boats_list.submit();

}
function Next() {

	document.frm_boats_list.hdnPag.value=eval(document.frm_boats_list.hdnPag.value)+1;
  	document.frm_boats_list.action="boats_list_reservation.aspx";
  	document.frm_boats_list.submit();

}

function Edit(BoatID) {
	document.frm_boats_list.hdn_Action.value="E";
	document.frm_boats_list.hdnBoatID.value = BoatID;
   

  	document.frm_boats_list.action="CalendarAdmin.aspx?bid="+BoatID ;
  	document.frm_boats_list.submit();

}



function Order(x) {
    document.frm_boats_list.hdnOrder.value=x;
	if (document.frm_boats_list.hdnWay.value==1)
	{document.frm_boats_list.hdnWay.value=2;}
	else
	{document.frm_boats_list.hdnWay.value=1;}

  	document.frm_boats_list.action="boats_list.aspx";
  	document.frm_boats_list.submit();
}



function LogOut() {
  	document.frm_boats_list.action="logout.aspx";
  	document.frm_boats_list.submit();
}

</script>
<body>
<form name="frm_boats_list" method="POST">
<input type="hidden" name="hdnPag" value="<%= nPag %>" />
<input type="hidden" name="hdn_Action" value="E" />
<input type="hidden" name="hdnBoatID" value="" />
<input type="hidden" name="txtDelete" value="" />
<input type="hidden" name="hdnOrder" value="<%= nOrder %>" />
<input type="hidden" name="hdnWay" value="<%= nWay %>" />

<input type="hidden" name="txt_Name" value="<%= txt_Name %>" />
<input type="hidden" name="txt_Description" value="<%= txt_Description %>" />
<input type="hidden" name="txt_Make " value="<%= txt_Make %>" />
<input type="hidden" name="txt_Model " value="<%= txt_Model %>" />
<input type="hidden" name="txt_size " value="<%= txt_size %>" />
<input type="hidden" name="txt_city " value="<%= txt_city %>" />
<input type="hidden" name="cbo_State " value="<%= cbo_State %>" />
<input type="hidden" name="cbo_Country " value="<%= cbo_Country %>" />
<input type="hidden" name="cbo_BoatType  " value="<%= cbo_BoatType %>" />

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
			<li><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li><a href="users_list.aspx">Add User</a></li>	
			<li><a href="boats_list.aspx">Boat List</a></li>
<%
    }
%>
			<li><a href="calendar.aspx">Calendar</a></li>
			<li id="current"><a href="boats_list_reservation.ASP">New Reservation</a></li>
			<li><a href="boats_list_reports.ASP">Reports</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu"><h1 style="font-size:8pt">New Reservation</h1></div>
			<div id="table_div">
			   <b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
					 Welcome  <%= Session["BusinessName"] %> Marina</font></b>
				<h1>Boat List</h1>
				<table class="list_table" cellpadding="0" cellspacing="0">
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
    cmd.CommandText = "SP_BR_BOAT_RESERVATION_LIST";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MarinaID"].Value = Session["MarinaID"];
    //cmd.Parameters[2] = txt_Name;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Name", adVarChar, adParamInput, 50, 0));
    cmd.Parameters["@P_VC_Name"].Value = txt_Name;
    //cmd.Parameters[3] = txt_Description;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_DESCRIPTION", adVarChar, adParamInput, 255, 0));
    cmd.Parameters["@P_VC_DESCRIPTION"].Value = txt_Description;
    //cmd.Parameters[4] = txt_Make;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MAKE", adVarChar, adParamInput, 50, 0));
    cmd.Parameters["@P_VC_MAKE"].Value = txt_Make;
    //cmd.Parameters[5] = txt_Model;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MODEL", adVarChar, adParamInput, 50, 0));
    cmd.Parameters["@P_VC_MODEL"].Value = txt_Model;
    //cmd.Parameters[6] = txt_size;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_SIZE", adVarChar, adParamInput, 50, 0));
    cmd.Parameters["@P_VC_SIZE"].Value = txt_size;
    //cmd.Parameters[7] = txt_city;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_CITY", adVarChar, adParamInput, 50, 0));
    cmd.Parameters["@P_VC_CITY"].Value = txt_city;
    //cmd.Parameters[8] = cbo_State;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_STATEID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_STATEID"].Value = cbo_State;
    //cmd.Parameters[9] = cbo_Country;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_COUNTRYID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_COUNTRYID"].Value = cbo_Country;
    //cmd.Parameters[10] = cbo_BoatType;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BOATTYPEID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_BOATTYPEID"].Value = cbo_BoatType;
    rs.CursorType = (nce.adodb.CursorType)3;
    rs.CursorLocation = (nce.adodb.CursorLocation)3;
    rs.Open(cmd);
    if (!(rs.Eof))
    {
        rs.PageSize = nRegistros;
        rs.AbsolutePage = nPag;
        nTotal = rs.RecordCount;
    }
    nContador = 0;
    while((!(rs.Eof)) && (nContador < nRegistros))
    {
        nContador = nContador + 1;
        rs.MoveNext();
    }
%>
				<tr>
			 <th></th>
			  <th colspan="7">
				<b>Select Boat to Adjust
				 <!--Displaying
			      Results  <%= ((nPag - 1) * 20) + 1 %>-<%= ((nPag - 1) * 20) + nContador %> of <%= nTotal %>-->
				 </b>

			  	</th>
				  </tr>
					<tr>
						<th class="box">&nbsp;&nbsp;&nbsp;</th>
						<!--th >&nbsp;</th-->
						<th>Name</th>
						<th>Make</th>
						<th>Model</th>
						<th>Size</th>
						<th>Boat Type</th>
						<!--th>&nbsp;</th>
						<th>&nbsp;</th-->						<!--th>&nbsp;</th>
						<th>&nbsp;</th-->
					</tr>
<%
    if (nContador > 0)
    {
        nContador = 0;
        rs.PageSize = nRegistros;
        rs.AbsolutePage = nPag;
    }
    while((!(rs.Eof)) && (nContador < nRegistros))
    {
        nContador = nContador + 1;
        if (nLinea == 1)
        {
            //sColor = "#FBFBF9"
            sColor = "";
            nLinea = 0;
        }
        else
        {
            sColor = "bluerow";
            nLinea = 1;
        }
%>
				<tr class="<%= sColor %>">
				<td class="box"><!--<input type="checkbox"  name="checkList" value="<%
        //=rs("in_boatID")
%>
" >--></td>
				<td>
                    <a href="javascript:Edit(<%= rs.Fields["in_boatID"].Value %>);"><%= rs.Fields["vc_Name"].Value %></a>
                   
                   				</td>
				<td><%= rs.Fields["vc_Make"].Value %></td>
				<td><%= rs.Fields["vc_Model"].Value %></td>
				<td><%= rs.Fields["vc_size"].Value %></td>
				<td> <%= rs.Fields["vc_BoatTypeDescription"].Value %></td>
				<!--td  ><a href="javascript:Edit(<%= rs.Fields["in_boatID"].Value %>);" >Edit</a></td-->
				<!--td  ><a href="javascript:Prev(<%= rs.Fields["in_boatID"].Value %>);" >Preview</a></td-->
				<!--td  ><%
        //=rs("vc_city")
%>
</td>
				<td  ><%
        //=rs("vc_stateName")
%>
</td>
				<td  ><%
        //=rs("vc_CountryName")
%>
</td>
				<td  ><%
        //=rs("in_MaxPassengers")
%>
</td>
				<td  ><%
        //=rs("vc_Requirements")
%>
</td-->
				</tr>

<%
        rs.MoveNext();
    }
%>
				</table>
<%
    if (nPag > 1)
    {
%>

			     <a href="javascript:Previous()" class="button">Previous</a>

<%
    }
    if (rs.PageCount > nPag)
    {
%>
              <a href="javascript:Next()" class="button">Next</a>
<%
    }
%>
		
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
</html>