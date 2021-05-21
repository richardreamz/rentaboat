<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacilityCalendarView.aspx.cs" Inherits="admin_FacilityCalendarView" %>
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

    
 

    
  <style>

     .numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 55px;
    height: 55px;
    padding: 8px;
    
    background: #fff;
    border: 2px solid #666;
    color: #666;
    text-align: center;
    
    font: 26px Arial, sans-serif;
}


.numberCircleBlue {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 55px;
    height: 55px;
    padding: 8px;
    
    background: #72C7CF;
    border: 2px solid #666;
    color: white;
    
    text-align: center;
    
    font: 26px Arial, sans-serif;
}

@media (max-width: 900px) {
	 .numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 35px;
    height: 35px;
    padding: 4px;
    
    background: #fff;
    border: 1px solid #666;
    color: #666;
    text-align: center;
    
    font: 16px Arial, sans-serif;
	 line-height:27px;
}


.numberCircleBlue {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 35px;
    height: 35px;
    padding: 4px;
    
    background: #72C7CF;
    border: 1px solid #666;
    color: white;
    
    text-align: center;
    
    font: 16px Arial, sans-serif;
	 line-height:27px;
}
.calday {
	font-size:16px;}
}


@media (max-width: 767px) {
	 .numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 25px;
    height: 25px;
    padding: 4px;
    
    background: #fff;
    border: 1px solid #666;
    color: #666;
    text-align: center;
    
    font: 12px Arial, sans-serif;
}


.numberCircleBlue {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 25px;
    height: 25px;
    padding: 4px;
    
    background: #72C7CF;
    border: 1px solid #666;
    color: white;
    
    text-align: center;
    
    font: 12px Arial, sans-serif;
}
.calday {
	font-size:12px; line-height:17px;}
}

  </style>
    
	


    
  
</head>
<body>
 

     <form id="frmCalView" runat="server">
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
           <div class="col-lg-12 col-sm-12 padbot20">
          
           <h1>
               <asp:Literal ID="ltrWelcomeHeader" runat="server"></asp:Literal>
           </h1>
           </div>
      </div>

    <div class="row">
             
           <div class="row">
           <div class="col-lg-3 col-sm-3 padbot20">
           <div style="border:1px solid #4CAEB8; padding:5px;">
           <div align="center"><h2>Legend</h2></div>
          <div align="center" style="background-color:#7427d3; color:#fff; padding:5px; margin-bottom:4px;"><strong>Hourly</strong></div>
           <div align="center" style="background-color:#F77D06; color:#fff; padding:5px; margin-bottom:4px;"><strong>1/2 Day AM</strong></div>
           <div align="center" style="background-color:#2DA9E5; color:#fff; padding:5px; margin-bottom:4px;"><strong>1/2 Day PM</strong></div>
           <div align="center" style="background-color:#67a415; color:#fff; padding:5px; margin-bottom:4px;"><strong>Full Day</strong></div>
           </div>
       		</div>


        	<div class="col-lg-5 col-sm-5 padbot20">
            <!-- Select Basic -->
<div class="control-group">
  <label class="control-label" for="ddAvailReserve">Select Calendar View</label>
    
    <asp:DropDownList ID="ddAvailReserve" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddAvailReserve_SelectedIndexChanged">
        <asp:ListItem Text="Available" Value="1"></asp:ListItem>
        <asp:ListItem Text="Reserved" Value="0"></asp:ListItem>
    </asp:DropDownList>
   
   
   
</div>
<div style="clear:both;"></div>
        	
            <!-- Select Basic -->
<div class="control-group">
  <label class="control-label" for="ddBoats">Select Boat</label>
    <asp:DropDownList ID="ddBoats" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddBoats_SelectedIndexChanged">
       
    </asp:DropDownList>

   </div>

<div style="clear:both;"></div>
</div>

            <div class="col-lg-4 col-sm-4 padbot20">
                 <asp:HyperLink ID="lnkUnansweredQuestions" runat="server" NavigateUrl="BoatList.aspx" Text ="Answer Boat Questions" ></asp:HyperLink>
            </div>

                 <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">      

                        <div style="background-color:#f0f4f4; margin:5px;">
                    <table class="res-table" cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:White;border-color:#999999;border-width:1px;border-style:solid;font-family:Verdana;font-size:8pt;width:100%!important;border-collapse:collapse;">
                        
                        <tr>
                            <td>
                                 <div style="background-color:#f0f4f4; padding:0px;"><!--must be no padding-->
                                <table class="res-table" cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color:Black;background-color:#f0f4f4;border-color:#999999;border-width:1px;border-style:solid;font-family:Verdana;font-size:8pt;width:100%!important;border-collapse:collapse;">
                                      <tr>
                            <td align="left" style="width:15%;"  >
                             
                            <asp:ImageButton ID="btnPreviousMonthStartDate" OnClick="btnPreviousMonthStartDate_Click" runat="server" ImageUrl="../images/arrow-prev.jpg" />
                            
                            </td>
                            <td  style="width:70%;" valign="bottom">
                              &nbsp; &nbsp;  <asp:DropDownList ID="ddMonthStartCalendar" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddMonthStartCalendar_SelectedIndexChanged" Width="150px" Font-Bold="true" style="margin-left:30%!important">
                                                                 
                                  
                                   <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                   <asp:ListItem Text="April" Value="4"></asp:ListItem>
 <asp:ListItem Text="May" Value="5"></asp:ListItem>
 <asp:ListItem Text="June" Value="6"></asp:ListItem>
 <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                   <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                   <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                   <asp:ListItem Text="October" Value="10"></asp:ListItem>

                                      <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>


                                </asp:DropDownList> &nbsp; &nbsp;
                                <asp:DropDownList ID="ddYearStartCalendar" runat="server" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddYearStartCalendar_SelectedIndexChanged" Font-Bold="true">
                                   

                                  
                                </asp:DropDownList>
                            </td>
                            <td align="right" style="width:15%;" >
                              
                                <asp:ImageButton ID="btnNextMonthStartDate" OnClick="btnNextMonthStartDate_Click" runat="server" ImageUrl="../images/arrow-next.jpg" />
                            
                            
                            </td>
                        </tr>
                                </table>
                                          </div>
                            </td>
                        </tr>
                        
                            
                      
                        <tr>
                            <td>

                                      <asp:Calendar  ID="calStartDate" runat="server" Width="100%" DayNameFormat="Short" CssClass="res-table" 
                             OnSelectionChanged="calStartDate_SelectionChanged"   OnVisibleMonthChanged="calStartDate_VisibleMonthChanged" OnDayRender="calStartDate_DayRender" ShowTitle="false">
                                <SelectedDayStyle />
                                <TodayDayStyle  />
                                <SelectorStyle   />
                                <WeekendDayStyle  />
                                <OtherMonthDayStyle   />
                                <NextPrevStyle  />
                                <DayHeaderStyle/>
                                <TitleStyle />
                        </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                         </div>



           
              </div>
                     </div>




                </div>
                    </ContentTemplate>
                        </asp:UpdatePanel>
             
         
         
         
         
         
         </div>
               
               
                 <script>

              setSelectedMenu("liCalendar");

          </script>

                   </form>
</body>
</html>
