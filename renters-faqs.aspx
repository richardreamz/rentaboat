<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    <link rel="stylesheet" href="css/bootstrap.css" >
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fonts/font-awesome.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    
	<script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/jquery.touchSwipe.min.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    
    
    <script src="js/jquery.carouFredSel-6.2.0.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/jquery.touchSwipe.min.js"></script>    
    
    <script>
        $(window).load(function () {
            //	Responsive layout, resizing the items
            $('#carousel1').carouFredSel({
                responsive: true,
                auto: false,
                scroll: 1,
                width: '100%',
                direction: 'up',
                next: "#next",
                pagination: false,
                mousewheel: false,
                items: {
                    width: 270,
                    height: 'auto',	//	optionally resize item-height
                    visible: {
                        min: 1,
                        max: 1
                    }
                }
            });

        });
    </script>
    
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
            var owl = $("#owl-demo");

            $(".next").click(function () {
                owl.trigger('owl.next');
            })
            $(".prev").click(function () {
                owl.trigger('owl.prev');
            })

            $("#owl-demo").owlCarousel({

                //navigation : true,

                items: 4,
                itemsDesktop: [1220, 4],
                itemsDesktopSmall: [979, 3],
                itemsTablet: [750, 2],
                itemsTabletSmall: [550, 2],
                itemsMobile: [470, 1]
            });
        });

    </script>
    
    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->
<style>
    header {
	text-align: center;
	background: #5CB5BE url(images/Depositphotos_5732720_s.png) top center no-repeat;
    background-size: cover ;
    background-color: white;

}
    body {
    background-color: white;
}

</style>
</head>
<body>
<!--==============================header=================================-->
<header id="header">
        <div>
            <nav class="navbar navbar-default navbar-static-top tm_navbar" role="navigation">
<h1 style="text-align: left;"><span style="font-family: 'Verdana'; font-size: 20px; color: rgb(255, 255, 255);"><i>RENTABOAT</i></span></h1>
                <ul class="nav sf-menu">
                  <li><a href="index.aspx">HOME</a></li>
                  <li class="active"><a href="#">RENTERS<em class="indicator1"></em></a>
                        <ul>
                          <li><a href="#">FAQ's</a></li>
                          <li><a href="how_to_rent_a_boat.aspx">How To Rent</a></li>
                       </ul>
                  </li>
                  <li><a href="#">OWNERS<em class="indicator1"></em></a>
                        <ul>
                          <li><a href="owners-faqs.html">FAQ's</a></li>
                          <li><a href="rentwithus.aspx">How to List Boat<em class="indicator2"></em></a>
                            <ul>
                               <li><a href="MemberSignInNew.aspx">Sign in</a></li>
                               <li><a class="last" href="#">Sell Your Boat</a></li>                       
                            </ul>
                          </li>
                          <li><a href="#">members.aspx</a></li>
                        </ul>
                      </li>
                  <li><a href="about-us.html">ABOUT US</a></li>
                  <li><a href="#">HOW IT WORKS<em class="indicator1"></em></a>
                        <ul>
                          <li><a href="#">How it Works</a></li>
                          <li><a href="#">Renting vs. Owning</a></li>
                          <li><a href="#">Rental Tips</a></li>
                          <li><a class="last" href="#">Marine Liability Insurance</a>
                          </li>
                        </ul>
                      </li>
                  <li><a href="contact_us.aspx">CONTACT US</a></li>
                </ul>
            </nav>
        </div>
        <div class="row_header1">
            <span style="font-family:'Verdana';font-size:48px;color:#ffffff;">Frequently Asked Questions by Boat Renters</span>
        </div>  
</header>
<!--==============================content=================================-->
<div">
    <!--==============================row_1=================================-->
   <div class="container">
       <div class="row">
       <div>
          <div class="col-md-2">
            <br><img src="images/images.jpeg" style="height: 354px;"> 
          </div>
            <div class="col-md-8">
              <br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: What is RentABoat?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: Renters can view rates, availability, live photos, and reserve a boat in one simple click! </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: How does it work?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: An online boat renting site! We are here to connect boat renters to boat owners. No experience needed! </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: Who owns the boats?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A:  Private boat owners and boat renting facilities. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: Is this a boat club? Do I need a membership?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: No, anyone can use RentABoat.com. You do not have to be a member to search boats. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: What fees will boat renters need to pay?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: We are a FEE FREE online reservation site! No membership is required. Rent A Boat is not a club! Renters can search boats without signing in! There is a deposit to hold your desired boat, this fee will be deducted from your rental price. The boat owner can require an additional deposit to hold your boat. Boat owners will post their rules and requirements. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: Do I have to contact the boat owner before my rental date?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: Boat owners will receive your contact information. They are required to contact you within 24 hours. Renters will also receive the boat owners contact information. If you, the renter or boat owner have any communication problems, our staff will be available 24/7 to help assist you. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: Are the online boat reservation calendars live and accurate?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: Yes, boat owners are encouraged to use our computerized program as their in-house reservation system, keeping the reservation calendars accurate. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: How do I know the boat I am reserving will look like the boat in the photo?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: Owners are required to post up to date photos of their boat. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: Do I need a boating license in order to rent a boat?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: Some boat owners and states will require you to have a boating license. Boat owners will post their rules and requirements. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: What is the refund policy?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: If you're not 100% satisfied with your rental, you online reservation deposit will be refunded. </span>
              <br><br><span style="font-family:'Verdana';font-size:16px;color:#ff0000;">Q: What is the cancellation policy?</span>
                <span style="font-family:'Verdana';font-size:16px;color:#000000;">
                <br>A: Boat owners have their cancellation policy. Please review the listed cancellation policies before making a reservation. </span>
              <br><br><p style="text-align:center;"><span style="font-family:'Verdana';font-size:18px;color:#000000;"><i>Have more questions? Feel free to contact RentABoat.com! </i></span></p>
            </div>
       </div>
      </div>    
    </div>
  </div>
    <!--==============================row_2=================================-->
    <!--==============================row_3=================================-->
    <!--==============================row_4=================================-->
<!--==============================footer=================================-->
<!--<footer>
    <div class="container">
        <div class="linemap">
            <img class="imgmapsmall" src="img/mapsmall.png" alt="">
            <span class="extraline1"></span>
            <figure></figure>
            <span class="extraline2"></span>
        </div>
        <a class="smalllogo" href="index-1.html"><img src="img/smallogo.png" alt="travel booking"></a>
        <p class="footerpriv">&copy; <span id="copyright-year"></span> <img src="img/line3.png" alt=""> <a class="privacylink" href="index-5.html">Privacy Policy</a>More <a rel="nofollow" href="http://www.templatemonster.com/category/travel-agency-website-templates/" target="_blank">Travel Agency Website Templates at TemplateMonster.com</a></p>         
    </div>
</footer>-->
<script src="js/bootstrap.min.js"></script>
<script src="js/tm-scripts.js"></script>
</body>
</html>