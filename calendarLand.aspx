<%@ Page language="C#" CodeFile="calendarLand.aspx.cs" Inherits="BoatRenting.calendarLand_aspx_cs"  MaintainScrollPositionOnPostback="true"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlNoRentingInfo.ascx" TagPrefix="uc1" TagName="ctlNoRentingInfo" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>





<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>List Boat</title>
   <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
   
  <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
 
    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>



	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	
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




     <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">

   
  
      <script type="text/javascript">
    <!--
    function setDropDownList(elementRef, valueToSetTo) {
        var isFound = false;


        for (var i = 0; i < elementRef.options.length; i++) {
            if (elementRef.options[i].value == valueToSetTo) {
                elementRef.options[i].selected = true;
                isFound = true;
            }
        }


        if (isFound == false)
            elementRef.options[0].selected = true;
    }

</script>
     
    
   

    <script>

         function areaMap(zipcode) {


             window.open("http://www.google.com/maps?q=" + zipcode + "&sa=X&oi=map&ct=title", "_blank", "height=800,width=900,status=yes,toolbar=no,menubar=no,location=no");

             return false;


         }

    </script>



  


 

  

    
</head>
<body>
	
    	 <form id="frmBoatDetails"  runat="server">
      
           <asp:ScriptManager ID="scm1" runat="server"></asp:ScriptManager>  
             
             
            
             
             
        
             
                
<header id="header">
<!-- TOP LINE -->

    <div class="row">
    <div class="col-lg-1">
        <asp:LinkButton ID="btnBack" runat="server" Text="Back" OnClientClick="javascript:window.history.back();" ForeColor="White"></asp:LinkButton>
    </div>
    <div class="col-lg-7">
      
            <asp:Label ID="lblBoatOwnerName" runat="server" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Label><br />
            <asp:Label ID="lblAddress" runat="server" ForeColor="White"></asp:Label><br />
            <asp:Label ID="lblCityStateZip" runat="server" ForeColor="White"></asp:Label><br />
            <asp:Label ID="lblCountry" runat="server" ForeColor="White"></asp:Label><br />
            <asp:Label ID="lblPhoneEmail" runat="server" ForeColor="White"></asp:Label><br />
           

    </div>

    <div class="col-lg-3">
     <h2 style="color:white;font-size:16px;">  Powered By</h2>
        <img src="img/logo.png" alt="Rent A Boat" width="168" height="31" />
    </div>
     <div class="col-lg-1">
        <asp:LinkButton ID="lnkSignIn" runat="server" Text="Sign In" OnClick="lnkSignIn_Click"  ForeColor="White"></asp:LinkButton>
    </div>
</div>				

     
</header>


