<%@ Page language="C#" CodeFile="notes_mant.aspx.cs" Inherits="BoatRenting.notes_mant_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    if (!IsPostBack)
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        txt_marinaID = Request["MarinaID"];
        hdn_Redirect = Request["hdn_Redirect"];
        Session.Add("MarinaID", txt_marinaID);
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_MARINA_GET";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = txt_marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_marinaID);
        rs = cmd.Execute();
        txt_ContactName = NVL(rs.Fields["vc_ContactName"].Value, "");
        txt_BusinessName = NVL(rs.Fields["vc_BusinessName"].Value, "");
        txt_MarinaName = NVL(rs.Fields["vc_MarinaName"].Value, "");
        txt_addressLine1 = NVL(rs.Fields["vc_addressLine1"].Value, "");
        txt_city = NVL(rs.Fields["vc_city"].Value, "");
        txt_phone = NVL(rs.Fields["vc_phone"].Value, "");
        txta_notes = NVL(rs.Fields["vc_notes"].Value, "");
    }
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
function Save() {
	document.frm_facilities_mant.action="notes_save.aspx";
	document.frm_facilities_mant.submit();
}

function Cancel() {
  //	document.frm_facilities_mant.action="facilities_list.aspx";
  //	document.frm_facilities_mant.submit();
 history.go(-1);
}

function LogOut() {
  	document.frm_facilities_mant.action="logout.aspx";
  	document.frm_facilities_mant.submit();
}

</script>
<body>
    <form id="form1" runat="server">
<input type="hidden" name="hdnPag" value="<%= nPag %>">
<input type="hidden" name="hdn_MarinaID" value="<%= txt_marinaID %>">
<input type="hidden" name="hdn_Redirect" value="<%= hdn_Redirect %>">
	<div id="container">
		<div id="banner"></div>
		<!--div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="FACILITIES_SEARCH.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="users_list.aspx">Add User</a>
		</div-->
		<div id="menu">
			<ul>
                <%
    if (Request["hdn_Redirect"] == "")
    {
%>
			<li id="current"><a href="FACILITIES_List.aspx">Facility</a></li>
			<li><a href="users_list.aspx">Add User</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
<%
    }
    else
    {
        if (Convert.ToDouble(Session["userLevelID"]) != 2.0)
        {
%>
					<li id="current"><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
					<li ><a href="boats_list.aspx">Boat List</a></li>
<%
        }
%>
				<li><a href="calendar.aspx">Calendar</a></li>

				<li><a href="boats_list_reservation.ASP">New Reservation</a></li>
				<li><a href="javascript:LogOut();">Log Out</a></li>
<%
    }
%>
			</ul>
		</div>
		<div id="sub_menu">&nbsp;</div>
			<div id="table_div">
				<table id="facility_table" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="4">
						 Facility Notes
						</th>
					</tr>
					<tr>
						<td class="align_right" height="5"></td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="align_right">Contact Name:</td>
						<td colspan="3"><%= txt_ContactName %></td>
					</tr>
					<tr>
						<td class="align_right">Facilities Name:</td>
						<td colspan="3"><%= txt_BusinessName %></td>
					</tr>
					<tr>
						<td class="align_right">Marina Name:</td>
						<td colspan="3"><%= txt_MarinaName %></td>
					</tr>
					<tr>
						<td class="align_right">Address:</td>
						<td colspan="3"><%= txt_addressLine1 %></td>
					</tr>
					<tr>
						<td class="align_right">City/Region:</td>
						<td colspan="3"><%= txt_city %></td>
					</tr>
					<tr>
						<td class="align_right">Phone:</td>
						<td colspan="3"><%= txt_phone %></td>
					</tr>
					<tr>
						<td class="align_right" height="5"></td>
						<td colspan="3"></td>
					</tr>					
					<tr>
					  <td class="align_top_right">Notes:</td>
					  <td colspan="3"><textarea name="txta_notes" cols="60" rows="10" id="txta_notes" style="font-size:12px; font-face:Arial"><%= txta_notes %></textarea></td>
					</tr>					
					<tr>
					  <td class="align_top_right">&nbsp;</td>
					  <td colspan="3">&nbsp;</td>
				  </tr>
				</table>
				<div><span class="hilite">*</span>
				 <span class="hilite_explain">Required fields</span></div>
	            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                    BackColor="#6699CC" ForeColor="White" Height="20px" Width="60px" />

	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" 
                    BackColor="#6699CC" ForeColor="White" Height="20px" Width="60px" />
	

                <br />
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
