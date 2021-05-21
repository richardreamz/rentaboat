<%@ Page Language="C#" AutoEventWireup="true" CodeFile="facilities_mant.aspx.cs" Inherits="admin_facilities_mant" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EDIT PROFILE</title>
  
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>
   <!-- CSS STYLES -->
	<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/form.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="../js/superfish.min.js" type="text/javascript"></script>
	<script src="../js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="../js/myscript.js" type="text/javascript"></script>
  
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



  <!-- SCRIPTS -->
    <!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>



    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.min.js" type="text/javascript"></script>

  
    
  
    <%--  <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>--%>


    <script type="text/javascript">
    $(function () {

        var state_index = { "AL": "202", "AK": "1", "AS": "American Samoa", "AZ": "2", "AR": "3", "CA": "3", "CO": "5", "CT": "6", "DE": "7", "DC": "8",  "FL": "9", "GA": "10", "GU": "11", "HI": "12", "ID": "13", "IL": "14", "IN": "15", "IA": "16", "KS": "17", "KY": "18", "LA": "19", "ME": "20",  "MD": "21", "MA": "22", "MI": "23", "MN": "24", "MS": "25", "MO": "26", "MT": "27", "NE": "28", "NV": "29", "NH": "30", "NJ": "31", "NM": "32", "NY": "33", "NC": "34", "ND": "35",  "OH": "36", "OK": "37", "OR": "38",  "PA": "39",  "RI": "40", "SC": "41", "SD": "42", "TN": "43", "TX": "44", "UT": "45", "VT": "46",  "VA": "47", "WA": "48", "WV": "49", "WI": "50", "WY": "51" };

      



        $("#txtZipCode").on('change', function () {
            var zip = $(this).val();
            var url = "//ziptasticapi.com/" + zip + "?callback=?";
            $.getJSON(url,
                function (result) {
                    if (result.city)
                        $("#txtCity").val(result.city);
                   

                    var s = state_index[result.state];
                  
                   $('#ddState').val(s);
                });
        });
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

	<style>
     .star{
color:red;
}
	</style>


    
  
</head>
<body>
 

     <form id="frmAddBoat" runat="server">
    <header id="header">
  <%--      Top Menu Here --%>
        <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

   <div class="container" > <div class="row_header-admin-dashboard" >
           <div align="center"><h1 class="white">DASHBOARD</h1></div>                 
      </div>
         
</div>

</header>

  
       
       <%--     <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>--%>

         <div class="container">

<%--    Admin Menu here--------------------------------------------------------------------------------- --%>
             <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />

         
         
          

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
         <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>


    <div class="row">
           <div class="col-lg-8 col-sm-8 padbot20">
           <h2 style="padding-left:160px;">Edit Your Profile</h2>

                <div  id="contact-form" class="contact-form">

                    <div class="control-group">
  <%--<label class="control-label" for="textinput">Boat Owner Name: </label>--%>
   <label class="control-label" for="textinput"><span class="star">*</span>First Name: </label>
       
                        
                        <asp:TextBox ID="txtContactName" runat="server" CssClass="input-xlarge"></asp:TextBox>
</div>
<div style="clear:both;"></div>


  <div class="control-group">
 <%-- <label class="control-label" for="textinput">Location Name: </label>--%>
   <label class="control-label" for="textinput"><span class="star">*</span>Last Name: </label>
     
       <asp:TextBox ID="txtFacilityName" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>


<%--<div class="control-group">
  <label class="control-label" for="textinput">Marina Name if not the same: </label>
      
      <asp:TextBox ID="txtMarinaName" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>--%>

<div class="control-group">
  <label class="control-label" for="textinput"><span class="star">*</span>Billing Address 1: </label>
      
        <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>



<div class="control-group">
  <label class="control-label" for="textinput">Address 2: </label>
      
        <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>



<div class="control-group">
  <label class="control-label" for="textinput"><span class="star">*</span>Zip/Postal Code:</label>
      
             <asp:TextBox ID="txtZipCode" runat="server" class="zip-lookup-field-zipcode" ></asp:TextBox>

</div>
<div style="clear:both;"></div>


<div class="control-group">
  <label class="control-label" for="textinput"><span class="star">*</span>Country: </label>
      
            <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged"></asp:DropDownList>

</div>
<div style="clear:both;"></div>




<div class="control-group">
  <label class="control-label" for="textinput"><span class="star">*</span>State/Province:</label>
      
            <asp:DropDownList ID="ddState" runat="server" ></asp:DropDownList>

</div>
<div style="clear:both;"></div>




<div class="control-group">
  <label class="control-label" for="textinput"><span class="star">*</span>City/Region:</label>
      
               <asp:TextBox ID="txtCity" runat="server"  class="zip-lookup-field-city"></asp:TextBox>

</div>
<div style="clear:both;"></div>





<%--
<div class="control-group">
  <label class="control-label" for="textinput">
     
       <a href="#" data-toggle="tooltip" title="Name the body of water in which your boat is located. Please be specific. For example, if your facility is located on the East Coast, you would not say Atlantic Ocean,
                         but rather the particular bay, cove or river where your boat is located."> Body Of Water:
                             <img src="./images/help.png" />
                                </a>
  </label>
      
             <asp:TextBox ID="txtBodyOfWater" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>--%>


<div class="control-group">
 <label class="control-label" for="textinput"><span class="star">*</span>Phone:</label>
      
            <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="MKE"></asp:TextBox>
                       
       <%-- <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
            TargetControlID="txtPhone"
            Mask="999-999-9999"
            ClearMaskOnLostFocus="false"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="None"
            InputDirection="LeftToRight"
            AcceptNegative="Left"
            DisplayMoney="Left" Filtered="-"
            ErrorTooltipEnabled="True" />
        <asp:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
            ControlExtender="MaskedEditExtender2"
            ControlToValidate="txtPhone"
            IsValidEmpty="False" ValidationExpression ="[0-9]{3}\-[0-9]{3}\-[0-9]{4}"
            EmptyValueMessage="input is required"
            InvalidValueMessage="input is invalid"
            Display="Dynamic"
            TooltipMessage="XXX-XXX-XXXX"
            EmptyValueBlurredText="Phone number should not be empty!"
            InvalidValueBlurredMessage="Please input the right phone number!"
            ValidationGroup="MKE" />--%>

</div>
<div style="clear:both;"></div>




<div class="control-group">
  <label class="control-label" for="textinput">Fax:</label>
      
           <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>


</div>
<div style="clear:both;"></div>



<div class="control-group">
  <label class="control-label" for="textinput"><span class="star">*</span>Email:</label>
      
                <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>

</div>
<div style="clear:both;"></div>




<div class="control-group">
  <label class="control-label" for="textinput">Facility Web Site:</label>
      
                <asp:TextBox ID="txtFacilityWebSite" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>





<%--<div class="control-group">
  <label class="control-label" for="textinput">Tax Rate:</label>
      
                <asp:TextBox ID="txtTaxRate" runat="server"  step="any"></asp:TextBox>
                     

</div>
<div style="clear:both;"></div>--%>


      <asp:Panel ID="pnlCommissionFee" runat="server" >

<div class="control-group">
  <label class="control-label" for="textinput">Commission Fee:</label>
      
               <table>
                          <tr>
                              <td>
                                  <asp:RadioButton ID="rdPayPerClick" runat="server" GroupName="comm" Text="Pay/ Click" />
                              </td>
                              <td>
                                  <asp:TextBox ID="txtPayClickAmount" runat="server" ></asp:TextBox>USD
                              </td>
                          </tr>

                            <tr>
                              <td>
                                  <asp:RadioButton ID="rdPercentage" runat="server" GroupName="comm" Text="Percentage" />
                              </td>
                              <td>
                                  <asp:TextBox ID="txtPercentageAmount" runat="server" ></asp:TextBox>%
                              </td>
                          </tr>

                            <tr>
                              <td>
                                  <asp:RadioButton ID="rdFlatRate" runat="server" GroupName="comm" Text="Per Transaction" />
                              </td>
                              <td>
                                  <asp:TextBox ID="txtFlatRateAmount" runat="server" ></asp:TextBox>USD
                              </td>
                          </tr>

                            <tr>
                              <td>
                                  <asp:RadioButton ID="rdDisplayAd" runat="server" GroupName="comm" Text="Display Ad" />
                              </td>
                              <td>
                                  <asp:TextBox ID="txtDiplayAdAmount" runat="server" ></asp:TextBox>USD

                                  &nbsp; &nbsp; <asp:RadioButton ID="rdMonthly" runat="server" GroupName="ad" Text ="Monthly" /> &nbsp; &nbsp; <asp:RadioButton ID="rdYearly" runat="server" GroupName="ad" Text ="Yearly" /> 
                              </td>
                          </tr>
                      </table>
                     

</div>
<div style="clear:both;"></div>


</asp:Panel>

<div class="control-group">
  <label class="control-label" for="textinput">Display Landing Page:</label>
      
                <asp:TextBox ID="txtDisplayLandingPage" runat="server"></asp:TextBox>
                     

</div>
<div style="clear:both;"></div>


<%--<div class="control-group">
  <label class="control-label" for="textinput">
      
       <a href="#"  data-toggle="tooltip" title=" If your facility has multiple locations you must enroll each individual location as a separate facility with its own user name and password. You may keep the Contact name and Business name the same, but user name and password must be unique.   IMPORTANT Please remember what user name and password go with each facility."> Multiple Locations:
                             <img src="./images/help.png" />
                                </a>
      
      



  </label>
      
                  <asp:DropDownList ID="ddMultipleLocation" runat="server">
                             <asp:ListItem Text="" Value=""></asp:ListItem>
                             <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                             <asp:ListItem Text="No" Value="0"></asp:ListItem>

                        </asp:DropDownList>
                     
                     

</div>
<div style="clear:both;"></div>--%>


<%--<div class="control-group">
  <label class="control-label" for="selectbasic">Do you offer accomodations?</label>
     <asp:DropDownList ID="ddAccomodations" runat="server">

                              <asp:ListItem Text="" Value=""></asp:ListItem>
                             <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                             <asp:ListItem Text="No" Value="0"></asp:ListItem>
                         </asp:DropDownList>
                     
</div>
<div style="clear:both;"></div>--%>


<%--<div class="control-group">
  <label class="control-label" for="selectbasic">Do you offer a captain or guide?</label>
    <asp:DropDownList ID="ddCaptian" runat="server">

                              <asp:ListItem Text="" Value=""></asp:ListItem>
                             <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                             <asp:ListItem Text="No" Value="0"></asp:ListItem>
                         </asp:DropDownList>
                     
</div>
<div style="clear:both;"></div>--%>


<%--<div class="control-group">
  <label class="control-label" for="selectbasic">
      
       <a  data-toggle="tooltip" title="   Check this box if you DO NOT want to offer last minute reservations or same day reservations of your boat">  Do not allow same day reservation:
                             <img src="./images/help.png" />
                                </a>
    



  </label>
        <asp:CheckBox ID="chkNoSameDay" runat="server" />
</div>
<div style="clear:both;"></div>--%>


                    <div class="control-group">
  <label class="control-label" for="textinput">Contact Hours: Open</label>
      <asp:DropDownList ID="ddOpenHour" runat="server"> </asp:DropDownList>
</div>
<div style="clear:both;"></div>


<div class="control-group">
  <label class="control-label" for="textinput">Contact Hours: Closed</label>
    <asp:DropDownList ID="ddClosedHour" runat="server"> </asp:DropDownList>
                     
</div>
<div style="clear:both;"></div>




<%--<div class="control-group">
  <label class="control-label" for="textarea">Additional notes for your renter:</label>
  <div class="controls">                     
    <asp:TextBox ID="txtFacilityDirections" runat="server" TextMode="MultiLine" Rows="5" Width="400px"></asp:TextBox>
                     
  </div>
</div>
<div style="clear:both;"></div>--%>


 <asp:Panel ID="pnlRating" runat="server">

<div class="control-group">
  <label class="control-label" for="textarea">Rating (1 minimum - 5 maximum):</label>
  <div class="controls">                     
     <asp:TextBox ID="txtRating" runat="server"  MaxLength="1" Width="80px"></asp:TextBox>
                     
                        <asp:RangeValidator ID="rvRating" ControlToValidate="txtRating" MinimumValue="1" MaximumValue="5" Type="Integer" ErrorMessage="Invalid Rating value" runat="server" EnableClientScript="false"></asp:RangeValidator>
      
  </div>
</div>
<div style="clear:both;"></div>
     </asp:Panel>

<br />
                    <br />


<br />

            <div runat="server" id="boatLink" >
              <div style="text-align:center;float:left;">       
<b>Have a Website? Drive Traffic To Your Site - Link to Us and We Will Link Back to You.</b><br />

Copy and Paste this URL to any Text, Button or Picture on Your Website.<br />
This Will Link Your Website Visitors to ONLY Your Boats.<br /> 
Questions call web tech 631-286-7816
                  </div>

<br />

                         <asp:TextBox ID="txtWebSiteAddress" runat="server" style="width:500px!important;max-width:500px;cursor:copy;color:black!important;font-weight:bolder!important" ReadOnly="true" ></asp:TextBox>

</div>


 
                  

            </div>
        </div>
</div>
   

                           <div class="row">
                          <div class="col-lg-8 col-sm-8 padbot20">
                               <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Medium" BorderStyle="Outset" ForeColor="Green"></asp:Label>
  
                          
                              </div>

                    </div>

   <div class="row">
        <div class="col-lg-8 col-sm-8 padbot20">
            <br />
                 

 <div class="btns" style="padding-left:160px;">
      <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn2" />
     </div>

      <div class="btns" style="padding-left:20px;">
                      <asp:LinkButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn2" /> 
                      </div>  

           </div>

   </div>

             

     </ContentTemplate>
                        </asp:UpdatePanel>
                 
         
         
         
         </div> 
        
     

    </form>
    
        <script>

            function ValidateInput()
            {
                var errorMessage="";
                if ($("#ddOpenHour").prop("selectedIndex") == 0)
                    errorMessage = "Missing Business Hours Open \n";


                if ($("#ddClosedHour").prop("selectedIndex") == 0)
                    errorMessage += "Missing Business Hours Closed \n";

                if (errorMessage.length != 0)
                {
                    alert(errorMessage);

                    return false;
                }
                return true;

            }

        </script>
        
        
          <script>

              setSelectedMenu("liEditProfile");

          </script>


</body>
</html>
