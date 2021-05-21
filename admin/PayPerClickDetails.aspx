<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayPerClickDetails.aspx.cs" Inherits="admin_PayPerClickDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PAY PER CLICK - DETAILS</title>
     <style type="text/css" media="screen">@import "br_admin.css";</style>

   
</head>
<body>
    <form id="form1" runat="server">
   <div id="container">
		<div id="banner"></div>
		<!--div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="FACILITIES_SEARCH.aspx">Facility</a>
		</div-->
		<div id="menu">
			<ul>

			<li><a href="FACILITIES_List.aspx">Facility</a></li>
            <li id="current"><a href="ShowPayPerClickReport.aspx">Pay Per Click Report</a></li>
			<li><a href="javascript:LogOut();">Log Out</a></li>
			</ul>
		</div>
		<div id="sub_menu">&nbsp;  </div>
			<div id="table_div">

                <div id="printPart">
				<table>
                    <tr>

                        <td>
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                        </td>
                    </tr>

                      <tr>
                      <td>

                    
                      <asp:GridView ID="gvPayperclick" runat="server" AutoGenerateColumns="False"   BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                        <Columns>

                           
                            <asp:BoundField HeaderText="Boat Name" DataField="BoatName" />
                            <asp:BoundField HeaderText="Sourvce IP Address" DataField="Source_IP_Address" />
                            <asp:BoundField HeaderText="Rate" DataField="Click_Rate" />
                            <asp:BoundField HeaderText="Time Clicked" DataField="Click_Time" />

                        </Columns>


                          <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                          <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                          <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                          <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                          <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F1F1F1" />
                          <SortedAscendingHeaderStyle BackColor="#594B9C" />
                          <SortedDescendingCellStyle BackColor="#CAC9C9" />
                          <SortedDescendingHeaderStyle BackColor="#33276A" />

                          <EmptyDataTemplate>
                              <h2> Nothing to Report ...</h2>

                          </EmptyDataTemplate>
                    </asp:GridView>




                      </td>
                  </tr>
                    </table>

                    </div>
                
                
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click"></asp:LinkButton>
                            &nbsp;&nbsp;
                              <asp:LinkButton ID="btnPrint" runat="server" Text="Print" OnClientClick="javascript:printDiv('printPart')"> </asp:LinkButton>
                        </td>

                    </tr>
                    </table>
                </div>
       </div>

         <script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
        }


        function LogOut() {
            document.frm_facilities_list.action = "logout.aspx";
            document.frm_facilities_list.submit();
        }
    </script>
    </form>
</body>
</html>
