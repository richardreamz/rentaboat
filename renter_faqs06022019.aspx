<%@ Page language="C#" CodeFile="renter_faqs.aspx.cs" Inherits="BoatRenting.renter_faqs_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Register Src="~/ctlSearch.ascx" TagPrefix="uc1" TagName="ctlSearch" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Boat Renters FAQs - RentABoat</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Everything a boat renter needs to know about renting a boat.">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    
    <script src="js/googletracking.js" type="text/javascript"></script>

    
    
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
    
   
    <script type='text/javascript'>
window.__lo_site_id = 153732;

	(function() {
		var wa = document.createElement('script'); wa.type = 'text/javascript'; wa.async = true;
		wa.src = 'https://d10lpsik1i8c69.cloudfront.net/w.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wa, s);
	  })();
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
				
    <form runat="server" id="frmSearch">        
        
        
            
<header id="header">
<!-- TOP LINE -->
			
  <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

<!--==============================content=================================-->

  
            
      <div class="container" >
      	<div class="row_header-rentFAQ" align="center" style="height:500px!important;">
        <h1 class="white">Frequently Asked Questions by Boat Renters</h1>
		   		<div style="width:65%; margin-left:auto; margin-right:auto"><hr /></div>
        
        	<h3  style="color:#fff;">Find Boat Rentals In Your Area Now!</h3>
              
           <uc1:ctlSearch runat="server" ID="ctlSearch" />
            
            <div class="row" >
              <div class="col-lg-12 col-sm-12 padbot20">
               <h2 style="color:#fff; font-size:24px;">If you are not able to locate your question/answer below,<br>please email <a href="mailto:Info@RentABoat.com" style="color:#ffffff;">Info@RentABoat.com</a> or call us at 1-888-610-BOAT (2628)</h2> 
            </div></div>       
      </div>         
	</div>

</header>


<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
        
<div class="row">
          <div class="col-md-2">
            <br> 
          </div>
            <div class="col-md-8"> <br><br>
               <h4 class="red">Q: What is RentABoat?</h4>
        <p><strong>A:</strong> We think renting boats worldwide should be easy and fun. Rentaboat.com lets you easily search for the perfect boat rental in the most popular destinations with real time availability, current photos, boat rental rates and more. It’s up to you if you want a captain or guide as most of our rental boats are available with or without.

</p>
            

               <h4 class="red">Q: Who owns the boats?</h4>
                <p><strong>A:</strong> Private boat owners and boat renting facilities.
 </p>

              <h4 class="red">Q: Is this a boat club? Do I need a membership?</h4>
                <p><strong>A:</strong> No, anyone can use RentABoat.com. You do not have to be a member to search for and rent boats in our boat rental network. Once you rent a boat with us, you can sign in using your email and password to view upcoming and past boat rentals anytime. 
 </p>
       
 
              <h4 class="red">Q: Do I have to contact the boat owner before my boat rental date?</h4>
                <p><strong>A:</strong> When you request to book a boat, the boat owner will receive your contact information. We require boat owners to contact you within 24 hours via email or phone. Renters will also receive the boat owner’s contact information. If there are any communication problems our staff is available 24/7 to assist you.
</p>
            
              <h4 class="red">Q: What fees will boat renters need to pay?</h4>
                <p><strong>A:</strong> RentAboat.com is a hassle-free online boat rental reservation site. There are no annual or monthly fees. Boat renters can search boat rental pages where they can view boat details, rates, availability, current photos and reserve a boat. The boat owner can require additional deposits and fees to rent their boat. All of the details will be on the individual boat rental pages.</p>
              
              
              <h4 class="red">Q: Are the online boat reservation calendars live and accurate?</h4>
                <p><strong>A:</strong> Yes. Boat owners are encouraged to use our program as their in-house reservation system. This allows boat owners to easily keep their reservation calendars up-to-date and accurate.</p>
            
              <h4 class="red">Q: How do I know the boat I am reserving will look like the boat in the photo?</h4>
                <p><strong>A:</strong> Owners are encouraged to post current photos of their boat.</p>
          
              <h4 class="red">Q: Do I need a boating license to rent a boat?</h4>
                <p><strong>A:</strong> Some boat owners and states do require that you to have a boating license. You can find this information on your desired boat rental page.</p>
             
              <h4 class="red">Q: What is the refund policy?</h4>
                <p><strong>A:</strong> If you're not 100% satisfied with your boat rental, your online booking fee will be refunded. If the boat you requested to book is not available, your booking fee will be refunded. </p>
             
              <h4 class="red">Q: What is the cancellation policy?</h4>
                <p><strong>A:</strong> Boat owners control their cancellation policies. They are listed on the boat information page. Please carefully review the listed cancellation policies before requesting to book the boat. You will be held to the policy listed by the boat owner.</p>
           
              <p style="text-align:center;"><i>Have more questions? Feel free to contact RentABoat.com!</i></p>
             </div>
   </div>
</div>     

</form>
<!-- FOOTER -->
    
    <uc1:ctlFooter runat="server" ID="ctlFooter" />

		


</body>
</html>