<%@ Page Language="C#" AutoEventWireup="true" CodeFile="boats_mant.aspx.cs" Inherits="BoatRenting.boats_mant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD/EDIT  BOATS</title>
<style>
    .vcenter {
    display: inline-block;
    vertical-align: middle!important;
    float: none;
}

    .row {
    display: table;
    width:100%!important;
}

.row [class*="col-"] {
    float: none;
    display: table-cell;
    vertical-align: top;
}

.input-symbol-dollar {
    position: relative;
    height:41px!important;
    
}
.input-symbol-dollar input {
    padding-left:18px;
    height:41px!important;

}
.input-symbol-dollar:before {
    position: absolute;
    vertical-align:middle!important;
    content:"$";
    left: 5px;
    height:41px!important;
    top:11px!important;
    font-size:15px!important;
}


.input-symbol-dollar1 {
    position: relative;
    /*height:40px!important;*/
    
}
.input-symbol-dollar1 input {
    padding-left:15px;
   /*height:40px!important;*/

}
.input-symbol-dollar1:before {
    position: absolute;
    vertical-align:middle!important;
    content:"$";
    left: 12px;
    height:60px!important;
    top:11px!important;
    font-size:15px!important;
}

.input-symbol-euro {
    position: relative;
    height:41px!important;
    
}
.input-symbol-euro input {
    padding-left:18px;
    height:41px!important;

}
.input-symbol-euro:before {
    position: absolute;
    vertical-align:middle!important;
    content:"€";
    left: 5px;
    height:41px!important;
    top:11px!important;
    font-size:15px!important;
}


.input-symbol-euro1 {
    position: relative;
    /*height:40px!important;*/
    
}
.input-symbol-euro1 input {
    padding-left:15px;
   /*height:40px!important;*/

}
.input-symbol-euro1:before {
    position: absolute;
    vertical-align:middle!important;
    content:"€";
    left: 12px;
    height:60px!important;
    top:11px!important;
    font-size:15px!important;
}


.lefttextalign
{

    text-align:left!important;
}

</style>

   
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

.removefloat
{
    float:none!important;
}

              

#mdlPopupHolidayCalendar_foregroundElement
{
     z-index:9990001!important;
}

#mdlPopupHolidayCalendar_backgroundElement
{
     z-index:9990000!important;
}

.modalBackground
{
     /*z-index:9990000!important;*/
       z-index:999!important;
}
 </style>



   

   
        <style>
                                                .hover_img a { position:relative; }
.hover_img a span { position:absolute; display:none; z-index:99; }
.hover_img a:hover span { display:block; }
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

  
       
     

         <div class="container">

<%--    Admin Menu here--------------------------------------------------------------------------------- --%>
             <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />

         <asp:UpdatePanel ID="upPanel" runat="server">
             <ContentTemplate>

             </ContentTemplate>
         </asp:UpdatePanel>
         
             <div class="contact-form" id="contact-form">

                  
      
                 <fieldset>

					<div class="control-group">
						<label class="control-label" for="textinput"><a data-toggle="tooltip" title="This name needs to be unique. This is how you will determine between your boats. If you have three of the same types of boats, you may want to name them unit 01 through unit 03.">Boat Name
                     <img src="./images/help.png" />
                                </a></label>
    					   <asp:TextBox ID="txtName" runat="server" CssClass="input-xlarge"></asp:TextBox>
					</div>
					<div style="clear:both;"></div>

                    
                     	<div class="control-group">
						<label class="control-label" for="textinput">Make </label>
    					     <asp:TextBox ID="txtMake" runat="server" CssClass="input-xlarge"></asp:TextBox>
					</div>
					<div style="clear:both;"></div>

                     

                     	<div class="control-group">
						<label class="control-label" for="textinput">Model </label>
    					     <asp:TextBox ID="txtModel" runat="server" CssClass="input-xlarge"></asp:TextBox>
					</div>
					<div style="clear:both;"></div>


                     	<div class="control-group">
						<label class="control-label" for="textinput">Year </label>
    					      <asp:TextBox ID="txtYear" runat="server" MaxLength="4" ></asp:TextBox>

                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                                        TargetControlID="txtYear" />
					</div>
					<div style="clear:both;"></div>

                     	<div class="control-group">
						<label class="control-label" for="textinput">
                            
                              <a  data-toggle="tooltip" title=" Size in Feet ">  Size
                             <img src="./images/help.png" />
                                </a>



						</label>
    					      <asp:TextBox ID="txtSize" runat="server" Width="200px" ></asp:TextBox>
                               

                                
                             &nbsp;
                             <asp:DropDownList ID="ddvcSizeUnit" runat="server" Height="41px">
                                 <asp:ListItem Text="Feet" Value="1" Selected="True"></asp:ListItem>
                                 <asp:ListItem Text="Meters" Value="2" ></asp:ListItem>

                             </asp:DropDownList>
					</div>
					<div style="clear:both;"></div>
                     
                     <div class="control-group">
						<label class="control-label" for="textinput">Maximum Passengers </label>
    					       <asp:TextBox ID="txtMaximumPassengers" runat="server"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers"
                                        TargetControlID="txtMaximumPassengers" />
					</div>
					<div style="clear:both;"></div>
                     
                      	<div class="control-group">
						<label class="control-label" for="textinput">Main Category </label>
    					      <asp:DropDownList ID="ddMainCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMainCategory_SelectedIndexChanged"></asp:DropDownList>

					</div>
					<div style="clear:both;"></div>
                           <div class="control-group">
						<label class="control-label" for="textinput">Boat is for Sale </label>
    					          <asp:CheckBox ID="chkBoatSale" runat="server" AutoPostBack="true" OnCheckedChanged="chkBoatSale_CheckedChanged"></asp:CheckBox>

                                    &nbsp; &nbsp; 
                        <asp:TextBox ID="txtBoatSaleAmount" runat="server" Width="200px"  ></asp:TextBox>
                          <asp:DropDownList ID="ddBoatSaleCurrency" runat="server" style="height:35px;!important;"></asp:DropDownList>   
					</div>
					<div style="clear:both;"></div>

               


                     	<div class="control-group">
						<label class="control-label" for="textinput">Marina Name</label>
    					      <asp:TextBox ID="txtMarinaName" runat="server"></asp:TextBox>
                                   

                                   
					</div>
					<div style="clear:both;"></div>
                           <div class="control-group">
						<label class="control-label" for="textinput">Check here if billing address is same as boat address/location </label>
    					          <asp:CheckBox ID="chkSameAsFacilityAddress" runat="server" AutoPostBack="true" OnCheckedChanged="chkSameAsFacilityAddress_CheckedChanged"></asp:CheckBox>

                                   
                                   
					</div>
					<div style="clear:both;"></div>

                     	<div class="control-group">
						<label class="control-label" for="textinput"><span class="hilite">*</span>Boat Address 1: </label>
    					      <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
                                    
                                   
					</div>
					<div style="clear:both;"></div>

                     <div class="control-group">
						<label class="control-label" for="textinput">Address 2: </label>
    					      <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                                    
                                   
					</div>
					
					<div style="clear:both;"></div>
                     	<div class="control-group">
						<label class="control-label" for="textinput"><span class="hilite">*</span>Zip/Postal Code </label>
    					      <asp:TextBox ID="txtZipCode" runat="server" ></asp:TextBox>
                                    
                                   
					</div>
					<div style="clear:both;"></div>
                      	
