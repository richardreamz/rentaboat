<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListEmailLog.aspx.cs" Inherits="admin_ListEmailLog" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlAdminMenuSuper.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>LIST OF EMAILS SENT</title>

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
    <style>
	  html, body {
 width: 100%!important;
  overflow-x: visible !important;
}
</style>

</head>
<body>
       <form id="frmListEmail" runat="server">
             <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>

    <header id="header">
  <%--      Top Menu Here --%>
       
   <div class="container"> <div class="row_header-admin-dashboard" >
           <div align="center"><h1 class="white">DASHBOARD</h1></div>                 
      </div>
         
</div>
        </header>

      <div style="width:100%;">

<%--    Admin Menu here--------------------------------------------------------------------------------- --%>
             <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />

        <div>
           
            <table>
                <tr>
                    <td>

                        <asp:GridView ID="gvEmailSent" runat="server" AutoGenerateColumns="false" AllowSorting="true" OnSorting="gvEmailSent_Sorting" OnRowCommand="gvEmailSent_RowCommand" DataKeyNames="Email_Log_Id">
                            <Columns>

                                <asp:BoundField HeaderText="Email From" DataField="Email_From" SortExpression="Email_From" HeaderStyle-ForeColor="White" />
                                <asp:BoundField HeaderText="Email To" DataField="Email_To" SortExpression="Email_To"  HeaderStyle-ForeColor="White" />
                                <asp:BoundField HeaderText="Subject" DataField="Email_Subject" SortExpression="Email_Subject"  HeaderStyle-ForeColor="White" />
                                <asp:BoundField HeaderText="Type of Email" DataField="Email_Type" SortExpression="Email_Type"  HeaderStyle-ForeColor="White" />
                                <asp:BoundField HeaderText="Date Sent" DataField="Date_Sent" SortExpression="Date_Sent"  HeaderStyle-ForeColor="White" />

                                <asp:ButtonField ButtonType="Button" CommandName="Resend" HeaderText="Resend" Text="Resend Email"  HeaderStyle-ForeColor="White"  />

                            </Columns>



                        </asp:GridView>


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

         setSelectedMenu("liEmailLog");

      </script>
</body>