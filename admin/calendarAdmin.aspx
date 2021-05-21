<%@ Page language="C#" CodeFile="calendarAdmin.aspx.cs" Inherits="BoatRenting.calendarAdmin_aspx_cs"  MaintainScrollPositionOnPostback="true"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>
<%@ Register Src="~/ctlNoRentingInfo.ascx" TagPrefix="uc1" TagName="ctlNoRentingInfo" %>




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
    <div style='text-align:center'><a href="//windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->



  <!-- SCRIPTS -->
    <!--[if IE]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>



   <%-- <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.min.js" type="text/javascript"></script>--%>

    
 

    
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

  
       
     
         <div class="container">

<%--    Admin Menu here--------------------------------------------------------------------------------- --%>
             <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />

         
         
          

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
       <%--  <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>--%>

 <div class="row">
           <div class="col-lg-6 col-sm-6 padbot20">
          
        <h2>Add New Reservation</h2>
           
                <div>
             
                 <h3 class="red">
                    
                     <asp:Label ID="lblDateChoose" runat="server"></asp:Label>
                                 </h3>
                    <div>


                        <asp:GridView ID="gvAvailableBoats" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="gvAvailableBoats_SelectedIndexChanged" DataKeyNames="in_BoatID" CssClass="res-table2">
                            <Columns>

                    
                    <asp:TemplateField HeaderText="Select">

                        <ItemTemplate>

                            <asp:LinkButton CssClass="btn" ID="lnkBoatName" runat="server" Text="Select" CommandName="Select"></asp:LinkButton>
                            
                        </ItemTemplate>

                    </asp:TemplateField>
                
                     
                    <asp:BoundField DataField="vc_Name" HeaderText="Boat Name" />
                  
                     <asp:BoundField DataField="vc_Make" HeaderText="Make" />
                     <asp:BoundField DataField="vc_Model" HeaderText="Model" />
                     <asp:BoundField DataField="vc_Size" HeaderText="Size" />
                     <asp:BoundField DataField="vc_description" HeaderText="Boat Type" />
                   
                  



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


                    </div>
               <br />
               <asp:Label ID="lblMessage" runat="server"></asp:Label>
                     <br><br>
 
                         <div class="btns">
                             <asp:LinkButton ID="btnBack" runat="server" Text="Back to Calendar" OnClick="btnBack_Click" CssClass="btn3"></asp:LinkButton>
                          

                         </div>
                            
                    
               </div>


          </div>

    <!--CALENDAR RESERVATION COLUMN-->
           <div class="col-lg-6 col-sm-6 padbot20"><br/><br/>
   
         
            <asp:UpdatePanel ID="uplChooseDate" runat="server">
                <ContentTemplate>
            
             <asp:Panel ID="pnlRenting" runat="server">
            <div class="boat-page-overview" >
             <div style="text-align:center;font-weight:bold;">
                <h2 style="font-weight:bold"> <asp:Literal ID="lblBoatName" runat="server" ></asp:Literal></h2>
                </div>
                <div id="divStep1"  runat="server">
                <h4 class="red">     Step 1 : <asp:Label ID="lblSelectABoat" runat="server"></asp:Label> </h4>
                    </div>
              <h2>  Choose Time</h2>
          
            <div class="control-group">
  			
                <asp:DropDownList ID="ddRentOption" runat="server"  Width="400px" AutoPostBack="true" OnSelectedIndexChanged="ddRentOption_SelectedIndexChanged"></asp:DropDownList>
              
               
                
                
                 <asp:Panel ID="pnlStartDateHide" runat="server">

   
                 <br />
                      <div id="divStartDateInfo" runat="server">
  <h4 class="red">   Step 2: Please Select a Date       </h4>    
     </div>
            <asp:LinkButton ID="lnkSelectADate" runat="server" Text="Select Pick Up Date" OnClick="lnkSelectADate_Click" class="btnSelectDate" Width="400px"></asp:LinkButton>
              
             

                <asp:Panel ID="pnlStartDateCalendar" runat="server" CssClass="popupControl">
          
                     <div style="background-color:#f0f4f4; margin:5px;">
                    <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:White;font-family:Verdana;font-size:8pt;width:100%;border-collapse:collapse;">
                        
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">
                                 <div style="background-color:#f0f4f4; padding:0px;"><!--must be no padding-->
                                <table class="calPickupDropOff" cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:#f0f4f4;border-color:#999999;border-width:1px;border-style:solid;font-family:Verdana;font-size:8pt;width:100%;border-collapse:collapse;">
                                      <tr>
                            <td align="left" style="width:15%;"  class="calPickupDropOff" >
                             
                            <asp:ImageButton ID="btnPreviousMonthStartDate" OnClick="btnPreviousMonthStartDate_Click" runat="server" ImageUrl="../images/arrow-prev.jpg" />
                            
                            </td>
                            <td align="center" style="width:70%;" valign="bottom" class="calPickupDropOff">
                              &nbsp; &nbsp;  <asp:DropDownList ID="ddMonthStartCalendar" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddMonthStartCalendar_SelectedIndexChanged" Width="150px" Font-Bold="true">
                                                                 
                                  
                                   <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                   <asp:ListItem Text="April" Value="4"></asp:ListItem>
 <asp:ListItem Text="May" Value="5"></asp:ListItem>
 <asp:ListItem Text="June" Value="6"></asp:ListItem>
 <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                   <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                   <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                   <asp:ListItem Text="October" Value="10"></asp:ListItem>

                                      <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>


                                </asp:DropDownList> &nbsp; &nbsp;
                                <asp:DropDownList ID="ddYearStartCalendar" runat="server" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddYearStartCalendar_SelectedIndexChanged" Font-Bold="true">
                                   

                                  
                                </asp:DropDownList>
                            </td>
                            <td align="right" style="width:15%;" class="calPickupDropOff">
                              
                                <asp:ImageButton ID="btnNextMonthStartDate" OnClick="btnNextMonthStartDate_Click" runat="server" ImageUrl="../images/arrow-next.jpg" />
                            
                            
                            </td>
                        </tr>
                                </table>
                                          </div>
                            </td>
                        </tr>
                        
                            
                      
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">

                                      <asp:Calendar ID="calStartDate" runat="server" Width="100%" DayNameFormat="Shortest" CssClass="calPickupDropOff"
                             OnSelectionChanged="calStartDate_SelectionChanged"   OnVisibleMonthChanged="calStartDate_VisibleMonthChanged" OnDayRender="calStartDate_DayRender" ShowTitle="false">
                                <SelectedDayStyle  />
                                <TodayDayStyle  />
                                <SelectorStyle   />
                                <WeekendDayStyle  />
                                <OtherMonthDayStyle   />
                                <NextPrevStyle />
                                <DayHeaderStyle/>
                                <TitleStyle/>
                        </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                         </div>

                   <br />
                     <div >
            <div class="mini-box" style="background-color:#93d13f;">&nbsp;</div> Green = Available<br>
            <div class="mini-box" style="background-color:#fff; border:1px solid #ccc;">&nbsp;</div> White = Not Available<br>
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          
            </div>
       
        
	
                
        </asp:Panel>

