<%@ Page language="C#" CodeFile="calendar.aspx.cs" Inherits="BoatRenting.calendar_aspx_cs"  MaintainScrollPositionOnPostback="true"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlNoRentingInfo.ascx" TagPrefix="uc1" TagName="ctlNoRentingInfo" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<%@ Register Src="~/ctlBoatQuestions.ascx" TagPrefix="uc1" TagName="ctlBoatQuestions" %>






<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Boat Details</title>
   <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
   <asp:Literal ID="ltrogtags" runat="server"></asp:Literal>
  <!-- CSS STYLES -->
	<%--<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
  --%>
    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>

	  <script>
        function ScrollToQuestions()
        {
            
            document.getElementById('dvAsk').scrollIntoView()

        }

     

    </script>
    
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
         // This example displays an address form, using the autocomplete feature
         // of the Google Places API to help users fill in the information.

         var placeSearch, autocomplete;
         var componentForm = {
             street_number: 'short_name',
             route: 'long_name',
             locality: 'long_name',
             administrative_area_level_1: 'short_name',
             country: 'long_name',
             postal_code: 'short_name',

         };

         var cleared = false;

       
         // [END region_fillform]

         // [START region_geolocation]
         // Bias the autocomplete object to the user's geographical location,
         // as supplied by the browser's 'navigator.geolocation' object.
         function geolocate() {
             if (navigator.geolocation) {
                 navigator.geolocation.getCurrentPosition(function (position) {
                     var geolocation = new google.maps.LatLng(
           position.coords.latitude, position.coords.longitude);
                     autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,
           geolocation));
                 });
             }
         }
         // [END region_geolocation]




         function areaMap(zipcode) {


             window.open("http://www.google.com/maps?q=" + zipcode + "&sa=X&oi=map&ct=title", "_blank", "height=800,width=900,status=yes,toolbar=no,menubar=no,location=no");

             return false;


         }

    </script>



  


 
    <style>
@media (max-width: 991px) and (min-width: 768px) {
.navbar-nav li a {
    font-size: 10px!important;
}
}
</style>
  

    
</head>
<body>
	
    	 <form id="frmBoatDetails"  runat="server">
      
             
             
             
            
             
             
        
             
                
<header id="header">
<!-- TOP LINE -->
				
    <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

<!--==============================content=================================-->
    
         
         <div class="container" >
      	<div class="row_header2" align="center" >
        	<h3  style="color:#fff;">Find Boat Rentals In Your Area Now!</h3>
            
          <div class="search" id="search">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Where do you want to go?" style="font-size:12px;" onkeypress="clearAddressSelection()"  ></asp:TextBox>
                
                  <asp:LinkButton ID="btnSearch" runat="server"  class="btn btn-primary btn1 btn-search"   OnClick="btnSearch_Click" >  
                      <span>search</span>
                     </asp:LinkButton>
                 <br />
              <asp:LinkButton ID="lnkAdvancedSearch" Text="Advanced Search" style="color:white;" runat="server" PostBackUrl="~/advancesearch.aspx"></asp:LinkButton>
                  </div>  
              <asp:Label ID="lblMessage" runat="server"></asp:Label>
              <asp:HiddenField ID="txtStreetName" runat="server" />
              <asp:HiddenField ID="txtCityName" runat="server" />
              <asp:HiddenField ID="txtState" runat="server" />
              <asp:HiddenField ID="txtZipCode" runat="server" />
              <asp:HiddenField ID="txtLat" runat="server" />
              <asp:HiddenField ID="txtLon" runat="server" />
              <asp:HiddenField ID="txtSelectedBoatId" runat="server" />
              <asp:HiddenField ID="txtSelectedMarinaId" runat="server" />
              <asp:HiddenField ID="txtSelectedRating" runat="server" />
              
      </div>         
	</div>
     
         </header>

<style>
    /*.table-nonfluid {
   width: 400px!important;
   
}
    .table thead > tr > th, .table tbody > tr > th, .table tfoot > tr > th, .table thead > tr > td, .table tbody > tr > td, .table tfoot > tr > td { border-right: 1px solid #2980B9!important; text-align:center!important; }

.table td:last-child {border-right:0!important;}

 .table th, table td, table tr {
      overflow: hidden; 
    
     

 }*/
