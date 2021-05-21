<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateClientInfo.aspx.cs" Inherits="UpdateClientInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Client Info</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    
      <script src="js/jquery.min.js" type="text/javascript"  ></script>
   
 
     <script src="js/bootstrap.min.js" type="text/javascript"  ></script>
    <script src="js/jquery-ui.min.js" type="text/javascript" ></script>
    <script src="js/superfish.min.js" type="text/javascript" ></script>
    <script src="js/jquery.flexslider-min.js" type="text/javascript" ></script>

    <script src="js/myscript.js" type="text/javascript" ></script>
    
    
    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
  <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    

     <style>
                   .btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

               </style>

      <style>
  .hover_img a { position:relative; }
.hover_img a span { position:absolute; display:none; z-index:99; }
.hover_img a:hover span { display:block;overflow:hidden; }
</style>
   
 

	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
   <%--<script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>--%>

       <%-- <script>
            $(document).ready(function () {

                $('.list2 li a').hover(function () {
                    $(this).stop().css({ color: '#b6b6b6' });
                    $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': '-7px' });
                }, function () {
                    $(this).stop().css({ color: '#c11030' });
                    $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': 0 });
                })

               

            });

    </script>--%>
    
   
    <script>

        function CollapseBoatingInfo()
        {
            $('#collapseTwo').collapse('show');
            $('#collapseOne').collapse('hide');

        }
    </script>

    <script src="//clevertree.github.io/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>
    
    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->

</head>
<body>
     <form runat="server" id="frmClientInfo">                
<header id="header" >

    <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />
<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h1 class="white" >Welcome Aboard!</h1>
              
                         
      </div>         
	</div>

</header>


  
      <%--  <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>--%>
    
    <div class="container">
      <div class="row">
    
           <asp:UpdatePanel ID="upAcc" runat="server">
               <ContentTemplate>


            
                 
                 <div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          PERSONAL INFORMATION
       <i class="indicator glyphicon glyphicon-chevron-down  pull-right"></i> </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">
    
       <asp:UpdatePanel ID="upPersonal" runat="server">
           <ContentTemplate>


         


            
           <div class="row">
         
            <div class="col-sm-8">
            <div class="control-group2">

  <label class="control-label" > First Name:</label> <asp:TextBox ID="txtFirstNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
                
   <asp:RequiredFieldValidator ID="rftxtFirstNameNewUser" runat="server" ControlToValidate="txtFirstNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

</div>
<div class="control-group">

     <label class="control-label" >  Last Name:
         </label> <asp:TextBox ID="txtLastNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
   
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

     </div>


<div class="control-group">

   <label class="control-label" > Address 1:</label> <asp:TextBox ID="txtAddress1NewUser" runat="server" class="input-xlarge"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1NewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

</div>
<div class="control-group">
  <label class="control-label" >Address 2:</label> <asp:TextBox ID="txtAddress2NewUser" runat="server" class="input-xlarge"></asp:TextBox>
   
</div>

      <div id="addressdiv">
           <div  id="zipcodediv">

   <label class="control-label" > Zip/Postal Code:</label> <asp:TextBox ID="txtZipcodeNewUser" runat="server"  class='zip-lookup-field-zipcode' MaxLength="5" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZipcodeNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           


             


               


</div>
   
           
            <div class="control-group">

  <label class="control-label" >  Country: </label>
               
            <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" ></asp:DropDownList>
                
             <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddCountry" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>

                  </div>

        <div class="control-group">

  <label class="control-label" >  State:</label>
            <asp:DropDownList ID="ddState" runat="server" class='zip-lookup-field-state'></asp:DropDownList>
     <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddState" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           --%>


</div>

          <div class="control-group">

   <label class="control-label" > City:</label> <asp:TextBox ID="txtCityNewUser" runat="server" class='zip-lookup-field-city'></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCityNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

</div>

  </div>
             
                       
               
                <div class="control-group">

  <label class="control-label" >  Contact Phone:</label> <asp:TextBox ID="txtContactPhoneNewUser" runat="server" class="input-xlarge"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContactPhoneNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
<asp:MaskedEditExtender ID="maskMainPhone" runat="server"

TargetControlID="txtContactPhoneNewUser"

Mask="(999)999-9999"

MaskType="None"

MessageValidatorTip="true"
OnFocusCssClass="editmask"

OnInvalidCssClass="invalidmask"

InputDirection="LeftToRight"

ClearMaskOnLostFocus="false"

/>

