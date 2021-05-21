<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestEmail.aspx.cs" Inherits="TestEmail" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Send Test Email :
        <asp:TextBox ID="txtEmail" runat="server" Width="318px"></asp:TextBox>
        <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