<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
      <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20" runat="server" id="divMarinaAddress">
        
             <h2>
                 <asp:Literal ID="lblBoatName" runat="server"></asp:Literal>
             </h2>
            <asp:Literal ID="lblMarinaAddress" runat="server"></asp:Literal>
             </div>
             
             <div class="col-lg-7 col-sm-7 padbot20">
             <!-- Search item -->
             
             <!--Image-->
             	<div class="boat-page-image">

		<img src="" alt="" width="400" height="246" runat="server" id="mainboatpic"/>
   			
            <asp:HiddenField ID="hpicmain" runat="server" />
                 </div>
                <div class="boat-page-thumb">
         
             <iframe	marginheight="0" marginwidth="0" scrolling="auto" name="f_morePic" width="400" height="108"	src="picscroll.aspx"> 
			</iframe>
	<br />
		  Boat # <asp:Label ID="lblBoatID" runat="server"></asp:Label>
                    <asp:Literal ID="ltrRating" runat="server"></asp:Literal> 
                
                    Facility #: <asp:Label ID="lblFacilityNumber" runat="server"></asp:Label>
                     <br>
                
                <asp:LinkButton ID="btnShowAreaMap" runat="server" class="btn btn-primary btn1a"><span>Area Map</span></asp:LinkButton>
                <br><br>


                </div>
                <!--overview-->
              	<div class="boat-page-overview">
              	
                <h2>Boat Details</h2>
                <p><span class="boat-page-item">Boat Name:</span> <asp:Literal ID="lblBoatName1" runat="server"></asp:Literal>   </p>
                <p><span class="boat-page-item">Make:</span> <asp:Literal ID="lblBoatMake" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Model:</span>  <asp:Literal ID="lblBoatModel" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Length:</span>  <asp:Literal ID="lblBoatLength" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Passengers:</span>  <asp:Literal ID="lblPassengers" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Captain or Guide available for hire:</span>  <asp:Literal ID="lblCaptain" runat="server"></asp:Literal> </p>
                           		
                   
                </div>
                
                <div class="boat-page-overview">
              		
                <h2>Boat Description</h2>
                           		
                   <p>
                        <asp:Literal ID="lblBoatDescription" runat="server"></asp:Literal> 
                   </p>
                </div>
                
                <div class="boat-page-overview">
              		
                <h2> Rental Details </h2>
                   
					<p><span class="boat-page-item">Requirements:</span> 
                         <asp:Literal ID="lblRequirements" runat="server"></asp:Literal> 
					</p>
                    <p><span class="boat-page-item">Facility Name:</span>  <asp:Literal ID="lblOwner" runat="server"></asp:Literal> </p>
                    <p><span class="boat-page-item">More Boats From This Owner:</span>  <asp:Literal ID="lblMoreBoatsFromOwner" runat="server"></asp:Literal> </p>
                    <p><span class="boat-page-item">Tax Rates:</span>  <asp:Literal ID="lblTaxRate" runat="server"></asp:Literal> </p>
                    <p><span class="boat-page-item">Reservatopm Deposit:</span>  <asp:Literal ID="lblReservationDeposit" runat="server"></asp:Literal> </p>
                    <p><span class="boat-page-item">Security Deposit:</span>  <asp:Literal ID="lblSecurityDeposit" runat="server"></asp:Literal> </p>
                    <p><span class="boat-page-item">Cancellation Policy:</span> 
                         <asp:Literal ID="lblCancellationPolicy" runat="server"></asp:Literal> 
                    </p> 		
                   
                </div>
                
                <div class="boat-page-overview">
              		
                <h2>Area and Attractions:</h2>
                           		
                   <p>
                        <asp:Literal ID="lblAreaAttractions" runat="server"></asp:Literal> 
                   </p>
                </div>

			</div>
            <div class="col-lg-5 col-sm-5 padbot20">	


				<div class="boat-table">
           

                    <asp:Literal ID="ltrPricing" runat="server"></asp:Literal>

       		</div>
            
      <br><br>


             
               
      
         
            <asp:UpdatePanel ID="uplChooseDate" runat="server">
                <ContentTemplate>
            
             <asp:Panel ID="pnlRenting" runat="server">
            <div class="boat-page-overview" >
            
                <div id="divStep1"  runat="server">
                <h4 class="red">     Step 1 : </h4>
                    </div>
              <h2>  Choose Time</h2>
          
            <div class="control-group">
  			
                <asp:DropDownList ID="ddRentOption" runat="server"  style="max-width:400px!important; width:100%!important" AutoPostBack="true" OnSelectedIndexChanged="ddRentOption_SelectedIndexChanged"></asp:DropDownList>
              
               
                
                
                 <asp:Panel ID="pnlStartDateHide" runat="server">

   
                 <br />
                      <div id="divStartDateInfo" runat="server">
  <h4 class="red">   Step 2: Please Select a Date       </h4>    
     </div>
            <asp:LinkButton ID="lnkSelectADate" runat="server" Text="Select Pick Up Date" OnClick="lnkSelectADate_Click" class="btnSelectDate" style="max-width:400px!important; width:100%!important"></asp:LinkButton>
              
             

                <asp:Panel ID="pnlStartDateCalendar" runat="server" CssClass="popupControl">
          
                    <div style="background-color:#f0f4f4; margin:5px;">
                    <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:White;font-family:Verdana;font-size:8pt;max-width:400px!important;width:100%!important; border-collapse:collapse;">
                        
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">
                                   <div style="background-color:#f0f4f4; padding:0px;"><!--must be no padding-->
                                <table class="calPickupDropOff" cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:#f0f4f4;border-color:#999999;border-width:1px;border-style:solid;font-family:Verdana;font-size:8pt;max-width:400px!important;width:100%!important; border-collapse:collapse;">
                                      <tr>
                            <td align="left" style="width:15%;"  class="calPickupDropOff" >
                             
                            <asp:ImageButton ID="btnPreviousMonthStartDate" OnClick="btnPreviousMonthStartDate_Click" runat="server" ImageUrl="images/arrow-prev.jpg" />
                            
                            </td>
                            <td align="center" style="width:70%;" valign="bottom" class="calPickupDropOff">
                              &nbsp; &nbsp;  <asp:DropDownList ID="ddMonthStartCalendar" runat="server" Width="100px"  AutoPostBack="true" OnSelectedIndexChanged="ddMonthStartCalendar_SelectedIndexChanged"  Font-Bold="true">
                                                                 
                                  
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
                            <td align="right" style="width:15%;"  class="calPickupDropOff">
                              
                                <asp:ImageButton ID="btnNextMonthStartDate" OnClick="btnNextMonthStartDate_Click" runat="server" ImageUrl="images/arrow-next.jpg" />
                            
                            
                            </td>
                        </tr>
                                </table>
                                          </div>
                            </td>
                        </tr>
                        
                            
                      
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">

                                      <asp:Calendar ID="calStartDate" runat="server"  DayNameFormat="Shortest" CssClass="calPickupDropOff"
                             OnSelectionChanged="calStartDate_SelectionChanged"   OnVisibleMonthChanged="calStartDate_VisibleMonthChanged" OnDayRender="calStartDate_DayRender" ShowTitle="false">
                                <SelectedDayStyle  />
                                <TodayDayStyle />
                                <SelectorStyle  />
                                <WeekendDayStyle  />
                                <OtherMonthDayStyle  />
                                <NextPrevStyle />
                                <DayHeaderStyle CssClass="calPickupDropOff" />
                                <TitleStyle  />
                        </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                        </div>

                   <br />
                 <%--    <div >
            <div class="mini-box" style="background-color:#93d13f;">&nbsp;</div> Green = Available<br>
            <div class="mini-box" style="background-color:#fff; border:1px solid #ccc;">&nbsp;</div> White = Not Available<br>
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          
            </div>
       --%>
        
	
                
        </asp:Panel>