<div class="control-group">
  <label class="control-label" for="textinput"><span class="hilite">*</span>Country: </label>
      
            <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged"></asp:DropDownList>

</div>
<div style="clear:both;"></div>




<div class="control-group">
  <label class="control-label" for="textinput"><span class="hilite">*</span>State/Province:</label>
      
            <asp:DropDownList ID="ddState" runat="server" ></asp:DropDownList>

</div>
<div style="clear:both;"></div>




<div class="control-group">
  <label class="control-label" for="textinput"><span class="hilite">*</span>City/Region:</label>
      
               <asp:TextBox ID="txtCity" runat="server"  ></asp:TextBox>

</div>
<div style="clear:both;"></div>



<div class="control-group">
  <label class="control-label" for="textinput">
     
      <a  data-toggle="tooltip" title="Name the body of water in which your boat is located. Please be specific. For example, if your facility is located on the East Coast, you would not say Atlantic Ocean,
                         but rather the particular bay, cove or river where your boat is located."> Body Of Water:
                             <img src="./images/help.png" />
                                </a>
  </label>
      
             <asp:TextBox ID="txtBodyOfWater" runat="server"></asp:TextBox>

</div>
<div style="clear:both;"></div>


<div class="control-group">
  <label class="control-label" for="textinput">Phone:</label>
      
            <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="MKE"></asp:TextBox>
                       
    

</div>
<div style="clear:both;"></div>




                       <div class="control-group">
						<label class="control-label" for="textinput">
                            
                           
                             <a  data-toggle="tooltip" title=" Check off if you require a captain or guide to be present while renters rent your boat.">  Captain or Guide Required
                             <img src="./images/help.png" />
                                </a>

						</label>
    					         <asp:CheckBox ID="chkCaptainAvailable" runat="server"></asp:CheckBox>
                                   
					</div>
					<div style="clear:both;"></div>




                     	<div class="control-group">
						<label class="control-label" for="textinput">Boat Description </label>
    					      <asp:TextBox ID="txtBoatDescription" runat="server" TextMode="MultiLine" Width="500px" Rows="4"></asp:TextBox>
                                   
					</div>
					<div style="clear:both;"></div>




                     	<div class="control-group">
						<label class="control-label" for="textinput">Requirement </label>
    					       <asp:TextBox ID="txtRequirement" runat="server" TextMode="MultiLine" Width="500px" Rows="4"></asp:TextBox>
                                  
                                   
					</div>
					<div style="clear:both;"></div>

                     
<div class="control-group">
  <label class="control-label" for="textarea">
      

        <a  data-toggle="tooltip" title="This is where you can explain the benefits of your area. For example, if your facility has a bait and tackle store or ship store you can include it here. Also, if there are any restaurants, parks, beaches, or other local attractions that would interest a customer you can list them or include a short explanation.">   Area & Attractions:
                             <img src="./images/help.png" />
                                </a>
    



  </label>
  <div class="controls">                     
   <asp:TextBox ID="txtFacilityAreaAttractions" runat="server" TextMode="MultiLine" Rows="5" Width="400px"></asp:TextBox>
                     
  </div>
