<%@ Page Language="C#" AutoEventWireup="true" CodeFile="owners-faqs.aspx.cs" Inherits="BoatRenting.owners_faqs" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
        <meta http-equiv="Cache-control" content="public, max-age=600" />
     <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name="format-detection" content="telephone=1-888-610-2628" />
    <meta name="description" content="Find & book affordable boat rentals with or without a captain. Rent sailboats, jet skis, yachts charters and other watercrafts anywhere in the world. Rated #1 in customer satisfaction.">
    <meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
    <meta name="author" content="Kenny Hilderbrandt">
    <meta name="google-site-verification" content="o_nt02lBg_GRoNrr7bSFXxw5lo7F8ULgeHZ58KaGx10" />
    



    <meta http-equiv="Expires" content="30" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta name="robots" content="index, follow" />
    <meta
      name="googlebot"
      content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
    <meta
      name="bingbot"
      content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
    <meta property="fb:pages" content="22764423720" />
    <meta
      name="robots"
      content="max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
    <link rel="canonical" href="https://www.rentaboat.com/" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Rent A Boat" />
    <meta
      property="og:description"
      content="Find & book affordable boat rentals with or without a captain. Rent sailboats, jet skis, yachts charters and other watercrafts anywhere in the world. Rated #1 in customer satisfaction."
    />
    <meta property="og:url" content="https://www.rentaboat.com/" />
    <meta property="og:site_name" content="Rent A Boat" />
    <meta
      property="article:publisher"
      content="https://www.facebook.com/RentaBoatcom-244505213935"
    />
    <meta
      property="article:published_time"
      content="2020-12-28T14:00:30+00:00"
    />
    <meta
      property="article:modified_time"
      content="2020-12-27T14:12:12+00:00"
    />
    <meta
      property="og:image"
      content="https://www.rentaboat.com/images/logo-dark.png"
    />
    <meta property="og:image:width" content="1600" />
    <meta property="og:image:height" content="840" />
    <meta property="fb:app_id" content="{appId}" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:creator" content="@RentABoat_com" />
    <meta name="twitter:site" content="@RentABoat_com" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
  
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/styleN.css" rel="stylesheet">
  
    <title>Rent A Boat</title>
    <script src="js/googletracking.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWHiLBM1hzypiPVydCCSLoYbRPMbG2C-M&libraries=places"></script>
    <script>
        var placeSearch, autocomplete, autocomplete1;
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




            var latlng = place.geometry.location;


            var address = "";
            var streetno = "";
            var route = "";
            var locality = "";
            var postalcode = "";
            var administrativearea = "";
            var country = "";

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

                    else if (addressType == "country")
                        country = val;

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

            var coun = document.getElementById('<%= txtCountry.ClientID %>');
            coun.value = country;


            document.getElementById('<%=btnSearch.ClientID%>').click();

        }




        function fillInAddress1() {
            // Get the place details from the autocomplete object.
            var place = autocomplete1.getPlace();




            var latlng = place.geometry.location;


            var address = "";
            var streetno = "";
            var route = "";
            var locality = "";
            var postalcode = "";
            var administrativearea = "";
            var country = "";

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

                    else if (addressType == "country")
                        country = val;

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

            var coun = document.getElementById('<%= txtCountry.ClientID %>');
            coun.value = country;


            document.getElementById('<%=btnSearch.ClientID%>').click();

        }






    </script>
