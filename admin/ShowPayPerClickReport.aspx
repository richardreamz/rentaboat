<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPayPerClickReport.aspx.cs" Inherits="admin_ShowPayPerClickReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PAY PER CLICK REPORT</title>
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
			<div id="printPart">

				<table>

                    <tr>
                        <td>

                            <asp:DropDownList ID="ddMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMonth_SelectedIndexChanged">
                                <asp:ListItem Text="JAN" Value="01"></asp:ListItem> 
                                  <asp:ListItem Text="FEB" Value="02"></asp:ListItem> 
                                  <asp:ListItem Text="MAR" Value="03"></asp:ListItem> 
                                  <asp:ListItem Text="APR" Value="04"></asp:ListItem> 
                                  <asp:ListItem Text="MAY" Value="05"></asp:ListItem> 
                                  <asp:ListItem Text="JUN" Value="06"></asp:ListItem> 
                                  <asp:ListItem Text="JUL" Value="07"></asp:ListItem> 
                                  <asp:ListItem Text="AUG" Value="08"></asp:ListItem> 
                                  <asp:ListItem Text="SEP" Value="09"></asp:ListItem> 
                                  <asp:ListItem Text="OCT" Value="10"></asp:ListItem> 
                                  <asp:ListItem Text="NOV" Value="11"></asp:ListItem> 
                                   <asp:ListItem Text="DEC" Value="12"></asp:ListItem> 
                                
                            
                            
                            
                            
                            </asp:DropDownList>&nbsp;&nbsp;

                            <asp:DropDownList ID="ddYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddYear_SelectedIndexChanged"></asp:DropDownList>


                        </td>

                    </tr>
                  <tr>
                      <td>

                    
                      <asp:GridView ID="gvPayperclick" runat="server" AutoGenerateColumns="False" DataKeyNames="in_MarinaID" OnSelectedIndexChanged="gvPayperclick_SelectedIndexChanged" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowDataBound="gvPayperclick_RowDataBound" ShowFooter="True" Font-Size="Medium" ForeColor="Black">
                          <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>

                            <asp:TemplateField HeaderText="Facility Name">
                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkFacilityName" runat="server" Text='<%# Bind("Facility_Name") %>' CommandName="Select"></asp:LinkButton>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField HeaderText="No of Clicks" DataField="NoOfClicks" />
                            <asp:BoundField HeaderText="Rate per Click" DataField="RatePerClick" />
                            <asp:BoundField HeaderText="Total Amount Due" DataField="TotalDue" />

                        </Columns>


                          <EmptyDataTemplate>
                              <h2> Nothing to Report ...</h2>

                          </EmptyDataTemplate>
                          <FooterStyle BackColor="#0066FF" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" ForeColor="White" />
                          <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                          <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F1F1F1" />
                          <SortedAscendingHeaderStyle BackColor="#808080" />
                          <SortedDescendingCellStyle BackColor="#CAC9C9" />
                          <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>

                      </td>
                  </tr>
                </table>
                </div>

        <asp:LinkButton ID="btnPrint" runat="server" OnClientClick="javascript:printDiv('printPart');" Text="Print"></asp:LinkButton>

        </div>


          <script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = "<html><head><title></title></head><body>" + divElements + "</body>";

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
