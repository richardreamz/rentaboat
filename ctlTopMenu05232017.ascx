﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlTopMenu.ascx.cs" Inherits="ctlTopMenu" %>
  


 

<%--   
    Manoj
    <script src="js/jquery.carouFredSel-6.2.0.js"></script>
    <script src="js/owl.carousel.js"></script>--%>


    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->




     <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&Key=AIzaSyDUasdm918z0Cm88TSAymH85w_MVYK95Nk"></script>
     
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
     
	
	
 <script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	
 <script src="js/myscript.js" type="text/javascript"></script>


        <script>	
            //Manoj
			//$(window).load( function(){
			//	//	Responsive layout, resizing the items
			//	$('#carousel1').carouFredSel({
			//	    responsive: true,
			//		auto: false,		
			//		scroll: 1,
			//		width: '100%',	
            //        direction: 'up',
            //        next: "#next",
			//		pagination: false,
			//		mousewheel: false,
			//		items: {
			//		  width: 270,
			//		  height: 'auto',	//	optionally resize item-height
			//			visible: {
			//				min: 1,
			//				max: 1
			//			}
			//		}
			//	});
                
			//});
    </script>
    
    <script>	
        //$(document).ready(function() {
            
        //$('.list2 li a').hover(function(){
        //    $(this).stop().css({color:'#b6b6b6'});         
        //    $(this).parent().siblings('em').find('img').stop().css({'margin-top':'-7px'});   
        //        }, function(){
        //    $(this).stop().css({color:'#c11030'});         
        //    $(this).parent().siblings('em').find('img').stop().css({'margin-top':0});       
        //})
                     
        //    ////////////
        //        var owl = $("#owl-demo");
                         
        //       $(".next").click(function(){
        //            owl.trigger('owl.next');
        //          })
        //          $(".prev").click(function(){
        //            owl.trigger('owl.prev');
        //          })
             
        //      $("#owl-demo").owlCarousel({
                
        //          //navigation : true,
                  
        //          items : 4,
        //          itemsDesktop : [1220,4],
        //          itemsDesktopSmall : [979,3],
        //          itemsTablet :	[750,2],
        //          itemsTabletSmall	:	[550,2],
        //          itemsMobile :	[470,1]
        //      });
        //});
        
    </script>





   <style>

   .ar{ float: right; }
.al{ float: left;}
.clear{ clear: both;}


.form1{ background-color:white; padding: 5px; }

.form1 .title{ min-width: 100px; display: inline-block; }


