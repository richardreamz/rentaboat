<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExecuteSQLQuery.aspx.cs" Inherits="admin_ExecuteSQLQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtSQLQuery" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
    </div>
        <div>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="true">

            </asp:GridView>
        </div>
        <div>
            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        </div>
        <div>
            <asp:Button ID="btnRun" Text="Run" runat="server" OnClick="btnRun_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnQuery" Text="Execute Query" runat="server" OnClick="btnQuery_Click" />

        </div>
    </form>
</body>
</html>