</div>
<div style="clear:both;"></div>


                     <div class="control-group">
  <label class="control-label" for="textarea">Cancellation Policy</label>
  <div class="controls">                     
     <asp:TextBox ID="txtFacilityCancellationPolicy" runat="server" TextMode="MultiLine" Rows="5" Width="400px"></asp:TextBox>
                     
  </div>
</div>
<div style="clear:both;"></div>


                   


                        

                 


                     <br />
                     <br />
                     <hr />


                       <h3>
            <a  data-toggle="tooltip" title="This feature allows you to insert a photo from your own computer onto your boat page. Press the browse button, then select your photo files and save them to the page.
                   ">  PHOTOS TO BE USED 
                             <img src="./images/help.png" />
                                </a></h3>
                            <br />
                            * Please choose a good quality photograph when uploading your photos. Pictures should be at least 500px in width and 300px in height. 
                            Please make sure that when choosing a picture your boat is prominently displayed in the middle of the photograph. Pictures with too much sky or water showing on either the top or bottom may get cut off.

					 <div id="divProgress" class="ProgressBar" runat="server" style="visibility: hidden">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="./images/loading_black.gif" Height="32" Width="32" AlternateText="Processing" /><b><i>&nbsp;&nbsp;Processing....... </i></b>
                                                </div>
    					          <asp:Label ID="lblMessageImageUpload" runat="server"></asp:Label>

				  <h3  style="padding-left:160px;">Result & Detail Pic</h3>
                    
   
                      <div class="row">
                         <div class="col-lg-7 vcenter">
                     <div class="control-group">					 
                      <label class="control-label" for="textinput">
                          <a  data-toggle="tooltip" title="Though not required, inputting a relevant picture name like (searay) and description like (Cabin Boat) in the input box of your will improve our Search Engine position and increase your boats chances of being shown on the major Search Engines.       "> Name
                             <img src="./images/help.png" />
                                </a>
                          
                         

                      </label>
                   <asp:TextBox ID="txtNamePic" runat="server"></asp:TextBox>
                      </div>
                      <div style="clear:both;"></div>



                         <div class="control-group">
					  <label class="control-label" for="textinput">Description</label>
                      <asp:TextBox ID="txtDescPic" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>


                        <div class="control-group">                      
					  <label class="control-label" for="textinput">Image File</label>
                   
                            
                        

                            
                                <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber" Style="display: none;">
                                          <img align="absmiddle" alt="" src="../img/loading_black.gif" /></asp:Label>

                     



                        </div>

                          </div>

                          <div class="col-lg-5">
                              <img  alt="image"  width="350" style="max-width:350px!important;border:solid!important;border-color:blue!important;" runat="server" id="imgPreviewMainPic"/>

                          </div>

                          </div>

                      <div style="clear:both;"></div>

<%-----------------%>

                        <br/><br/>

                      <div class="row">
                         <div class="col-lg-7 vcenter">
                      <h3  style="padding-left:160px;">Other Pic1</h3>
                      <div class="control-group">					  
                      <label class="control-label" for="textinput">Name</label>
                   <asp:TextBox ID="txtNamePic1" runat="server"></asp:TextBox>
                      </div>
                      <div style="clear:both;"></div>

                        <div class="control-group">
					  <label class="control-label" for="textinput">Description</label>
                     <asp:TextBox ID="txtDescPic1" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>


                       <div class="control-group">
					  <label class="control-label" for="textinput">Image File</label>
                       
                      


                                <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup1" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber1"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber1" Style="display: none;">
                                          <img align="absmiddle" alt="" src="../img/loading_black.gif" /></asp:Label>

                     


                       </div>
                          
                                </div>

                          <div class="col-lg-5">
<img  alt="image"  width="350" style="max-width:350px!important;border:solid!important;border-color:blue!important;" runat="server" id="imgPreviewPic1"/>

                          </div>

                          </div>


                      <div style="clear:both;"></div>



                         <br><br>
                      <div class="row">
                         <div class="col-lg-7 vcenter">
                      <h3  style="padding-left:160px;">Other Pic2</h3>
                      <div class="control-group">					  
                      <label class="control-label" for="textinput">Name</label>
                        <asp:TextBox ID="txtNamePic2" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>


                           <div class="control-group">
					  <label class="control-label" for="textinput">Description</label>
                     <asp:TextBox ID="txtDescPic2" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>

                        <div class="control-group">
					  <label class="control-label" for="textinput">Image File</label>
                   



                            
                            <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup2" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber2"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber2" Style="display: none;">
                                          <img align="absmiddle" alt="" src="../img/loading_black.gif" /></asp:Label>

                    



                        </div>
                              </div>
                             <div class="col-lg-5">
                                 <img  alt="image"  width="350" style="max-width:350px!important;border:solid!important;border-color:blue!important;" runat="server" id="imgPreviewPic2"/>

                             </div>



                            
                          </div>

                      <div style="clear:both;"></div>
                      
                      <br/><br/>
                     <div class="row">
                         <div class="col-lg-7 vcenter">
                      <h3  style="padding-left:160px;">Other Pic3</h3>
                      <div class="control-group">					  
                      <label class="control-label" for="textinput">Name</label>
                     <asp:TextBox ID="txtNamePic3" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>
                      
                      <div class="control-group">
					  <label class="control-label" for="textinput">Description</label>
                       <asp:TextBox ID="txtDescPic3" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>


                      <div class="control-group">
					  <label class="control-label" for="textinput">Image File</label>
                    
                     


                            <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup3" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber3"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber3" Style="display: none;">
                                          <img align="absmiddle" alt="" src="../img/loading_black.gif" /></asp:Label>

                     

                           </div>
                          </div>

                             <div class="col-lg-5">
                                 <img  alt="image"  width="350" style="max-width:350px!important;border:solid!important;border-color:blue!important;" runat="server" id="imgPreviewPic3"/>
                             </div>


                            
