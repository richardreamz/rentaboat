<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlAdminMenu.ascx.cs" Inherits="admin_ctlAdminMenu" %>
<div class="row">
	
     <div class="col-lg-12 col-sm-12 padbot20" align="center">
     <div class="navbar-admin" runat="server" id="navbarAdmin" >
     <ul class="nav navbar-nav2">
     	<li id="liEditProfile" class="admin"><a href="facilities_mant.aspx">Edit Profile</a></li>
         
         <li style="color:#fff;" class="admin">|</li>
       
         <li id="liAddNewBoat" class="admin"><a href="boats_mant.aspx">Add New Boat</a></li>
        
         <li style="color:#fff;" class="admin">|</li>
        
        <li id="liBoatListing"><a href="BoatList.aspx" class="admin">Boat Profiles</a></li>
        
         <li style="color:#fff;" class="admin">|</li>
        <li id="liCalendar"><a href="FacilityCalendarView.aspx">Boat Calendar</a></li>
        <li style="color:#fff;">|</li>
       
        <li id="liReports"><a href="boats_list_reports.aspx">Reports</a></li>
        <li style="color:#fff;">|</li>
        <li id="liUserList" class="admin"><a href="users_list.aspx">User/Passwords</a></li>
        <li style="color:#fff;" class="admin">|</li>
        <li>
            <asp:LinkButton ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" ></asp:LinkButton>
         


        </li>
      
     </ul>
     </div>
 

     </div>
</div>

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