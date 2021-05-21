<%@ Page language="C#" CodeFile="ViewVideo.aspx.cs" Inherits="BoatRenting.ViewVideo_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />

<script language="JavaScript"><!--

function createLoading()
{
//var right=((screen.availWidth/2)+10px);
//var T= ((screen.availHeight/2)-10px);
//var bottom=((screen.availHeight/2)+10px);
//var L=((screen.availWidth/2)-10px);

var ta='<table width=100% height=100% border=0><tr><td align=center>'
+'loading...<br><br><img src="./images/loading.gif">'
+'</td></tr></table>';
var LR= '\n<DIV id=idloading style="position:relative'
  +'; left:0'
  +'; top:0'
  +'; width:100'
  +'; height:100'
  +'; clip:rect('+0+','+100+','+100+','+0+')'
  +';z-index:1'
 
 
  +'">'+ ta +'   </DIV>';



//alert(LR);

document.body.insertAdjacentHTML("BeforeEnd",LR);

}

function showLoading()
{

//document.layers["idloading"].visibility='show'
//document.getElementById("idloading").visibility  ='show';
document.getElementById("idloading").style.display  ='block';

}

function hideLoading()
{
document.getElementById("idloading").style.display  ='none';

//document.layers["idloading"].visibility='hide'

//alert("hiding");



}

//-->
</script>

</head>
<body onload="window.resizeTo(400,600)" >


<form name="frm_boatVideo" method="post">

<div id=divplayer style="z-index:-1;">

<object id="MediaPlayer" CLASSID="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"
standby="Loading Microsoft Windows® Media Player components..." type="application/x-oleobject" width="400" height="300" >
<param name="fileName" value="boats/<%= Request.QueryString["filename"] %>">
<param name="animationatStart" value="true">
<param name="transparentatStart" value="true">
<param name="autoStart" value="true">
<param name="AutoRewind" value="true">
<param name="showControls" value="true">
<param name="Volume" value="-450">
<param name="AudioStream" value="false">
<param name="Mute" value="true">

<embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" src="boatrenting/client/boats/<%= Request.QueryString["filename"] %>" name="MediaPlayer" width=400 height=400 autostart=1 showcontrols=1 volume=-450 autorewind=1 audiostream=0>
</object>
</div>

<div>
If Problem in viewing Video <a href='./boats/<%= Request.QueryString["filename"] %>'>Download  </a>
</div>

<div id="idloading" style="position:absolute; left:10;; top:350; z-index:1;">
<table align="center" width="100%">
<tr width="100%">
<td align=center>
Loading....
</td>
</tr>
<tr width="100%">
<td align="center" width="100%" >
<img src="./images/loading.gif">
 </td>
</tr>
<tr>
<td align="center" width="100%" >
 <a href="http://www.xvidmovies.com/codec/" target="_blank">    if video doesn't play in 60sec download xVid Codec
</a> 
</td>
</tr>


</div>
 
<!--

<input type="text" name="status" id="status">
--><script language="JavaScript">

var tID;

	function startCheckPlayer() {
		//window.setTimeout("checkPlayerStatus()",1000);
		tID = window.setInterval("checkPlayerStatus()",1000);
	}
	function checkPlayerStatus() {
		
             var Player = document.getElementById("MediaPlayer");

	    // alert( Player.playState);

             //document.getElementById("status").value = Player.playState;

   

    if (Player.playState == 2)
{
                    hideLoading();
		    window.clearInterval(tID);


 


}
else
{
                  showLoading();
                  //window.setTimeout("checkPlayerStatus()",1000);
}
          


}
	
</script>
<script language="JavaScript">
window.setTimeout("startCheckPlayer()",1000);
</script> 


</form>
</body>

</html>
