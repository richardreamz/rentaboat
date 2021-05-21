<%@ Page language="C#" CodeFile="reserve.aspx.cs" Inherits="BoatRenting.reserve_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="__dbconnection.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    //, rs
    cmd = new Command();
    //Set rs=Server.CreateObject("ADODB.Recordset")
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOOKDATExBOAT_SAVE";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_MarinaID"].Value = Session["MarinaID"];
    //cmd.Parameters[2].Value = Request.Form["hdnBoatID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BoatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_BoatID"].Value = Request.Form["hdnBoatID"];
    //cmd.Parameters[3].Value = Session["KartID"];
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_KartID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_KartID"].Value = Session["KartID"];
    //cmd.Parameters[4].Value = Session["UserID"];
    cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@UserID"].Value = Session["UserID"];
    //rs.Open cmd
    cmd.Execute();
    //Response.Write(session("MarinaID") & "<br>")
    //Response.Write(Request.Form("hdnBoatID") & "<br>")
    //Response.Write(session("KartDetail") & "<br>")
    //Response.Write(session("UserID") & "<br>")
    //response.End()
    cmd = new Command();
    //Set rs=Server.CreateObject("ADODB.Recordset")
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_KART_UPDATECLIENT";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = Session["Kart"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_vc_sessionID", adVarChar, adParamInput, 100, 0));
    cmd.Parameters["@p_vc_sessionID"].Value = Session["Kart"];
    //cmd.Parameters[2].Value = Request.Form["hdn_clientID"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_clientID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_clientID"].Value = Request.Form["hdn_clientID"];
    //rs.Open cmd
    cmd.Execute();
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
<form name="frm_reserve" method="post" action="boats_list_reservation.aspx">
<script>Redirect1(); </script>
</form>
</body>
</html>
