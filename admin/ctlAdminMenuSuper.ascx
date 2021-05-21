<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlAdminMenuSuper.ascx.cs" Inherits="admin_ctlAdminMenuSuper" %>
<%--<div class="row">--%>
	
   <%--  <div class="col-lg-12 col-sm-12 padbot20" align="center">--%>
     <div class="navbar-admin" runat="server" id="navbarAdmin" >
     <ul class="nav navbar-nav2">
     	<li id="liFacilityList" class="admin"><a href="facilities_list.aspx">Facilities</a></li>
         
         <li style="color:#fff;" class="admin">|</li>
       
         <li id="liClientList" class="admin"><a href="Client_list.aspx">Clients</a></li>
         
         <li style="color:#fff;" class="admin">|</li>



         <li id="liPayPerClick" class="admin"><a href="showPayPerClickReport.aspx">Pay Per Click Report</a></li>
        
         <li style="color:#fff;" class="admin">|</li>
       
         <li id="liHomePagePhoto" class="admin"><a href="setHomePagePhotos.aspx">Home Page Photos</a></li>
        
          <li id="liEmailLog" class="admin"><a href="ListEmailLog.aspx">Email Log</a></li>
        
       
        <li>
            <asp:LinkButton ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" ></asp:LinkButton>
         


        </li>
      
     </ul>
     </div>
 

    <%-- </div>--%>
<%--</div>--%>

<script>

    function setSelectedMenu(id)
    {
       
        $('#'+id).addClass("active");

    }

    function HideAdminMenu()
    {

        $('.admin').hide();


    }


</script>