</div>
                      <div style="clear:both;"></div>



                          <br/><br/>

                       <div class="row">
                         <div class="col-lg-7 vcenter">
                       <h3  style="padding-left:160px;">Other Pic4</h3>
                      <div class="control-group">					 
                      <label class="control-label" for="textinput">Name</label>
                      <asp:TextBox ID="txtNamePic4" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>
                      
                      <div class="control-group">
					  <label class="control-label" for="textinput">Description</label>
                   <asp:TextBox ID="txtDescPic4" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>
                      
                      <div class="control-group">
					  <label class="control-label" for="textinput">Image File</label>
                    
                     


                             <span class="btn btn-default btn-file">
                  <img src="./img/addboatPhoto.png" />
                       <asp:AsyncFileUpload ID="fileup4" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete" 
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber4"
                                                    OnClientUploadStarted="ClientUploadStarted" OnClientUploadComplete="uploadComplete"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber4" Style="display: none;">
                                          <img align="absmiddle" alt="" src="../img/loading_black.gif" /></asp:Label>

                     


                      </div>




                             </div>

                           <div class="col-lg-5">
<img  alt="image"  width="350" style="max-width:350px!important;border:solid!important;border-color:blue!important;" runat="server" id="imgPreviewPic4"/>
                           </div>


                           </div>
                      <div style="clear:both;"></div>
                      
				 



                     


				   
                   <br/><br/>


      <hr/>
                   

				  <h3>Add Video to your boat Listing</h3>
				<hr/>
				 Simply use the upload tool to add video to your boat listing  page.  
				  
				 <br/><br/>

                       <div class="row">
                           <asp:UpdatePanel ID="upVideo" runat="server">

                               <ContentTemplate>

                            
                         <div class="col-lg-8 vcenter">
                       <h3  style="padding-left:160px;">Video</h3>
                      <div class="control-group">					 
                      <label class="control-label" for="textinput">Name</label>
                    <asp:TextBox ID="txtVideoName" runat="server"></asp:TextBox>

                       </div>
                      <div style="clear:both;"></div>
                      
                      <div class="control-group">
					  <label class="control-label" for="textinput">Description</label>
                      <asp:TextBox ID="txtVideoDescription" runat="server"></asp:TextBox>
                       </div>
                      <div style="clear:both;"></div>
                      
                      <div class="control-group">
					  <label class="control-label" for="textinput">Video File</label>
                   


                       <span class="btn btn-default btn-file">
                  <img src="./img/addboatvideo.png" />
                       <asp:AsyncFileUpload ID="fileupVideo" runat="server" CssClass="cssAddPhoto" 
                                                    OnUploadedComplete="OnAsyncFileUploadComplete"
                                                    CompleteBackColor="Green" UploadingBackColor="Red" ThrobberID="myThrobber10"
                                                    OnClientUploadStarted="ClientUploadStartedVideo" OnClientUploadComplete="uploadCompleteVideo"   />
                                 </span>
                                                <asp:Label runat="server" ID="myThrobber10" Style="display: none;">
                                          <img align="absmiddle" alt="" src="../img/loading_black.gif" /></asp:Label>

                
                   

                      
                      
                      
                      
                   
                      <div style="clear:both;"></div>
                      
                     
                        <div style="visibility:hidden">
					  <label class="control-label" for="textinput">Youtube Link</label>
                     <asp:TextBox ID="txtYoutubeLink" runat="server" Width="300px" ></asp:TextBox>
                     
                        
                        </div>
                          </div>

                        </div>
                              <div class="col-lg-4">

                                   <iframe width="400" height="400" runat="server" id="iframeVideo" style="height:400px!important;"
                src="http://www.youtube.com/embed/HWTv15ilQks"  frameborder="0" allowfullscreen></iframe>
                           </div>

                      

                        </ContentTemplate>
                           </asp:UpdatePanel>

                   
                </div>
                      
        
				     <div style="clear:both;"></div> 

				<br/><br/>
                  
