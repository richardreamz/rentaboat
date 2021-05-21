<%@ Page Language="C#" AutoEventWireup="true" CodeFile="log_calendar.aspx.cs" Inherits="admin_log_calendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CALENDAR BOOKED BOATS</title>

    <style type="text/css" media="screen">@import "br_admin.css";</style>

    
         <style>
             .centered {
  position: absolute;
  left: 50%;
  margin-left: -100px;
}

         </style>
</head>
<body>
    <form id="form1" runat="server">
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
         <div>
             <table>
                 <tr style="background-color:#afe0cf;color:black;">
                     <td>
                         <asp:Label ID="lblShowingRecords" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>

                     </td>

                 </tr>
                 <tr>
                     <td>

                            <asp:GridView ID="gvBookedBoats" runat="server" AutoGenerateColumns="false" DataKeyNames="in_BookDateID" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvBookedBoats_SelectedIndexChanged">

                 <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                 <Columns>
                    
                      <asp:TemplateField HeaderText="Delete">
                         <ItemTemplate>
                             <asp:CheckBox ID="chkDelete" runat="server" />
                        </ItemTemplate>
                          </asp:TemplateField>
                     
                     <asp:BoundField DataField="BoatName" HeaderText="Boat Name" />
                     <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                     <asp:BoundField DataField="CustomerAddress" HeaderText="Customer Address" />
                     <asp:BoundField DataField="PhoneNo" HeaderText="Phone" />
                     <asp:BoundField DataField="Email" HeaderText="Email" />
                     <asp:BoundField DataField="RentalType" HeaderText="Rental Type" />
                     <asp:BoundField DataField="FromTo" HeaderText="From - To" />
                     <asp:TemplateField HeaderText="Agreement">
                         <ItemTemplate>

                             
                             <asp:ImageButton ID="btnPrint" AlternateText="Print" runat="server" ImageUrl="./images/printer.gif"  CommandName="Select"/>
                         </ItemTemplate>

                     </asp:TemplateField>



                 </Columns>


                 <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                 <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                 <RowStyle BackColor="#EFF3FB"></RowStyle>

                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                 <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                 <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                 <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                 <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
             </asp:GridView>
                     </td>

                 </tr>

                 <tr>
                     <td>
                            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>

                     </td>

                 </tr>
                 <tr>
                     <td style="float:none!important;display:inline;">

                        <asp:LinkButton ID="btnDeleteReservation" runat="server" Text="Delete" OnClick="btnDeleteReservation_Click" OnClientClick="javascript:return confirm('Are you sure you want to Delete the selected Reservations');" CssClass="button" />
                         &nbsp; &nbsp; 
                         <asp:LinkButton ID="btnBack" Text="Back to Calendar" runat="server" OnClick="btnBack_Click" CssClass="button" />
                            &nbsp; &nbsp; 
                         <asp:LinkButton ID="btnPreviousDay" runat="server" Text="Previous Day" CssClass="button" OnClick="btnPreviousDay_Click" />

                            &nbsp; &nbsp; 
                         <asp:LinkButton ID="btnNextDay" runat="server" Text="Next Day" CssClass="button" OnClick="btnNextDay_Click" />


                     </td>

                 </tr>

             </table>

          



         </div>

       

       




         </div>


    </form>
</body>
</html>
