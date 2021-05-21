<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlSearch.ascx.cs" Inherits="ctlSearch" %>

 <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">

   
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9nCdlg4gKj7sEJ8oP1dbwP0wVZjfu09Q&libraries=places" ></script>
 

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

<script>
    function clearAddressSelection() {

        var cleared = false;
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


         function gotoDetails(boatid, marinaid, rating) {

             var bid = document.getElementById('<%= txtSelectedBoatId.ClientID %>');
            bid.value = boatid;


            var mid = document.getElementById('<%= txtSelectedMarinaId.ClientID %>');
            mid.value = marinaid;

            var rat = document.getElementById('<%= txtSelectedRating.ClientID %>');
            rat.value = rating;



        }


</script>
            
          <div class="search" id="search">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Where do you want to boat?" style="font-size:12px;height:43px " onkeypress="clearAddressSelection()"></asp:TextBox>                
                   <asp:LinkButton ID="btnSearch" runat="server"  class="btn btn-primary btn1 btn-search"   OnClick="btnSearch_Click" >  
                      <span>search</span>
                     </asp:LinkButton>
               <br />
              <asp:LinkButton ID="lnkAdvancedSearch" Text="Advanced Search" style="color:white;" runat="server" PostBackUrl="~/advancesearch.aspx"></asp:LinkButton>
                
                
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