<hr />
                     <h3>

                         <script>

                             function AddNewBoatDollarSign()
                             {
                                 $('.input-symbol-euro').toggleClass("input-symbol-euro").toggleClass('input-symbol-dollar');


                                 $('.csymbol').text("$");
                             }

                             function ChangeCurrencySign(ddid)
                             {
                               

                                 var c = document.getElementById(ddid.id);
if (c.value == 1)
{
   
    $('.input-symbol-euro').toggleClass("input-symbol-euro").toggleClass('input-symbol-dollar');
  
   
    $('.csymbol').text("$");
}
else

{
      $('.input-symbol-dollar').toggleClass("input-symbol-dollar").toggleClass('input-symbol-euro');
  
     $('.csymbol').text("€");
}


                             }
                         </script>
                          <b><span class="hilite">*</span>Pricing </b>

                     </h3>
                     <hr />

                    
                  

                      <b>*Fill in your boat rental price in at least one of the boxes next to the Rental Time Slots that are<br />
                                                    available for your boat and the hours available. If you do not offer a certain Time Slot leave it blank.</b>
                      <br />
                     <br />
                      <div class="control-group">
                         	<label class="control-label" for="ddCurrency">Pick a Currency  &nbsp;</label>
                          <asp:DropDownList ID="ddCurrency" runat="server" onchange="ChangeCurrencySign(this)" style="height:35px;!important;"></asp:DropDownList>   
                     </div>
                     <div style="clear:both;"></div>
                     <br />


              <table>
                                       

                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Week Day </th>
                                                <th>Weekend Day </th>
                                                <th>
                                                    <asp:Button ID="btnHolidyList" runat="server" OnClick="btnHolidyList_Click" Text="Holiday" ToolTip="" />
                                                    <a data-toggle="tooltip" title="Here you can select what days of the year you want as Holidays. Not all Holiday calendars are the same so we allow you to select your own Holidays and their corresponding dates. For example, USA Independence Day is July 4th but you my want July 3rd and 5th to also be considered as Holiday pricing.">
                                                    <img src="./images/help.png" />
                                                    </a></th>
                                                <th>Hours From </th>
                                                <th>Hours To </th>
                                            </tr>
                                        </thead>
                                       

                                        <tr>
                                            <td>Full Day</td>
                                            <td><span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol1" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtFullWeekDay" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers, Custom" TargetControlID="txtFullWeekDay" ValidChars="." />
                                            </td>
                                            <td><span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol2" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtFullWeekend" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers, Custom" TargetControlID="txtFullWeekend" ValidChars="." />
                                            </td>
                                            <td><span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol3" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtFullHoliday" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers, Custom" TargetControlID="txtFullHoliday" ValidChars="." />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddFullHoursFrom" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddFullHoursTo" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Half Day AM </td>
                                            <td><span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol4" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtAMWeekDay" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Numbers, Custom" TargetControlID="txtAMWeekDay" ValidChars="." />
                                            </td>
                                            <td>
                                                <span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol5" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtAMWeekend" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Numbers, Custom" TargetControlID="txtAMWeekend" ValidChars="." />
                                            </td>
                                            <td>
                                                <span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol6" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtAMHoliday" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="Numbers, Custom" TargetControlID="txtAMHoliday" ValidChars="." />
                                            </td>


                                            <td>
                                                <asp:DropDownList ID="ddAMHoursFrom" runat="server" Width="100px">
                                                </asp:DropDownList>

                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddAMHoursTo" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>


                                        </tr>

                                        <tr>
                                            <td>
                                                Half Day PM
                                            </td>
                                            <td><span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol7" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtPMWeekDay" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" FilterType="Numbers, Custom" TargetControlID="txtPMWeekDay" ValidChars="." />
                                            </td>
                                            <td>
                                                <span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol8" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtPMWeekend" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" FilterType="Numbers, Custom" TargetControlID="txtPMWeekend" ValidChars="." />
                                            </td>
                                            <td>
                                                <span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol9" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtPMHoliday" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" FilterType="Numbers, Custom" TargetControlID="txtPMHoliday" ValidChars="." />
                                            </td>


                                            <td>
                                                <asp:DropDownList ID="ddPMHoursFrom" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddPMHoursTo" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>


                                        </tr>

                                        <tr>
                                            <td>
                                                Hourly
                                            </td>
                                            <td><span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol10" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtHourWeekDay" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" FilterType="Numbers, Custom" TargetControlID="txtHourWeekDay" ValidChars="." />
                                            </td>
                                            <td>
                                                <span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol11" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtHourWeekend" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" FilterType="Numbers, Custom" TargetControlID="txtHourWeekend" ValidChars="." />
                                            </td>
                                            <td>
                                                <span class="csymbol">
                                                <asp:Label ID="lblCurrencySymbol12" runat="server"></asp:Label>
                                                </span>
                                                <asp:TextBox ID="txtHourHoliday" runat="server" CssClass="removefloat" Width="100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" FilterType="Numbers, Custom" TargetControlID="txtHourHoliday" ValidChars="." />
                                            </td>


                                            <td>
                                                <asp:DropDownList ID="ddHourHoursFrom" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddHourHoursTo" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </td>


                                        </tr>

                                        <tr>
                                            <td colspan="6">
                                                <asp:Label ID="lblMessagePricing" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:Label>
                                            </td>


                                        </tr>



                                    </table>

                     <br/>
                     
                        <div class="control-group">
						<label class="control-label" for="textinput">Tax Rate </label>
    					         <asp:TextBox ID="txtTaxRate" runat="server" Width="80"></asp:TextBox> <label class="control-label lefttextalign">% </label>
                               
                                   
					</div>
					<div style="clear:both;"></div>

                       <div class="control-group">
						<label class="control-label" for="textinput">Reservation Deposit </label>
    					 <span class="input-symbol-dollar" id="sReservation" runat="server"><asp:TextBox ID="txtReservationDeposit" runat="server"  ></asp:TextBox></span>

                                   
                                   
					</div>
					<div style="clear:both;"></div>


                       <div class="control-group">
						<label class="control-label" for="textinput">Security Deposit</label>
    					       <span class="input-symbol-dollar" id="sSecurity" runat="server">  <asp:TextBox ID="txtSecurityDeposit" runat="server" ></asp:TextBox></span>
                                 

                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers"
                                        TargetControlID="txtSecurityDeposit" />
                                   
					</div>


					<div style="clear:both;"></div>

                                        
