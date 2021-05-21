<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BoatList.aspx.cs" Inherits="admin_BoatList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LIST OF BOATS</title>
  

 
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>
	
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

    
 

    
  
    <script type='text/javascript'>
window.__lo_site_id = 153732;

	(function() {
		var wa = document.createElement('script'); wa.type = 'text/javascript'; wa.async = true;
		wa.src = 'https://d10lpsik1i8c69.cloudfront.net/w.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wa, s);
	  })();
	</script>
	


    
  
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
         <div class="col-lg-12 col-sm-12 padbot20">
            <h1>
                <asp:Literal ID="ltrMarinaWelcome" runat="server"></asp:Literal>
            </h1>
           
           <div><div style="float:left;"><h3>Boat List</h3></div><div style="float:right;"><h3>Displaying results <asp:Literal ID="ltrCount" runat="server"></asp:Literal> </h3></div></div>
           <div style="clear:both"></div>
           
                                <!--booking result-->

             

             <asp:GridView ID="gvBoatList" runat="server" AutoGenerateColumns="false" DataKeyNames="in_boatID" OnRowCommand="gvBoatList_RowCommand" Width="100%" OnRowCreated="gvBoatList_RowCreated">
                 <Columns>

                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:CheckBox ID="chkSelectedBoat" runat="server" />

                         </ItemTemplate>

                     </asp:TemplateField>

                       <asp:BoundField HeaderText="Name" DataField="vc_name" />


                     <asp:BoundField HeaderText="Make" DataField="vc_make" />

                       <asp:BoundField HeaderText="Model" DataField="vc_model" />

                       <asp:BoundField HeaderText="Size" DataField="vc_size" />

<%--                      <asp:BoundField HeaderText="Boat Type" DataField="vc_BoatTypeDescription" />--%>

                        <asp:TemplateField>
                         <ItemTemplate>
                               <asp:LinkButton ID="btnBook" runat="server" Text="Book" CommandName="book" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                               
                             
                             <a href="javascript:ShowPopup(this);" data-toggle="popover" title="Booking Description" >  
                            
                                   <img src="./images/help.png">
                                
                              
                              </a>
                          


					
                            


                         </ItemTemplate>

                     </asp:TemplateField>

                 



                     <asp:TemplateField>
                         <ItemTemplate>

                             <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="edit" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>

                         </ItemTemplate>

                     </asp:TemplateField>

                         <asp:TemplateField>

                         <ItemTemplate>

                             <asp:LinkButton ID="btnStaus" Text='<%# Bind("BoatStatus") %>' CommandName="changeStatus" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>

                         </ItemTemplate>

                     </asp:TemplateField>

                       <asp:TemplateField>
                         <ItemTemplate>

                             <asp:LinkButton ID="btnPreview" runat="server" Text="Preview" CommandName="preview" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>

                         </ItemTemplate>

                     </asp:TemplateField>

                        <asp:TemplateField>
                         <ItemTemplate>

                             <asp:LinkButton ID="btnQuestions" runat="server" Text="Questions" CommandName="questions" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>

                         </ItemTemplate>

                     </asp:TemplateField>
                       

                 </Columns>



             </asp:GridView>
                   
    

             <br>

                      <div class="btns" style="padding-left:3px;">
                       
                          <asp:LinkButton ID="btnRemoveSelectedBoats" runat="server" Text="Remove Checked Boats" CssClass="btn3" OnClick="btnRemoveSelectedBoats_Click" OnClientClick="return confirm('Are you sure you want to remove selected boats ?')"></asp:LinkButton>
                      </div>
                      <div class="btns" style="padding-left:3px;">
                       
                           <asp:LinkButton ID="btnDeactivateSelectedBoats" runat="server" Text="Deactivate Checked Boats" CssClass="btn3" OnClick="btnDeactivateSelectedBoats_Click" OnClientClick="return confirm('Are you sure you want to DEACTIVATE selected boats ?')"></asp:LinkButton>

                      </div>  
                      <div class="btns" style="padding-left:3px;">
                    
                           <asp:LinkButton ID="btnAddNewBoat" runat="server" Text="Add New Boat" CssClass="btn3"  OnClick="btnAddNewBoat_Click"></asp:LinkButton>

                      </div>  
<br><br><br><br>


           
           </div>
        <script>

            setSelectedMenu("liBoatListing");
        </script>
        
    
    </div>
                    </ContentTemplate>
                        </asp:UpdatePanel>
             </div>

           <script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});


function ShowPopup(obj)
{
    //alert("Test");
    $("[data-toggle='popover']").popover('toggle');
    $(document).on("click", "[data-toggle=popover]", function () {
       // alert("test");
        $('[data-toggle="popover"]').not(this).popover('hide');
    });
}
</script>
    </form>

  
</body>
</html>
