<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBoatQuestionsAdmin.ascx.cs" Inherits="admin_ctlBoatQuestionsAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    <script type="text/javascript">
    function WaterMarkFocus(txt, text) {
        if (txt.value == text) {
            txt.value = "";
            txt.style.color = "black";
        }
    }
 
    function WaterMarkBlur(txt, text) {
        if (txt.value == "") {
            txt.value = text;
            txt.style.color = "gray";
        }
    }
</script>
<style>

    .btn3 {
	text-transform: uppercase;
	font-family:Verdana, sans-serif;
	font-size: 12px;
	line-height: 12px;
	font-weight: 800;
	display: block;
	
	letter-spacing: 2px;
	
	text-decoration: none;
	text-align: center;	
	width: 100%;	
	-webkit-transition: all 0.28s ease;
	transition: all 0.28s ease;
	
	background: #fe5974;
  background-image: -webkit-linear-gradient(top, #fe5974, #dc3d58);
  background-image: -moz-linear-gradient(top, #fe5974, #dc3d58);
  background-image: -ms-linear-gradient(top, #fe5974, #dc3d58);
  background-image: -o-linear-gradient(top, #fe5974, #dc3d58);
  background-image: linear-gradient(to bottom, #fe5974, #dc3d58);
  -webkit-border-radius: 14;
  -moz-border-radius: 14;
  border-radius: 14px;
  color: #ffffff;
   padding: 5px 10px 5px 10px;
   border:3px #d33650 solid;
 
}

</style>


<asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>
<asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:Label>

<asp:Table ID="tblQuestion" runat="server"></asp:Table>
      <asp:ModalPopupExtender ID="mdlSuccess" runat="server"
                        TargetControlID="btnSuccess"
                        PopupControlID="pnlSuccess"
                        BackgroundCssClass="modalBackground"
                        DropShadow="true"
          CancelControlID ="btnOK"
                        />

                   <asp:Button ID="btnSuccess" runat="server" Style="display: none" />


                    <asp:Panel ID="pnlSuccess" Style="display: none" runat="server">
                           <div style="background-color: gray">
                          <div style="background-color: green; color: white; font-size: medium;" id="divHeader" runat="server">
                                <asp:Label ID="lblpopupHeader" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                     
                            </div>
                        <div style="background-color: white">
                           <asp:Label ID="lblPopupContent" runat="server" ForeColor="Green" Font-Bold="true" Font-Size="Large"></asp:Label>
                            <br />
                               <br />
                             <div class="btns" style="margin: 0 auto!important; width: 656px; text-align: center!important;background-color:white!important;">
                        <asp:LinkButton ID="btnOK" runat="server" CssClass="btn3" Text="OK" Width="100"  />

                            </div>
                        </div>
                               </div>


                        </asp:Panel>


