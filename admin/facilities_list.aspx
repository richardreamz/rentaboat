<%@ Page language="C#" CodeFile="facilities_list.aspx.cs" Inherits="BoatRenting.facilities_list_aspx_cs" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlAdminMenuSuper.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FACILITIES LIST</title>
  

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
      <style type="text/css">
       
        .GridPager a, .GridPager span
        {
            display: block;
            height: 25px;
            width: 25px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }
        .GridPager a
        {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        .GridPager span
        {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }
    </style>
   
    
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

    
 

    
  
   <%--   <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>--%>

	
    <script src="//clevertree.github.io/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>

    
  
</head>
<body>
 
     <form id="frmAddBoat" runat="server">
         <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>

    <header id="header">
  <%--      Top Menu Here --%>
       
   <div class="container"> <div class="row_header-admin-dashboard" >
           <div align="center"><h1 class="white">DASHBOARD</h1></div>                 
      </div>
         
</div>

</header>

  
       
     
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


    <%--<div class="row">--%>
          <%-- <div class="col-xs-12 col-sm-12">--%>
           <h2 style="padding-left:160px;">FACILITIES LIST</h2>

            <div>
                Search Text <asp:TextBox ID="txtSearchText" style="font-size:12px; " runat="server" Width="200px"></asp:TextBox>
                &nbsp;&nbsp; 
                 Facility ID: <asp:TextBox ID="txtFacilityID" runat="server" style="font-size:12px; " Width="80px"></asp:TextBox>
                &nbsp;&nbsp; <asp:Button ID="btnSearch" CssClass="ui-button"  Text="Search" runat="server" OnClick="btnSearch_Click" />
            </div>
               <div>
                   <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>

               </div>

           <asp:GridView ID="gvFacilitiesList"  HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" OnRowDataBound="gvFacilitiesList_RowDataBound" PagerSettings-PageButtonCount="30"
        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
        runat="server" PageSize="20" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" Width="100%" OnRowCommand="gvFacilitiesList_RowCommand" DataKeyNames="in_MarinaID" ShowFooter="true" ShowHeader="true">
             <Columns>
                   <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkDelete" runat="server"  />
                    </ItemTemplate>
                  </asp:TemplateField>
                 <asp:BoundField DataField="vc_contactName" HeaderText="Contact Name" />
                 <asp:BoundField DataField="vc_businessName" HeaderText="Facility Name" />
                 <asp:BoundField DataField="vc_MarinaName" HeaderText="Marina Name" />
                 <asp:BoundField DataField="vc_city" HeaderText="City/Region" />
                 <asp:BoundField DataField="vc_stateName" HeaderText="State" />
                 <asp:BoundField DataField="ch_Zip" HeaderText="Zip Code" />
                 <asp:BoundField DataField="vc_BodyDescription" HeaderText="Body Of Water" />
                 <asp:BoundField DataField="vc_Phone" HeaderText="Phone" />
                
                 <asp:BoundField DataField="in_Rating" HeaderText="*" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' Text="Edit" CommandName="Edit" />
                    </ItemTemplate>

                </asp:TemplateField>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnActivate" Text="Off" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Activate" />
                    </ItemTemplate>

                </asp:TemplateField>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnNotes" Text="Notes" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' runat="server" CommandName="Notes" />
                    </ItemTemplate>

                </asp:TemplateField>

                
             </Columns>

                <PagerStyle HorizontalAlign="Right" CssClass="GridPager"  />
                <pagersettings 
            position="TopAndBottom"/>

              
           </asp:GridView>   
            
                    <div>
                        <asp:Label ID="lblDeleteMessage" runat="server" ></asp:Label>
                    </div>
     <div style="text-align:center;">
         <asp:Button ID="btnDelete" CssClass="btn2" runat="server" Text="Delete Selected" OnClientClick="javascript:return confirm('Are you sure you want to Delete the selected Reservations');" OnClick="btnDelete_Click"/>
     </div>



           <%--   </div>  --%>
       <%-- </div>--%>
 <%--  <div class="row">
        <div class="col-lg-8 col-sm-8 padbot20">
            <br />
         
            
            
                    

 <div class="btns" style="padding-left:160px;">
      <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn2" />
     </div>

      <div class="btns" style="padding-left:20px;">
                      <asp:LinkButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn2" /> 
                      </div>  

           </div>

   </div>--%>

             

     </ContentTemplate>
                        </asp:UpdatePanel>
                 
         
         
         
         </div> 
        
     

    </form>
    
     
        
          <script>

              setSelectedMenu("liFacilityList");

          </script>
   
     
	
<script language="JavaScript" type="text/javascript" src="wz_tooltip.js"></script>  	
</body>
</html>
