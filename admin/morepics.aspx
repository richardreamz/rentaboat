<%@ Page language="C#" CodeFile="morepics.aspx.cs" Inherits="BoatRenting.morepics_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    cmdF = new Command();
    rsF = new Recordset();
    cmdF.ActiveConnection = oConn;
    cmdF.CommandText = "SP_BR_IMAGE_OTHERS_LIST";
    cmdF.CommandType = adCmdStoredProc;
    //cmdF.Parameters[1] = Request.QueryString["marina"];
    //cmdF.Parameters[2] = Request.QueryString["boat"];
    cmdF.Parameters.Append(cmdF.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmdF.Parameters.Append(cmdF.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmdF.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Request.QueryString["boat"]);
    cmdF.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Request.QueryString["marina"]);

    rsF.CursorType = (nce.adodb.CursorType)3;
    rsF.CursorLocation = (nce.adodb.CursorLocation)3;
    rsF.Open(cmdF);
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />

    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>



<script language="JavaScript">
var images = new Array();
var texts = new Array();
<%
    i = 0;
    while(!(rsF.Eof))
    {
%>
    images[<%= i %>] = '<%= rsF.Fields["vc_filename"].Value %>';
    texts[<%= i %>] = '<%= rsF.Fields["vc_nombre"].Value %>';
<%
        i = i + 1;
        rsF.MoveNext();
    }
    rsF.MoveFirst();
%>
</script>
</head>
<body>
<form name="frm_boat" method="post">
<table class="boatdetails_table" cellpadding="0" cellspacing="0" width="390">
	<tr>
		<th bgcolor="white">Additional Pictures</th>
		<th bgcolor="white" align="right">
		<span id="_next" <%
    if (rsF.RecordCount == 1)
    {
%>
style="display:none"<%
    }
%>
><a href="javascript:Next()">Next image >></a>&nbsp;&nbsp;</span>
		<span id="_prev" style="display:none"><a href="javascript:Previous()"><< Previous image </a>&nbsp;&nbsp;</span></th>
	</tr>
	<tr>
		<td colspan="2" align="center" valign="middle" height="182" width="390">
				<img id="imgboat" src="boats/<%= rsF.Fields["vc_filename"].Value %>" alt="<%= rsF.Fields["vc_nombre"].Value %>" width="373" height="170">
		</td>
	</tr>
</table>
</form>
</body>
<script language="JavaScript">
function Next(){
	_next.style.display='none';
	_prev.style.display='';
	document.frm_boat.imgboat.src = 'boats/' + images[1];
	document.frm_boat.imgboat.alt = texts[1];
}

function Previous(){
	_prev.style.display='none';
	_next.style.display='';
	document.frm_boat.imgboat.src = 'boats/' + images[0];
	document.frm_boat.imgboat.alt = texts[0];
}
</script>



</html>
