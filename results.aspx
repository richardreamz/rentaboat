<%@ Page language="C#" CodeFile="results.aspx.cs" Inherits="BoatRenting.results_aspx_cs" Debug="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!doctype html>
<html lang="en">
  <head>
       
    <!-- Required meta tags -->
         <asp:PlaceHolder ID="phMetaDesc" runat="server">

    </asp:PlaceHolder>
        <asp:PlaceHolder ID="phTitle" runat="server"></asp:PlaceHolder>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <link href="css/styleN.css" rel="stylesheet">

    <title>Rent A Boat</title>

      
      
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWHiLBM1hzypiPVydCCSLoYbRPMbG2C-M&libraries=places" ></script>


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

           <%-- autocomplete1 = new google.maps.places.Autocomplete(
             /** @type {HTMLInputElement} */(document.getElementById("<%=txtSearch1.ClientID%>")),
               { types: ['geocode'] });
            // When the user selects an address from the dropdown,
            // populate the address fields in the form.
            google.maps.event.addListener(autocomplete1, 'place_changed', function () {
                fillInAddress1();
            });--%>

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

  </head>
  <body class="body">
     <form runat="server" id="frmSearch"> 
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
                        <a class="nav-link dropdown-toggle" href="how-It-works.html" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WHY RENTING</a>
                        <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                          <a class="dropdown-item" href="renting-vs-owning.aspx" >Renting vs. Owning</a>
                          <a class="dropdown-item" href="rental-tips.html" >Rental Tips</a>
                          
                        </div>
                    </li>
                      <li class="">
                          <a href="about-us.html" >ABOUT US</a>
                      </li>
                      <li class="">
                          <a href="contact_us.aspx" >Contact Us</a>
                      </li>
                      <li class="">
                        <button data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-custom align-nav" style="padding: 8px 25px;margin-top: 22px;" onclick="javascript:return false;">SIGN IN</button>
                      </li>
                  </ul>
              </div>
                <div class="searchbar">
                    <div class="text-center search-form">
                        <div  class="form-on-scroll">
                            <input type="text" placeholder="Where would you like go boating?" runat="server" id="txtSearch" >
                            <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch" onserverclick="btnSearch_Click"> <i class="fas fa-search pr-0 pr-lg-2"></i> <span class="d-none d-lg-inline">SEARCH</span></button>
                        </div>
                        <div class="menu-on-scroll">
                            <button class="btn btn-custom align-nav" data-toggle="modal" data-target="#exampleModalCenter" onclick="javascript:return false;">SIGN IN</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
  </header>


  <section id="service" class="section pb-4">
    <div class="container search-container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="title-head text-center">
                    <h2 class="text-capitalize pt-5 pb-4">Search Results</h2>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mb-3">
        
            <div class="col-md-4 align-self-center">
                <div class="text-center text-md-right">
                    <p class="font-12 m-0"> Results Found</p>
                </div>
            </div>
        </div>


        <asp:Repeater ID="rpBoatList" runat="server">
            <ItemTemplate>


                  <div class="row result-bg text-center text-md-left">
            <div class="col-md-2 pb-3 pb-md-0 pr-0">
                <div class="avtivity-img">
                    <a class="" href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>
                        <img class="img-fluid" width="160" src="./boats/<%# DataBinder.Eval(Container.DataItem, "FileName") %>" alt="<%# DataBinder.Eval(Container.DataItem, "FilenameDescription") %>" /></a>
                </div>
            </div>
         
            
            <div class="col-md-7 col-lg-8 align-self-center pl-3 pl-lg-1">
                <div class="row">
                    <div class="col-md-9">
                        <div class="result-info">
                            <p class="font-13"><b>Location:</b>  <%# DataBinder.Eval(Container.DataItem, "State") %>, <%# DataBinder.Eval(Container.DataItem, "City") %>,  <%# DataBinder.Eval(Container.DataItem, "Zip") %>, <%# DataBinder.Eval(Container.DataItem, "BodyOfWater") %>  </p>
                            <p class="font-13"><b>Make & Model:</b> <%# DataBinder.Eval(Container.DataItem, "Make") %>, <%# DataBinder.Eval(Container.DataItem, "Year") %>, <%# DataBinder.Eval(Container.DataItem, "Model") %> </p>
                            <p class="font-13"><b>Rental Type:</b> <span class="color-blue">
                               <%# getRentalType(DataBinder.Eval(Container.DataItem, "Captain").ToString())	 %>

                                                                   </span></p>
                            <p class="font-13"><b>Max Passengers:</b> <%# DataBinder.Eval(Container.DataItem, "MaximumPassengers") %></p>
                            <ul class="list-inline small mb-3 mb-md-0">
                                <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 align-self-center">
                        <div class="price-tag text-center">
                            <small class="">From USD</small>
                            <h5><%# DataBinder.Eval(Container.DataItem, "Currency") %><%# formattedAmount(DataBinder.Eval(Container.DataItem, "Amount").ToString(), DataBinder.Eval(Container.DataItem, "Currency").ToString()  )	 %></h5>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-3 col-lg-2 align-self-center">
                <a  class="btn btn-custom-lg btn-block text-uppercase" href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>More Info</a>
            </div>
        </div>






            </ItemTemplate>


        </asp:Repeater>

          
 <asp:Button ID="btnShowDetails" runat="server" style="visibility: hidden; display: none;" OnClick="btnGoDetails_Click" UseSubmitBehavior="false" />
                



         <div class="mt-5 mb-5" aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
        <asp:Repeater ID="rptPagerBottom" runat="server">
    <ItemTemplate>
     <li class='<%# Convert.ToBoolean(Eval("Enabled")) ? "page-item" : "page-item disabled" %>'>   <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page-link page_enabled" : "page-link page_disabled" %>'
            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
   </li>
         
         </ItemTemplate>
