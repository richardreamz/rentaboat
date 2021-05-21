<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlTopMenu.ascx.cs" Inherits="ctlTopMenu" %>
  


   

<%--    
<style>
    * { box-sizing: border-box; }
html { font-family: sans-serif; text-size-adjust: 100%; font-size: 10px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }
html, body { width: auto !important; overflow-x: hidden !important; }
body { margin: 0px; font-family: Verdana, sans-serif; font-size: 16px; line-height: 1.42857; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); background: rgb(255, 255, 255); }
button, input, optgroup, select, textarea { margin: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; color: inherit; }
input { line-height: normal; }
input, button, select, textarea { font-family: inherit; font-size: inherit; line-height: inherit; }
article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary { display: block; }
header { text-align: center; background: url("../../img/patternhead.jpg") center top / cover repeat-x rgb(28, 129, 139); }
.background-homesize { background: url("https://www.rentaboat.com/images/large-homepage3.jpg") center top / 100% 720px no-repeat; }
.top_line { padding: 7px 30px 2px; font-size: 12px; color: rgb(112, 214, 225); }
.row { margin-right: -15px; margin-left: -15px; }
a { background-color: transparent; color: rgb(51, 122, 183); text-decoration: none; }
.top_line a { font-size: 12px; color: rgb(182, 224, 229); }
.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 { position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; }
.col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 { float: left; }
.col-sm-12 { width: 100%; }
.col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 { float: left; }
.col-lg-12 { width: 100%; }
.popup { padding: 20px 10px 35px; background: white; z-index: 999; display: none; position: absolute; right: 10px; margin-top: 30px; font-size: 12px; border: 1px solid rgb(46, 40, 40); }
.close { font-weight: bold; float: right; color: rgb(51, 122, 183) !important; background-color: white !important; opacity: 1 !important; font-size: 21px; line-height: 1; text-shadow: rgb(255, 255, 255) 0px 1px 0px; }
.form1 { background-color: white; padding: 5px; }
textarea, input[type="text"], input[type="email"], input[type="search"], input[type="password"] { -webkit-appearance: none; height: 22px; width: 260px; }
button, html input[type="button"], input[type="reset"], input[type="submit"] { -webkit-appearance: button; cursor: pointer; }
p { margin: 0px 0px 24px; font-family: Verdana, sans-serif; font-size: 16px; line-height: 26px; color: rgb(51, 51, 51); padding: 0px; }
.menu_block { position: relative; z-index: 100; margin: 0px -30px; text-align: center; height: 80px; }
.navbar-brand, .navbar-nav > li > a { text-shadow: rgba(255, 255, 255, 0.25) 0px 1px 0px; }
.navbar-brand { float: left; height: 62px; padding: 15px; font-size: 18px; line-height: 20px; display: block; position: relative; margin: 0px auto 3px; top: 6px; left: 8px; }
img { border: 0px; vertical-align: middle; max-width: 100%; }
.navbar-brand img { max-width: 370px; width: 100%; }
.navbar-brand2 { display: none; }
.navbar-header { float: left; }
button { overflow: visible; }
button, select { text-transform: none; }
.navbar-toggle { position: relative; float: right; padding: 9px 10px; margin-top: 8px; margin-right: 15px; margin-bottom: 8px; background-color: transparent; background-image: none; border: 1px solid transparent; border-radius: 4px; display: none; }
.glyphicon { position: relative; top: 1px; display: inline-block; font-family: "Glyphicons Halflings"; font-style: normal; font-weight: 400; line-height: 1; -webkit-font-smoothing: antialiased; }
.collapse { display: none; visibility: hidden; }
.navbar-collapse { padding-right: 0px; padding-left: 0px; overflow-x: visible; border-top: 0px; box-shadow: none; width: auto; float: none; border: 0px; }
.navbar-collapse.collapse { padding-bottom: 0px; display: block !important; height: auto !important; overflow: visible !important; visibility: visible !important; }
ul, ol { margin-top: 0px; margin-bottom: 10px; }
.nav { padding-left: 0px; margin-bottom: 0px; list-style: none; }
.navbar-nav { margin: 0px; float: none; }
.nav > li { position: relative; display: block; }
.navbar-nav > li { float: left; }
.navbar-nav li { float: none; display: inline-block; margin: 0px; text-align: center; }
.nav > li > a { position: relative; display: block; padding: 10px 15px; }
.navbar-nav > li > a { padding-top: 15px; padding-bottom: 15px; line-height: 20px; }
.navbar-nav li a { position: relative; display: block; margin: 0px 46px 0px 50px; padding: 22px 0px 24px; text-transform: uppercase; font-weight: bold; line-height: 28px; font-size: 15px; color: rgb(255, 255, 255); text-shadow: none; border: 0px; }
.navbar-nav li:hover a, .navbar-nav li a:focus, .navbar-nav li.active a { background: none; color: rgb(255, 255, 255); }
.indicator2 { background: url("../../img/indicator2.png") 0px 0px no-repeat; width: 7px; height: 5px; position: absolute; display: inline-block; top: 33px; margin-left: 5px; left: auto; z-index: 5; }
ul ul, ol ul, ul ol, ol ol { margin-bottom: 0px; }
.sub-menu ul { display: none; position: absolute; z-index: 9990; min-width: 185px; left: 0px; top: 100%; padding: 0px 0px 5px; margin: 3px 0px 0px -3px; background: rgb(255, 255, 255); border-bottom: 2px solid rgb(28, 129, 139); }
.sub-menu ul li { margin: 0px; padding: 0px; width: 100%; border-top: 0px; }
.sub-menu ul li a { text-transform: none; text-shadow: none; margin: 0px !important; padding: 7px 5px 7px 20px !important; text-align: left !important; color: rgb(28, 129, 139) !important; border: 0px !important; }
.container { margin-right: auto; margin-left: auto; width: 1170px; padding: 2px 5px; }
.row_header-home2 { padding: 120px 0px 300px; }
h1 { margin: 0.67em 0px; font-size: 30px; font-family: Verdana, sans-serif; line-height: 40px; font-weight: 200; color: rgb(76, 174, 184); }
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 { font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; }
h1, .h1, h2, .h2, h3, .h3 { margin-top: 20px; margin-bottom: 10px; }
h1, .h1 { font-size: 36px; }
h1.white { color: rgb(255, 255, 255); font-size: 50px; }
hr { height: 0px; box-sizing: content-box; margin-top: 20px; margin-bottom: 20px; border-width: 1px 0px 0px; border-right-style: initial; border-bottom-style: initial; border-left-style: initial; border-right-color: initial; border-bottom-color: initial; border-left-color: initial; border-image: initial; border-top-style: solid; border-top-color: rgb(238, 238, 238); }
h3, .h3 { font-size: 24px; }
h3 { font-family: Verdana, sans-serif; font-size: 18px; line-height: 22px; font-weight: 500; color: rgb(28, 129, 139); }
#search { margin: 0px; padding-right: 130px; position: relative; }
#search input { border-radius: 0px; font-family: Verdana, sans-serif; font-size: 18px; line-height: 22px; outline: none; margin: 0px; color: rgb(204, 204, 204); background: rgb(255, 255, 255); height: 55px; border-width: 1px medium medium 1px; border-style: solid none none solid; border-top-color: rgb(176, 176, 176); border-left-color: rgb(176, 176, 176); box-shadow: rgb(229, 229, 229) 1px 1px 3px 1px inset; box-sizing: border-box; width: 320px; border-right-color: inherit; border-bottom-color: inherit; text-align: center; }
.btn-default, .btn-primary, .btn-success, .btn-info, .btn-warning, .btn-danger { text-shadow: rgba(0, 0, 0, 0.2) 0px -1px 0px; box-shadow: rgba(255, 255, 255, 0.15) 0px 1px 0px inset, rgba(0, 0, 0, 0.075) 0px 1px 1px; }
.btn-primary { background-image: linear-gradient(rgb(66, 139, 202) 0px, rgb(48, 113, 169) 100%); background-repeat: repeat-x; border-color: rgb(46, 109, 164); color: rgb(255, 255, 255); background-color: rgb(51, 122, 183); }
.btn { display: inline-block; padding: 6px 12px; margin-bottom: 0px; font-size: 14px; font-weight: 400; line-height: 1.42857; text-align: center; white-space: nowrap; vertical-align: middle; touch-action: manipulation; cursor: pointer; user-select: none; background-image: none; border: 1px solid transparent; border-radius: 4px; }
.btn1 { position: relative; border: none; border-radius: 0px; background: transparent; box-sizing: border-box; padding: 0px; z-index: 10; line-height: 0; }
.btn-search { position: absolute; top: 0px; }
.btn1 span { text-transform: uppercase; position: relative; display: block; float: left; font-family: Verdana, sans-serif; font-size: 18px; line-height: 32px; font-weight: 800; letter-spacing: 2px; background: linear-gradient(rgb(254, 89, 116), rgb(220, 61, 88)) rgb(254, 89, 116); height: 55px; text-decoration: none; text-align: center; width: 100%; transition: all 0.28s ease; border-radius: 14px; color: rgb(255, 255, 255); padding: 10px 20px; border: 3px solid rgb(211, 54, 80); }
h2, .h2 { font-size: 30px; }
h2 { font-family: Verdana, sans-serif; font-size: 24px; line-height: 30px; font-weight: 200; color: rgb(76, 174, 184); }
.home-title { font-size: 30px; }
b, strong { font-weight: 700; }
.list1 { position: relative; list-style: none; overflow: hidden; padding: 0px; margin: 0px; }
.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 { float: left; }
.col-xs-4 { width: 33.3333%; }
.col-sm-4 { width: 33.3333%; }
.col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 { float: left; }
.col-md-4 { width: 33.3333%; }
.col-lg-2 { width: 16.6667%; }
.list1 li { position: relative; list-style: none; overflow: hidden; margin-bottom: 15px; }
.btn2 { text-transform: uppercase; font-family: Verdana, sans-serif; font-size: 12px; line-height: 24px; font-weight: 800; display: block; color: rgb(255, 255, 255); letter-spacing: 2px; background: rgb(49, 142, 152); text-decoration: none; text-align: center; padding: 9px 10px 10px; width: 100%; border-radius: 0px; transition: all 0.28s ease; }
.list1 li .btn2 { position: relative; display: block; border: none; border-radius: 0px; box-sizing: border-box; padding: 0px 0px 0px 40px; z-index: 10; line-height: 0; overflow: hidden; background: rgb(49, 142, 152); transition: all 0.25s ease; }
.list1 li .btn2 strong { top: 0px; left: 0px; padding: 0px; position: absolute; background: rgb(24, 128, 139); transition: all 0.25s ease; }
.list1 li .btn2 strong img { position: relative; width: 55px; height: 55px; top: 0px; left: 0px; }
.list1 li .btn2 span { text-transform: uppercase; position: relative; display: block; float: left; font-family: Verdana, sans-serif; font-size: 11px; line-height: 18px; font-weight: 800; letter-spacing: 2px; padding: 18px 0px 19px 18px; transition: all 0.25s ease; top: 0px; left: 0px; width: 118px; }
.btn3 { text-transform: uppercase; font-family: Verdana, sans-serif; font-size: 12px; line-height: 24px; font-weight: 800; display: block; letter-spacing: 2px; text-decoration: none; text-align: center; width: 100%; transition: all 0.28s ease; background: linear-gradient(rgb(254, 89, 116), rgb(220, 61, 88)) rgb(254, 89, 116); border-radius: 14px; color: rgb(255, 255, 255); padding: 10px 20px; border: 3px solid rgb(211, 54, 80); }
.list1 li .btn3 { position: relative; display: block; border: none; border-radius: 0px; box-sizing: border-box; padding: 0px 0px 0px 55px; z-index: 10; line-height: 0; overflow: hidden; background: rgb(49, 142, 152); transition: all 0.25s ease; }
.list1 li .btn3 strong { top: 0px; left: 0px; padding: 0px; position: absolute; background: rgb(24, 128, 139); transition: all 0.25s ease; }
.list1 li .btn3 strong img { position: relative; width: 55px; height: 55px; top: 0px; left: 0px; }
.list1 li .btn3 span { text-transform: uppercase; position: relative; display: block; float: left; font-family: Verdana, sans-serif; font-size: 11px; line-height: 16px; font-weight: 800; letter-spacing: 2px; padding: 11px 0px 12px 14px; transition: all 0.25s ease; }

