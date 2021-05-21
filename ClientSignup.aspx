<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClientSignup.aspx.cs" Inherits="ClientSignup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>


<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>BOAT RENTALS, YACHT CHARTERS, SAILBOAT RENTAL and BOATS FOR HIRE</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=1-888-610-2628" />
    <meta name="description" content="Find A Boat Rental, Sailboat Charters and Yacht Reservations in Miami, Bahamas, California, Florida, Ohio, Michigan, Maryland, Texas, Alabama, Arizona, New York, Maine, Carolina. View boat photos, availability and reserve online. Rated #1 in customer satisfaction">
    <meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
    <meta name="author" content="Kenny Hilderbrandt">
    <meta name="google-site-verification" content="o_nt02lBg_GRoNrr7bSFXxw5lo7F8ULgeHZ58KaGx10" />
    <meta name="google-site-verification" content="o_nt02lBg_GRoNrr7bSFXxw5lo7F8ULgeHZ58KaGx10" />

   





  <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />

 

	<!-- SCRIPTS -->
	<!--[if IE]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<%--<script src="js/myscript.js" type="text/javascript"></script>
  --%>
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
    
   
    <%--   <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>--%>

    <script src="//clevertree.github.io/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>
    
    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="//windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->


</head>
<body>
<!--==============================header=================================-->

<!-- HEADER -->
	<form id="frmClientSignup" runat="server" >		
                  
<header id="header" >
<!-- TOP LINE -->
					
    <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />
<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h1 class="white" >Welcome Aboard!</h1>
              
                         
      </div>         
	</div>

</header>
 <!--==============================content=================================-->



<div class="container"> 
     

       
       
            <h4 class="red">NEW Customer:</h4>
        
            <div class="control-group2">

  <label class="control-label" > First Name:<span style="color:red">*</span></label> <asp:TextBox ID="txtFirstNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
                
   <asp:RequiredFieldValidator ID="rftxtFirstNameNewUser" runat="server" ControlToValidate="txtFirstNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

</div>
<div class="control-group">

     <label class="control-label" >  Last Name:
         </label> <asp:TextBox ID="txtLastNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
   
  
     </div>


<div class="control-group">

   <label class="control-label" > Address 1:</label> <asp:TextBox ID="txtAddress1NewUser" runat="server" class="input-xlarge"></asp:TextBox>
   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1NewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>

</div>
<div class="control-group">
  <label class="control-label" >Address 2:</label> <asp:TextBox ID="txtAddress2NewUser" runat="server" class="input-xlarge"></asp:TextBox>
   
</div>

      <div id="addressdiv">
           <div  id="zipcodediv">

   <label class="control-label" > Zip/Postal Code:</label> <asp:TextBox ID="txtZipcodeNewUser" runat="server"  class='zip-lookup-field-zipcode' MaxLength="5" ></asp:TextBox>
<%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZipcodeNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>


             


               


</div>
   
           
            <div class="control-group">

  <label class="control-label" >  Country: </label>
               
            <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged" ></asp:DropDownList>
                
           <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddCountry" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>

                  </div>

        <div class="control-group">

  <label class="control-label" >  State:</label>
            <asp:DropDownList ID="ddState" runat="server" class='zip-lookup-field-state'></asp:DropDownList>
   <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddState" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>


</div>

          <div class="control-group">

   <label class="control-label" > City:</label> <asp:TextBox ID="txtCityNewUser" runat="server" class='zip-lookup-field-city'></asp:TextBox>
   <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCityNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>

</div>

  </div>
             
                       
               
                <div class="control-group">

  <label class="control-label" >  Contact Phone:</label> <asp:TextBox ID="txtContactPhoneNewUser" runat="server" class="input-xlarge"></asp:TextBox>
    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContactPhoneNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>
<asp:MaskedEditExtender ID="maskMainPhone" runat="server"

TargetControlID="txtContactPhoneNewUser"

Mask="(999)999-9999"

MaskType="None"

MessageValidatorTip="true"
OnFocusCssClass="editmask"

OnInvalidCssClass="invalidmask"

InputDirection="LeftToRight"

ClearMaskOnLostFocus="false"

AutoComplete="false" />

</div>

       
                <div class="control-group">

  <label class="control-label" > Email:<span style="color:red">*</span></label> <asp:TextBox ID="txtEmailNewUser" runat="server" class="input-xlarge"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmailNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

</div>
                <div class="control-group">

   <label class="control-label" > Confirm Email:<span style="color:red">*</span></label> <asp:TextBox ID="txtComfirmEmailNewUser" runat="server" class="input-xlarge"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtComfirmEmailNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

</div>
 
  

	<asp:Panel ID="pnlPassword" runat="server">
     <div class="control-group">

  <label class="control-label" >  Password:<span style="color:red">*</span></label> <asp:TextBox ID="txtNewUserPassword" runat="server" class="input-xlarge" TextMode="Password"></asp:TextBox>
   
</div>
                <div class="control-group">

   <label class="control-label" > Confirm Password:<span style="color:red">*</span></label> <asp:TextBox ID="txtNewUserPasswordConfirm" runat="server" class="input-xlarge" TextMode="Password"></asp:TextBox>
   
</div>
         <div>

  <label>  <span style="color:red">* Required to ask a question.</span></label> 
   
</div>
   </asp:Panel> 

       <br />
          <asp:Label ID="lblMessageNewUserSave" runat="server" ></asp:Label>
      

        <div style="clear:both;"></div>   
<br>
  
       <div class="control-group">
      <asp:LinkButton ID="lnkCreateNewUser" runat="server" CssClass="left-btn btn3" Text="SAVE" Width="200px" OnClick="lnkCreateNewUser_Click" ValidationGroup="saveRecord"></asp:LinkButton>
            </div>         
  
        
	 



 
    </div>
    </form>
    <!-- FOOTER -->
    <uc1:ctlFooter runat="server" ID="ctlFooter" />

	

</body>
</html>
