<%@ Page language="C#" CodeFile="login.aspx.cs" Inherits="BoatRenting.login_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="__functions.aspx"-->
<%
    Username = Request["txtUsername"];
    Password = Request["txtPassword"];
    if (NVL(Username, "!!!!") != "!!!!")
    {
        Login(Username, Password);
        if (NVL(Convert.ToString(Session["userID"]), "0") != "0")
        {
            //if session("Kart") = "" then
            VBMath.Randomize();
            varSession = "adm";
            for(i = 0; i <= 47; i += 1)
            {
                varSession = varSession + "" + Convert.ToString(Conversion.Int(((float)6.0 * VBMath.Rnd()) + (float)1.0));
            }
            Session.Add("Kart", varSession);
            //end if
            Response.Redirect(Convert.ToString(Session["defaultPage"]));
        }
        else
        {
            Message = "User/Password invalid, Please try again!";
        }
    }
%>
<HTML>
<HEAD>
<TITLE>map_blue</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">

<script language="JavaScript"><!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<style type="text/css" media="screen">@import "formhead.css";</style>
<style type="text/css" media="screen">@import "backend.css";</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onLoad="MM_preloadImages('images/home_over_04.gif','images/email_over_05.gif')" link="#0099FF" vlink="#0099FF" alink="#0099FF">
<!-- ImageReady Slices (map_blue.psd) -->
<div id="container">
	<div id="top_bar"></div>
	
	<div id="table_div">
<TABLE WIDTH=794 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center" class="table" height="512">

 <TR>
  <TD ROWSPAN=9 colspan="10" align="left" valign="top">
   <table width="801" border="0" cellspacing="0" cellpadding="0" height="191">
    <tr>
     <td width="177" height="10">&nbsp;</td>
     <td width="410" height="10"><%= Message %></td>
     <td width="214" height="10">&nbsp;</td>
    </tr>
    <tr>
     <td width="177" height="63">&nbsp;</td>
     <td rowspan="2" height="63">
      <form name="form1" method="post" action="login.aspx">
       <table width="386" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td class="a_body_text" align="right" valign="middle" width="158">User
          Name:</td>
         <td width="10">&nbsp; </td>
         <td width="218">
          <input type="text" name="txtUsername">
         </td>
        </tr>
        <tr>
         <td class="a_body_text" align="right" valign="middle" width="158">Password:</td>
         <td width="10">&nbsp; </td>
         <td width="218">
          <input type="password" name="txtPassword">
         </td>
        </tr>
        <tr>
         <td width="158">&nbsp;</td>
         <td width="10">&nbsp;</td>
         <td width="218">
          <!-- <input type="submit" name="Submit" value="Login" onClick="MM_openBrWindow('admin.htm','','')"> -->
          <input type="submit" name="Submit" value="Login">
         </td>
        </tr>
        <tr>
         <td width="158">&nbsp;</td>
         <td width="10">&nbsp;</td>
         <td width="218">&nbsp;</td>
        </tr>
       </table>
      </form>
     </td>
     <td width="214" height="63">&nbsp;</td>
    </tr>
    <tr>
     <td width="177">&nbsp;</td>
     <td width="214">&nbsp;</td>
    </tr>
    <tr>
     <td width="177">&nbsp;</td>
     <td width="410">&nbsp;</td>
     <td width="214">&nbsp;</td>
    </tr>
   </table>
  </TD>
  <TD height="77"> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=77 ALT=""></TD>
  <td></td>
 </TR>
 <TR>
  <TD height="16"> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=16 ALT=""></TD>
  <td></td>
 </TR>
 <TR>
  <TD height="37"> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=37 ALT=""></TD>
  <td></td>
 </TR>
 <TR>
  <TD height="22"> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=22 ALT=""></TD>
  <td></td>
 </TR>
 <TR>
  <TD height="185"> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=185 ALT=""></TD>
  <td></td>
 </TR>
 
 <TR>
  <TD height="50"> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=34 ALT=""></TD>
  <td></td>
 </TR>
 
</TABLE>
</div>
</div>
<!-- End ImageReady Slices -->
</BODY>
</HTML>
