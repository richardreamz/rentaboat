<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSummaryAdmin.aspx.cs" Inherits="BoatRenting.admin_OrderSummaryAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


     <style type="text/css" media="screen">
        @import "br_admin.css";
    .style1
    {
        text-align: right;
        height: 20px;
    }
    .style2
    {
        height: 20px;
    }
</style>

    
<style type="text/css">

        .popupBackground
        {
            position: absolute;
            z-index: 100;
            top: 0px;
            left: 0px;
            background-color: black;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            opacity: 0.8;
        }
    .modal
    {
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
    .loading
    {
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


 	<!-- SCRIPTS -->
	<!--[if IE]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

     <%--  <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>--%>

  <script src="//clevertree.github.io/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>


	<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
    
 
    <script>
        function PrintAgreement()
        {

            window.open('boats_printAgreement.aspx');

            return true;


        }


    </script>
    
  
</head>
<body>
    <form id="form1" runat="server">

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

                <table cellpadding="30">
                    <tr>
                        <td>


                        </td>
                        <td></td>
                    </tr>
                  
                    <tr>

                        <td valign="top" style="font-size:medium;">
                            <br />
                          
                            Boat Name:<b> <%= orderSummary.BoatName %> </b>&nbsp;&nbsp; Boat #:<b> <%= orderSummary.BoatID %></b>

                            <img src="" alt="" width="400" height="246" runat="server" id="mainboatpic"/>

                            <br />
                            
                            Year: <b><%= orderSummary.BoatYear %> </b>&nbsp;&nbsp; Make: <b><%= orderSummary.BoatMake %></b>&nbsp;&nbsp; Model:<b> <%= orderSummary.BoatModel %></b>&nbsp;&nbsp; Size:<b> <%= orderSummary.BoatSize %></b>
                        </td>

                        <td>
                          <table cellpadding="5" cellspacing="5" border="0" style="font-size:medium;" >
                              <tr>
                                  <td style="font-size:large;color:black"><h2>Boat Owner Client Input</h2></td>

                              </tr>
                                <tr>
                                <td>
You are about to remove Boat # <%=orderSummary.BoatID%> from your reservation calendar for the times listed below.
                                    Please input your clients information or search for existing clients by using the search tool.
                                    To self reserve your boat or to "Blackout" dates for maintenance please use "Facility". To edit reservations please
                                    goto your  <asp:LinkButton ID="lnkCalendarPage" runat="server" Text="Calendar" OnClick="lnkCalendarPage_Click"   Font-Size="Medium" ></asp:LinkButton> page




                                 </td>


                                </tr>



                              <tr>
                                  <td>
                                      PICK UP DATE: <b> <%= orderSummary.RentStartDate %></b>

                                  </td>
                                  </tr>
                              <tr>
                                  <td>
                                      DROP OFF DATE:<b>  <%= orderSummary.RentEndDate %></b>

                                  </td>

                              </tr>
                              <tr>
                                  <td>

                                      TIME :<b>  <%= orderSummary.RentingTimeFromTo %></b>

                                  </td>

                              </tr>

                          </table>

                            <table style="font-size:medium;">
                               
                                <tr>
                                    <td>
                                      Type Of Client :  <asp:DropDownList id="ddTypeOfClient" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddTypeOfClient_SelectedIndexChanged">
                                                         <asp:ListItem Text="Select a Client" Value="0"></asp:ListItem>
                                                         <asp:ListItem Text="Existing Client" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="New Client" Value="2"></asp:ListItem>
                                                         <asp:ListItem Text="Facility" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                   
                                        
                                        &nbsp; &nbsp; 
                                        <asp:LinkButton ID="lnkSearchClientList" runat="server" Text="Find by Last Name or First Name" OnClick="lnkSearchClientList_Click"></asp:LinkButton>
                                         </td>

                                </tr>

                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlClientInfo" runat="server" Visible="false">

                                            <table style="font-size:medium;">
                                                <tr>
                                                    <td>
 First Name:
                                                    </td>
                                                    <td>

<asp:TextBox ID="txtFirstNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="rftxtFirstNameNewUser" runat="server" ControlToValidate="txtFirstNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>
                                                         Last Name:
    
                                                    </td>
                                                    <td>

   <asp:TextBox ID="txtLastNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
   
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>
                                                          Address 1: 
                                                    </td>
                                                    <td>
<asp:TextBox ID="txtAddress1NewUser" runat="server" class="input-xlarge"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1NewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           


                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>
                                                       Address 2: 
                                                    </td>
                                                    <td>
<asp:TextBox ID="txtAddress2NewUser" runat="server" class="input-xlarge"></asp:TextBox>
   

                                                    </td>
                                                </tr>

                                                    <tr>
                                                    <td>
                                                        Zip/Postal Code: 
                                                    </td>
                                                    <td>

<asp:TextBox ID="txtZipcodeNewUser" runat="server" class='zip-lookup-field-zipcode' MaxLength="5"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZipcodeNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>
                                                         Country: 
               
          
                                                    </td>
                                                    <td>

                                                          <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged" ></asp:DropDownList>
                
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddCountry" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>
                                                         State:
         
                                                    </td>
                                                    <td>

                                                           <asp:DropDownList ID="ddState" runat="server" class='zip-lookup-field-state'></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddState" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>
City: 
                                                    </td>
                                                    <td>

<asp:TextBox ID="txtCityNewUser" runat="server" class='zip-lookup-field-city' ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCityNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                                                    </td>
                                                </tr>

                                             

                                                 <tr>
                                                    <td>
                                                         Contact Phone: 
                                                    </td>
                                                    <td>

<asp:TextBox ID="txtContactPhoneNewUser" runat="server" class="input-xlarge"></asp:TextBox>
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

AutoComplete="false" />
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td>
 Email:

                                                    </td>
                                                    <td>

 <asp:TextBox ID="txtEmailNewUser" runat="server" class="input-xlarge"></asp:TextBox>
 
                                                    </td>
                                                </tr>

          

                                         

                                                <tr>
                                                    <td colspan="2">

                                                           <asp:Label ID="lblMessageNewUserSave" runat="server" ></asp:Label>
                                                    </td>

                                                </tr>
                                            </table>

                                           

  


       <br />
       
      

        

    
	 





                                        </asp:Panel>


                                    </td>

                                </tr>

                                <tr>
                                    <td>

                                        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Red" BorderStyle="Outset"></asp:Label>
                                    </td>

                                </tr>


                                <tr>
                                    <td>
                                      <div class="btns" style="float:left!important">
         
                                            <asp:Button ID="btnBack" runat="server" Text="GO BACK" OnClick="btnBack_Click" CssClass="btn3" /> 
                                     </div>
                                       <div class="btns" style="float:left!important; margin-left:15px;">
         

                                            <asp:Button ID="btnReserve" runat="server" CssClass="btn3" Text="RESERVE & PRINT AGREEMENT" OnClick="btnReserve_Click" />
                                       
                                         </div>

                                         <div class="btns" style="float:left!important; margin-left:15px;">
         
                                            <asp:Button ID="btnReserveOnly" runat="server" Text="RESERVE " OnClick="btnReserveOnly_Click" CssClass="btn3" />
                                        </div>
                                    </td>

                                </tr>

                            </table>



                        </td>

                    </tr>


                </table>

                        
                 <asp:ModalPopupExtender ID="mdlPopupMessage" runat="server"
    TargetControlID="btnHidden1"
    PopupControlID="pnlMessage"
    BackgroundCssClass="popupBackground" 
    DropShadow="true" 
      
   />
   

                   <asp:Button ID="btnHidden1" runat="server" style="display: none" />


             <asp:Panel id="pnlMessage" style="display: none;" runat="server" Width="400px"  ScrollBars="Auto" DefaultButton="btnOK">
	
              
                             
               

                 <div style="background-color:gainsboro">
           <div style="background-color:green;color:white; font-size:medium;">
                   
                     <asp:Label ID="lblModelHeader" runat="server" Text="Header"></asp:Label>
                </div>
                <div style="margin-top:10px;">                   
                      <asp:Label ID="lblModelBody" runat="server" Font-Bold="true" ></asp:Label>
                    
                </div>
                     <br />
                     <br />

                <div align="center" >
                    <asp:Button ID="btnOK" runat="server" Text ="OK"  OnClick="btnOK_Click"  Font-Bold="true" CssClass="btn3 " Width="100px"/>
                    
		         </div>
        </div>
</asp:Panel>



                  <asp:ModalPopupExtender ID="mdlPopupClientSearch" runat="server"
    TargetControlID="btnHidden"
    PopupControlID="pnlClientSearch"
    BackgroundCssClass="popupBackground" 
    DropShadow="true" 
   CancelControlID="btnCancel"
    
   
   />
   
<asp:Button ID="btnHidden" runat="server" style="display: none" />


             <asp:Panel id="pnlClientSearch" style="display: none" runat="server"  Height="600px" ScrollBars="Auto" DefaultButton="btnSearch">
	
                             
                 <div style="background-color:white">
                <div style="background-color:green;color:white; font-size:medium;">
                   
                    SEARCH & SELECT A CLIENT
                     
                </div>
                     <div >
                         <table cellpadding="5" cellspacing="5" border="0"  align="center">
	<tr>
		<td>First Name:</td>
		<td>
            <asp:TextBox ID="txtFirstName" runat="server" ></asp:TextBox>

		</td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td>
            <asp:TextBox ID="txtLastName" runat="server"  ></asp:TextBox>

		</td>
	</tr>
                             <tr>
                                 <td colspan="2">

                                     <asp:Label ID="lblMessageSelectClient" runat="server"></asp:Label>

                                 </td>

                             </tr>
	<tr>
		
		<td align="center"  valign="bottom" colspan="2">
            <asp:Button ID="btnSearch" runat="server" Text="SEARCH" OnClick="btnSearch_Click" /> &nbsp; &nbsp; 
            <asp:Button ID="btnCancel" runat="server" Text="Close" />

           


		</td>
	</tr>
	</table>


                     </div>

                <div style="margin-top:10px;margin-left:30px; ">                   
                  
                    <asp:GridView ID="gvClient" runat="server" AutoGenerateColumns="false" DataKeyNames="in_ClientID" OnSelectedIndexChanged="gvClient_SelectedIndexChanged" >

                        <Columns>
                            <asp:BoundField DataField="NameAndEmail" ReadOnly="true" />
                            <asp:TemplateField HeaderText="Select">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnkSelect" runat="server" Text="Select" CommandName="Select"></asp:LinkButton>

                              </ItemTemplate>

                            </asp:TemplateField>


                        </Columns>


                    </asp:GridView>

                     <br />
                     <br />

          
        </div>
</asp:Panel>

                


                
          
           
             

                </ContentTemplate>
                    </asp:UpdatePanel>




<div class="loading" align="center">
    <caption>
        Processing. Please wait.<br />
        <br />
        <img alt="loading" src="./images/loader.gif" style="margin-left:40px;margin-right:40px; margin-top:40px;" />
    </caption>
</div>
<script type="text/javascript">
    function ShowProgress() {
      

      

       



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
   



    function pageLoad()
    {
           var loading = $(".loading");     
           
           $(".modal").remove();
    

        loading.hide();
    }

   

</script>



 <script>

              setSelectedMenu("liCalendar");

          </script>
  
             
            



            </div>
    </form>
</body>
</html>