</div>
                <div class="control-group">

  <label class="control-label" > User Name / Email:</label> <asp:TextBox ID="txtEmailNewUser" runat="server" class="input-xlarge"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmailNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

    <asp:LinkButton ID="btnChangePassword" CssClass="btn" runat="server" Text="Change Password" data-toggle="modal" href="#password_modal" />


        <asp:UpdatePanel ID="upPasswordChange" runat="server">
            <ContentTemplate>


            <script type="text/javascript">
           function openModal() {
               $('#password_modal').modal('show');
           }
</script>

                        <div class="modal fade" id="password_modal">
                     <div class="modal-dialog">
                         <div class="modal-content">
    <div class="modal-header">
        <h3>Change Password <span class="extra-title muted"></span></h3>
    </div>
    <div class="modal-body form-horizontal">
        <div class="control-group">
            <label for="current_password" class="control-label">Current Password</label>
            <div class="controls">
               
                <asp:TextBox ID="current_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="new_password" class="control-label">New Password</label>
            <div class="controls">
              
                  <asp:TextBox ID="new_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="confirm_password" class="control-label">Confirm Password</label>
            <div class="controls">
              
                    <asp:TextBox ID="confirm_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
        </div>  
        <div>
            <asp:Label ID="lblMessageChangePassword" runat="server"></asp:Label>
        </div>    
    </div>
    <div class="modal-footer">
        <button href="#" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
     
        <asp:LinkButton ID="password_modal_save"  CssClass="btn btn-primary" runat="server" OnClick="password_modal_save_Click" Text="Save Changes"></asp:LinkButton>
    </div>
                        
                         </div>
                  </div>
                </div>
        

                     </ContentTemplate>

        </asp:UpdatePanel>
                    
                    
                         

</div>
            
 
  

	
            
            
            
            </div>

              
          
          <div  class="col-sm-4">
             

                
              <img runat="server"  id="personalPhotoPreview" width="250" height="200" />
              <br />
 <br />
                     

              <span class="btn btn-default btn-file">
                  <img src="./img/addPhoto.png" />
              <asp:AsyncFileUpload ID="fileupPersonalPhoto" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber4"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />

                                              
          
         
       </span>
                <asp:Label runat="server" ID="myThrobber4" Style="display: none;">
                                          <img align="absmiddle" alt="" src="./img/loading_black.gif" /></asp:Label>
              
                <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;"
                            runat="server" cellpadding="3" id="clientSide" />
               </div>

      

        </div>


          <div class="row">
              <div class="col-sm-8">
                     <caption>
                         <br />
                         <asp:Label ID="lblMessagePersonalInfo" runat="server"></asp:Label>
                     </caption>
         


              </div>

          </div>

<div class="row">

       <div class="col-sm-4 ">
           <caption>
               <br />
               <asp:Button ID="btnSavePersonalInfo" runat="server" CssClass="btn btn-primary center-block" Text="Save" OnClick="btnSavePersonalInfo_Click" ValidationGroup="saveRecord" />
           </caption>

          </div>
</div>
   
            </ContentTemplate>

       </asp:UpdatePanel>




    </div>
  </div>
   </div>
    <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
         BOATING INFORMATION
        <i class="indicator glyphicon glyphicon-chevron-up  pull-right"></i></a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">

       


            

       
          <asp:UpdatePanel ID="upBoatOwner" runat="server">
              <ContentTemplate>

          

          <div class="row">
            <div class="col-lg-12 col-sm-12 padbot20">
               
        
       <div class="control-group">

  <label class="control-label" >  Years of Boat Experience:</label> 
           <asp:TextBox ID="txtYearsOfExperience"  runat="server" style="height:35px!important;width:100px!important" class="input-xlarge" ></asp:TextBox>
   
</div>   
     </div>
              
               <div class="row">     
      <div class="col-lg-12 col-sm-12 padbot20">
               
        
       <div class="control-group">

  <label class="control-label" >  Current Boat Owner:</label>
          <asp:DropDownList ID="ddBoatOwner" runat="server">
             <asp:ListItem Text="No" Value="0"></asp:ListItem>              
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
         </asp:DropDownList>
   
</div>   
          </div>
</div>

            <div class="row">     
      <div class="col-lg-12 col-sm-12 padbot20">
               
 <div class="control-group">

  <label class="control-label" >  Currently hold boat Insurance ?:</label>
         <asp:DropDownList ID="ddInsuranceCoverage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddInsuranceCoverage_SelectedIndexChanged">
             <asp:ListItem Text="No" Value="0"></asp:ListItem>              
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
         </asp:DropDownList>
     <asp:TextBox ID="txtInsuranceCompany" runat="server" ToolTip="Insurance Company Name" style="height:35px!important;" placeholder="Insurance Company Name" Visible="false"></asp:TextBox>
   
</div>   
        
          </div>
                </div>

                  <div class="row">     
      <div class="col-lg-12 col-sm-12 padbot20">
               

