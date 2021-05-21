<%@ Page Language="C#" AutoEventWireup="true" CodeFile="how_to_rent_a_boat.aspx.cs" Inherits="BoatRenting.how_to_rent_a_boat_aspx_cs" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Everything a boat renter needs to know about renting a boat.">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/styleN.css" rel="stylesheet">
    <title>Contact Us - Rent A Boat</title>
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
                        <a href="index.html" class="logo text-uppercase">
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
                                <li class="active nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">RENT a Boat</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="renter_faqs.aspx">FAQ's</a>
                                        <a class="dropdown-item" href="how_to_rent_a_boat.aspx">How To Rent</a>
                                    </div>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">LIST YOUR BOAT</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="./admin/BoatOwnerSignup.aspx">List Your Boat</a>
                                        <a class="dropdown-item" href="owners-faqs.html">FAQ's</a>
                                        <a class="dropdown-item" href="MemberSignIn.aspx">Sign in</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown ">
                                    <a class="nav-link dropdown-toggle" href="how-It-works.html" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">HOW IT WORKS</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="how-It-works.html">How it Works</a>
                                        <a class="dropdown-item" href="renting-vs-owning.html">Renting vs. Owning</a>
                                        <a class="dropdown-item" href="rental-tips.html">Rental Tips</a>
                                        <a class="dropdown-item" href="marine-liability-insurance.html">Marine Liability Insurance</a>
                                    </div>
                                </li>
                                <li class="">
                                    <a href="about-us.html">ABOUT US</a>
                                </li>
                                <li class="">
                                    <a href="contact_us.aspx">Contact Us</a>
                                </li>
                                <li class="">
                                    <button data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-custom align-nav" style="padding: 8px 25px; margin-top: 22px;" onclick="javascript:return false;">SIGN IN</button>
                                </li>
                            </ul>
                        </div>
                        <div class="searchbar">
                            <div class="text-center search-form">
                                <div class="form-on-scroll">
                                    <input type="text" placeholder="Where would you like go boating?" runat="server" id="txtSearch">
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
        <section class="section pb-4">
            <div class="row mt-4">
                <div class="col-sm-3">
                    <h4>Contact Information</h4>
                    <br><h6>Address</h6>
                    <p style="font-size: 15px;">RentABoat.com<br> 320 South Country Road<br> Brookhaven, NY11719
                    </p><hr>
                        
                    <h6>Phone/Fax</h6>
                    <p style="font-size: 15px;"> 1-888-610-BOAT<br> Office: 631-286-7816<br> Fax: 631-286-7137
                    </p><hr>
                        <h6>Websites</h6>
                    <p style="font-size: 15px;"> <a href="http://www.jetskirentals.com/">http://www.jetskirentals.com/</a><br><a href="http://www.boatandmotormarine.com/">http://www.boatandmotormarine.com/</a>
                    </p>
                </div>
                <div class="col-sm-3">
                    <h4>Crew</h4>
                    <br>
                    <p style="font-size: 15px;">Kenny Hilderbrandt JR<br>
                    CEO &amp; Founder<br>
                    Ext 10 </p>
                    <p style="font-size: 15px;">Chris Phelan<br>
                    Operations of Beaver Dam Boat Basin<br>
                    Ext 14 </p>
                    <p style="font-size: 15px;">Mackenzie Burniche<br>
                    Chief Marketing Officer<br>
                    Ext 11</p>
                    <p style="font-size: 15px;">Emma LaRosa<br>Customer Service<br> Ext 12 </p>
                </div>
                <div class="col-lg-6 col-sm-6 padbot20" style="background-color: #efefef">
                    <h4>Get In Touch</h4>
                    <h6>We would love to hear from you</h6>
                    <fieldset>
                        <div class="contact-form">
                            <!-- Text input-->
                            <div class="form-group row" style="height: 40px;">
                                <label class="col-sm-2 col-form-label" for="textinput">Your Name: </label>
                                <input name="txtName" type="text" id="txtName" class="col-sm-6 form-control">
                            </div>
                            <div style="clear: both;"></div>
                            <div class="form-group row " style="height: 40px;">
                                <label class="col-sm-2 col-form-label" for="textinput">Phone: </label>
                                <input name="txtPhone" type="text" id="txtPhone" class="col-sm-6 form-control">
                            </div>
                            <div style="clear: both;"></div>
                            <div class="form-group row" style="height: 40px;">
                                <label class="col-sm-2 col-form-label" for="textinput">Email Address: </label>
                                <input name="txtEmailAddress" type="text" id="txtEmailAddress" class="col-sm-6 form-control">
                            </div>
                            <div style="clear: both;"></div>
                            <div class="form-group row" style="height: 40px;">
                                <label class="col-sm-2 col-form-label" for="textinput">Subject: </label>
                                <input name="txtSubject" type="text" id="txtSubject" class="col-sm-6 form-control">
                            </div>
                            <div style="clear: both;"></div>

                            <!-- Textarea -->
                            <div class="form-group row" style="height: 40px;">
                                <label class="col-sm-2 col-form-label" for="textarea">Message:</label>
                                <div class="controls">
                                    <textarea name="txtMessage" rows="5" cols="20" id="txtMessage" class="col-sm-8 form-control" style="height: 100px; width: 470px;"></textarea>
                                </div>
                            </div>
                            <div style="clear: both;"></div>
                            <br>
                            <div class="btn" style="margin-left: 100px; margin-top: 50px; height: 40px; background-color: #318e98">
                                <a id="lnkSubmit" style="color: white;" class="btn2" href="javascript:__doPostBack('lnkSubmit','')">Submit</a>
                            </div>
                            <br>
                            <br>
                            <span id="lblMessage" style="font-size: Medium; font-weight: bold;"></span>
                        </div>
                    </fieldset>
                </div>   
                <hr>
                <div class="col-lg-12">
                    <br>
                    <br>
                    <p>
                        RentABoat.com is a 
                    sub-corporation of Hilderbrandt Industries. For over 50 years, the 
                    Hilderbrandt family has owned and operated marine-related businesses. 
                    RentABoat.com's main operations are handled from their marina, Beaver 
                    Dam Boat Basin in Brookhaven, New York. Beaver Dam Boat Basin is a 
                    company that specializes in boat and jet ski rentals, boat services, 
                    boat storage, and boat slip leasing.
                    </p>
                </div>
                <div class="col-lg-12">
                    <iframe src="Contact%20-%20RentABoat_files/embed.html" style="border: 0; max-width: 1500px; width: 100%; height: 500px;" allowfullscreen="" frameborder="0"></iframe>
                </div>
            </div>
        </section>
        <section class="section bg-gradient pb-4 pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 text-center text-lg-left">
                        <div class="footer-info">
                            <img src="images/logo-light.png" class="img-fluid" width="200">
                            <p>"As conscious traveling Paupers we must always be concerned about our dear Mother Earth. If you think about it, you travel across her face, and She is the host to your journey; without Her we could not find the unfolding adventures that attract and feed our souls. - unknown"</p>
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
                        <p class="text-uppercase footer-title">Contact Us</p>
                        <div class="contact-us">
                            <p><i class="fas fa-phone-alt pr-2"></i><a href="tel:1-888-610">1-888-610-BOAT</a></p>
                            <p><i class="fas fa-phone-alt pr-2"></i><a href="tel:631-286-7816">631-286-7816</a></p>
                            <p><i class="fas fa-envelope pr-2"></i><a href="mailto:info@rentaboat.spam"><span>info@rentaboat.com</span></a></p>
                        </div>
                    </div>
                </div>
                <hr style="background-color: white;">
                <div class="row footer-bottom">
                    <div class="col-lg-8 text-center text-lg-left">
                        <p>© Copyright 2020 Rent A Boat, RentABoat.com | 320 South Counrty Rd Brookhaven NY 11719</p>
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
        </script>
    </form>
</body>
</html>
