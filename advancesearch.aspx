<%@ Page language="C#" CodeFile="advancesearch.aspx.cs" Inherits="BoatRenting.advancesearch_aspx_cs" %>

<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Advance Search</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>
    
    
    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
    
     <script src="../js/jquery.min.js" type="text/javascript"></script>
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



     <%-- <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>--%>

    <script src="//clevertree.github.io/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>
</head>
<body>
<!--==============================header=================================-->

<!-- HEADER -->
	<form id="frmAdvancedSearch" runat="server" defaultbutton="lnkSearchAll">			
                
<header id="header">
<!-- TOP LINE -->
    <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />		

<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h1 class="white" >Advance Search</h1>
              
                         
      </div>         
	</div>

</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
      <div class="row"> <div class="col-lg-2 col-sm-2 padbot20"></div>
           <div class="col-lg-8 col-sm-8 padbot20">
         
             <h2>Find A Boat Location</h2>
                                 
 				<div id="contact-form" class="contact-form">
                     <fieldset>

					<div class="boat-page-overview"  >		
                        
                        		<label class="control-label" >Zip</label>
    			

                        <asp:TextBox ID="txtZip" runat="server"  MaxLength="5" class='zip-lookup-field-zipcode'></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtZip" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                      
                         <div style="clear:both;"></div>   
					<br>       
            			
					<label class="control-label" >Country</label>
                        <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged"></asp:DropDownList>
				
 					<div style="clear:both;"></div>   
					<br>

					<label class="control-label" >State</label>
    				
                      
  					 <asp:DropDownList ID="ddState" runat="server" class='zip-lookup-field-state'></asp:DropDownList>
                        
                        
                          <div style="clear:both;"></div>   
					<br>
			
					<label class="control-label" >City</label>
    				
                       
 					<asp:TextBox ID="txtCity" runat="server"  class='zip-lookup-field-city'></asp:TextBox>
                        
                        <div style="clear:both;"></div>   
					<br>

			
 
					<label class="control-label" >Miles</label>
    				<asp:TextBox ID="txtMiles" runat="server" CssClass="input-xlarge"></asp:TextBox>
                      <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtMiles" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                      
                        
                        <div style="clear:both;"></div>   
					<br>
                   
   					<label class="control-label" >Body of Water</label>
			
                        <asp:DropDownList ID="ddBodyOfWater" runat="server" CssClass="input-xlarge"></asp:DropDownList>
 					<div style="clear:both;"></div>   
					<br>
                        <asp:Label ID="lblMessageBoatLocation" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
					<div class="btns" align="right" style="margin-left:20px; float:right;">
                    
                        <asp:LinkButton ID="lnkSearch1" runat="server" class="btn3" OnClick="lnkSearch1_Click" Text="Search Now"></asp:LinkButton>
                    </div>
					</div>


				</fieldset></div>

			</div>
      </div>
      
      <div class="row">
           <div class="col-lg-6 col-sm-6 padbot20">

 			<h2>Find A Boat By Boat Type</h2>
                                 
 				<div id="contact-form" class="contact-form">
                     <fieldset>
					<div class="boat-page-overview">                    	
		       		<label class="control-label" >Boat Type</label>
				
                        <asp:DropDownList ID="ddBoatType" runat="server" CssClass="input-xlarge"></asp:DropDownList>
 					<div style="clear:both;"></div>   
					<br>
                
                    
      				<label class="control-label" >Price</label>
    		
                        	<asp:TextBox ID="txtStartPrice" placeholder="Lowest" runat="server" CssClass="input-xlarge" style="width:100px;"></asp:TextBox>
                  
                 <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtStartPrice" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                      
                        	<asp:TextBox ID="txtEndPrice" placeholder="Highest" runat="server" CssClass="input-xlarge" style="width:100px;"></asp:TextBox>
                   <asp:CompareValidator ID="CompareValidator4" ControlToValidate="txtEndPrice" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                     
                  
                        <div style="clear:both;"></div>   
					<br>
                        	<label class="control-label" >Boat ID</label>
                         <asp:TextBox ID="txtBoatID" placeholder="Boat ID" runat="server" CssClass="input-xlarge" style="width:100px;"></asp:TextBox>

                        <br />

                          <div style="clear:both;"></div>   
					<br>
                        	<label class="control-label" >Facility ID</label>
                         <asp:TextBox ID="txtFacilityID" placeholder="Facility ID" runat="server" CssClass="input-xlarge" style="width:100px;"></asp:TextBox>

                        <br />
                         <asp:Label ID="lblMessageBoatType" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
					<div class="btns" align="right" style="margin-left:20px; float:right;">
                       
                        
                                            <asp:LinkButton ID="lnkBoatType" runat="server" class="btn3"  OnClick="lnkBoatType_Click" Text="Search Now"></asp:LinkButton>

                    
                    </div>
					</div>
				</fieldset>

 				</div>
			</div>

 			<div class="col-lg-6 col-sm-6 padbot20">

 			<h2>Find A Boat By Manufacturer</h2>
                                 
 				<div id="contact-form" class="contact-form"><fieldset>
					<div class="boat-page-overview">
		       		<label class="control-label" >Make</label>
				

                        <asp:DropDownList ID="ddMake" runat="server" class="input-xlarge"></asp:DropDownList>
 					<div style="clear:both;"></div>   
					<br>
                    
                    <label class="control-label" >Model</label>
			
                        	<asp:TextBox ID="txtModel"  runat="server" CssClass="input-xlarge" style="width:250px;"></asp:TextBox>
                  
                        
                        <div style="clear:both;"></div>   
					<br>
                    
   					<label class="control-label" >Year</label>
    				
                   
                        	<asp:TextBox ID="txtYearFrom" placeholder="From"  runat="server" CssClass="input-xlarge" style="width:100px;"></asp:TextBox>
                  
     				
                        	<asp:TextBox ID="txtYearTo" placeholder="To" runat="server" CssClass="input-xlarge" style="width:100px;"></asp:TextBox>
                  
                        <div style="clear:both;"></div>   
					<br>
                    
                        <asp:Label ID="lblMessageByManufacturer" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
					<div class="btns" align="right" style="margin-left:20px; float:right;">
                        <asp:LinkButton ID="lnkByManufacturer" runat="server" class="btn3"  OnClick="lnkByManufacturer_Click" Text="Search Now"></asp:LinkButton>

                    </div>
					</div>
				</fieldset></div>
			</div>


	</div>  
    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
    <div align="center">
   <div class="btns"  style="float:left; width:230px;margin-left:300px;">
                     
         <asp:LinkButton ID="lnkSearchAll" runat="server" class="btn3" OnClick="lnkSearchAll_Click"   Text="Search All"></asp:LinkButton>
  
     
                </div>
 <div class="btns"  style="float:right; width:230px;margin-right:300px;">
    
    <asp:LinkButton ID="lnkClearAll" runat="server" class="right-btn btn3"  OnClick="lnkClearAll_Click"  Text="Clear All" ></asp:LinkButton>
     </div>
      
    </div>
</div>
<!-- FOOTER -->

        </form>
			
    <uc1:ctlFooter runat="server" ID="ctlFooter" />			


</body>
</html>