<div class="control-group">

  <label class="control-label" >  Currently holding a boating License ?:</label>
            <asp:DropDownList ID="ddBoatinLicense" runat="server">
             <asp:ListItem Text="No" Value="0"></asp:ListItem>              
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
         </asp:DropDownList>
    
</div> 

</div>
                      </div>


                  <div class="row">     
      <div class="col-lg-12 col-sm-12 padbot20">
               
<div class="control-group">

  <label class="control-label" >  Describe your boating experience:</label>
     <asp:TextBox ID="txtBoatingExperience" runat="server" ToolTip="Describe your boating experience"  TextMode="MultiLine" Rows="5" style="height:80px!important;width:400px!important"></asp:TextBox>
       
   


</div>   


</div>
                      </div>


                <div class="row">
                    <div class="col-sm-12">

                        <h2>Upload Boating Photos</h2>
                        <h3>*Show us your boating experience by uploading photos of previous owned or rented boats!</h3>
                        </div>

                </div>

                <div class="row">
                    <div class="col-sm-1">

                    </div>
                     <div class="col-sm-3 text-left">
                         Name
                    </div>
                     <div class="col-sm-3 text-left">
                         Description
                    </div>

                       <div class="col-sm-3">
                      
                    </div>

                </div>
                
                
                 <div class="row">
                  
                       <div class="col-sm-1 text-right">
                        Picture 1
                    </div>
                     <div class="col-sm-3">
                          <asp:TextBox ID="txtNamePic" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-sm-3">
                        <asp:TextBox ID="txtDescPic" runat="server"></asp:TextBox>
                    </div>

                       <div class="col-sm-3">
                             <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber" Style="display: none;">
                                          <img align="absmiddle" alt="" src="./img/loading_black.gif" /></asp:Label>

                         
                           </div>
                  
                                 <div class="col-sm-1">

                                         <div class="hover_img" runat="server" id="divMainPicPreview">
                            <a href="#">Preview<span><img  alt="image" height="250" width="200" style="max-width:200px!important" runat="server" id="imgPreviewMainPic"/></span></a>
                                                </div>
                                 </div>             
                  

                </div>
<div class="row">

     <div class="col-sm-1 text-right">
                        Picture 2
                    </div>
                     <div class="col-sm-3">
                          <asp:TextBox ID="txtNamePic1" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-sm-3">
                        <asp:TextBox ID="txtDescPic1" runat="server"></asp:TextBox>
                    </div>

                       <div class="col-sm-3">
                             <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup1" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber1"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber1" Style="display: none;">
                                          <img align="absmiddle" alt="" src="./img/loading_black.gif" /></asp:Label>
                           </div>
                     <div class="col-sm-1 text-left">
                                                <div class="hover_img" runat="server" id="divPic1Preview">
                            <a href="#">Preview<span><img  alt="image" height="250" width="200" style="max-width:200px!important" runat="server" id="imgPreviewPic1"/></span></a>
                                                </div>
                    </div>


</div>


<div class="row">
     <div class="col-sm-1 text-right">
                        Picture 3
                    </div>
                     <div class="col-sm-3">
                          <asp:TextBox ID="txtNamePic2" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-sm-3">
                        <asp:TextBox ID="txtDescPic2" runat="server"></asp:TextBox>
                    </div>

                       <div class="col-sm-3">
                             <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup2" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber2"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber2" Style="display: none;">
                                          <img align="absmiddle" alt="" src="./img/loading_black.gif" /></asp:Label>
                           </div>
                     <div class="col-sm-1 text-left">
                                                <div class="hover_img" runat="server" id="divPic2Preview">
                            <a href="#">Preview<span><img  alt="image" height="250" width="200" style="max-width:200px!important" runat="server" id="imgPreviewPic2"/></span></a>
                                                </div>
                    </div>


    </div>


<div class="row">
         <div class="col-sm-1 text-right">
                        Picture 4
                    </div>
                     <div class="col-sm-3">
                          <asp:TextBox ID="txtNamePic3" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-sm-3">
                        <asp:TextBox ID="txtDescPic3" runat="server"></asp:TextBox>
                    </div>

                       <div class="col-sm-3">
                              <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup3" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber3"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                  </span>

                                                <asp:Label runat="server" ID="myThrobber3" Style="display: none;">
                                          <img align="absmiddle" alt="" src="./img/loading_black.gif" /></asp:Label>
                           </div>
                     <div class="col-sm-1 text-left">
                                                <div class="hover_img" runat="server" id="divPic3Preview">
                            <a href="#">Preview<span><img  alt="image" height="250" width="200" style="max-width:200px!important" runat="server" id="imgPreviewPic3"/></span></a>
                                                </div>
                    </div>

    </div>

