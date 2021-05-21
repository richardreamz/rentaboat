<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AskQuestionBoat.aspx.cs" Inherits="AskQuestionBoat" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlNoRentingInfo.ascx" TagPrefix="uc1" TagName="ctlNoRentingInfo" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src='https://www.google.com/recaptcha/api.js'></script>


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


</head>
<body>
   
   <form id="frmquestion"  runat="server">
      
   
                
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
         	    <div class="col-md-6">
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
                
               


                </div>
                <!--overview-->
                     </div>
         <div class="col-md-6">
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
                </div>


    </div>


      <div class="row">
          Type your question below:<br />
          <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Rows="5" Width="100%" Height="200">

          </asp:TextBox>




          </div>
   
      <div class="g-recaptcha" data-sitekey="6Lcn5RkTAAAAAFwz9EyhonwtUBpaiYEzxq2gcncI"></div>
     <div class="row">
        <asp:Label ID="lblM" runat="server"></asp:Label>
    </div>
    <div class="row">
        <div class="col-md-12">
        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btnSend_Click" />
   &nbsp;&nbsp;

         <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />
    
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

     
    <asp:Button ID="btnh1" runat="server" style="display:none"/>             
                   
     <asp:ModalPopupExtender ID="modalPopup" runat="server"
    TargetControlID="btnh1"
    PopupControlID="pnlShowMessage"
    BackgroundCssClass="modalBackground" 
   
   
    
   
   />
   



             <asp:Panel id="pnlShowMessage" style="display: none" runat="server">
	
                             
                 <div style="background-color:white">
                <div style="background-color:green;color:white">
                   
                  MESSAGE SEND SUCCESSFULLY
                </div>
                <div style="margin-top:10px;">                   
                You will receive an email when the owner answer the question
                   and also will be posted to the website.
                </div>
                     <br />
                     <br />

                <div align="center" >
                    <asp:Button ID="btnOK" runat="server" Text ="OK"  OnClick="btnOK_Click"  Font-Bold="true"  Width="150px"/>
                    &nbsp;&nbsp;
                   
		         </div>
        </div>
</asp:Panel>   
   
   
   </form>

        <!-- FOOTER -->


    <uc1:ctlFooter runat="server" ID="ctlFooter" />

				
</body>
</html>