</style>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
      <div class="row">
        
           <div class="col-lg-12 col-sm-12 padbot20" runat="server" id="divMarinaAddress">
        
           <%--  <h2>
                 <asp:Literal ID="lblBoatName" runat="server"></asp:Literal>
             </h2>--%>
           
                <asp:Literal ID="lblMarinaAddress" runat="server"></asp:Literal>
                
          
        
                
             </div>
             
             <div class="col-lg-7 col-sm-7 padbot20">
             <!-- Search item -->
         
                      <table class="table table-condensed" style="border-collapse:collapse;">
   
   
      <tr class="col-xs-12 col-lg-10 col-sm-12">
           <td class="col-xs-3 col-lg-3  col-sm-3">Country<br />
              <asp:Label ID="lblPostalCode" runat="server" ForeColor="#4CAEB8"></asp:Label>
        </td>
        <td class="col-xs-3 col-lg-3  col-sm-3">State<br /><asp:Label ID="lblState" runat="server" ForeColor="#4CAEB8"></asp:Label>
        </td>
          <td class="col-xs-3 col-lg-3  col-sm-3">City<br /><asp:Label ID="lblCity" runat="server" ForeColor="#4CAEB8"></asp:Label>
          </td>
        
       <td class="col-xs-12 col-lg-3  col-sm-3">Body Of Water<br /><asp:Label ID="lblBodyOfWater" runat="server" ForeColor="#4CAEB8"></asp:Label>
        </td>
      </tr>
     
   
  </table>

                    
             <!--Image-->
             	<div class="boat-page-image">
                    
		<img src="" alt="" runat="server" id="mainboatpic"/>
   			
            <asp:HiddenField ID="hpicmain" runat="server" />
                 </div>
                <div class="boat-page-thumb">
         
             <iframe style="max-height:600px!important;"	marginheight="0" marginwidth="0" scrolling="auto" name="f_morePic" 	src="picscroll.aspx"> 
			</iframe>
	<br />
		  Boat # <asp:Label ID="lblBoatID" runat="server"></asp:Label>
                    <asp:Literal ID="ltrRating" runat="server"></asp:Literal> 
                
                    Facility #: <asp:Label ID="lblFacilityNumber" runat="server"></asp:Label>
                     <br>
                
                <asp:LinkButton ID="btnShowAreaMap" runat="server" class="btn btn-primary "><span>Area Map</span></asp:LinkButton>
                    &nbsp;
 <asp:HyperLink ID="lnkScrollBottom" runat="server" class="btn btn-primary " NavigateUrl="#dvAsk"><span>Contact Boat Owner</span></asp:HyperLink>
                
                <br><br>

<!-- AddToAny BEGIN -->
<script async src="https://static.addtoany.com/menu/page.js"></script>
<style>
.a2a_svg {    width: 80px; height:24px;  padding:0 2px;}

.a2a_kit .a2a_svg {
    background-repeat: no-repeat;  padding:0 2px; }
.a2a_default_style a {
    padding:0 ;
    margin-right: 6px;
} 
.a2a_button_facebook, .a2a_s_facebook { background-image:url(images/fb.png);}
.a2a_button_twitter, .a2a_s_twitter { background:url(images/twitter.png);}
.a2a_button_google_plus, .a2a_s_google_plus { background:url(images/g.png);}
.a2a_button_pinterest,.a2a_s_pinterest { background:url(images/pin.png);}
.a2a_button_linkedin,.a2a_s_linkedin { background:url(images/in.png);}
.a2a_button_stumbleupon,.a2a_s_stumbleupon { background:url(images/su.png);}
.a2a_button_email, .a2a_s_email {background:url(images/email.png);}
	
	</style>
<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
<a class="a2a_button_facebook"></a> &nbsp; <a class="a2a_button_twitter"></a><a class="a2a_button_google_plus"></a><a class="a2a_button_pinterest"></a><a class="a2a_button_linkedin"></a><a class="a2a_button_email" style="width:32px;"></a>
</div>