</head>
<body class="body">
    <form id="frmHowToRent" runat="server">
        <header id="topnav" class="darkheader defaultscroll fixed-top sticky">
            <div class="container-fluid pl-3 pr-3 pl-lg-4 pr-lg-4 pl-xl-5 pr-xl-5 mt-3">
                <!-- Logo container-->
                <div class="grid-on-mobile">
                    <div>
                        <a href="index.aspx" class="logo text-uppercase">
                            <img src="images/logo-light.png" alt="" class="logo-light" height="50" />
                            <img src="images/logo-dark.png" alt="" class="logo-dark" height="50" />
                        </a>
                    </div>
                    <!-- End Logo container-->
                    <div class="">
                        <div class="menu-extras">
                            <div class="menu-item">
                                <!-- Mobile menu toggle-->
                                <a class="navbar-toggle">
                                    <div class="lines">
                                        <span><i class="fas fa-bars"></i></span>
                                    </div>
                                </a>
                                <!-- End mobile menu toggle-->
                            </div>
                        </div>
                        <div id="navigations">
                  <!-- Navigation Menu-->
                  <ul class="navigation-menu">
                        <li class="">
                          <a href="index.aspx" >Home</a>
                      </li>
                      <li class="active nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">RENT a Boat</a>
                          <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                            <a class="dropdown-item" href="how_to_rent_a_boat.aspx" >How To Rent</a>
                            <a class="dropdown-item" href="renter_faqs.aspx" >Renter FAQ's</a>
                            
                          </div>
                      </li>

                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">LIST YOUR BOAT</a>
                        <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                          <a class="dropdown-item" href="how-It-works.aspx" >How it Works</a>
                          <a class="dropdown-item" href="./admin/BoatOwnerSignup.aspx" >List Your Boat</a>
                          <a class="dropdown-item" href="owners-faqs.aspx" >Owner FAQ's</a>
                          <a class="dropdown-item" href="marine-liability-insurance.aspx" >Marine Liability Insurance</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle" href="how-It-works.aspx" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WHY RENTING</a>
                        <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                          <a class="dropdown-item" href="renting-vs-owning.aspx" >Renting vs. Owning</a>
                          <a class="dropdown-item" href="rental-tips.aspx" >Rental Tips</a>
                          
                        </div>
                    </li>
                      <li class="">
                          <a href="about-us.aspx" >ABOUT US</a>
                      </li>
                      <li class="">
                          <a href="contact_us.aspx" >Contact Us</a>
                      </li>
                     
                      <li class="">
                        <button data-toggle="modal" aria-selected="false"  class="btn btn-custom align-nav" style="padding: 8px 25px;margin-top: 22px;" onclick="javascript:  return CheckEnterKey(event);" id="btnSignInClient1">SIGN IN</button>
                      </li>
                     
                      
                      <li>

                      </li>
                  </ul>
              </div>
                        <div class="searchbar">
                            <div class="text-center search-form">
                                <div class="form-on-scroll">
                                    <input type="text" placeholder="Where would you like to go boating?" runat="server" id="txtSearch">
                                    <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch" onserverclick="btnSearch_Click"><i class="fas fa-search pr-0 pr-lg-2"></i><span class="d-none d-lg-inline">SEARCH</span></button>
                                </div>
                                <div class="menu-on-scroll">
                                    <button class="btn btn-custom align-nav" data-toggle="modal" data-target="#exampleModalCenter" onclick="javascript:return false;">SIGN IN</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <asp:HiddenField ID="txtStreetName" runat="server" />
                <asp:HiddenField ID="txtCityName" runat="server" />
                <asp:HiddenField ID="txtState" runat="server" />
                <asp:HiddenField ID="txtZipCode" runat="server" />
                <asp:HiddenField ID="txtCountry" runat="server" />

                <asp:HiddenField ID="txtLat" runat="server" />
                <asp:HiddenField ID="txtLon" runat="server" />
                <asp:HiddenField ID="txtSelectedBoatId" runat="server" />
                <asp:HiddenField ID="txtSelectedMarinaId" runat="server" />
                <asp:HiddenField ID="txtSelectedRating" runat="server" />
            </div>
        </header>
        <section id="faq" class="section pb-4">
            <div id="faq-container" class="container-fluid">
                <div class="row justify-content-center mt-4">
                    <div class="col-lg-12">
                        <div class="title-head text-center">
                            <h2 class="pt-5 pb-4">Frequently Asked Questions by Boat Renters</h2>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12 accordion" id="faq-accordion">
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-1">
                                <h5 class="align-self-center m-0">
                                    Who owns the boats?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-1" class="collapse mt-3" data-parent="#faq-accordion">
                                Private boat owners, boat renting facilities, charter boats and water recreation companies.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-2">
                                <h5 class="align-self-center m-0">
                                    Is this a boat club? Do I need a membership?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-2" class="collapse mt-3" data-parent="#faq-accordion">
                                No, anyone can use RentABoat.com. You do not have to be a member to search for and rent boats in our boat rental network. Once you rent a boat with us, you can sign in using your email and password to view upcoming and past boat rentals, anytime.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-3">
                                <h5 class="align-self-center m-0">
                                    Do I have to contact the boat owner before my boat rental date?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-3" class="collapse mt-3" data-parent="#faq-accordion">
                                Yes. You will receive the boat owners contact information, you must contact the boat owner to confirm transaction. When you request to rent a boat, the boat owner will also receive your contact information. We require boat owners to contact you within 24 hours via email or phone to confirm. If there are any communication problems our staff is available 24/7 to assist you
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-4">
                                <h5 class="align-self-center m-0">
                                    What fees will boat renters need to pay?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-4" class="collapse mt-3" data-parent="#faq-accordion">
                                Renter pays a 10% online rental request transaction fee. This is the only RentABoat fee associated with the rental request. The boat owner is not charged any fees. RentAboat.com is a hassle-free online boat rental networking website. There are no annual or monthly fees. Boat renters can view boat rental pages where they can view boat details, rates, availability, current photos and request to rent. The boat owner can require additional deposits and fees to rent their boat. All of the details will be on the individual boat rental pages.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-5">
                                <h5 class="align-self-center m-0">
                                    Are the online boat reservation calendars live and accurate?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-5" class="collapse mt-3" data-parent="#faq-accordion">
                                Yes. Calendars are live and but not always accurate. Boat owners are encouraged to update their calendars, but this does not always happen. We do suggest you contact the boat owner after the rental request transaction is completed amd you received contact infomation.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-6">
                                <h5 class="align-self-center m-0">
                                    How do I know the boat I am reserving will look like the boat in the photo?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-6" class="collapse mt-3" data-parent="#faq-accordion">
                                Owners are encouraged to post current photos of their boat.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-7">
                                <h5 class="align-self-center m-0">
                                    Do I need a boating license to rent a boat?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-7" class="collapse mt-3" data-parent="#faq-accordion">
                                Some boat owners and states do require that you to have a boating license. You can find this information on your desired boat rental page.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-8">
                                <h5 class="align-self-center m-0">
                                    What is the refund policy?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-8" class="collapse mt-3" data-parent="#faq-accordion">
                                If you are not 100% satisfied with your boat rental, your RentABoat online fee will be refunded. If the boat you requested is not available, your RentABoat transaction fee will not be charged.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-9">
                                <h5 class="align-self-center m-0">
                                    What is the cancellation policy?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-9" class="collapse mt-3" data-parent="#faq-accordion">
                                Boat owners control their cancellation policies. They are listed on the boat information page. Please carefully review the listed cancellation policies before requesting to rent the boat. You will be held to the policy listed by the boat owner.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section bg-gradient pb-4 pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 text-center text-lg-left">
                        <div class="footer-info">
                            <img src="images/logo-light.png" class="img-fluid" width="200">
                            <p>"As conscious traveling Paupers we must always be concerned about our dear Mother Earth. If you think about it, you travel across her face, and She is the host to your journey; without Her we could not find the unfolding adventures that attract and feed our souls". - Unknown</p>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <ul class="footer-icons list-inline mt-3">
                                    <li class="list-inline-item"><a href="https://m.facebook.com/RentaBoatcom-244505213935/?ref=bookmarks" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a href="https://twitter.com/RentABoat_com" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="https://www.instagram.com/rentaboat_com/" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                </ul>
                            </div>
                            <div class="col-md-5 align-self-center">
                                <div class="form-group select-language">
                                    <%-- <select class="form-control" id="exampleFormControlSelect1">
                              <option selected style="color: black;"> Select Language</option>
                              <option style="color: black;" >English</option>
                              <option style="color: black;">French</option>
                            </select>--%>
                                    <%--  <asp:DropDownList ID="ddLanguage" runat="server" CssClass="form-control"  AutoPostBack="true" OnSelectedIndexChanged="ddLanguage_SelectedIndexChanged">
                                <asp:ListItem Text="Select Lanaguage"  Value=""></asp:ListItem>
                                <asp:ListItem Text="English" Value="en"></asp:ListItem>
                                <asp:ListItem Text="French" Value="fr"></asp:ListItem>
                            </asp:DropDownList>--%>
                      Select Language: 
                                    <div id="google_translate_element">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                  <script type="text/javascript">  
        function googleTranslateElementInit() {
            new google.translate.TranslateElement(
                { pageLanguage: 'en' },
                'google_translate_element'
            );
        }
    </script>  
      
    <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"> 
    </script>  
      
            <div class="col-lg-4 text-center text-lg-right">
                <p class="text-uppercase footer-title"><a href="contact_us.aspx">Contact Us</a></p>
                <div class="contact-us">
                    <p><i class="fas fa-phone-alt pr-2"></i> <a href="tel:1-888-610">1-888-610-BOAT</a></p>
                    <p><i class="fas fa-phone-alt pr-2"></i> <a href="tel:631-286-7816">631-286-7816</a></p>
                    <p><i class="fas fa-envelope pr-2"></i> <a href="mailto:info@rentaboat.spam"> <span>info@rentaboat.com</span></a></p>
                </div>
            </div>
        </div>
        <hr style="background-color: white;">
        <div class="row footer-bottom">
            <div class="col-lg-8 text-center text-lg-left">
                <p>© Copyright 2021 Rent A Boat, RentABoat.com | 320 South Counrty Rd. Brookhaven NY, 11719</p>
            </div>
            <div class="col-lg-4 footer-end text-center text-lg-right">
                <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
            </div>
        </div>
    </div>