</asp:Panel>
   	</div>   
       <br />
                <br />

<asp:Panel ID="pnlEndDateHide" runat="server">
      
 <div id="divEndDateInfo" runat="server">
    <h4 class="red">   Step 2: Please Select a Drop Off Date       </h4>    
     </div>
     <asp:LinkButton ID="lnkEndDate" runat="server" Text="SELECT DROP OFF DATE"  OnClick="lnkEndDate_Click" class="btnSelectDate" ></asp:LinkButton>
              
               

           <asp:Panel ID="pnlEndDateCalendar" runat="server" CssClass="popupControl">
          
                    <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:White;font-family:Verdana;font-size:8pt;border-collapse:collapse;max-width:400px!important;width:100%;">
                        
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">
                                 <div style="background-color:#f0f4f4; padding:5px;">
                                <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:#f0f4f4;font-family:Verdana;font-size:8pt;border-collapse:collapse;max-width:400px!important;width:100%;">
                                      <tr>
                            <td align="left" style="width:15%;"  class="calPickupDropOff" >
                             
                            <asp:ImageButton ID="btnPreviousMonthEndDate" OnClick="btnPreviousMonthEndDate_Click" runat="server" ImageUrl="images/arrow-prev.jpg" />
                            
                            </td>
                            <td align="center" style="width:70%;" valign="bottom" class="calPickupDropOff">
                              &nbsp; &nbsp;  <asp:DropDownList ID="ddMonthEndCalendar" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddMonthEndCalendar_SelectedIndexChanged" Width="100px" Font-Bold="true">
                                                                 
                                  
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
                            <td align="right" style="width:15%;"  class="calPickupDropOff">
                              
                                <asp:ImageButton ID="btnNextMonthEndDate" OnClick="btnNextMonthEndDate_Click" runat="server" ImageUrl="images/arrow-next.jpg" />
                            
                            
                            </td>
                        </tr>
                                </table>
                                          </div>
                            </td>
                        </tr>
                        
                            
                      
                        <tr class="calPickupDropOff">
                            <td class="calPickupDropOff">
                         <asp:Calendar ID="calEndDate" runat="server"  DayNameFormat="Shortest"
                            BackColor="White" BorderColor="#999999" CellPadding="1" Font-Names="Verdana" CssClass="calPickupDropOff"
                            Font-Size="8pt" ForeColor="Black" OnSelectionChanged="calEndDate_SelectionChanged"  OnVisibleMonthChanged="calEndDate_VisibleMonthChanged" OnDayRender="calEndDate_DayRender" ShowTitle="false">
                               <SelectedDayStyle  />
                                <TodayDayStyle  />
                                <SelectorStyle  />
                                <WeekendDayStyle  />
                                <OtherMonthDayStyle  />
                                <NextPrevStyle  />
                                <DayHeaderStyle CssClass="calPickupDropOff"/>
                                <TitleStyle  />
                        </asp:Calendar>
                  
             

  </td>
                        </tr>
                    </table>
                   <br />
                  <%--   <div >
            <div class="mini-box" style="background-color:#93d13f;">&nbsp;</div> Green = Available<br>
            <div class="mini-box" style="background-color:#fff; border:1px solid #ccc;">&nbsp;</div> White = Not Available<br>
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          
            </div>--%>
       

        </asp:Panel>

    <br />
    <br />
    <asp:Label ID="lblMessageOneDayRental" runat="server"></asp:Label>
  
       <div class="btns" style="float:right!important">
                <div style="font-size:small" runat="server" id="divOneDayInfo">   * For Multiple Day Rentals select a desired Drop Off Date.</div>       
                 <asp:LinkButton ID="lnkContinueWithOneDayRental" runat="server" CssClass="btn3" Text="One Day Rental & Continue" OnClick="lnkContinueWithOneDayRental_Click" ></asp:LinkButton>
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
                  
                         <div >
            <div class="mini-box" style="background-color:#93d13f;">&nbsp;</div> Green = Available<br>
            <div class="mini-box" style="background-color:#fff; border:1px solid #ccc;">&nbsp;</div> White = Not Available<br>
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          
            </div>
            </asp:Panel>

            <asp:Panel ID="pnlNoRenting" runat="server">


                <uc1:ctlnorentinginfo runat="server" id="ctlNoRentingInfo" />

            </asp:Panel>
                   
               
          <asp:HiddenField ID="txtAllowSameDayRental" Value="1" runat="server"/>



</div>

                      </ContentTemplate>

            </asp:UpdatePanel>


                    

                <iframe width="400" height="225" src="" frameborder="0" allowfullscreen runat="server" id="iframeVideo"></iframe>
    
           </div>


            
            
  


            
   </div>
</div>    


            

             


            




         

                    

             </form>
<!-- FOOTER -->


    <uc1:ctlFooter runat="server" ID="ctlFooter" />

				
    <script>
       
        
        
           
    
    
    </script>
  
</body>
</html>