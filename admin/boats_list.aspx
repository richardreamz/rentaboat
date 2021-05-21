<%@ Page language="C#" CodeFile="boats_list.aspx.cs" Inherits="BoatRenting.boats_list_aspx_cs" %>
<%@ Import Namespace = "nce.adoole" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
   
<!--#include file="__functions.aspx"-->
<%
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
    Session.Timeout = 1440;
    
    //if (Request.Form["hdnPag"] == "")
    if (Convert.ToInt32(Request.Form["hdnPag"]) == 0)
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
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";</style>

<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>


<script language="javascript">
function Previous() {

	document.frm_boats_list.hdnPag.value=eval(document.frm_boats_list.hdnPag.value)-1;
  	document.frm_boats_list.action="boats_list.aspx";
  	document.frm_boats_list.submit();

}
function Next() {

	document.frm_boats_list.hdnPag.value=eval(document.frm_boats_list.hdnPag.value)+1;
  	document.frm_boats_list.action="boats_list.aspx";
  	document.frm_boats_list.submit();

}

function Edit(BoatID) {
	document.frm_boats_list.hdn_Action.value="E";
  	document.frm_boats_list.action="boats_mant.aspx?BoatID=" + BoatID ;
  	document.frm_boats_list.submit();

}

function Prev(BoatID) {
	document.frm_boats_list.hdn_Action.value="E";
  	document.frm_boats_list.action="boats_pre_mant.aspx?BoatID=" + BoatID ;
  	document.frm_boats_list.submit();

}

function Acti(BoatID) {
	document.frm_boats_list.hdn_Action.value="E";
  	document.frm_boats_list.action="boats_activate.aspx?BoatID=" + BoatID ;
  	document.frm_boats_list.submit();

}