.button{ display: inline-block; background: #000; padding:0px 0px; z-index: 0; color: #fff; background-color:#FF9933;}
.overlay{ z-index:5; background: rgba(0, 0, 0, .50); display: block; position:fixed; width: 100%; height: 100%; }

.popup{ padding: 20px 10px 35px; background: white; z-index: 999; display: none; position: absolute; right: 10px; margin-top:30px; font-size:12px;border: 1px solid #2E2828;}
#footer{ position: fixed; bottom: 0; background: #fff; width: 100%; font-size: 12px; text-align: center; }
#footer div{ padding: 5px; }

.close{ font-weight: bold; color:#337ab7!important; float: right;  background-color:white!important;opacity:1!important }
    </style>



<asp:ScriptManager ID="scm1" runat="server" EnablePageMethods="true">

     <Services>
         <asp:ServiceReference Path="~/LoginAuth.asmx" />

     </Services>

 </asp:ScriptManager>

<script>

   

        function showLoginBox()
        {
          
           

            if ($('#<%=lblLoginLogout.ClientID%>').html() == "Sign in")
                {
            $("body").append(''); $(".popup").show();
            $('#lblLoginMessage').html("");
            $(".close").click(function (e) {
                $(".popup, .overlay").hide();
            });
            }
            else
            {
                //Sign Out

                 __doPostBack('<%= btnSignIn.UniqueID%>', 'btnSignIn');

            }


        }

        function CloseLoginBox()
        {

            $(".popup, .overlay").hide();

            return false;
        }

        function TryLogin()
        {
            var username = document.getElementById('<%= txtLoginName.ClientID%>').value;
            var password = document.getElementById('<%= txtPassword.ClientID%>').value;

            if (password.length == 0)
            {
                $('#ctlTopMenu_lblLoginMessage').html("Failed to Login");
                return false;
            }

        

            LoginAuth.ValidateLogin(username, password, OnSuccess);

            //PageMethods.ValidateLogin(username, password, OnSuccess);
            return false;

        }

        function OnSuccess(result)
        {
           
        
        

            if (result == "Failed") {
                

                $('#ctlTopMenu_lblLoginMessage').html("Failed to Login");
            }
            else {
                $('#lblLoginMessage').html("");
                document.forms[0].__EVENTTARGET.value = '<%= btnSignIn.UniqueID%>';
                __doPostBack('<%= btnSignIn.UniqueID%>', 'btnSignIn');
            }
          


        }
    </script>


		<div class="full_width top_line clearfix" >
						<div class="row">
                          
                            <asp:UpdatePanel ID="uplLogin" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                      <div>
                                        <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        
                                    </div>
 <div align="right"><a href="admin/BoatOwnerSignup.aspx">List Your Boat /</a>

                               
                    		 <div class="login_popup" style="float:right;">
                                <div class="col-lg-12 col-sm-12" align="right" >
                                    <asp:LinkButton ID="lnkUsername" runat="server" OnClick="lnkUsername_Click" Text=""></asp:LinkButton>
                                    <a  onclick="showLoginBox()" runat="server" > 
                                   <asp:Label ID="lblLoginLogout" runat="server"></asp:Label>
                                    </a> </div>
                          
                     
                         <div class="popup" runat="server" id="loginPopupDiv" >
                            <a href="#" class="close" style="float:right;" onclick="return CloseLoginBox();">[X]</a>
                            <div class="form1">
                                <span style="color:black;">Username:</span><asp:TextBox ID="txtLoginName" runat="server" style="background-color:white!important;color:black!important;width:150px!important"></asp:TextBox><br /><br />
                                <span style="color:black;">Password:</span> <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  style="background-color:white!important;color:black!important;width:150px!important;" CssClass="clspass"></asp:TextBox>
                           <br />
                                <div align="right">
                              
                                    <asp:Button ID="btnSignIn" runat="server"  Text="Sign In"  OnClientClick="return TryLogin();" OnClick="btnSignIn_Click" style="margin-top:10px;color:black!important;"/>
                             <br />
                                    <br />
                                <p style="text-align:center;font-size:11px;">
                                    <a href="forgotpassword.aspx" style="color:#248992!important;text-decoration:underline!important">Forgot your password?</a> &nbsp;|&nbsp; <a href="./Admin/BoatOwnerSignup.aspx"  style="color:#248992!important;text-decoration:underline!important">Boat Owner Sign Up</a>
                                </p>
                                     
                                <asp:Label ID="lblLoginMessage" runat="server" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                
                                    </div>
                            </div>
                        </div>
                                         
                        
                        </div>

                             </ContentTemplate>

                            </asp:UpdatePanel>

					</div><!-- //TOP LINE -->
                    </div>

</div>



<div class="menu_block clearfix" >
        <div class="navbar-brand">
            <asp:HyperLink ID="lnkGoHome" runat="server" NavigateUrl="~/index.aspx"  >
            <img src="img/logo.png" alt="Rent A Boat"/>
                </asp:HyperLink>

            <div class="navbar-brand2">
            
            <img src="img/logo-blue.png" alt="Rent A Boat"/>

            </div>

        </div>
        <!-- RESPONSIVE BUTTON MENU -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="glyphicon glyphicon-align-justify"></span>
							</button>
						</div><!-- //RESPONSIVE BUTTON MENU -->
                        
           <div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
                  <li class="active"><a href="index.aspx">HOME</a></li>
                  <li class="sub-menu"> <a> RENTERS<em class="indicator2"></em></a>
                       <ul>
                       		<li><a href="renter_faqs.aspx">FAQ's</a></li>
                          	<li><a href="how_to_rent_a_boat.aspx">How To Rent</a></li>
                           	<%--**##**<li><a class="last" href="renters-sign-in.html">Sign In</a></li>--%>
                       </ul>
                  </li>
                  <li class="sub-menu"> <a> LIST YOUR BOAT<em class="indicator2"></em></a>
                  		<ul>                           
							<li><a href="./admin/BoatOwnerSignup.aspx">List Your Boat</a></li> 
                             
                            <li><a href="owners-faqs.html">FAQ's</a></li>
                            <li><a class="last" href="MemberSignIn.aspx">Sign in</a></li>
                        </ul>                                     
                  </li>
                  <li ><a href="about-us.html">ABOUT US</a></li>
                  <li class="sub-menu"><a> HOW IT WORKS<em class="indicator2"></em></a>
                        <ul>
                          <li><a href="how-It-works.html">How it Works</a></li>
                          <li><a href="renting-vs-owning.html">Renting vs. Owning</a></li>
                          <li><a href="rental-tips.html">Rental Tips</a></li>
                          <li><a class="last" href="marine-liability-insurance.html">Marine Liability Insurance</a></li>
                        </ul>
                   </li>
                  <li><a href="contact_us.aspx">CONTACT US</a></li>
                </ul>
            </div>
        </div>  
       



 <script type="text/javascript">
            //Bind keypress event to textbox
     $('#ctlTopMenu_txtPassword').keypress(function (event) {

        
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                   
                    event.stopPropagation();
                
                    TryLogin();

                    


                }
                //Stop the event from propogation to other handlers
                //If this line will be removed, then keypress event handler attached
                //at document level will also be triggered
               // event.stopPropagation();


            });
             


     $('#ctlTopMenu_txtLoginName').keypress(function (event) {
         var keycode = (event.keyCode ? event.keyCode : event.which);
         if (keycode == '13') {

             if ($('#ctlTopMenu_txtPassword').val().length == 0)
             {
                 $('#ctlTopMenu_lblLoginMessage').html("Enter Password.");
                
                 return false;
             }


             event.stopPropagation();

             TryLogin();




         }
         //Stop the event from propogation to other handlers
         //If this line will be removed, then keypress event handler attached
         //at document level will also be triggered
         // event.stopPropagation();


     });


            //Bind keypress event to document
            //$(document).keypress(function(event){
            //    var keycode = (event.keyCode ? event.keyCode : event.which);
            //    if(keycode == '13'){
            //        alert('You pressed a "enter" key in somewhere');   
            //    }
            //});
        </script>

