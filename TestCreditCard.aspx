<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestCreditCard.aspx.cs" Inherits="TestCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <label class="control-label" >Card Number</label>
  
    <asp:TextBox ID="txtCardNumber" runat="server" CssClass="input-xlarge"></asp:TextBox>

     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCardNumber" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>           

 


 <div style="clear:both;"></div>   
<br>
    

    

<label class="control-label" >Expiration Date</label>
   
   <asp:DropDownList ID="ddExpMonth" runat="server" style="width:100px;" class="input-xlarge"></asp:DropDownList>
  <asp:DropDownList ID="ddExpYear" runat="server" style="width:100px;" class="input-xlarge"></asp:DropDownList>
  
    
     <div style="clear:both;"></div>   
<br>


   <label class="control-label" >CID#</label> 
   
    <asp:TextBox ID="txtCID" runat="server" CssClass="input-xlarge" style="width:120px;"></asp:TextBox>

       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCID" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>           
   
<div style="clear:both;"></div>


<label class="control-label" >Name on the Card</label>

    <asp:TextBox ID="txtNameOnCard" runat="server" CssClass="input-xlarge"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtNameOnCard" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>           

  <div style="clear:both;"></div>   
<br/>
        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label> 
   <br />
    
         
<div class=""  style="margin-left:20px;">
      <asp:LinkButton ID="lnkPurchase" runat="server" Text="PURCHASE" OnClick="lnkPurchase_Click" class="right-btn btn3 "   OnClientClick="this.style.visibility= 'hidden';ShowProgress();"  ></asp:LinkButton>  
    
     </div>
    </div>
    </form>
</body>
</html>
