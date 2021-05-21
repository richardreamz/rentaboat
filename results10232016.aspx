<%@ Page language="C#" CodeFile="results.aspx.cs" Inherits="BoatRenting.results_aspx_cs" Debug="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>

<!DOCTYPE html>

<html>
<head>
<title>Welcome to BoatRenting.com!</title>
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
	
<%--	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="js/myscript.js" type="text/javascript"></script>
  
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

   
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
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
             // Create the autocomplete object, restricting the search
             // to geographical location types.
           //  clearAddressSelection();
             autocomplete = new google.maps.places.Autocomplete(
             /** @type {HTMLInputElement} */(document.getElementById("<%=txtSearch.ClientID%>")),
       { types: ['geocode'] });
             // When the user selects an address from the dropdown,
             // populate the address fields in the form.
             google.maps.event.addListener(autocomplete, 'place_changed', function () {
                 fillInAddress();
             });
         }

         // The START and END in square brackets define a snippet for our documentation:
         // [START region_fillform]
         function fillInAddress() {
             // Get the place details from the autocomplete object.
             var place = autocomplete.getPlace();

             //for (var component in componentForm) {
             //    document.getElementById(component).value = '';
             //    document.getElementById(component).disabled = false;
             //}

          

             var latlng = place.geometry.location;
            // alert( latlng.lat());
           //  alert( latlng.lng());

             // alert(place.address_components[0].types[0]);

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
                // alert(addressType);
                 if (componentForm[addressType]) {
                     var val = place.address_components[i][componentForm[addressType]];
                     //  document.getElementById(addressType).value = val;
                     //alert(addressType);
                   
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

    </script>



    <script>
        function gotoDetails(boatid, marinaid, rating) {

            var bid = document.getElementById('<%= txtSelectedBoatId.ClientID %>');
        bid.value = boatid;


        var mid = document.getElementById('<%= txtSelectedMarinaId.ClientID %>');
        mid.value = marinaid;

        var rat = document.getElementById('<%= txtSelectedRating.ClientID %>');
        rat.value = rating;
       
        document.getElementById('<%=btnShowDetails.ClientID%>').click();

    }


</script>


    <style>
      #locationField, #controls {
        position: relative;
        width: 480px;
      }
      #autocomplete {
        position: absolute;
        top: 0px;
        left: 0px;
        width: 99%;
      }
      .label {
        text-align: right;
        font-weight: bold;
        width: 100px;
        color: #303030;
      }
      #address {
        border: 1px solid #000090;
        background-color: #f0f0ff;
        width: 480px;
        padding-right: 2px;
      }
      #address td {
        font-size: 10pt;
      }
      .field {
        width: 99%;
      }
      .slimField {
        width: 80px;
      }
      .wideField {
        width: 200px;
      }
      #locationField {
        height: 20px;
        margin-bottom: 2px;
      }
    </style>



    <style>

         .Repeater, .Repeater td, .Repeater td
        {
            border: 1px solid #ccc;
        }
        .Repeater td
        {
            background-color: #eee !important;
        }
        .Repeater th
        {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }
        .Repeater span
        {
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }
        .page_enabled, .page_disabled
        {
            display: inline-block;
            height: 20px;
            min-width: 20px;
            line-height: 20px;
            text-align: center;
            text-decoration: none;
            border: 1px solid #ccc;
        }
        .page_enabled
        {
            background-color: #eee;
            color: #000;
        }
        .page_disabled
        {
            background-color: #6C6C6C;
            color: #fff !important;
        }
    </style>


    
</head>
<body runat="server" >
	
    	 <form id="search2" class="search" runat="server"  defaultbutton="btnSearch"
        defaultfocus="txtSearch">
      			
                
<header id="header">
<!-- TOP LINE -->
				
        <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

<!--==============================content=================================-->
    
         
         <div class="container" >
      	<div class="row_header2" align="center" >
        	<h3  style="color:#fff;">Find Boat Rentals In Your Area Now!</h3>
              
          <div class="search" id="search">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Where do you want to go?" style="font-size:12px; " onkeypress="clearAddressSelection()"></asp:TextBox>
               
                   <asp:LinkButton ID="btnSearch" runat="server"  class="btn btn-primary btn1 btn-search" OnClick="btnSearch_Click"  >  
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



 <!--==============================row_1=================================-->
<div class="container">
      <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">
             <h2>Search Results</h2>
             
             
             <!-- Search item -->
              


<asp:Repeater ID="rptPager" runat="server">
    <ItemTemplate>
        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
   </ItemTemplate>
</asp:Repeater>

               <asp:Repeater ID="rpBoatList" runat="server">

                   <ItemTemplate>

                        <div class="boat-list-item">
             	<!--Image-->
             	<div class="boat-list-image">
                     	<a class="" href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>
		<img src="./boats/<%# DataBinder.Eval(Container.DataItem, "FileName") %>" alt="<%# DataBinder.Eval(Container.DataItem, "FilenameDescription") %>"    />
   				</a>
                             </div>
                
                <!--overview-->
              	<div class="products-list-item-overview">
              		<h2><ahref='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>  <%# DataBinder.Eval(Container.DataItem, "BoatName") %></a></h2>
                <p>   <%# DataBinder.Eval(Container.DataItem, "Description") %></p>
                
             		<ul class="list-result">
             			<li>State<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "State") %></span></li>
                		<li>City<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "City") %></span></li>
                           <li>Zip<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "Zip") %></span></li>
                        <li>Body Of Water<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "BodyOfWater") %></span></li>
                		<li>Year<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "Year") %></span></li>
                		<li>Make<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "Make") %></span></li>
                		<li>Model<br><span class="boat-result">  <%# DataBinder.Eval(Container.DataItem, "Model") %></span></li>
                	
                	</ul>
                    <div style="clear:both"></div>
                </div>

				<!-- Price / BookNow -->
		
				<div class="products-price">				
					<span class="price-from-label">From&nbsp;<%# DataBinder.Eval(Container.DataItem, "Currency") %></span>
					<span class="price">  <%# formattedAmount(DataBinder.Eval(Container.DataItem, "Amount").ToString(), DataBinder.Eval(Container.DataItem, "Currency").ToString()  )	 %></span>
						
					<a class='btn-submit' href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>More Info!</a>
                
               
                
                </div>
    	</div>



<div style="clear:both"></div>

                   </ItemTemplate>


               </asp:Repeater>

               
<asp:Repeater ID="rptPagerBottom" runat="server">
    <ItemTemplate>
        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
   </ItemTemplate>
</asp:Repeater>
             
     
 <asp:Button ID="btnShowDetails" runat="server" style="visibility: hidden; display: none;" OnClick="btnGoDetails_Click" UseSubmitBehavior="false" />
                

<!-- Search item -->
             
        







		






       </div>
   </div>
</div>    


  </form>    





    <!-- FOOTER -->


			



     <uc1:ctlFooter runat="server" ID="ctlFooter" />



</body>

<script src="http://www.google-analytics.com/urchin.js" type="text/java_script">
    </script>
<script type="text/java_script">
_uacct = "UA-872206-1";
urchinTracker();
    </script>

</html>

