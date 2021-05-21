<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBoatQuestions.aspx.cs" Inherits="admin_ListBoatQuestions" %>

<%@ Register Src="~/ctlBoatQuestions.ascx" TagPrefix="uc1" TagName="ctlBoatQuestions" %>
<%@ Register Src="~/admin/ctlBoatQuestionsAdmin.ascx" TagPrefix="uc1" TagName="ctlBoatQuestionsAdmin" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="frmBoatQuestions" runat="server">
    <div>
        <uc1:ctlBoatQuestionsAdmin runat="server" ID="ctlBoatQuestionsAdmin" />
    </div>
    </form>
</body>
</html>