<!-- AddToAny END -->
<br><br>

                    <asp:Literal ID="ltrSocialButtons" runat="server" ></asp:Literal>

                  
                </div>
                <!--overview-->
              	<div class="boat-page-overview">
              	
                <h2>Boat Details</h2>
                <p><span class="boat-page-item">Boat Name:</span> <asp:Literal ID="lblBoatName1" runat="server"></asp:Literal>   </p>
                <p><span class="boat-page-item">Make:</span> <asp:Literal ID="lblBoatMake" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Model:</span>  <asp:Literal ID="lblBoatModel" runat="server"></asp:Literal> </p>
   <p><span class="boat-page-item">Year:</span>  <asp:Literal ID="lblBoatYear" runat="server"></asp:Literal> </p>

                <p><span class="boat-page-item">Length:</span>  <asp:Literal ID="lblBoatLength" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Passengers:</span>  <asp:Literal ID="lblPassengers" runat="server"></asp:Literal> </p>
                <p><span class="boat-page-item">Captain or Guide Available For Hire:</span>  <asp:Literal ID="lblCaptain" runat="server"></asp:Literal> </p>
                           		
                 <div id="divBoatSale" runat="server">  <p><span class="boat-page-item">This Boat Is For Sale:</span>  <asp:Literal ID="lblBoatSalePrice" runat="server"></asp:Literal> </p>
                </div>
               
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
                    <p><span class="boat-page-item">Reservation Deposit:</span>  <asp:Literal ID="lblReservationDeposit" runat="server"></asp:Literal> </p>
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

                <div class="boat-page-overview" >
                 <span> Pick a Currency <asp:DropDownList ID="ddCurrency" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddCurrency_SelectedIndexChanged" ></asp:DropDownList>   </span> 
                </div>
				<div class="boat-table">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                    <asp:Literal ID="ltrPricing" runat="server"></asp:Literal>
              </ContentTemplate>

                  <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddCurrency" />
            </Triggers>
                 </asp:UpdatePanel>

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
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day AM<br>
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
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day AM<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          
            </div>--%>
       

        </asp:Panel>

    <br />
    <br />
    <asp:Label ID="lblMessageOneDayRental" runat="server"></asp:Label>
  <div class="btns" style="float:left!important">
      <br />
      <asp:LinkButton ID="lnkClearSelectionOneDay" runat="server" CssClass="btn3" Text="Clear" OnClick="lnkClearSelection_Click" ></asp:LinkButton>

      </div>
       <div class="btns" style="float:right!important">
                <div style="font-size:small" runat="server" id="divOneDayInfo">  Single day rental press</div>       
                 <asp:LinkButton ID="lnkContinueWithOneDayRental" runat="server" CssClass="btn3" Text="Continue" OnClick="lnkContinueWithOneDayRental_Click" ></asp:LinkButton>
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

                     <div class="btns" style="float:left!important">
         
                 <asp:LinkButton ID="lnkClearSelection" runat="server" CssClass="btn3" Text="Clear" OnClick="lnkClearSelection_Click" ></asp:LinkButton>
       </div>
                    <div class="btns" style="float:left!important; margin-left:15px;">
         
                 <asp:LinkButton ID="lnkContinue" runat="server" CssClass="btn3" Text="Continue" OnClick="lnkContinue_Click"></asp:LinkButton>
       </div>
            </asp:Panel>


                
       
   


		</div>
                  
                         <div >
            <div class="mini-box" style="background-color:#93d13f;">&nbsp;</div> Green = Available<br>
            <div class="mini-box" style="background-color:#fff; border:1px solid #ccc;">&nbsp;</div> White = Not Available<br>
            <div class="mini-box" style="background-color:#F77D06;">&nbsp;</div> Orange = Available Half Day AM<br>
    <div class="mini-box" style="background-color:#2DA9E5;">&nbsp;</div> Blue = Available Half Day PM<br>
          

                             <br />
                             <br />
                             <iframe width="400" height="225" src="" frameborder="0" allowfullscreen runat="server" id="iframeVideo" style="height:400px!important;"></iframe>
    

                                
                           </div>

            </div>
            </asp:Panel>

            <asp:Panel ID="pnlNoRenting" runat="server">


                <uc1:ctlnorentinginfo runat="server" id="ctlNoRentingInfo" />

            </asp:Panel>
                   
               
          <asp:HiddenField ID="txtAllowSameDayRental" Value="1" runat="server"/>



