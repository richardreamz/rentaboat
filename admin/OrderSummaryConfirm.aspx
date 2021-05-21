<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSummaryConfirm.aspx.cs" Inherits="BoatRenting.OrderSummaryConfirm"  MaintainScrollPositionOnPostback="true"   %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Order Summary</title>
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
	
	<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
    
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<%--<script src="js/myscript.js" type="text/javascript"></script>
  --%>
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

</head>
<body>
<!--==============================header=================================-->

<!-- HEADER -->
				
                
<header id="header" >
     <form id="frmorderconfirm" runat="server">
    <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />


<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h1 class="white" >Welcome Aboard!</h1>
              
                         
      </div>         
	</div>

</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->

    
<div class="container">
      <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">
         
        
            
             <div>
             <div style="color:Red">
             Please print this receipt for your records. &nbsp;&nbsp; <asp:Button ID="btnPrintTop" runat="server" Text="PRINT" OnClientClick="javascript:window.print(); return false;" />
             </div>
             <br />
                 
        You can access and manage your information at <a href="">http://www.rentaboat.com</a>.
        <br>
        <strong>UserName: <span style="color:#248992">{Username}</span></strong><br>
        <strong>Password: <span style="color:#248992">{Passsword}</span></strong>
        <br><br>
             
             <div>
             Dear &nbsp;<%= orderSummary.ClientFirstName %> &nbsp; <%= orderSummary.ClientLastName %>,

   <br />
                 <br />

Thank you for choosing RentABoat.com. You have tentatively reserved the following boat. Please note this is NOT a confirmed reservation. 
You MUST contact the boat owner after receiving this email. This broker fee WILL be deducted from the total rental fee by the boat owner.
 If for some reason the boat is not available, there will be no charge to your credit card. This broker fee is not a deposit.
  The boat owner will contact you to collect their listed deposit. We will email you a copy of this reservation.

 <br />
 <br />
 

Welcome Aboard,

 <br />
 

The RentABoat.com Crew
             
             </div>
             </div>
         
              

             <table>
             <thead>
             	<tr style="">
                
                    <th>Boat Details</th>
                    <th>Owner Contact Information</th>
                    <th>Rental Details</th>
                   
                </tr>
                </thead>
                <tbody>
                <tr>
                	<td>
                	<div class="boat-page-image">
                	<asp:LinkButton ID="lnkShowBoatProfile" runat="server" OnClick="lnkShowBoatProfile_Click">
        <b>Click here to go back to this boat's profile</b>
		<img src="./boats/<%=orderSummary.ImageFileName %>" alt="<%= orderSummary.ImageFileNameDescription %>" /></asp:LinkButton>
   				</div>
   				
   			<br/>
   			  <span class="boat-page-item">Type of Boat:</span> <%= orderSummary. BoatType%><br>
                    <span class="boat-page-item">Length:</span> <%= orderSummary.BoatSize %><br/>
                    <span class="boat-page-item">Passengers:</span> <%= orderSummary.MaximumPassengers %><br/>
                    <span class="boat-page-item">Description:</span><%= orderSummary.BoatDescription %><br/>
                    
                      <span class="boat-page-item">Attractions:</span><%= orderSummary.FacilityArea %><br/>
                    
                    </td>
                    
                    <td>
                    
                      <span class="boat-page-item">Facility:</span> <%= orderSummary.FacilityName %><br/>
                    
                       <span class="boat-page-item">Marina Name:</span> <%= orderSummary.MarinaName %><br/>
                    
                       <span class="boat-page-item">Contact Name:</span> <%= orderSummary.ContactName %><br/>
                    
                       <span class="boat-page-item">Location:</span>  <%= orderSummary.BodyOfWater %> <br />

                       
                       <span class="boat-page-item">Address:</span> <%= orderSummary.AddressLine1 %>,&nbsp;  <%= orderSummary.AddressLine2 %> &nbsp; <%= orderSummary.City %>, <%= orderSummary.StateName %> - <%= orderSummary.Zipcode %> <br/>
                        
                        <br/>
                       <span class="boat-page-item">Phone:</span> <%= orderSummary.MarinaPhone %><br/>
                       <span class="boat-page-item">Fax:</span> <%= orderSummary.MarinaFax %><br/>
                       <span class="boat-page-item">Email:</span> <%= orderSummary.MarinaEMail %><br/>
                       <span class="boat-page-item">Direction:</span> <%= orderSummary.FacilityDirection %><br/>
                       <span class="boat-page-item">Hours:</span> <%= orderSummary.FacilityOpenTime %> -  <%= orderSummary.FacilityCloseTime %><br/>
                    
                    
                    </td>
                    
                    <td>
                    
                     <span class="boat-page-item">From:</span>  <%= orderSummary.RentStartDate %><br/>
                    
                       <span class="boat-page-item">To:</span> <%= orderSummary.RentEndDate %><br/>
                       <%= orderSummary.RentingTimeFromTo %>
                    
                       <span class="boat-page-item">Total:</span>  <%= orderSummary.TotalRentAmount.ToString() %><br/>
                    
                       <span class="boat-page-item">Reservation Fee:</span>$<%= orderSummary.MarinaOnlineReservationFee.ToString("F") %><br/>
                    
                     <span class="boat-page-item">Due at Rental site:</span> <%= (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F") %><br/>
                    
                    </td>
                    
                    
                    
                  
                </tr>
                </tbody>
                </table>

                   
           <br />
               <br />

               RentABoat.com - 320 South Country Road - Brookhaven - NY - 11719 - 631-286-7816 - info@RentABoat.com 
            <div style="float:right">
               
                   
                      <asp:Button ID="btnPrint" runat="server" Text="PRINT" OnClientClick="javascript:window.print(); return false;" />
                                                                                                                    </div>

  


            
   </div>
</div>    

</div>

         </form>
<!-- FOOTER -->


    <uc1:ctlFooter runat="server" ID="ctlFooter" />
				


</body>
</html>