<%@ Page language="C#" CodeFile="reserve_edit.aspx.cs" Inherits="BoatRenting.reserve_edit_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="__dbconnection.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    //, rs
    cmd = new Command();
    //Set rs=Server.CreateObject("ADODB.Recordset")
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOOKDATExBOAT_DEL";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MarinaID"].Value = Session["MarinaID"];
    //cmd.Parameters[2].Value = Request.Form["hdnBoatID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BoatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_BoatID"].Value = Request.Form["hdnBoatID"];
    cmd.Execute();
    cmd.CommandText = "SP_BR_BOOKDATExBOAT_UPD";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MarinaID"].Value = Session["MarinaID"];
    //cmd.Parameters[2].Value = Request.Form["hdnBoatID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BoatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_BoatID"].Value = Request.Form["hdnBoatID"];
    //cmd.Parameters[3].Value = Session["UserID"];
    cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@UserID"].Value = Session["UserID"];
    cmd.Execute();
    //.CommandText = "SP_BR_BOOKDATExBOAT_SAVE"
    //.CommandType=adCmdStoredProc
    //.Parameters(1)=session("MarinaID")
    //.Parameters(2)=Request.Form("hdnBoatID")
    //.Parameters(3)=Request.Form("KartDetail")
    //.Parameters(4)=session("UserID")
    //rs.Open cmd
    //Response.Write(session("MarinaID") & "<br>")
    //Response.Write(Request.Form("hdnBoatID") & "<br>")
    //Response.Write(session("KartDetail") & "<br>")
    //Response.Write(session("UserID") & "<br>")
    //response.End()
%>

<html>
<head>
<title>Welcome to BoatRenting.com!</title>
</head>
<script language="JavaScript">
function Redirect1(){
	document.frm_reserve.submit();
}
</script>

<body>
<form name="frm_reserve" method="post" action="calendar.aspx">
<script>Redirect1(); </script>
</form>
</body>
</html>
