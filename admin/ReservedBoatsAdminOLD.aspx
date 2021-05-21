<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReservedBoatsAdmin.aspx.cs" Inherits="admin_ReservedBoatsAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EDIT PROFILE</title>
  

   <!-- CSS STYLES -->
	<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/form.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
    
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="../js/superfish.min.js" type="text/javascript"></script>
	<script src="../js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="../js/myscript.js" type="text/javascript"></script>
  
        <script>
        $(document).ready(function () {

            $('.list2 li a').hover(function () {
                $(this).stop().css({ color: '#b6b6b6' });
                $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': '-7px' });
            }, function () {
                $(this).stop().css({ color: '#c11030' });
                $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': 0 });
            })

            ////////////
           
        });

    </script>
    
   
    
    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->



  <!-- SCRIPTS -->
    <!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>



    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.min.js" type="text/javascript"></script>

    
 

    
  <style>

     .numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 55px;
    height: 55px;
    padding: 8px;
    
    background: #fff;
    border: 2px solid #666;
    color: #666;
    text-align: center;
    
    font: 26px Arial, sans-serif;
}


.numberCircleBlue {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 55px;
    height: 55px;
    padding: 8px;
    
    background: #72C7CF;
    border: 2px solid #666;
    color: white;
    
    text-align: center;
    
    font: 26px Arial, sans-serif;
}


  </style>
    
	


    
  
</head>
<body>
 

     <form id="frmCalView" runat="server">
    <header id="header">
  <%--      Top Menu Here --%>
        <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

   <div class="container" > <div class="row_header-admin-dashboard" >
           <div align="center"><h1 class="white">DASHBOARD</h1></div>                 
      </div>
         
</div>

</header>

  
       
       <%--     <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>--%>

         <div class="container">

<%--    Admin Menu here--------------------------------------------------------------------------------- --%>
             <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />

         
         
          

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
         <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>

 <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">
          
           <h1>
               <asp:Literal ID="ltrWelcomeHeader" runat="server"></asp:Literal>
           </h1>

                 <span>For past reservations you can view them through <a href="boats_list_reports.aspx">Reports</a></span>
           <div><div style="float:left;"><h3>Reservation List</h3></div><div style="float:right;"><h3>
               <asp:Label ID="lblShowingRecords" runat="server"></asp:Label>
                                                                                                  </h3></div></div>
           <div style="clear:both"></div>
                 <!--booking result-->
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
                    <%-- <asp:BoundField DataField="FromTo" HeaderText="From - To" />
                    --%>
                     <asp:TemplateField HeaderText="From - To">

                         <ItemTemplate>

                             <asp:Label ID="lblFromTo" runat="server" Text='<%# Bind("FromTo") %>'></asp:Label>
                             <asp:Button ID="btnChangeDate" runat="server" Text="Change"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="changedate" OnCommand="btnChangeDate_Command" CssClass="btn btn-primary" />
                         </ItemTemplate>
                     </asp:TemplateField>
                     
                     
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
            
                 <EmptyDataTemplate>
                     
                     <h2>NO RESERVATIONS ...</h2>

                 </EmptyDataTemplate>       
                        
                  </asp:GridView>
            
                      <div style="clear:both;"></div> <br><br>
                      *Reservations made off line or through a different booking site can be added here.<br/><br/>
                  <div style="clear:both;"></div>
               <asp:Label ID="lblMessage" runat="server"></asp:Label>
               <br><br> 
               <div class="btns" style="">
                    <asp:LinkButton ID="btnDeleteReservation" CssClass="btn3"  runat="server" Text="Delete" OnClick="btnDeleteReservation_Click" OnClientClick="javascript:return confirm('Are you sure you want to Delete the selected Reservations');"  />
                       </div>
               
                <div class="btns" style="padding-left:20px;">
                         <asp:LinkButton ID="btnBack" Text="Back to Calendar" runat="server" OnClick="btnBack_Click" CssClass="btn3"/>
                         </div>
                <div class="btns" style="padding-left:20px;">
                         <asp:LinkButton ID="btnPreviousDay" runat="server" Text="Previous Day" CssClass="btn3" OnClick="btnPreviousDay_Click" />
                      </div> 
                                      
                <div class="btns" style="padding-left:20px;">
                         <asp:LinkButton ID="btnNextDay" runat="server" Text="Next Day" CssClass="btn3" OnClick="btnNextDay_Click" />
                      </div> 



           </div>



      </div>



                         <asp:ModalPopupExtender ID="mdlPopupChangeDate" runat="server"
                        TargetControlID="btnHidden"
                        PopupControlID="pnlChangeDate"
                        BackgroundCssClass="modalBackground"
                        DropShadow="true"
                        CancelControlID="btnCancel" />

                    <asp:Button ID="btnHidden" runat="server" Style="display: none" />


                    <asp:Panel ID="pnlChangeDate" Style="display: none" runat="server">


                        <div style="background-color: white">
                            <div style="background-color: green; color: white; font-size: medium;">
                                Change Rented Date.
                     
                            </div>
                            <div style="margin-top: 10px;">
                                <table class="table-condensed">
                                    <tr>
                                        <td>From:</td>
                                        <td>
                                            <asp:TextBox ID="txtFromDate" runat="server" Width="120px"></asp:TextBox>
                                        
                                        <asp:CalendarExtender ID="cefrm" runat="server" TargetControlID="txtFromDate" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            To:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtToDate" runat="server" Width="120px"></asp:TextBox>
                                        
                                         <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtToDate" />
                                       
                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Panel ID="pnlTime" runat="server">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Pick Up Time
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddStartTime" runat="server"></asp:DropDownList>
                                                        </td>
                                                        </tr>
                                                    <tr>
                                                        <td>
                                                            Drop Off Time
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddEndTime" runat="server"></asp:DropDownList>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </asp:Panel>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="lblMessagePopup" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" >
                                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                                            &nbsp;
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" />

                                        </td>
                                    </tr>
                                </table>


                            </div>
                           </div>
                        </asp:Panel>


</ContentTemplate>
                        </asp:UpdatePanel>
         
             
                 </div>
              <script>

              setSelectedMenu("liCalendar");

          </script>


       


    </form>
</body>
</html>