</style>--%>




    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->




    
  <%--  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&Key=AIzaSyA20GSpc86i07ogqfL9MmCx2-OqbjlHHFA"></script>
   --%>  



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
     
	






 <script src="js/jquery.min.js" type="text/javascript" async></script>
<script src="js/bootstrap.min.js" type="text/javascript" async></script>
	<script src="js/jquery-ui.min.js" type="text/javascript" async></script>
	<script src="js/superfish.min.js" type="text/javascript" async></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript" async></script>
	
 <script src="js/myscript.js" type="text/javascript" async></script>


  <%-- <script src="js/sc2.js" type="text/javascript" async></script>
<script src="js/sc3.js" type="text/javascript" async></script>
<script src="js/sc1.js" type="text/javascript" async></script>--%>

  
  





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
                          
                         <%--   <asp:UpdatePanel ID="uplLogin" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                      <div>
                                        <div id="google_translate_element"></div>
                                         
        
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

                          <%--   </ContentTemplate>

                            </asp:UpdatePanel>--%>

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
       



 <script type="text/javascript" defer> 
            //Bind keypress event to textbox

     var waitForJQuery = setInterval(function () {
         if (typeof $ != 'undefined') {

             // place your code here.

            

  

         $('#ctlTopMenu_txtPassword').keypress(function (event) {


             var keycode = (event.keyCode ? event.keyCode : event.which);
             if (keycode == '13') {

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

                 if ($('#ctlTopMenu_txtPassword').val().length == 0) {
                     $('#ctlTopMenu_lblLoginMessage').html("Enter Password.");

                     return false;
                 }


                 event.stopPropagation();

                 TryLogin();




             }
           


         });



         clearInterval(waitForJQuery);
     }
     }, 10);

       
    
        </script>

   <%--<asp:ScriptReference   name="WebForms.js" assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" path="~/js/sc1.js" NotifyScriptLoaded="true" > </asp:ScriptReference>
            <asp:ScriptReference   name="MicrosoftAjaxWebForms.js" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" path="~/js/sc3.js" NotifyScriptLoaded="true"></asp:ScriptReference>
            <asp:ScriptReference   name="MicrosoftAjax.js" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" path="~/js/sc2.js" NotifyScriptLoaded="true">
       
                
           </asp:ScriptReference>--%>
<asp:ScriptManager ID="scm1" runat="server" EnablePageMethods="true"  LoadScriptsBeforeUI="false" ScriptMode="Release"   >

     <Services>
         <asp:ServiceReference Path="~/LoginAuth.asmx" InlineScript="true" />
         
      </Services>
    <Scripts>
    
      <asp:ScriptReference   ScriptMode="Release"  name="MicrosoftAjax.js" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" path="~/js/sc2.js" NotifyScriptLoaded="true"> </asp:ScriptReference>
       
    </Scripts>
 </asp:ScriptManager>

    


 