</div>

                      </ContentTemplate>

            </asp:UpdatePanel>



                
           </div>


            
            
  


            
   </div>
</div>    


            

               <script>


            




                   function clearAddressSelection() {


                       if (!cleared) {



                           var st = document.getElementById('<%= txtStreetName.ClientID %>');
                 st.value = "";

                 var city = document.getElementById('<%= txtCityName.ClientID %>');
                 city.value = "";

                 var state = document.getElementById('<%= txtState.ClientID %>');
                 state.value = "";

                 var zip = document.getElementById('<%= txtZipCode.ClientID %>');
                 zip.value = "";

                 var lat = document.getElementById('<%= txtLat.ClientID %>');
                 lat.value = "";

                 var lon = document.getElementById('<%= txtLon.ClientID %>');
                 lon.value = "";
                 cleared = true;

             }

         }

         function initialize() {
           
             autocomplete = new google.maps.places.Autocomplete(
             /** @type {HTMLInputElement} */(document.getElementById("<%=txtSearch.ClientID%>")),
       { types: ['geocode'] });
             // When the user selects an address from the dropdown,
             // populate the address fields in the form.
             google.maps.event.addListener(autocomplete, 'place_changed', function () {
                 fillInAddress();
             });
         }

       
         function fillInAddress() {
             // Get the place details from the autocomplete object.
             var place = autocomplete.getPlace();

         


             var latlng = place.geometry.location;
           

             var address = "";
             var streetno = "";
             var route = "";
             var locality = "";
             var postalcode = "";
             var administrativearea = "";
             // Get each component of the address from the place details
             //and fill the corresponding field on the form.
             for (var i = 0; i < place.address_components.length; i++) {
                 var addressType = place.address_components[i].types[0];
               
                 if (componentForm[addressType]) {
                     var val = place.address_components[i][componentForm[addressType]];
                   

                     if (addressType == "street_number")
                         streetno = val;
                     else if (addressType == "route")
                         route = val;
                     else if (addressType == "locality")
                         locality = val;
                     else if (addressType == "postal_code")
                         postalcode = val;
                     else if (addressType == "administrative_area_level_1")
                         administrativearea = val;


                     // alert(val);

                 }

             }

             // alert(postalcode);

             var st = document.getElementById('<%= txtStreetName.ClientID %>');
             st.value = route;

             var city = document.getElementById('<%= txtCityName.ClientID %>');
             city.value = locality;

             var state = document.getElementById('<%= txtState.ClientID %>');
             state.value = administrativearea;

             var zip = document.getElementById('<%= txtZipCode.ClientID %>');
             zip.value = postalcode;

             var lat = document.getElementById('<%= txtLat.ClientID %>');
             lat.value = latlng.lat();

             var lon = document.getElementById('<%= txtLon.ClientID %>');
             lon.value = latlng.lng();



             document.getElementById('<%=btnSearch.ClientID%>').click();

         }


         function gotoDetails(boatid, marinaid, rating) {

             var bid = document.getElementById('<%= txtSelectedBoatId.ClientID %>');
            bid.value = boatid;


            var mid = document.getElementById('<%= txtSelectedMarinaId.ClientID %>');
            mid.value = marinaid;

            var rat = document.getElementById('<%= txtSelectedRating.ClientID %>');
            rat.value = rating;



        }


</script>
             <div id="dvAsk" style="padding:10px;">
             <uc1:ctlBoatQuestions runat="server" ID="ctlBoatQuestions" />   
             </div>
                    

             </form>
<!-- FOOTER -->


    <uc1:ctlFooter runat="server" ID="ctlFooter" />
   
				
   
  
</body>
</html>