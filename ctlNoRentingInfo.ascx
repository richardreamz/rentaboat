<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlNoRentingInfo.ascx.cs" Inherits="ctlNoRentingInfo" %>

 <div class="boat-page-overview">
           <div class="control-group">
               <div align="center">
               <asp:Label  ID="lblAddressMarina" runat="server" Font-Bold="true" Font-Size="X-Large"></asp:Label>
               <br />
               <br />
            </div>
               <div style="font-size:large;">
               <u>
                   Want to book this boat? You can directly contact this boat owner!<div> <br/>View the information below to find out more information!</div> </br>
               </u>
                   
                    <br />
             </div>
               <div style="font-size:large;">
              Boat Owners Name:   <asp:Label ID="lblMarinaName" runat="server"></asp:Label>

                   <br />
                   <br />

               Phone Number:
                   <asp:Label ID="lblMarinaNUmber" runat="server"></asp:Label>

              </div>

                <div style="clear:both;"></div>   
<br>
  <div style="text-align:center;">  <asp:LinkButton ID="lnkMoreInfo" runat="server" CssClass="center-btn btn3" Text="More Information" Width="200px" align="center"  ></asp:LinkButton>
                     
  
        </div>

            </div>




    </div>