function Delete(nCount){

if (confirm("Confirm Action !  \n \n Claims selected will be deleted, are you sure to perform this task") )
{
	numMarks = 0;
	if (nCount == 1){
		if (document.frm_boats_list.checkList.checked){
			numMarks = 1;
			document.frm_boats_list.txtDelete.value = document.frm_boats_list.checkList.value + "-";
		}
	}
	else if (nCount > 1){
		numChecks = document.frm_boats_list.checkList.length;

		for(i=0; i<numChecks; i++){
			if (document.frm_boats_list.checkList[i].checked){
				numMarks  = numMarks + 1;
				//alert(document.frm_boats_list.checkList[i].value);
				document.frm_boats_list.txtDelete.value = document.frm_boats_list.txtDelete.value + document.frm_boats_list.checkList[i].value + "-" ;
			}
		}
	}

	if (numMarks == 0){
		alert("Choose a record to delete");
	}
	else{
  		document.frm_boats_list.action="boats_delete.aspx" ;
  		document.frm_boats_list.submit();
  	}
 }
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

function Inactivate(nCount){

if (confirm("Confirm Action !  \n \n Claims selected will be inactivated, are you sure to perform this task") )
{
	numMarks = 0;
	if (nCount == 1){
		if (document.frm_boats_list.checkActive.checked){
			numMarks = 1;
			document.frm_boats_list.txtInactivate.value = document.frm_boats_list.checkActive.value + "-";
		}
	}
	else if (nCount > 1){
		numChecks = document.frm_boats_list.checkActive.length;

		for(i=0; i<numChecks; i++){
			if (document.frm_boats_list.checkActive[i].checked){
				numMarks  = numMarks + 1;
				//alert(document.frm_boats_list.checkList[i].value);
				document.frm_boats_list.txtInactivate.value = document.frm_boats_list.txtInactivate.value + document.frm_boats_list.checkActive[i].value + "-" ;
			}
		}
	}

	if (numMarks == 0){
		alert("Choose a record to inactivate");
	}
	else{
  		document.frm_boats_list.action="boats_inactivate.aspx" ;
  		document.frm_boats_list.submit();
  	}
 }
}


function New() {
	document.frm_boats_list.hdn_Action.value="N";
  	document.frm_boats_list.action="boats_mant.aspx" ;
  	document.frm_boats_list.submit();
}

function LogOut() {
  	document.frm_boats_list.action="logout.aspx";
  	document.frm_boats_list.submit();
}

function ShowHelp(opt){
if (opt==1){
text='When your boat is active it is rentable. When not active (Inactive) it will not show up on our web site. Keep in mind that this does not delete your boat, but shows when it is not working or out of service.'
}
window.open('../help.aspx?text='+text, 'help'+opt, 'scrollbars=no,height=220,width=300,status=no');
}

</script>
<body>
<FORM name="frm_boats_list" method="POST">
<input type="hidden" name="hdnPag" value="<%= nPag %>">
<input type="hidden" name="hdn_Action" value="E">

<input type="hidden" name="txtDelete" value="">
<input type="hidden" name="txtInactivate" value="">
<input type="hidden" name="hdnOrder" value="<%= nOrder %>">
<input type="hidden" name="hdnWay" value="<%= nWay %>">

<input type="hidden" name="txt_Name" value="<%= txt_Name %>">
<input type="hidden" name="txt_Description" value="<%= txt_Description %>">
<input type="hidden" name="txt_Make " value="<%= txt_Make %>">
<input type="hidden" name="txt_Model " value="<%= txt_Model %>">
<input type="hidden" name="txt_size " value="<%= txt_size %>">
<input type="hidden" name="txt_city " value="<%= txt_city %>">
<input type="hidden" name="cbo_State " value="<%= cbo_State %>">
<input type="hidden" name="cbo_Country " value="<%= cbo_Country %>">
<input type="hidden" name="cbo_BoatType  " value="<%= cbo_BoatType %>">

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
			<li ><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li><a href="users_list.aspx">Add User</a></li>	
			<li id="current"><a href="boats_list.aspx">Boat List</a></li>
			<li><a href="calendar.aspx">Calendar</a></li>
			<li><a href="boats_list_reservation.aspx">New Reservation</a></li>
			<li><a href="boats_list_reports.aspx">Reports</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu"><h1 style="font-size:8pt">Facility Boat Listings</h1></div>
			<div id="table_div">
				<b><font size="2"  face="Verdana, Arial, Helvetica, sans-serif">
					 Welcome  <%= Session["BusinessName"] %> Marina</font></b>
				<h1>Boat List</h1>
				<table  class="list_table" cellpadding="0" cellspacing="0">
<%
    nLinea = 1;
    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOAT_LIST";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_marinaID"].Value = Session["MarinaID"];
    //cmd.Parameters[2] = txt_Name;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_NANE", adVarChar, adParamInput, 50, 0));
    cmd.Parameters["@P_VC_NAME"].Value = txt_Name;
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
			 <th ></th>
			  <th colspan="11">
				<b>
				 Displaying
			      Results  <%= ((nPag - 1) * 20) + 1 %>-<%= ((nPag - 1) * 20) + nContador %> of <%= nTotal %>
				 </b>

			  	</th>
				  </tr>
					<tr >
						<th class="box">&nbsp;&nbsp;&nbsp;</th>
						<th align="right">Inactive&nbsp;<a href="javascript:ShowHelp(1);"><img src="../images/help.png" border="0" alt="Help!"></a></th>
						<th align="left"></th>
						<th>Name</th>
						<th>Make</th>
						<th>Model</th>
						<th>Size</th>
						<th>Boat Type</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<!--th>&nbsp;</th-->
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
				<tr class="<%= sColor %>" >
				<td class="box" ><input type="checkbox"  name="checkList" value="<%= rs.Fields["in_boatID"].Value %>" ></td>
				<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox"  name="checkActive" value="<%= rs.Fields["in_boatID"].Value %>" <%
        if (Convert.ToInt32(rs.Fields["ti_actived"].Value) == 0)
        {
%>
checked<%
        }
%>
 ></td>
				<td  ><%= rs.Fields["vc_Name"].Value %></td>
				<td  ><%= rs.Fields["vc_Make"].Value %></td>
				<td  ><%= rs.Fields["vc_Model"].Value %></td>
				<td  ><%= rs.Fields["vc_size"].Value %></td>
				<td  > <%= rs.Fields["vc_BoatTypeDescription"].Value %></td>
				<td  ><a href="javascript:Edit(<%= rs.Fields["in_boatID"].Value %>);" >Edit</a></td>
				<td  ><a href="javascript:Acti(<%= rs.Fields["in_boatID"].Value %>);" >Activate</a></td>
				<td  ><a href="javascript:Prev(<%= rs.Fields["in_boatID"].Value %>);" >Preview</a></td>
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
		<a href="javascript:Delete(<%= nContador %>);" class="button">Remove Boat</a>
		<a href="javascript:Inactivate(<%= nContador %>);" class="button">Deactivate Boat</a>
		<a href="javascript:New();" class="button">Add New Boat</a>
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