<div class="row">

    <div class="col-sm-12">

     <asp:Label ID="lblMessageBoatInfo" runat="server"></asp:Label>

    </div>


</div>


<div class="row">

    <div class="col-sm-12">

        <asp:Button ID="btnSaveBoatOwnerInfo" runat="server" Text="Save"  OnClick="btnSaveBoatOwnerInfo_Click" CssClass="btn btn-primary center-block"  />

    </div>


</div>
    




      </div>
    </div>

                      </ContentTemplate>
          </asp:UpdatePanel>
         
                  
                   </div>
      

      
      
      </div>
                 
                 
                      
        
        
        
         </div>
   


 <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
        UPCOMING  BOAT RENTALS
          <i class="indicator glyphicon glyphicon-chevron-up  pull-right"></i></a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
      <div class="panel-body">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
            <div class="col-lg-12 col-sm-12 padbot20">
               
        
                <asp:GridView ID="gvUpcomingBoatRentals" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="BoatName" HeaderText="Boat" />
                        <asp:BoundField DataField="PickupDate" HeaderText="From Date" />
                        <asp:BoundField DataField="ch_BeginHour" HeaderText="From Time" />

                          <asp:BoundField DataField="DropOffDate" HeaderText="To Date" />
                        <asp:BoundField DataField="ch_EndHour" HeaderText="To Time" />
                         
                         <asp:BoundField DataField="TypeOfRent" HeaderText="Rental Type" />
                       

                    </Columns>

                </asp:GridView>
     
  
                </div>
  
      </ContentTemplate>
             </asp:UpdatePanel>
      
        </div>
                 
                 
                      
        
        
        
         </div>
    </div>

   <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
         PAST BOAT RENTALS
          <i class="indicator glyphicon glyphicon-chevron-up  pull-right"></i></a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
              <ContentTemplate>
            <div class="col-lg-12 col-sm-12 padbot20">
               
        
                <asp:GridView ID="gvPastRentals" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="BoatName" HeaderText="Boat" />
                        <asp:BoundField DataField="PickupDate" HeaderText="From Date" />
                        <asp:BoundField DataField="ch_BeginHour" HeaderText="From Time" />

                          <asp:BoundField DataField="DropOffDate" HeaderText="To Date" />
                        <asp:BoundField DataField="ch_EndHour" HeaderText="To Time" />
                         
                         <asp:BoundField DataField="TypeOfRent" HeaderText="Rental Type" />
                       

                    </Columns>

                </asp:GridView>
     
  
                </div>
  
      
      
        </div>
                 
                 
                      
        
        
        
         </div>
    </div>
                     
                     
                     
                     
   </div>

                      </ContentTemplate>

           </asp:UpdatePanel>


</div>
     

     
        
             
        
        
        
        
        
        
        
         </div>



</ContentTemplate>
               </asp:UpdatePanel>

          
            </div>
        </div>
   

           <script type="Text/javascript">








            function fillCell(row, cellNumber, text) {
                var cell = row.insertCell(cellNumber);
                cell.innerHTML = text;
                cell.style.borderBottom = cell.style.borderRight = "solid 1px #aaaaff";
            }
            function addToClientTable(name, text) {
                var table = document.getElementById("<%= clientSide.ClientID %>");
           var row = table.insertRow(0);
         
       }





       function uploadError(sender, args) {
           addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
           alert("Error uploading photo " + args.get_errorMessage());

       }
       function uploadComplete(sender, args) {

           


           //var contentType = args.get_contentType();
           //var text = args.get_length() + " bytes";
           //if (contentType.length > 0) {
           //    text += ", '" + contentType + "'";
           //}
           //addToClientTable(args.get_fileName(), text);

         
     
          
       }

       function ClientUploadStarted(sender, args) {
           var filename = args.get_fileName();

        

           var ext = filename.substring(filename.lastIndexOf(".") + 1);
           if (ext != 'jpg' && ext != 'JPG' && ext != 'JPEG' && ext != 'jpeg') {
               throw {
                   name: "Invalid File Type",
                   level: "Error",
                   message: "Invalid File Type (Only JPG files)",
                   htmlMessage: "Invalid File Type (Only .jpg)"
               }
               return false;


           }


           // ShowProgressBar();
           return true;
       }

       function ClientUploadStartedVideo(sender, args) {
           var filename = args.get_fileName();
           var ext = filename.substring(filename.lastIndexOf(".") + 1);


           // ShowProgressBar();
           return true;
       }

        </script>



        <script>


            $('#accordion').on('hidden.bs.collapse', function () {
               
            })

            $('#accordion .accordion-toggle').click(function (e) {
                var chevState = $(e.target).siblings("i.indicator").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
                $("i.indicator").not(chevState).removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            });
        </script>

    </form>
</body>
</html>