</asp:Repeater>
 </ul>
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
</section>


<section class="section bg-gradient pb-4 pt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 text-center text-lg-left">
                <div class="footer-info">
                   <a href="index.aspx"> <img src="images/logo-light.png" class="img-fluid" width="200"> </a>
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
                            <select class="form-control" id="exampleFormControlSelect1">
                              <option selected style="color: black;"> Select Language</option>
                              <option style="color: black;">English</option>
                              <option style="color: black;">French</option>
                            </select>
                          </div>
                    </div>
                </div>
            </div>

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
                <p>Copyright 2021 Rent A Boat, RentABoat.com | 320 South Country's Rd. Brookhaven NY, 11719</p>
            </div>
            <div class="col-lg-4 footer-end text-center text-lg-right">
                <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
            </div>
        </div>
    </div>
</section>

<!-- MOdal SIgn in Sign Up -->

  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body text-center padding-5">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="far fa-times-circle"></i>
              </button>
            <h1 class="pb-4"> Sign In</h1>
            <form class="pb-5">
                <div class="form-group text-field">
                  <input type="text" class="form-control" id="exampleInputEmail12" placeholder=" "  required>
                  <label class="style-lable">Email</label>
                </div>
                <div class="form-group text-field">
                  <input type="password" class="form-control" id="exampleInputPassword12" placeholder=" " required>
                  <label class="style-lable">Password</label>
                </div>
                <div class="form-check text-right forgot-password">
                  <a href="#" class="form-check-label">Forgot Password?</a>
                </div>
                <button type="submit" class="btn btn-custom-lg-signup btn-block mt-4">Sign In</button>
              </form>
              <div class="row ">
                  <div class="col-12">
                    <p class="mb-4 font-15">Or Choose one of the following sign in methods.</p>
                  </div>
                  <div class="col-sm-6">
                    <button type="submit" class="btn btn-fb btn-block mb-3 mb-sm-0"><i class="fab fa-facebook-f pr-2"></i> Facebook</button>
                  </div>
                  <div class="col-sm-6">
                    <button type="submit" class="btn btn-google btn-block"><i class="fab fa-google pr-2"></i> Google</button>
                  </div>
                  <div class="col-12">
                    <p class="pt-4 font-15">Don't have an account? <a href="#" data-toggle="modal" data-target="#exampleModalCenter-1" class="sign-up">Sign up now!</a> </p>
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
            <h1 class="pb-4"> Sign Up</h1>
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

<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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


$(document).ready(function() {
    $(".navbar-toggle").click(function(e) {
        $("#navigations").toggleClass('show-menu');

        e.stopPropagation();
    });
    $(document).click(function(e) {
        if (!$(e.target).is('#navigations, #navigations *')) {
        $("#navigations").attr('class', '');
        }
    });
});


$(document).ready(function() {
    $(".sign-up").click(function(e) {
        $('#exampleModalCenter').modal('hide')
        
    });
    $(".sign-in").click(function(e) {
        $('#exampleModalCenter-1').modal('hide');
        $('#exampleModalCenter').modal('show')
        
    });
});
    
</script>
    <script>
    $(document).ready(function() {
        setTimeout(function() {
            $('tspan').each(function() {
                if ($(this).text() == "Simplemaps.com Trial") {
                    $(this).css("display", "none");
                }
            });
        }, 100);

        $(window).resize(function() {
            setTimeout(function() {
                $('tspan').each(function() {
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


    (function($) {

    'use strict';

    function toggleMenu(state) {
        if(state == "on") {
        $('#navigations').slideDown();
        $('body').addClass('maun-open');
        } else if(state == "off") {
        $('#navigations').slideUp();
        $('body').removeClass('maun-open');
        }
    }

    function initSmoothLink() {
        $('.navigation-menu a').on('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top - 0
            }, 1500, 'easeInOutExpo');
            event.preventDefault();
        });
    }
    function initDropdownMenu() {
        $(document).on('click',".darkheader .dropdown", function(event) {
            event.preventDefault();
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

</script>--%>
    
  </body>
</html>

