<%@ Page language="C#" CodeFile="returning_user.aspx.cs" Inherits="BoatRenting.returning_user_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
    //*************
    debugTEST_Kart = Convert.ToString(Session["Kart"]);
    debugTEST_clientID = Convert.ToString(Session["clientID"]);
    //*************

    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_CLIENT_LOGIN";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = Request.Form["txt_email"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_UserName", adVarChar, adParamInput, 100, 0));
    cmd.Parameters["@P_VC_UserName"].Value = Request.Form["txt_email"];
    //.Parameters(1)="jr@boatrenting.com"
    //.Parameters(2)=request.Form("txt_password")
    //cmd.Parameters[2] = "";
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Password", adVarChar, adParamInput, 30, 0));
    cmd.Parameters["@P_VC_Password"].Value = "";
    rs.Open(cmd);
    Session["clientID"] = ""; 
    Session["clientID"] = rs.Fields["in_clientID"].Value;
    if (rs.Eof)
    {
        Response.Redirect("users.aspx?ans=ko");
    }
    if (Request.Form["hdn_del"] == "1")
    {
        Delete();
    }
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>
<body>
    <form id="form1" runat="server">
<input type="hidden" name="hdn_del" value="0">
<input type="hidden" name="txt_email" value="<%= Request.Form["txt_email"] %>">
<input type="hidden" name="txt_password" value="<%= Request.Form["txt_password"] %>">
<input type="hidden" name="cmb_boat">
<input type="hidden" name="cmb_country">
<input type="hidden" name="cmb_body">
<input type="hidden" name="cmb_facility">
<input type="hidden" name="cmb_state">
<input type="hidden" name="cmb_zip">
<input type="hidden" name="hdn_clientID">
<input type="hidden" name="hdn_session">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
				<li id="current"><a href="default.aspx">Home</a></li>
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
			</ul>
		</div>
		<div id="sub_menu"></div>
		<div id="returning_customers_summary">
			<div id="welcome_back">
				<h1>Welcome Back!</h1>
				<p><%= rs.Fields["FullName"].Value %><br/>
<%= rs.Fields["vc_address"].Value %><br/>
<%= rs.Fields["vc_city"].Value %>, <%= rs.Fields["vc_name"].Value %><br/>
<%= rs.Fields["vc_contactPhone"].Value %>
				</p>
			</div>
			<div id="order_summary" align="right">
				<h1 align="left">Order Summary:</h1>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				This online fee will be deducted off the rental price
				<table cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="3">Boat Description</th>
						<th>Type of Rental</th>
						<th>Occupied Days</th>
						<th>Online Fee</th>
					</tr>
<%
    cmd3 = new Command();
    rs3 = new Recordset();
    cmd3.ActiveConnection = oConn;
    cmd3.CommandText = "SP_BR_KART_LIST";
    cmd3.CommandType = adCmdStoredProc;
    //cmd3.Parameters[1] = Session["Kart"];
    cmd3.Parameters.Append(cmd.CreateParameter("@p_vc_sessionID", adVarChar, adParamInput, 100, 0));
    cmd3.Parameters["@p_vc_sessionID"].Value = Session["Kart"];
    rs3.Open(cmd3);
    if (rs3.Eof)
    {
        flgData = "0";
%>
						<tr>
							<td colspan="6" align="center">There are no Boats in your Shopping kart</td>
						</tr>
<%
    }
    else
    {
        flgData = "1";
        Cont = 0;
        while(!(rs3.Eof))
        {
            Cont = Cont + 1;
%>
					<tr>
						<td align="center"><input type="checkbox" name="chkElim<%= Cont %>" value="<%= rs3.Fields["in_kartID"].Value %>_<%= rs3.Fields["in_kartDetailID"].Value %>"></td>
						<td width="90"><img src="boats/<%= rs3.Fields["vc_filename"].Value %>" alt="<%= rs3.Fields["IDescrip"].Value %>" width="80" height="50"></td>
						<td width="280">
<%= rs3.Fields["vc_name"].Value %>:&nbsp;<%= rs3.Fields["vc_make"].Value %>&nbsp;<%= rs3.Fields["vc_model"].Value %><br>
						Length:&nbsp;<%= rs3.Fields["vc_size"].Value %>&nbsp;-&nbsp;Passengers:&nbsp;<%= rs3.Fields["in_maxPassengers"].Value %><br>
						Description:&nbsp;<%= rs3.Fields["Bdescrip"].Value %><br>
						Location:&nbsp;<%= rs3.Fields["CountryName"].Value %>&nbsp;-&nbsp;<%= rs3.Fields["StateName"].Value %>&nbsp;-&nbsp;<%= rs3.Fields["vc_city"].Value %><br>
<%= rs3.Fields["vc_bodywater"].Value %>
						</td>
						<td width="140"><%= rs3.Fields["Tdescrip"].Value %><%
            if (!(Convert.ToString(rs3.Fields["BEHour"].Value) == ""))
            {
%>
<br><%= rs3.Fields["BEHour"].Value %><%
            }
%>
</td>
						<td width="160">From: <%= rs3.Fields["Begindate"].Value %><br>
							To: <%= rs3.Fields["Enddate"].Value %></td>
						<td  width="80">
							
<%
            if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
            {
%>
								Price $<%= Strings.FormatNumber(rs3.Fields["nu_Price"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
                broker_fee = (Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0));
%>

								<br>
								Broker Fee $<%= Strings.FormatNumber(broker_fee, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
							      <br>
								Due at Facility $<%= Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)) - broker_fee, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
            }
            else
            {
%>
								$<%= Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
            }
%>

						</td>
					</tr>
<%
            rs3.MoveNext();
        }
        rs3.Close();
        rs3 = null;
    }