<div class="control-group">
  <label class="control-label" for="selectbasic">
      
       <a  data-toggle="tooltip" title="   Check this box if you DO NOT want to offer last minute reservations or same day reservations of your boat">  Do not allow same day reservation:
                             <img src="./images/help.png" />
                                </a>
    



  </label>
        <asp:CheckBox ID="chkNoSameDay" runat="server" />
</div>
<div style="clear:both;"></div>

                     
                     
                     
                     
                     <br/><br/>



                     <div runat="server" id="boatLink" >
              <div style="text-align:center;float:left;">       
<b>Have a Website? Drive Traffic To Your Site - Link to Us and We Will Link Back to You.</b><br />

To Your Own Customized Boat Page Showing Your Customers ONLY Your Boats, Prices and Pictures.<br />
Copy and Paste the Bellow URL to any Text, Button or Picture on Your Website<br />

Questions call web tech 632-286-7817
                  </div>

<br />

                         <asp:TextBox ID="txtWebSiteAddress" runat="server" style="width:500px!important;max-width:500px;cursor:copy" ReadOnly="true" ></asp:TextBox>

</div>




                     <br/><br/><br/>

                       <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                     <br />

                      <br />
                      <br />

 <div class="btns">
                          <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CssClass="btn3 " OnClick="btnCancel_Click" />
                      </div>  

                      <div class="btns" style="padding-left:20px;">
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn3 " Text="Save" OnClick="btnSave_Click" ValidationGroup="saveRecord" OnClientClick="javascript:return ShowProgress();" />

                      </div>
                      
                  
                     <div style="clear:both;"></div>

                  


                 
                        

                     <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;"
                            runat="server" cellpadding="3" id="clientSide" />

  
                             <asp:UpdatePanel ID="pnl" runat="server">
                            <ContentTemplate>


                            <asp:ModalPopupExtender ID="mdlPopupHolidayCalendar" runat="server"
                        TargetControlID="btnHidden"
                        PopupControlID="pnlNoAvailability"
                        BackgroundCssClass="modalBackground"
                        
                        DropShadow="true"
                        CancelControlID="btnCancelHoliday" />

                 
                   


                        

                    <asp:Panel ID="pnlNoAvailability" Style="display: none;z-index:9990001!important;" runat="server">

                    

                             <asp:Button ID="btnHidden" runat="server" Style="display: none" />

  

                        <div style="background-color: white">
                            <div style="background-color: green; color: white; font-size: medium;">
                                Add/Remove Holidays by Clicking on the Date.
                     
                            </div>
                            <div style="margin-top: 10px;">
                                <asp:Calendar ID="calHoliday" runat="server" Width="330px"
                                    BackColor="White" BorderColor="Black" Font-Names="Verdana"
                                    Font-Size="9pt" ForeColor="Black" OnSelectionChanged="calHoliday_SelectionChanged" OnVisibleMonthChanged="calHoliday_VisibleMonthChanged"
                                    OnDayRender="calHoliday_DayRender" BorderStyle="Solid" CellSpacing="1" Height="250px" NextPrevFormat="ShortMonth">


                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt"></DayHeaderStyle>

                                    <DayStyle BackColor="#CCCCCC"></DayStyle>

                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White"></NextPrevStyle>

                                    <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                                    <SelectedDayStyle BackColor="#333399" ForeColor="White"></SelectedDayStyle>

                                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt"></TitleStyle>

                                    <TodayDayStyle BackColor="#999999" ForeColor="White"></TodayDayStyle>
                                </asp:Calendar>
                                <div class="mini-box" style="background-color: #f7df57;">&nbsp;</div>
                                <div style="float: left; margin-top: 4px;">Yellow = Holiday</div>

                            </div>
                            <br />
                            <br />

                            <div align="center">

                                <asp:Button ID="btnCancelHoliday" runat="server" Text="DONE" Font-Bold="true" CssClass="button" Width="100px" />
                                <br />
                                <br />


                            </div>
                        </div>

                               
                    </asp:Panel>
                            


                    <asp:ModalPopupExtender ID="mdlPopupProfile" runat="server"   TargetControlID="btnHiddenP"
                        PopupControlID="pnlProfile"
                        BackgroundCssClass="modalBackground"
                        DropShadow="true"
                        >

                    </asp:ModalPopupExtender>
   <asp:Panel ID="pnlProfile" Style="display: none;z-index:9990001!important;" runat="server">

                    

                             <asp:Button ID="btnHiddenP" runat="server" Style="display: none" />
            <div style="background-color: white">
                            <div style="background-color: red; color: white; font-size: large;">
                             ***  Incomplete Facility Profile  ***                   
                            </div>
                              <div style="margin-top: 10px; font-size:medium; font-weight:bold;">
                                  <table>
                                      <tr>
                                          <td style="border:hidden!important;">
                                              Please complete the facility profile before adding the boat.<br />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="border:hidden!important;  margin:auto!important;text-align:center!important; vertical-align:middle!important;padding-left:200px!important" >
                                              <asp:Button ID="btnGoProfile" runat="server" Text="OK" OnClick="btnGoProfile_Click"  Width="100px"  style="background-color: #f44336;color:white;font-weight:bold;" />
                                          </td>
                                      </tr>

                                  </table>
                                  
                                  


                                  </div>
                </div>
       

  </asp:Panel>


                             
                         </ContentTemplate>
                        </asp:UpdatePanel>
    
                             

                    <style type="text/css">
                        .modal {
                            position: fixed;
                            top: 0;
                            left: 0;
                            background-color: black;
                            z-index: 99;
                            opacity: 0.8;
                            filter: alpha(opacity=80);
                            -moz-opacity: 0.8;
                            min-height: 100%;
                            width: 100%;
                        }

                        .loading {
                            font-family: Arial;
                            font-size: 10pt;
                            border: 5px solid #67CFF5;
                            width: 300px;
                            height: 300px;
                            display: none;
                            position: fixed;
                            background-color: White;
                            z-index: 999;
                        }
                    </style>
                    <div class="loading" align="center">
                        <caption>
                            Processing. Please wait.<br />
                            <br />
                            <img alt="loading" src="./images/loader.gif" style="margin-left: 40px; margin-right: 40px; margin-top: 40px;" />
                        </caption>
                    </div>


                      </fieldset>

                 <asp:ModalPopupExtender ID="mdlSuccess" runat="server"
                        TargetControlID="btnSuccess"
                        PopupControlID="pnlSuccess"
                        BackgroundCssClass="modalBackground"
                        DropShadow="true"
                        />

                   <asp:Button ID="btnSuccess" runat="server" Style="display: none;z-index:9990001!important;"  />


                    <asp:Panel ID="pnlSuccess" Style="display: none;z-index:9990001!important;" runat="server">
                           <div style="background-color: gray">
                          <div style="background-color: green; color: white; font-size: medium;">
                                Success
                     
                            </div>
                        <div style="background-color: white">
                            Congratulations your boat listing is now live on RentABoat.com!
                            <br />
                             
                             <div class="btns" style="margin: 0 auto!important; width: 656px; text-align: center!important;background-color:white!important;">
                        <asp:LinkButton ID="btnOK" runat="server" CssClass="btn3 " Text="OK" OnClick="btnOK_Click" Width="100"  />

                            </div>
                        </div>
                               </div>


                        </asp:Panel>

         

                              

                        
               


             
                    <script type="text/javascript">
                        function ShowProgress() {

                            var errromess = "";



                            var isChecked = $("#chkSameAsFacilityAddress").is(":checked");
                            if (!isChecked) {
                                // alert("CheckBox checked.");

                              
                                if  ($("#txtAddress1").val().length == 0)
                                {
                                   // alert("Please provide Boat Address 1.");

                                    // return false;
                                    errromess += "Missing  Boat Address 1. \n";

                                }

                                if ($("#txtZipCode").val().length == 0) {
                                  //  alert("Please provide Zip/Postal Code.");

                                    // return false;

                                    errromess += "Missing Zip/Postal Code. \n";

                                }

                                if ($("#ddCountry").val() == 'Select a Country') {
                                   // alert("Please provide a Country.");

                                    //return false;
                                    errromess += "Missing  Country.\n";

                                }
                                if ($("#ddState").val() == 'Select a State') {
                                   // alert("Please provide State.");

                                  //  return false;
                                    errromess += "Missing  State.\n";
                                }


                                if ($("#txtCity").val().length == 0) {
                                  //  alert("Please provide City.");

                                   // return false;
                                    errromess += "Missing  City.\n";
                                }


                            } 



                            if ($("#txtFullWeekDay").val().length == 0 && $("#txtFullWeekend").val().length == 0 && $("#txtFullHoliday").val().length == 0 && $("#txtAMWeekDay").val().length == 0 && $("#txtAMWeekend").val().length == 0 && $("#txtAMHoliday").val().length == 0 && $("#txtPMWeekDay").val().length == 0 && $("#txtPMWeekend").val().length == 0 && $("#txtPMHoliday").val().length == 0 && $("#txtHourWeekDay").val().length == 0 && $("#txtHourWeekend").val().length == 0 && $("#txtHourHoliday").val().length == 0)
                            {
                                //alert("Please fill in your boat rental price and the hours your boat will be available in at least one of the boxes under \"pricing\"");

                                errromess += "Missing rental rate: Please fill in your boat rental price and the hours your boat will be available in at least one of the boxes under \"pricing\".";



                                //return false;

                            }


                            if (errromess != "")
                            {
                                alert(errromess);
                                return false;


                            }
                            if ($("#txtFullWeekDay").val().length > 0 || $("#txtFullWeekend").val().length > 0 || $("#txtFullHoliday").val().length > 0) {

                                if ($("#ddFullHoursFrom").val() == -1 || $("#ddFullHoursTo").val() == -1) {

                                    alert("Please provide Hours From & Hours To for Full Day Reservation.");

                                    return false;
                                }

                            }


                            if ($("#txtAMWeekDay").val().length > 0 || $("#txtAMWeekend").val().length > 0 || $("#txtAMHoliday").val().length > 0) {

                                if ($("#ddAMHoursFrom").val() == -1 || $("#ddAMHoursTo").val() == -1) {

                                    alert("Please provide Hours From & Hours To for Half Day AM Reservation.");

                                    return false;
                                }

                            }



                            if ($("#txtPMWeekDay").val().length > 0 || $("#txtPMWeekend").val().length > 0 || $("#txtPMHoliday").val().length > 0) {

                                if ($("#ddPMHoursFrom").val() == -1 || $("#ddPMHoursTo").val() == -1) {

                                    alert("Please provide Hours From & Hours To for Half Day PM Reservation.");

                                    return false;
                                }

                            }




                            if ($("#txtHourWeekDay").val().length > 0 || $("#txtHourWeekend").val().length > 0 || $("#txtHourHoliday").val().length > 0) {

                                if ($("#ddHourHoursFrom").val() == -1 || $("#ddHourHoursTo").val() == -1) {

                                    alert("Please provide Hours From & Hours To for Hourly Reservation.");

                                    return false;
                                }

                            }




                            setTimeout(function () {

                                var modal = $('<div />');
                                modal.addClass("modal");
                                $('body').append(modal);
                                var loading = $(".loading");
                                loading.show();
                                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                                loading.css({ top: top, left: left });
                            }, 1);
                        }




                        function pageLoad() {
                            var loading = $(".loading");

                            $(".modal").remove();


                            loading.hide();
                        //    $('#mdlPopupHolidayCalendar_foregroundElement').attr('style', 'position: fixed; z-index: 10001!important; left: 760.5px; top: -40.5px;');
                          //  $('#mdlPopupHolidayCalendar_backgroundElement').attr('style', 'position: fixed; left: 0px; top: 0px; z-index: 10000!important; width: 1903px; height: 5803px;');


                            //$("mdlPopupHolidayCalendar_foregroundElement").style.z-index=9990001;
                            //$("mdlPopupHolidayCalendar_backgroundElement").style.z-index = 9990000;
                        }
                        


                    </script>
                    
                    
                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

    
                    <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>

              <%--      </table>--%>

                    </table>

                 


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

       }
       function uploadComplete(sender, args) {
           var contentType = args.get_contentType();
           var text = args.get_length() + " bytes";
           if (contentType.length > 0) {
               text += ", '" + contentType + "'";
           }
           addToClientTable(args.get_fileName(), text);
          
       }

       function uploadCompleteVideo(sender, args) {
           var contentType = args.get_contentType();
           var text = args.get_length() + " bytes";
           if (contentType.length > 0) {
               text += ", '" + contentType + "'";
           }
         
           $("#txtYoutubeLink").hide();

           alert("Uploaded to Youtube successfully. You will be able to see the video after Youtube process the video.");
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


        
           return true;
       }

       function ClientUploadStartedVideo(sender, args) {
           var filename = args.get_fileName();
           var ext = filename.substring(filename.lastIndexOf(".") + 1);

           var ext = filename.substring(filename.lastIndexOf(".") + 1);
           if (ext != 'mp4' && ext != 'MP4' && ext != 'mov' && ext != 'MOV' && ext != 'm4v' && ext != 'M4V' && ext != 'm2v' && ext != 'M2V') {
               throw {
                   name: "Invalid File Type",
                   level: "Error",
                   message: "Invalid File Type (Only MP4 or MOV files)",
                   htmlMessage: "Invalid File Type (Only .mp4 or mov or m4v or m2v)"
               }
               return false;


           }


          
           return true;
       }

        </script>
          
  
    <script>

        $("#txtZipCode").keyup( function (e) {
            e.preventDefault();
            var aData ;
            aData = $("#txtZipCode").val();
           

            if (aData.length == 5 ) {
             
              
                var jsonData = JSON.stringify({ zipcode: aData });
                $.ajax({
                    type: "POST",                     
                    url: "../GetZipLookup.asmx/getAddressFromZip",
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json", // dataType is json format
                   
                    success: OnSuccess,
                    error: OnErrorCall
                });
            }
            function OnSuccess(response) {
               
                if (response.d.length > 0) {
                    $("#txtCity").val(response.d[0].City);
                   
                    $("#ddState").val(response.d[0].State);
                  
                }
                else
                {
                    $("#txtCity").val("");
                    $("#ddState").val("");
                }
            }
            function OnErrorCall(response) { console.log(error); }
        });


    </script>
        


          </form>
    
</body>
</html>