</asp:Panel>
   	</div>   
       <br />
                <br />

<asp:Panel ID="pnlEndDateHide" runat="server">
      
 <div id="divEndDateInfo" runat="server">
    <h4 class="red">   Step 2: Please Select a Drop Off Date       </h4>    
     </div>
     <asp:LinkButton ID="lnkEndDate" runat="server" Text="SELECT DROP OFF DATE"  OnClick="lnkEndDate_Click" class="btnSelectDate" Width="400px"></asp:LinkButton>
              
               

           <asp:Panel ID="pnlEndDateCalendar" runat="server" CssClass="popupControl">
          
                    <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:White;font-family:Verdana;font-size:8pt;width:100%;border-collapse:collapse;">
                        
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">
                                 <div style="background-color:#f0f4f4; padding:5px;">
                                <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:#f0f4f4;font-family:Verdana;font-size:8pt;width:100%;border-collapse:collapse;">
                                      <tr>
                            <td align="left" style="width:15%;"  class="calPickupDropOff" >
                             
                            <asp:ImageButton ID="btnPreviousMonthEndDate" OnClick="btnPreviousMonthEndDate_Click" runat="server" ImageUrl="../images/arrow-prev.jpg" />
                            
                            </td>
                            <td align="center" style="width:70%;" valign="bottom" class="calPickupDropOff">
                              &nbsp; &nbsp;  <asp:DropDownList ID="ddMonthEndCalendar" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddMonthEndCalendar_SelectedIndexChanged" Width="150px" Font-Bold="true">
                                                                 
                                  
                                   <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                   <asp:ListItem Text="April" Value="4"></asp:ListItem>
 <asp:ListItem Text="May" Value="5"></asp:ListItem>
 <asp:ListItem Text="June" Value="6"></asp:ListItem>
 <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                   <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                   <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                   <asp:ListItem Text="October" Value="10"></asp:ListItem>

                                      <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>


                                </asp:DropDownList> &nbsp; &nbsp;
                                <asp:DropDownList ID="ddYearEndCalendar" runat="server" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddYearEndCalendar_SelectedIndexChanged" Font-Bold="true">
                                   

                                  
                                </asp:DropDownList>
                            </td>
                            <td align="right" style="width:15%;" class="calPickupDropOff">
                              
                                <asp:ImageButton ID="btnNextMonthEndDate" OnClick="btnNextMonthEndDate_Click" runat="server" ImageUrl="../images/arrow-next.jpg" />
                            
                            
                            </td>
                        </tr>
                                </table>
                                          </div>
                            </td>
                        </tr>
                        
                            
                      
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">
                         <asp:Calendar ID="calEndDate" runat="server" Width="100%" DayNameFormat="Shortest"
                            BackColor="White" BorderColor="#999999" CellPadding="1" Font-Names="Verdana"
                            Font-Size="8pt" ForeColor="Black" OnSelectionChanged="calEndDate_SelectionChanged"  OnVisibleMonthChanged="calEndDate_VisibleMonthChanged" OnDayRender="calEndDate_DayRender" ShowTitle="false">
                               <SelectedDayStyle  />
                                <TodayDayStyle  />
                                <SelectorStyle   />
                                <WeekendDayStyle  />
                                <OtherMonthDayStyle   />
                                <NextPrevStyle />
                                <DayHeaderStyle />
                                <TitleStyle  />
                        </asp:Calendar>
                  
             

  </td>
                        </tr>
                    </table>
                   <br />
                     <div >
            <div class="mini-box" style="background-color:#93d13f;">&nbsp;</div> Green = Available<br>
            <div class="mini-box" style="background-color:#fff; border:1px solid #ccc;">&nbsp;</div> White = Not Available<br>
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          
            </div>
       

        </asp:Panel>

    <br />
    <br />
    <asp:Label ID="lblMessageOneDayRental" runat="server"></asp:Label>
  
     <div class="btns" style="float:left!important">
         <div style="font-size:small" runat="server" id="div1">&nbsp;&nbsp;</div> 
                 <asp:LinkButton ID="lnkClearOneDayRental" runat="server" CssClass="btn3" Text="Clear" OnClick="lnkClearSelection_Click" ></asp:LinkButton>
       </div>

       <div class="btns" style="float:right!important">
                <div style="font-size:small" runat="server" id="divOneDayInfo"> Single day rental press</div>       
                 <asp:LinkButton ID="lnkContinueWithOneDayRental" runat="server" CssClass="btn3" Text="One Day Rental" OnClick="lnkContinueWithOneDayRental_Click" ></asp:LinkButton>
       </div>

    </asp:Panel>
                  
           <asp:Panel ID="pnlStartEndTimeHide" runat="server">
               <div id="divTimeInfo" runat="server">
                <h4 class="red"> Step 3: Choose your hours </h4>    
    			</div>
               <asp:DropDownList ID="ddStartTime" runat="server"></asp:DropDownList>
             
    			<asp:DropDownList ID="ddEndTime" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddEndTime_SelectedIndexChanged"></asp:DropDownList>
                </asp:Panel>
    
                <asp:Panel ID="pnlContinueHide" runat="server">
     <h4 class="red"> Step <%=LastStepNo %>: We need your information!       </h4>           
       <div style="color:red;float:left;font-size:medium;">
              <asp:Label ID="lblMessageContinue" runat="server" ></asp:Label>
          </div>
                    <br />
                    <br />

                     <div class="btns" style="float:left!important">
         
                 <asp:LinkButton ID="lnkClearSelection" runat="server" CssClass="btn3" Text="Clear Selections" OnClick="lnkClearSelection_Click" ></asp:LinkButton>
       </div>
                    <div class="btns" style="float:left!important; margin-left:15px;">
         
                 <asp:LinkButton ID="lnkContinue" runat="server" CssClass="btn3" Text="Continue" OnClick="lnkContinue_Click"></asp:LinkButton>
       </div>
            </asp:Panel>



   


		</div>
                  
                     
            </asp:Panel>

            <asp:Panel ID="pnlNoRenting" runat="server">

                <uc1:ctlNoRentingInfo runat="server" ID="ctlNoRentingInfo" />
            

            </asp:Panel>
                   
               
            <asp:HiddenField ID="txtAllowSameDayRental" Value="1" runat="server"/>



</div>

                      </ContentTemplate>

            </asp:UpdatePanel>


                    

               
           </div>


            
            
  


            
   </div>


               </ContentTemplate>
                        </asp:UpdatePanel>



            

            
</div>
             

                    

             </form>
<!-- FOOTER -->


			
      <script>

              setSelectedMenu("liCalendar");

          </script>
  
</body>
</html>