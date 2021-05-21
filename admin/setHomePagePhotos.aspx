<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setHomePagePhotos.aspx.cs" Inherits="BoatRenting.admin_setHomePagePhotos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlAdminMenuSuper.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HOME PAGE PHOTOS</title>

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

    
 

    
  
      <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>

	

</head>
<body>
       <form id="frmHomePagePhoto" runat="server">
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

        <div>
           
            <table>
                <tr>
                    <td colspan="3">
                      <h2>  Home page Photo Pick</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                      <b>  Pick 1</b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddMarina1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMarina1_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddBoat1" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <b>  Pick 2</b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddMarina2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMarina1_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddBoat2" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                 <tr>
                    <td>
                       <b>  Pick 3</b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddMarina3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMarina1_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddBoat3" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                 <tr>
                    <td>
                       <b>  Pick 4</b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddMarina4" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMarina1_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddBoat4" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center;"> 
                        <asp:Button ID="btnSaveHomePhotos" runat="server" Text="Save" OnClick="btnSaveHomePhotos_Click" CssClass="btn2" />
                    </td>

                </tr>

                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </td>

                </tr>
            </table>

           
        </div>


              <div>
           
            <table>
                <tr>
                    <td>
                      <h2> Exchange Rate</h2>
                    </td>
                </tr>

                <tr>

                    <td>
                        One (1) USD = 
                   
                        <asp:TextBox ID="txtConversion" runat="server" Width="200px"></asp:TextBox> EURO
                        ( Reverse Rate = <asp:Label ID="lblReverseRate" runat="server"></asp:Label>)

                    </td>
                </tr>
                <tr>

                    <td> 
                        <asp:Button ID="btnSaveExchange" runat="server" Text="Save Exchange Rate" OnClick="btnSaveExchange_Click" CssClass="btn2" />
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="lblMessageExchangeRate" runat="server"></asp:Label>
                    </td>

                </tr>
            </table>

                
              
              
              </div>

            




             </div>

         


		<div id="footer">
			<div id="footer_details">
			
			</div>
		</div>
	
         </form>
     <script>

         setSelectedMenu("liHomePagePhoto");

          </script>
</body>
</html>