%>
				</table>
<%
    if (flgData == "1")
    {
%>
				<div style="height:20px;width:140px"><a href="javascript:RemoveBoat()" class="button">Remove selection</a>
				<input type="hidden" name="txtCount" value="<%= Cont %>"></div>
<%
    }
%>
			</div>
			<!--
			<a href="javascript:goBack()" class="button">&laquo; Go Back</a>
			-->
			
<%--			<a href="javascript:makeReservation()" class="button">Continue &raquo;</a><a href="javascript:RemoveBoat()" class="button">
--%>            <asp:Button 
                ID="Button1" runat="server" onclick="Button1_Click" Text="Continue" 
                BackColor="#FF9900" ForeColor="White" Height="19px" Width="95px" />
            </a>
				&nbsp;</div>
		<div id="footer">
			<div id="footer_details">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:Contact();">Contact Us</a>
			</div>
		</div>
	</div> <!-- Container Ends Here -->
    </form>
</body>
<script language="JavaScript">
function RemoveBoat()
{
var cont=frm_reserve.txtCount.value;
var xItem;
var i;
var checks=0;

	for(i=1;i<=cont;i+=1){
		xItem=eval('frm_reserve.chkElim'+i+';');
		if(xItem.checked) checks+=1
	}

	if (checks>0){
		if(confirm("Are you sure you want to remove the selected boat(s) from your Shopping kart?")){
			document.frm_reserve.hdn_del.value = "1";
			frm_reserve.action="returning_user.aspx";
			frm_reserve.submit();
		}
	}
	else{
		alert("Please, select the boat(s) you want to remove");
	}
}

function goBack(){
	window.history.back();
}

function makeReservation(){
	document.frm_reserve.hdn_clientID.value = <%= rs.Fields["in_clientID"].Value %>;
	document.frm_reserve.hdn_session.value = <%= Convert.ToString(Session["Kart"]) %>;
	
	//document.frm_reserve.action = "https://boatrenting.com/returning_user2.aspx";//s PRODUCTION
          returning_user2URL = "https://boatrenting.com/returning_user2.aspx";
          returning_user2URL = returning_user2URL + "?c=" + Convert.ToString(Session["clientID"]) + "&k=" + Convert.ToString(Session["Kart"]);
          Response.Redirect(returning_user2URL, true);// PRODUCTION
		//document.frm_reserve.action = "http://www.boatrenting.idserve.com/returning_user2.aspx";//s TEST ONLY
//document.frm_reserve.action = "http://localhost:50331/client.net/returning_user2.aspx";	//TEST ONLY
	
	document.frm_reserve.submit();
}

function QuickSearch(x){
	document.frm_reserve.cmb_boat.value = x;
	document.frm_reserve.cmb_country.value = 0;
	document.frm_reserve.cmb_body.value = 0;
	document.frm_reserve.cmb_facility.value = 0;
	document.frm_reserve.cmb_state.value = 0;
	document.frm_reserve.cmb_zip.value = 0;
	document.frm_reserve.action = "results.aspx";
	document.frm_reserve.submit();
}
function Contact(){
	document.frm_reserve.action = "contactus.aspx";
	document.frm_reserve.submit();
}

</script>
<script src="http://www.google-analytics.com/urchin.js" type="text/java_script">
</script>
<script type="text/java_script">
_uacct = "UA-872206-1";
urchinTracker();
</script>

<%
    rs.Close();
    rs = null;
%>
</html>