</section>

        
        <!-- Modal SIgn in Sign Up -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body text-center padding-5">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="far fa-times-circle"></i>
                        </button>
                        <h1 class="pb-4">Sign In</h1>


                        <%-- form tag here--%>

                        <form class="pb-5">
                            <div class="form-group text-field">
                                <asp:TextBox type="text" runat="server" class="form-control" ID="txtLoginName" placeholder=" " />

                                <label class="style-lable">Email</label>
                            </div>
                            <div class="form-group text-field">
                                <asp:TextBox type="password" runat="server" class="form-control" ID="txtPassword" placeholder=" " />
                                <label class="style-lable">Password</label>
                            </div>
                            <div class="form-check text-right forgot-password">
                                <a href="forgotpassword.aspx" class="form-check-label">Forgot Password?</a>
                            </div>
                            <asp:Button type="submit" class="btn btn-custom-lg-signup btn-block mt-4" OnClick="btnSignIn_Click" Text="Sign In" runat="server"></asp:Button>
                        </form>
                        <div class="row ">
                            <div class="col-12">
                                <p class="font-15">Don't have an account? <a href="#" data-toggle="modal" data-target="#exampleModalCenter-1" class="sign-up">Sign up now!</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModalCenter-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body text-center padding-5">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="far fa-times-circle"></i>
                        </button>
                        <h1 class="pb-4">Sign Up</h1>
                        <form class="pb-4">
                            <div class="form-group text-field">
                                <input type="text" class="form-control" id="exampleInputFirstName" placeholder=" " required>
                                <label class="style-lable">First Name</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="text" class="form-control" id="exampleInputLastName" placeholder=" " required>
                                <label class="style-lable">Last Name</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder=" " required>
                                <label class="style-lable">Email</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder=" " required>
                                <label class="style-lable">Password</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="password" class="form-control" id="exampleInputPasswordConfirm" placeholder=" " required>
                                <label class="style-lable">Confirm Password</label>
                            </div>
                            <div class="form-check text-left">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label text-black font-15" for="exampleCheck1">I accept the Terms and Conditions and agree with them.                    </label>
                            </div>
                            <button type="submit" class="btn btn-custom-lg-signup btn-block mt-4">Sign Up</button>
                        </form>
                        <div class="row ">
                            <div class="col-12">
                                <p class="font-15">Already have an account? <a href="#" class="sign-in">Sign In now!</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery.easing.min.js"></script>
        <!-- BackSlideShow -->
        <script src="js/jquery.backstretch.min.js"></script>
        <script>
            $.backstretch(["images/bg.jpg"], {
                duration: 3000,
                fade: 750
            });

            // Toggle plus minus icon on show hide of collapse element
            $(".collapse").on('show.bs.collapse', function () {
                $(this).parents(".question-box").find(".fa").removeClass("fa-plus").addClass("fa-minus");
                $(this).parents(".question-box").removeClass("inactive-question").addClass("border border-secondary")
            }).on('hide.bs.collapse', function () {
                $(this).parents(".question-box").find(".fa").removeClass("fa-minus").addClass("fa-plus");
                $(this).parents(".question-box").addClass("inactive-question").removeClass("border border-secondary")
            });

            $(document).ready(function () {
                $(".navbar-toggle").click(function (e) {
                    $("#navigations").toggleClass('show-menu');

                    e.stopPropagation();
                });
                $(document).click(function (e) {
                    if (!$(e.target).is('#navigations, #navigations *')) {
                        if ($("#search-bar").css("visibility") === "hidden") {
                            $("#navigations").removeClass('show-menu');

                        }
                    }
                });
            });


            $(document).ready(function () {
                $(".sign-up").click(function (e) {
                    $('#exampleModalCenter').modal('hide')

                });
                $(".sign-in").click(function (e) {
                    $('#exampleModalCenter-1').modal('hide');
                    $('#exampleModalCenter').modal('show')

                });
            });

        </script>
        <script>
            $(document).ready(function () {
                setTimeout(function () {
                    $('tspan').each(function () {
                        if ($(this).text() == "Simplemaps.com Trial") {
                            $(this).css("display", "none");
                        }
                    });
                }, 100);

                $(window).resize(function () {
                    setTimeout(function () {
                        $('tspan').each(function () {
                            if ($(this).text() == "Simplemaps.com Trial") {
                                $(this).css("display", "none");
                            }
                        });
                    }, 350);
                })

            });
        </script>
        <script>
            $('#exampleModalCenter, #exampleModalCenter-1').on('show.bs.modal', function (e) {
                $('body, header').addClass('test');
            });


            (function ($) {

                'use strict';

                function toggleMenu(state) {
                    if (state == "on") {
                        $('#navigations').slideDown();
                        $('body').addClass('maun-open');
                    } else if (state == "off") {
                        $('#navigations').slideUp();
                        $('body').removeClass('maun-open');
                    }
                }

                function initSmoothLink() {
                    $('.navigation-menu a').on('click', function (event) {
                        var $anchor = $(this);
                        $('html, body').stop().animate({
                            scrollTop: $($anchor.attr('href')).offset().top - 0
                        }, 1500, 'easeInOutExpo');
                        event.preventDefault();
                    });
                }
                function initDropdownMenu() {
                    $(document).on('click', ".darkheader .dropdown", function (event) {
                        //event.preventDefault();
                        $(this).toggleClass("sub-menu-opened");
                    });
                }

                function initScrollspy() {
                    $("#navigations").scrollspy({ offset: 70 });
                }

                //navigation-v2 code

                function init() {
                    initScrollspy();
                    initDropdownMenu()
                }
                init();


            })(jQuery)

        </script>
    </form>
</body>
</html>