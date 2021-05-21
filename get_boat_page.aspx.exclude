<%@ Page language="C#" CodeFile="calendar.aspx.cs" Inherits="BoatRenting.calendar_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="includes/__dbconnection.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%
    
    Session.Add("strErr", "");
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOAT_GET";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1] = Request.Form["hdnBoatID"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Request.QueryString["BoatID"]);
    //cmd.Parameters[2] = Request.Form["hdnMarinaID"];
    cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Request.QueryString["MarinaID"]);
    rs.Open(cmd);
    
    cmdF = new Command();
    rsF = new Recordset();
    cmdF.ActiveConnection = oConn;
    cmdF.CommandText = "SP_BR_IMAGE_OTHERS_LIST";
    cmdF.CommandType = adCmdStoredProc;
    //cmdF.Parameters[1] = Request.Form["hdnMarinaID"];
    cmdF.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmdF.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmdF.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Request.QueryString["MarinaID"]);
    //cmdF.Parameters[2] = Request.Form["hdnBoatID"];
    cmdF.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Request.QueryString["BoatID"]);
    rsF.CursorType = (nce.adodb.CursorType)3;
    rsF.CursorLocation = (nce.adodb.CursorLocation)3;
    rsF.Open(cmdF);
    if (Request.Form["hdn_add"] == "1")
    {
        cmdLogin = new Command();
        rsLogin = new Recordset();
        cmdLogin.ActiveConnection = oConn;
        cmdLogin.CommandText = "SP_BR_CLIENT_LOGIN";
        cmdLogin.CommandType = adCmdStoredProc;
        //cmdLogin.Parameters[1] = Request.Form["txt_email"];
        cmdLogin.Parameters.Append(cmd.CreateParameter("@P_VC_UserName", adVarChar, adParamInput, 100, 0));
        cmdLogin.Parameters["@P_VC_UserName"].Value = Request.Form["txt_email"];
        //.Parameters(1)="jr@boatrenting.com"
        //.Parameters(2)=request.Form("txt_password")
        //cmdLogin.Parameters[2] = "";
        cmdLogin.Parameters.Append(cmd.CreateParameter("@P_VC_Password", adVarChar, adParamInput, 30, 0));
        cmdLogin.Parameters["@P_VC_Password"].Value = "";
        rsLogin.Open(cmdLogin);
        if (rsLogin.Eof)
        {
            LoginSuccessFlag = "0";
        }
        else
        {
            LoginSuccessFlag = "1";
        }
            //If Login Success then only check the cart avaialbility
        if ((Request.Form["txt_date1"] == "Today"))
        {
            sfecha1 = DateTime.Today.ToString("MM/dd/yyyy") + "";
        }
        else
        {
            SDate1 = Request.Form["txt_date1"];
            dia1 = SDate1.Substring(5 - 1, 2);
            mes1 = SDate1.Substring(1 - 1, 3);
            anio1 = SDate1.Substring(8 - 1, 4);
            switch (mes1) {
                case "Jan":
                    mes1 = "01";
                    break;
                case "Feb":
                    mes1 = "02";
                    break;
                case "Mar":
                    mes1 = "03";
                    break;
                case "Apr":
                    mes1 = "04";
                    break;
                case "May":
                    mes1 = "05";
                    break;
                case "Jun":
                    mes1 = "06";
                    break;
                case "Jul":
                    mes1 = "07";
                    break;
                case "Aug":
                    mes1 = "08";
                    break;
                case "Sep":
                    mes1 = "09";
                    break;
                case "Oct":
                    mes1 = "10";
                    break;
                case "Nov":
                    mes1 = "11";
                    break;
                case "Dec":
                    mes1 = "12";
                    break;
            }
            sfecha1 = mes1 + "/" + dia1 + "/" + anio1;
        }
        if ((Request.Form["TxtToDate"] == "Today"))
        {
            //sfecha2 = Convert.ToString(DateTime.Today) + "";
            sfecha2 = DateTime.Today.ToString("MM/dd/yyyy") + "";
        }
        else
        {
            SDate2 = Request.Form["TxtToDate"];
            dia2 = SDate2.Substring(5 - 1, 2);
            mes2 = SDate2.Substring(1 - 1, 3);
            anio2 = SDate2.Substring(8 - 1, 4);
            switch (mes2) {
                case "Jan":
                    mes2 = "01";
                    break;
                case "Feb":
                    mes2 = "02";
                    break;
                case "Mar":
                    mes2 = "03";
                    break;
                case "Apr":
                    mes2 = "04";
                    break;
                case "May":
                    mes2 = "05";
                    break;
                case "Jun":
                    mes2 = "06";
                    break;
                case "Jul":
                    mes2 = "07";
                    break;
                case "Aug":
                    mes2 = "08";
                    break;
                case "Sep":
                    mes2 = "09";
                    break;
                case "Oct":
                    mes2 = "10";
                    break;
                case "Nov":
                    mes2 = "11";
                    break;
                case "Dec":
                    mes2 = "12";
                    break;
            }
            sfecha2 = mes2 + "/" + dia2 + "/" + anio2;
        }
        cmd3 = new Command();
        rs3 = new Recordset();
        cmd3.ActiveConnection = oConn;
        cmd3.CommandText = "SP_BR_KART_ADDITION_AVAILABILITY";
        cmd3.CommandType = adCmdStoredProc;
        //cmd3.Parameters[1] = Request.Form["hdnBoatID"];
        cmd3.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd3.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Request.QueryString["BoatID"]);
        //cmd3.Parameters[2] = Request.Form["hdnMarinaID"];
        cmd3.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd3.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Request.QueryString["MarinaID"]);
        //cmd3.Parameters[3] = Request.Form["cmb_typerent"];
        cmd3.Parameters.Append(cmd.CreateParameter("@p_in_typerentID", adInteger, adParamInput, 4, 0));
        cmd3.Parameters["@p_in_typerentID"].Value = Convert.ToInt32(Request.Form["cmb_typerent"]);
        //cmd3.Parameters[4] = sfecha1;
        cmd3.Parameters.Append(cmd.CreateParameter("@p_begindate", adVarChar, adParamInput, 10, 0));
        cmd3.Parameters["@p_begindate"].Value = sfecha1;
        //request.Form("txt_date1")
        //cmd3.Parameters[5] = sfecha2;
        cmd3.Parameters.Append(cmd.CreateParameter("@p_enddate", adVarChar, adParamInput, 10, 0));
        cmd3.Parameters["@p_enddate"].Value = sfecha2;
        //request.Form("txt_date2")
        if ((Request.Form["cmb_typerent"] == "4"))
        {
            //.Parameters(6)=request.Form("cmb_hour1")
            //.Parameters(7)=request.Form("cmb_hour2")
            //cmd3.Parameters[6] = Request.Form["hourfromtext"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_beginhour", adVarChar, adParamInput, 7, 0));
            cmd3.Parameters["@p_beginhour"].Value = Request.Form["hourfromtext"];
            //cmd3.Parameters[7] = Request.Form["hourtotext"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_endhour", adVarChar, adParamInput, 7, 0));
            cmd3.Parameters["@p_endhour"].Value = Request.Form["hourtotext"];
            //cmd3.Parameters[8] = Request.Form["hourmilitaryfrom"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_hours_military_from", adInteger, adParamInput, 4, 0));
            cmd3.Parameters["@p_hours_military_from"].Value = Convert.ToInt32(Request.Form["hourmilitaryfrom"]);
            //cmd3.Parameters[9] = Request.Form["hourmilitaryto"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_hours_military_to", adInteger, adParamInput, 4, 0));
            cmd3.Parameters["@p_hours_military_to"].Value = Convert.ToInt32(Request.Form["hourmilitaryto"]);
        }
        else if ((Request.Form["cmb_typerent"] == "5"))
        {
            //cmd3.Parameters[6] = Request.Form["hourfromtext"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_beginhour", adVarChar, adParamInput, 7, 0));
            cmd3.Parameters["@p_beginhour"].Value = Request.Form["hourfromtext"];
            //cmd3.Parameters[7] = Request.Form["hourtotext"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_endhour", adVarChar, adParamInput, 7, 0));
            cmd3.Parameters["@p_endhour"].Value = Request.Form["hourtotext"];
            //cmd3.Parameters[8] = Request.Form["hourmilitaryfrom"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_hours_military_from", adInteger, adParamInput, 4, 0));
            cmd3.Parameters["@p_hours_military_from"].Value = Convert.ToInt32(Request.Form["hourmilitaryfrom"]);
            //cmd3.Parameters[9] = Request.Form["hourmilitaryto"];
            cmd3.Parameters.Append(cmd.CreateParameter("@p_hours_military_to", adInteger, adParamInput, 4, 0));
            cmd3.Parameters["@p_hours_military_to"].Value = Convert.ToInt32(Request.Form["hourmilitaryto"]);
            //else
            //.Parameters(6)=request.Form("halfhour1")
            //.Parameters(7)=request.Form("halfhour2")
            //.Parameters(8)=request.Form("cmb_hour1")
            //.Parameters(9)=request.Form("cmb_hour2")
        }
        rs3.Open(cmd3);
        if (Convert.ToString(rs3.Fields[0].Value) == "1")
        {
            flgAvailable = "1";
            totalhours = 0.0;
            if ((Request.Form["cmb_typerent"] == "4"))
            {
                totalhours = (Convert.ToInt32(Request.Form["cmb_hour2"]) - Convert.ToInt32(Request.Form["cmb_hour1"])) / 100.0;
            }
            else if( (Request.Form["cmb_typerent"] == "5"))
            {
                totalhours = 1.0;
            }
            cmd2 = new Command();
            rs2 = new Recordset();
            cmd2.ActiveConnection = oConn;
            cmd2.CommandText = "SP_BR_KART_ADDITION";
            cmd2.CommandType = adCmdStoredProc;
            //cmd2.Parameters[1] = Request.Form["hdnBoatID"];
            cmd2.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
            cmd2.Parameters["@p_in_boatID"].Value = Request.QueryString["BoatID"];
            //cmd2.Parameters[2] = Request.Form["hdnMarinaID"];
            cmd2.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
            cmd2.Parameters["@p_in_marinaID"].Value = Request.QueryString["MarinaID"];
            //cmd2.Parameters[3] = Request.Form["cmb_typerent"];
            cmd2.Parameters.Append(cmd.CreateParameter("@p_in_typerentID", adInteger, adParamInput, 4, 0));
            cmd2.Parameters["@p_in_typerentID"].Value = Request.Form["cmb_typerent"];
            //cmd2.Parameters[4] = sfecha1;
            cmd2.Parameters.Append(cmd.CreateParameter("@p_begindate", adVarChar, adParamInput, 10, 0));
            cmd2.Parameters["@p_begindate"].Value = sfecha1;            
            //request.Form("txt_date1")
            //cmd2.Parameters[5] = sfecha2;
            cmd2.Parameters.Append(cmd.CreateParameter("@p_enddate", adVarChar, adParamInput, 10, 0));
            cmd2.Parameters["@P_IN_enddate"].Value = sfecha2;
            //request.Form("txt_date2")
            //cmd2.Parameters[6] = Request.Form["hourfromtext"];
            cmd2.Parameters.Append(cmd.CreateParameter("@p_beginhour", adVarChar, adParamInput, 8, 0));
            cmd2.Parameters["@p_beginhour"].Value = Request.Form["hourfromtext"];
            //.Parameters(6)=request.Form("hourmilitaryfrom")
            //cmd2.Parameters[7] = Request.Form["hourtotext"];
            cmd2.Parameters.Append(cmd.CreateParameter("@p_endhour", adVarChar, adParamInput, 8, 0));
            cmd2.Parameters["@p_endhour"].Value = Request.Form["hourtotext"];
            //.Parameters(7)=request.Form("hourmilitaryto")
            //cmd2.Parameters[8] = Session["Kart"];
            cmd2.Parameters.Append(cmd.CreateParameter("@p_vc_sessionID", adVarChar, adParamInput, 100, 0));
            cmd2.Parameters["@p_vc_sessionID"].Value = Session["Kart"];
            //cmd2.Parameters[9] = 1;
            cmd2.Parameters.Append(cmd.CreateParameter("@p_ti_webclient", adTinyInt, adParamInput, 2, 0));
            cmd2.Parameters["@p_ti_webclient"].Value = 1;
            //ti_webclient as user web
            if ((Request.Form["cmb_typerent"] == "4"))
            {
                //cmd2.Parameters[10] = Request.Form["cmb_hour1"];
                cmd2.Parameters.Append(cmd.CreateParameter("@p_beginhourMilitary", adInteger, adParamInput, 4, 0));
                cmd2.Parameters["@p_beginhourMilitary"].Value = Request.Form["cmb_hour1"];
                //cmd2.Parameters[11] = Request.Form["cmb_hour2"];
                cmd2.Parameters.Append(cmd.CreateParameter("@p_endhourMilitary", adInteger, adParamInput, 4, 0));
                cmd2.Parameters["@p_endhourMilitary"].Value = Request.Form["cmb_hour2"];
            }
            else if( (Request.Form["cmb_typerent"] == "5"))
            {
                //cmd2.Parameters[10] = Request.Form["hourmilitaryfrom"];
                cmd2.Parameters.Append(cmd.CreateParameter("@p_beginhourMilitary", adInteger, adParamInput, 4, 0));
                cmd2.Parameters["@p_beginhourMilitary"].Value = Request.Form["hourmilitaryfrom"];
                //cmd2.Parameters[11] = Request.Form["hourmilitaryto"];
                cmd2.Parameters.Append(cmd.CreateParameter("@p_endhourMilitary", adInteger, adParamInput, 4, 0));
                cmd2.Parameters["@p_endhourMilitary"].Value = Request.Form["hourmilitaryto"];
            }
            else
            {
                //cmd2.Parameters[10] = 0;
                cmd2.Parameters.Append(cmd.CreateParameter("@p_beginhourMilitary", adInteger, adParamInput, 4, 0));
                cmd2.Parameters["@p_beginhourMilitary"].Value = 0;
                //cmd2.Parameters[11] = 0;
                cmd2.Parameters.Append(cmd.CreateParameter("@p_endhourMilitary", adInteger, adParamInput, 4, 0));
                cmd2.Parameters["@p_endhourMilitary"].Value = 0;
            }
            //cmd2.Parameters[12] = totalhours;
            cmd2.Parameters.Append(cmd.CreateParameter("@p_totalHours", adInteger, adParamInput, 4, 0));
            cmd2.Parameters["@p_totalHours"].Value = totalhours;
            rs2.Open(cmd2);
            rs2 = null;
        }
        else if (Convert.ToString(rs3.Fields[0].Value) == "0")
        {
            flgAvailable = "0";
        }
        rs3 = null;
    //End of Login Sucess
    //'	end if
    }
        //if (Request("txt_date1") = "") then
        //response.Write("Null--")
        //response.End()
        //else
        //response.Write(Request("txt_date1")&"--")
        //response.End()
        //end if
    if ((Request["txt_date1"] == null ))
    //if ((Request["txt_date1"] == ""))
        {
        //txt_date1=Date() & ""
        txt_date1 = "Today";
    }
    else
    {
        txt_date1 = Request["txt_date1"];
    }
    //if ((Request["TxtToDate"] == ""))
    if ((Request["TxtToDate"] == null))
        {
        //TxtToDate=Date() & ""
        TxtToDate = "Today";
    }
    else
    {
        TxtToDate = Request["txt_date1"];
    }
        //Added
    if ((txt_date1 != "Today"))
    {
        txt_date2 = TxtToDate;
        txt_date1_day = Convert.ToDateTime(txt_date1).Day;
        if ((Convert.ToString(txt_date1_day).Length < 2))
        {
            txt_date1_day = "0" + Convert.ToString(txt_date1_day);
        }
        txt_date1_month = Convert.ToDateTime(txt_date1).Month;
        txt_date1_year = Convert.ToDateTime(txt_date1).Year;
    //Addedd
    }
%>


<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type"	content="text/html;	charset=iso-8859-1"	/>
<meta http-equiv="Content-Language"	content="en-us"	/>
<meta name="ROBOTS"	content="ALL" />

<link rel="stylesheet" href="calendar/cal_RedCell.css" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>


<script	language="JavaScript">
var tout;

window.onerror = null;
 var bName = navigator.appName;
 var bVer = parseInt(navigator.appVersion);
 var NS4 = (bName == "Netscape" && bVer >= 4);
 var IE4 = (bName == "Microsoft Internet Explorer" 
 && bVer >= 4);
 var NS3 = (bName == "Netscape" && bVer < 4);
 var IE3 = (bName == "Microsoft Internet Explorer" 
 && bVer < 4);
 var blink_speed=100;
 var i=0;
 
if (NS4 || IE4) {
 if (navigator.appName == "Netscape") {
 layerStyleRef="parent.layer.";
 layerRef="parent.document.layers";
 styleSwitch="";
 }else{
 layerStyleRef="parent.layer.style.";
 layerRef="parent.document.all";
 styleSwitch=".style";
 }
}

//BLINKING
function Blink(layerName){
 

 
 
 if (NS4 || IE4) { 
 if(i%2==0)
 {
 eval(layerRef+'["'+layerName+'"]'+
 styleSwitch+'.visibility="visible"');
 }
 else
 {
 eval(layerRef+'["'+layerName+'"]'+
 styleSwitch+'.visibility="hidden"');
 }
 } 
 if(i<1)
 {
 i++;
 } 
 else
 {
 i--
 }
tout= setTimeout("Blink('"+layerName+"')",blink_speed);
}

function StopBlinkPickup()
{

if (document.frm_boat.txt_date1.value == "Today") 
   document.frm_boat.txt_date1.value="";

clearTimeout(tout);
 eval(layerRef+'["pickup"]'+
 styleSwitch+'.visibility="visible"');
}



function UserLogin(x,y){

 



	    var h1;
	    var h2;
	    var halfhourtext;
	    
	      var sIndex;	    
	    
	    
     if (document.frm_boat.cmb_typerent.value==4){
	
	        h1 = $("#cmb_hour1").val();
	    
	    
	    
	      h2 =$("#cmb_hour2").val();
	    
	    if ( parseInt(h1,10) >= parseInt(h2,10))
	      {
	      alert ("Invalid start time and end time");	      
	      return false;
	      
	      }
	
	 
	 document.getElementById("hourmilitaryfrom").value = h1;
	 document.getElementById("hourmilitaryto").value = h2;
	 
	 document.getElementById("hourfromtext").value = $("#cmb_hour1 option:selected").text();
	 document.getElementById("hourtotext").value = $("#cmb_hour2 option:selected").text();
	 
	 
	 document.getElementById("ToDateRow").style.display='none';
	 
	document.getElementById("hour1").style.display='';
		document.getElementById("hour2").style.display='';
	
	
	}
	
	else if (document.frm_boat.cmb_typerent.value==5){
	
	  
	    
	    
	    
	    h1 = $("#cmb_halfhour1").val();
	    
	    
	    // Add half to it
	    if (document.frm_boat.cmb_typerent.value==5)
	    {
	     sIndex= $("select#cmb_halfhour1").attr("selectedIndex");
	     sIndex=sIndex+1;
	     
        
	    h2 = document.getElementById("cmb_halfhour1").options[sIndex].value;
	    halfhourtext = document.getElementById("cmb_halfhour1").options[sIndex].text;
	    
	    }
	
	 document.getElementById("hourmilitaryfrom").value = h1;
	 
	 document.getElementById("hourmilitaryto").value = h2;
	 
	 document.getElementById("hourfromtext").value = $("#cmb_halfhour1 option:selected").text();
	 
	 document.getElementById("hourtotext").value = halfhourtext;
	 
	 
		document.getElementById("halfhour1").style.display='';
		document.getElementById("halfhour2").style.display='none';
		document.getElementById("hour1").style.display='none';
		document.getElementById("hour2").style.display='none';
		document.getElementById("ToDateRow").style.display='none';
		
	}
	else{
		document.getElementById("hour1").style.display='none';
		document.getElementById("hour2").style.display='none';
		document.getElementById("halfhour1").style.display='none';
		document.getElementById("halfhour2").style.display='none';
		document.getElementById("ToDateRow").style.display='';
		
	}
	


	//if (Validar()){
	  	document.frm_boat.action="calendar.aspx";
	  	document.frm_boat.txtNewUser.value="0";
	  	document.frm_boat.hdn_add.value="1";
		document.frm_boat.hdnBoatID.value = x;
		document.frm_boat.hdnMarinaID.value = y;
	
	  	document.frm_boat.submit();
	//}
}


function NewUser(x,y)
{

  var h1;
	    var h2;
	    var halfhourtext;
	    
	      var sIndex;	    
	    
	    
     if (document.frm_boat.cmb_typerent.value==4){
	
	        h1 = $("#cmb_hour1").val();
	    
	    
	    
	    
	      h2 =$("#cmb_hour2").val();
	    
	    if ( parseInt(h1,10) >= parseInt(h2,10))
	      {
	      alert ("Invalid start time and end time");	      
	      return false;
	      
	      }
	
	 
	 document.getElementById("hourmilitaryfrom").value = h1;
	 document.getElementById("hourmilitaryto").value = h2;
	 
	 document.getElementById("hourfromtext").value = $("#cmb_hour1 option:selected").text();
	 document.getElementById("hourtotext").value = $("#cmb_hour2 option:selected").text();
	 
	 
	 document.getElementById("ToDateRow").style.display='none';
	 
	document.getElementById("hour1").style.display='';
		document.getElementById("hour2").style.display='';
	
	
	}
	
	else if (document.frm_boat.cmb_typerent.value==5){
	
	  
	    
	    
	    
	    h1 = $("#cmb_halfhour1").val();
	    
	    
	    // Add half to it
	    if (document.frm_boat.cmb_typerent.value==5)
	    {
	     sIndex= $("select#cmb_halfhour1").attr("selectedIndex");
	     sIndex=sIndex+1;
	     
        
	    h2 = document.getElementById("cmb_halfhour1").options[sIndex].value;
	    halfhourtext = document.getElementById("cmb_halfhour1").options[sIndex].text;
	    
	    }
	
	 document.getElementById("hourmilitaryfrom").value = h1;
	 
	 document.getElementById("hourmilitaryto").value = h2;
	 
	 document.getElementById("hourfromtext").value = $("#cmb_halfhour1 option:selected").text();
	 
	 document.getElementById("hourtotext").value = halfhourtext;
	 
	 
		document.getElementById("halfhour1").style.display='';
		document.getElementById("halfhour2").style.display='none';
		document.getElementById("hour1").style.display='none';
		document.getElementById("hour2").style.display='none';
		document.getElementById("ToDateRow").style.display='none';
		
	}
	else{
		document.getElementById("hour1").style.display='none';
		document.getElementById("hour2").style.display='none';
		document.getElementById("halfhour1").style.display='none';
		document.getElementById("halfhour2").style.display='none';
		document.getElementById("ToDateRow").style.display='';
		
	}
	


	//if (Validar()){
	  	document.frm_boat.action="calendar.aspx";
	  	document.frm_boat.txtNewUser.value="0";
	  	document.frm_boat.hdn_add.value="1";
		document.frm_boat.hdnBoatID.value = x;
		document.frm_boat.hdnMarinaID.value = y;
		
		



	   
	   document.frm_boat.action="calendar.aspx";
	  	
	  	document.frm_boat.hdn_add.value="1";
	  	document.frm_boat.txtNewUser.value="1";
		document.frm_boat.hdnBoatID.value = x;
		document.frm_boat.hdnMarinaID.value = y;
	
	  	document.frm_boat.submit();
	   
	  

}


function NewUserSubmit()
{
 
 
    document.frm_boat.action="newuser.aspx";
	  	
	document.frm_boat.submit();
}


function areaMap(zipcode)
{


window.open("http://www.google.com/maps?q="	+zipcode +"&sa=X&oi=map&ct=title","_blank",	"height=800,width=900,status=yes,toolbar=no,menubar=no,location=no");



}

function ChangeTypeRent(){
	if (document.frm_boat.cmb_typerent.value==4){
		document.getElementById("hour1").style.display=''
		document.getElementById("hour2").style.display=''
		document.getElementById("halfhour1").style.display='none'
		//document.getElementById("halfhour2").style.display='none'
		//document.getElementById("hour2").style.display='none'
		document.getElementById("ToDateRow").style.display='none'
		
	}
	
	else if (document.frm_boat.cmb_typerent.value==5){
		document.getElementById("halfhour1").style.display=''
		//document.getElementById("halfhour2").style.display=''
		document.getElementById("hour1").style.display='none'
		document.getElementById("hour2").style.display='none'
		
			document.getElementById("ToDateRow").style.display='none'
	}
	else{
		document.getElementById("hour1").style.display='none'
		document.getElementById("hour2").style.display='none'
		document.getElementById("halfhour1").style.display='none'
		//document.getElementById("halfhour2").style.display='none'
		document.getElementById("ToDateRow").style.display=''
	}
	
	
	
}


function ViewVideo(filename,desc,name)
{
  
  window.open("./ViewVideo.aspx?filename=" +	filename, "_blank",	"height=400,width=400,status=no,toolbar=no,menubar=no,location=no");
  
 //	window.open("./boats/" + filename, "_blank", "height=400,width=400,status=no,toolbar=no,menubar=no,location=no");
  
  
  
}


function FCalendario(num_campo)
{
	var	matParam = new Array(2);
	campo =	num_campo;
	matParam[0]	= window;
	switch (campo)
	{
		case 0:
			matParam[1]	= "txt_date1"; break;
		case 1:
			matParam[1]	= "txt_date2"; break;
	}
		window.showModalDialog("calendar.html",matParam,"dialogHeight:210px; dialogWidth:280px;	center:yes;	help:no; resizable:no; status:no");
}
function AddList(x,y){
	
	
	
	if (Validar()){
	
		document.frm_boat.hdn_add.value="1";
		document.frm_boat.hdnBoatID.value = x;
		document.frm_boat.hdnMarinaID.value = y;
	 	document.frm_boat.action="calendar2.aspx";
		document.frm_boat.submit();

	}

}


function Reserve(){




	document.frm_boat.action = "returning_user.aspx";
	document.frm_boat.submit();
}

function colocar(day,month,year) {
		var	dia	= new String(day);
		if (dia.length < 2)	dia	= "0" +	dia;

		var	mes	= new String(month);
		if (mes.length < 2)	mes	= "0" +	mes;
		var	anio = new String(year);

	document.frm_boat.txt_date1.value=mes +	"/"	+ dia +	"/"	+ anio;
	document.frm_boat.txt_date1_day.value=dia;
	document.frm_boat.txt_date1_month.value=month;
	document.frm_boat.txt_date1_year.value=year;
	document.frm_boat.txt_date2.value=mes +	"/"	+ dia +	"/"	+ anio;
	document.frm_boat.txt_date1_old.value=dia +	"/"	+ mes +	"/"	+ anio;
	document.frm_boat.txt_date2_old.value=dia +	"/"	+ mes +	"/"	+ anio;
	document.frm_boat.action="calendar2.aspx";
	document.frm_boat.submit();

}


function StopBlinking()
{
if (document.frm_boat.TxtToDate.value == "Today") 
   document.frm_boat.TxtToDate.value="";


StopBlinkPickup();
window.frames.i_calendar.StopBlink();


}


function ShowCalendarFrom()
{

if (document.frm_boat.txt_date1.value == "Today") 
   document.frm_boat.txt_date1.value="";
StopBlinkPickup();
Blink('divTo');

showCalendar('frm_boat','txt_date1','IMG_EndDate1');


}




function ValidateEndTime()
{
//alert('test');

var startO=document.getElementById("cmb_hour1");
 var starttimeindex= document.getElementById("cmb_hour1").selectedIndex;
 alert( startO.options[starttimeindex].text);
 
}
</script>


<SCRIPT LANGUAGE="JavaScript" SRC="js/timepicker.js"></SCRIPT>





</head>
<body onload="Blink('pickup');">
<form name="frm_boat" method="post">

<%
        //txt_date1_old=NVL(Request("txt_date1_old"),Date)
        //txt_date2_old=NVL(Request("txt_date2_old"),Date)
        //response.Write(TxtToDate&"--"&len(TxtToDate))
        //response.End()
        //Set cmd=Server.CreateObject("ADODB.Command")
        //Set rs=Server.CreateObject("ADODB.Recordset")
        //With cmd
        //Set .ActiveConnection=oConn
        //.CommandText = "SP_BR_BOAT_GET"
        //.CommandType=adCmdStoredProc
        //.Parameters(1)=request.Form("hdnBoatID")
        //.Parameters(2)=request.Form("hdnMarinaID")
        //End With
        //rs.Open cmd
    if (((Request.Form["hdn_add"] == "1") && (flgAvailable == "1") && (Request["txtNewUser"] != "1")))
    {
%>
<input type="text" name="txt_email" id="txt_email" maxlength="100" value="<%= Request.Form["txt_email"] %>">

<script language="javascript">
   Reserve();
</script>
<%
    }
    if (((Request.Form["hdn_add"] == "1") && (flgAvailable == "1") && (Request["txtNewUser"] == "1")))
    {
%>
<script language="javascript">
   NewUserSubmit();
</script>
<%
    }
%>
<input type="hidden" name="hdnBoatID"  id="hdnBoatID" value="<%= Request.QueryString["BoatID"] %>" />
<input type="hidden" name="hdnMarinaID"	id="hdnMarinaID" value="<%= Request.QueryString["MarinaID"] %>" />
<input type="hidden" name="cmb_boat"  id="cmb_boat" />
<input type="hidden" name="cmb_country"	id="cmb_country" />
<input type="hidden" name="cmb_body" id="cmb_body" />
<input type="hidden" name="cmb_facility" id="cmb_facility" />
<input type="hidden" name="cmb_state" id="cmb_state" />
<input type="hidden" name="cmb_zip"	 id="cmb_zip" />
<input type="hidden" name="txtNewUser"	 id="txtNewUser" value="<%= Request.Form["txtNewUser"] %>" />
<input type="hidden" name="halfhourmilitaryfrom" id="halfhourmilitaryfrom" value="<%= Request.Form["halfhourmilitaryfrom"] %>" />
<input type="hidden" name="halfhourmilitaryto" id="halfhourmilitaryto" value="<%= Request.Form["halfhourmilitaryto"] %>" />
<input type="hidden" name="hourmilitaryfrom" id="hourmilitaryfrom" value="<%= Request.Form["hourmilitaryfrom"] %>" />
<input type="hidden" name="hourmilitaryto" id="hourmilitaryto"  value="<%= Request.Form["halfhourmilitaryfrom"] %>" />
<input type="hidden" name="hourfromtext" id="hourfromtext" value="<%= Request.Form["hourfromtext"] %>" />
<input type="hidden" name="hourtotext" id="hourtotext" value="<%= Request.Form["hourtotext"] %>" />

<!--
<input type="hidden" name="txt_date1" id="txt_date1">
-->


<input type="hidden" name="txt_date2" id="txt_date2">

<input type="hidden" name="txt_date1_day">
<input type="hidden" name="txt_date1_month">
<input type="hidden" name="txt_date1_year">


<input type="hidden" name="txt_date1_old">

<input type="hidden" name="txt_date2_old">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
					<li	id="current"><a	href="default.aspx">Home</a></li>

				
				<!--li><a href="javascript:QuickSearch(3)">Boating Clubs</a></li-->
				<li><a href="javascript:QuickSearch(12)">Cabin</a></li>
				<li><a href="javascript:QuickSearch(8)">Charters</a></li>
				<li><a href="javascript:QuickSearch(10)">Dinner</a></li>
				<li><a href="javascript:QuickSearch(9)">Excursions</a></li>
				<li><a href="javascript:QuickSearch(1)">Fishing</a></li>
<li><a href="javascript:QuickSearch(13)">Houseboat</a></li>
				<li><a href="javascript:QuickSearch(7)">Jet	Ski</a></li>
				<li><a href="javascript:QuickSearch(4)">Paddle</a></li>
				<li><a href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li><a href="javascript:QuickSearch(2)">Sailing</a></li>
				<li><a href="javascript:QuickSearch(6)">Speed</a></li>
				<li><a href="javascript:QuickSearch(5)">Yachts</a></li>
				<!--li><a href="javascript:QuickSearch(13)">Houseboat</a></li-->

			</ul>
		</div><!-- SUB MENU	-->
		<table cellpadding="0" cellspacing="0" width="780" height="25" style="background: url('images/sub_menu_bg.gif')	repeat-x bottom	left; margin-left: 1px;	color: #666">
		<tr>
			<td	width="29" height="25"></td>
			<td	width="657"	height="25">
			    &nbsp;| &nbsp;
			<a href="default.aspx">Home</a>&nbsp;| &nbsp;
			<a href="rentwithus.aspx">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact	Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="Articles.aspx">Articles</a>&nbsp;|&nbsp;
			<a href="sitemap.aspx">Site Map</a>
			</td>
			<td	width="130"	height="25">
			<div></div>
            </td>
		</tr>
		</table>
		
		<div class="calendar_boatimage">
			
			
			<img name="mainboatpic"	src="boats/<%= rs.Fields["vc_filename"].Value %>" alt="<%= rs.Fields["vc_nombre"].Value %>" width="400" height="246"/>
			<input type="hidden" name="hpicmain" value="boats/<%= rs.Fields["vc_filename"].Value %>" >
			<iframe	marginheight="0" marginwidth="0" scrolling="auto" name="f_morePic" width="400" height="108"	src="picscroll.aspx?hdnBoat=<%= rs.Fields["in_boatID"].Value %>&hdnMarina=<%= rs.Fields["in_marinaID"].Value %>"> 
			</iframe>
		
		
		
		
		
		
		
		
		
		
		
			
		
		
		<table cellpadding="0" cellspacing="0" border="0" width="373px" >
						
			
				
						
<%
    cmdF2 = new Command();
    rsF2 = new Recordset();
    cmdF2.ActiveConnection = oConn;
    cmdF2.CommandText = "SP_BR_IMAGE_OTHERS_LIST";
    cmdF2.CommandType = adCmdStoredProc;
    //cmdF2.Parameters[1] = Request.Form["hdnMarinaID"];
    cmdF2.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmdF2.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmdF2.Parameters["@P_IN_MarinaID"].Value = Request.QueryString["MarinaID"];
    //cmdF2.Parameters[2] = Request.Form["hdnBoatID"];
    cmdF2.Parameters["@P_IN_BoatID"].Value = Request.QueryString["BoatID"];
    rsF2 = cmdF2.Execute();
    cmdVideo = new Command();
    rsVideo = new Recordset();
    cmdVideo.ActiveConnection = oConn;
    cmdVideo.CommandText = "SP_BR_VIDEO_LIST";
    cmdVideo.CommandType = adCmdStoredProc;
    //cmdVideo.Parameters[1] = Request.Form["hdnMarinaID"];
    cmdVideo.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
    cmdVideo.Parameters.Append(cmd.CreateParameter("@P_IN_BoatID", adInteger, adParamInput, 4, 0));
    cmdVideo.Parameters["@P_IN_MarinaID"].Value = Convert.ToInt32(Request.QueryString["MarinaID"]);
    //cmdVideo.Parameters[2] = Request.Form["hdnBoatID"];
    cmdVideo.Parameters["@P_IN_BoatID"].Value = Convert.ToInt32(Request.QueryString["BoatID"]);
    rsVideo = cmdVideo.Execute();
%>
						
						
						<tr>
						
						<td	align="left"   colspan=2>
						
						Boat # : <%= Request.QueryString["BoatID"]%>  &nbsp;&nbsp;&nbsp;&nbsp;
						
						
<%
    for(i = 1.0; i <= Convert.ToDouble(Request.Form["hdnRating"]); i += 1)
    {
%>
																 <img src="images/staryellow.gif" width="20" height="20"  />
<%
    }
    for(i = 1.0; i <= 5.0 - Convert.ToDouble(Request.Form["hdnRating"]); i += 1)
    {
%>
														 <img src="images/starwhite.gif" width="20" height="20"	/>
<%
    }
%>
						
						
						
						
						
						</td>			
						</tr>
					
								
						<tr>
							<td   >&nbsp;&nbsp;<%= rs.Fields["StateName"].Value %>
<%
    if (!(Convert.ToString(rs.Fields["vc_city"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_city"].Value %><%
    }
    if (!(Convert.ToString(rs.Fields["ch_zip"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["ch_zip"].Value %><%
    }
    if (!(Convert.ToString(rs.Fields["vc_bodywater"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_bodywater"].Value %><%
    }
%>
							
							
							
							
						<br>
							
							<input type="button" value="AREA MAP" onclick="javascript:areaMap('<%= rs.Fields["ch_zip"].Value %>')"	id=button2 name=button2>
							
<%
    if (!(rsVideo.Eof))
    {
        if   (rsVideo.Fields["vc_filename"].Value.ToString().Substring(0,4) == "http")
        {
%>
							&nbsp;&nbsp; <input	type="button" value="See Boat Video" onclick="window.open('<%= rsVideo.Fields["vc_filename"].Value %>');"	 id=button4	name=button3>

<%            
        }
        else
        {
%>
							&nbsp;&nbsp; <input	type="button" value="See Boat Video" onclick="javascript:ViewVideo('<%= rsVideo.Fields["vc_filename"].Value %>','<%= rsVideo.Fields["vc_description"].Value %>','<%= rsVideo.Fields["vc_nombre"].Value %>')"	 id=button3	name=button3>
							
<%
        }
    }
%>
							
						
						
						
						
						
							
							</td>
							
							
							
							
							
							
							
							
							
						</tr>
						
						
						
			</table>	
			
		
			
			</div>
			
			
			
			
		
	
				
		
		
<%
    if ((Convert.ToInt32(rs.Fields["ch_feeType"].Value) == 3))
    {
%>
	     
	     
	     <div class="calendar_calendardiv">
			
			<div align=center>
					<h4><br><br>
			
<%= rs.Fields["StateName"].Value %>
<%
        if (!(Convert.ToString(rs.Fields["vc_city"].Value) == ""))
        {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_city"].Value %><%
        }
        if (!(Convert.ToString(rs.Fields["ch_zip"].Value) == ""))
        {
%>
&nbsp;-&nbsp;<%= rs.Fields["ch_zip"].Value %><%
        }
%>
					<br>
					<br>
<%
        if (!(Convert.ToString(rs.Fields["vc_bodywater"].Value) == ""))
        {
%>
&nbsp;&nbsp;<%= rs.Fields["vc_bodywater"].Value %><%
        }
%>
					 <br>
					 <br>
					 </h4>
					 <button onmouseover="this.style.cursor='hand'"	style="width:300;height:72;font:bold 20px Arial;color: red"	onclick="javascript:window.open('http://<%= rs.Fields["displayAdLandingPage"].Value %>')"   >MORE INFORMATION </button>
											
			</div>
		
	
		</div>
			
			
<%
    }
    else
    {
%>
		
		
		
		
			<div class="calendar_calendardiv" >
				
				
					
						<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
									 <iframe marginheight="0" marginwidth="0" name="i_calendar" id="i_calendar"	  src="calendar_i.aspx?hdnBoat=<%= rs.Fields["in_boatID"].Value %>&hdnMarina=<%= rs.Fields["in_marinaID"].Value %>" frameborder="0" scrolling="no"	height="165" width="205"></iframe>
									</td>
									<td>
										
										&nbsp;&nbsp;
									<img src="images/booknow.gif"  onclick="javacript:NewUser(<%= Request.Form["hdnBoatID"] %>,<%= Request.Form["hdnMarinaID"] %>)"onmouseover="style.cursor='hand'"/>
										<br>&nbsp;&nbsp;&nbsp;&nbsp;Click on 
										your desired date
			
					
				
					
			
			
			
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="calendar_dates_available">Green =	Available</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="calendar_dates_partially_available">Orange = 1/2 Day</span>
				
				
	<table cellpadding="0" cellspacing="0"  border="1" align="right" >
				<tr>
				<td colspan=2 height=15px>
				</td>
				</tr>
				
				<tr>
					
					<td colspan=2>
					<input type="hidden" name="hdn_add" value="0">
			        <input type="hidden" name="hdn_del" value="0">
					<div id="pickup" style="background-color:#FFFFCC;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Pick Up Date</strong></div> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
        TypeRent();
%>
						
					</td>
				</tr>

				<tr>
					<td id="lblCalendarFrom" name="lblCalendarFrom">From:</td>
					<td id="txtCalendarFrom" name="txtCalendarFrom" >
<script language="JavaScript" src="calendar/RedCellCalendar.js"></script>
<a onClick="ShowCalendarFrom();" href="javascript:calClick()">
         	   	<img height="17" alt="Select Date" src="imagescal/calendar.gif" width="18"  align="absMiddle" border="0" name="IMG_EndDate1" id="IMG_EndDate1"></a>
		
<%
        //txt_date1 = " ";
        if (txt_date1.Length != 11)
        {
                //dia=mid(txt_date1,4,2)
                //mes=mid(txt_date1,1,2)
                //anio=mid(txt_date1,7,4)
            switch (txt_date1_month) {
                case 01:
                    mes = "Jan";
                    break;
                case 02:
                    mes = "Feb";
                    break;
                case 03:
                    mes = "Mar";
                    break;
                case 04:
                    mes = "Apr";
                    break;
                case 05:
                    mes = "May";
                    break;
                case 06:
                    mes = "Jun";
                    break;
                case 07:
                    mes = "Jul";
                    break;
                case 08:
                    mes = "Aug";
                    break;
                case 09:
                    mes = "Sep";
                    break;
                case 10:
                    mes = "Oct";
                    break;
                case 11:
                    mes = "Nov";
                    break;
                case 12:
                    mes = "Dec";
                    break;
            }
            if ((txt_date1 != "Today"))
            {
                fecha = mes + "-" + Convert.ToString(txt_date1_day) + "-" + Convert.ToString(txt_date1_year);
            }
            else
            {
                fecha = "Today";
            }
%>
				<input type="text" id="txt_date1" name="txt_date1" size="10" value="<%= fecha %>" onclick="ShowCalendarFrom();"  READONLY >
<%
        }
        else
        {
            txt_date1 = SDate1;
%>
				<input type="text" id="txt_date1" name="txt_date1" size="10" value="<%= txt_date1 %>" onclick="ShowCalendarFrom();"  READONLY  > <%
        }
%>
			</td>
				</tr>
				<tr id="ToDateRow" name="ToDateRow">
					<td id="lblCalendarTo" name="lblCalendarTo" ><div id="divTo">To:</div></td>
					<td id="txtCalendarTo" name="txtCalendarTo">
<script language="JavaScript" src="calendar/RedCellCalendar.js"></script>
					<a onClick="showCalendar('frm_boat','TxtToDate','IMG_EndDate2')" href="javascript:calClick()">
         	   	<img height="17" alt="Select Date" src="imagescal/calendar.gif" width="18" align="absMiddle" border="0" name="IMG_EndDate2" id="IMG_EndDate2"></a><%
        if (txt_date1.Length != 11)
        {
%>&nbsp;<input type="text" id="TxtToDate" name="TxtToDate" size="10"  maxlength="11"  value="<%= fecha %>" onclick="StopBlinking();showCalendar('frm_boat','TxtToDate','IMG_EndDate2')"  READONLY >
<%
        }
        else
        {
            txt_date1 = Request["txt_date1"];
%>
					<input type="text" id="TxtToDate" name="TxtToDate" size="10"  maxlength="11"  value="<%= txt_date1 %>" onclick="StopBlinking();showCalendar('frm_boat','TxtToDate','IMG_EndDate2')"  READONLY  >
<%
        }
%>

					</td>
				</tr>
				<tr>
					<td colspan=2 > 
					</td>
				</tr>
				<tr>
					<td ></td>
					<td ><input type="text" name="txt_date2" id="txt_date2"  size="10" style="display:none" value="<%= txt_date2 %>">
					</td>
				</tr>
				 <tr id="hour1" style="DISPLAY: none" name="hour1">
									<td >Start</td>
									<td ><select id="cmb_hour1" name="cmb_hour1" class="boat_quantity">
<%
        for(i = 0.0; i <= 11.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i %>:00 AM</option>
<%
        }
%>
											
											<option value="1200">12:00 PM</option>
											
<%
        for(i = 13.0; i <= 23.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i - 12.0 %>:00 PM</option>
<%
        }
%>
										</select> hrs.</td>
					</tr>
					<tr id="hour2" style="DISPLAY: none" name="hour2">
									<td >Return</td>
									<td ><select id="cmb_hour2"  name="cmb_hour2" class="boat_quantity" >
<%
        for(i = 0.0; i <= 11.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i %>:00 AM</option>
<%
        }
%>
											
											<option value="1200">12:00 PM</option>
											
											
<%
        for(i = 13.0; i <= 23.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i - 12.0 %>:00 PM</option>
<%
        }
%>
										</select> hrs.</td>
					</tr>
					
					
					 <tr id="halfhour1" style="DISPLAY: none" name="halfhour1">
									<td >Start</td>
									<td >
									<select id="cmb_halfhour1"  name="cmb_halfhour1" class="boat_quantity" >
<%
        for(i = 0.0; i <= 11.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i %>:00 AM</option>
											<option value="<%= getMilitaryHalf(i) %>"><%= i %>:30 AM</option>
											
<%
        }
%>
											
											<option value="1200">12:00 PM</option>
											<option value="1230">12:30 PM</option>
											
<%
        for(i = 13.0; i <= 23.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i - 12.0 %>:00 PM</option>
											<option value="<%= getMilitaryHalf(i) %>"><%= (i - 12.0) %>:30 PM</option>
<%
        }
%>
										</select> hrs.
									</td>
					</tr>
					
						<tr id="halfhour2" style="DISPLAY: none" name="halfhour2">
									<td >Return</td>
									<td ><select id="cmb_halfhour2"  name="cmb_halfhour2" class="boat_quantity" readonly >
<%
        for(i = 0.0; i <= 11.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i %>:00 AM</option>
											<option value="<%= getMilitaryHalf(i) %>"><%= i %>:30 AM</option>
											
<%
        }
%>
											
											<option value="1200">12:00 PM</option>
											<option value="1230">12:30 PM</option>
											
<%
        for(i = 13.0; i <= 23.0; i += 1)
        {
%>
											<option value="<%= getMilitary(i) %>"><%= i - 12.0 %>:00 PM</option>
											<option value="<%= getMilitaryHalf(i) %>"><%= (i - 12.0) %>:30 PM</option>
<%
        }
%>
										</select> hrs.
										
										
										
										</td>
					</tr>
					
					
					
					
					
					
			</table>
						
							
							
							
							</td>
										
							</tr>
							
							
							
							<tr>
							
							<td colspan=2>
							
								<table cellpadding="0" cellspacing="0"  border="0" align="lft" bgColor="#F1F5F5"width="358">
							<tr>
							<td><p align="right"><b><font size="2">631-286-7816</font><font color="#000080" size="4">&nbsp;&nbsp;&nbsp;New Customers</font></b> &nbsp;
							<input type="button" value="Book Now" id="SignIn" name="SignIn" onclick="javacript:NewUser(<%= Request.QueryString["BoatID"] %>,<%= Request.QueryString["MarinaID"] %>)">
							</td>
							</tr>
							<tr>
							<td width="374">
                            <p align="right">Members<font color="#000080" size="2">&nbsp;(email)</font>&nbsp;	&nbsp;<input type="text" name="txt_email" id="txt_email" maxlength="100" value="<%= Request.Form["txt_email"] %>">					    
							<input type="button" value="Sign In" onclick="javascript:UserLogin(<%= Request.QueryString["BoatID"] %>,<%= Request.Form["hdnMarinaID"] %>)">
							<p align="center"><font color="#FF0000" size="4">Rental Rates</font></b></i></td>
							</td>
							</tr>
							
						
									
							
							</table>
							</td>
							</tr>
							
						
						
							</table>
				
				
			
<%
        cmdP = new Command();
        rsP = new Recordset();
        cmdP.ActiveConnection = oConn;
        cmdP.CommandText = "SP_BR_PRICExBOATxTYPERENT_LIST";
        cmdP.CommandType = adCmdStoredProc;
        //cmdP.Parameters[1] = rs.Fields["in_boatID"].Value;
        cmdP.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmdP.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmdP.Parameters["@p_in_boatID"].Value = rs.Fields["in_boatID"].Value;
        //cmdP.Parameters[2] = rs.Fields["in_marinaID"].Value;
        cmdP.Parameters["@p_in_marinaID"].Value = rs.Fields["in_marinaID"].Value;
        rsP.Open(cmdP);
%>
							
		
				<table border="1" cellspacing="0" cellpadding="0" align="center" bgColor="#F1F5F5" width="378px">
					
<%
        i = 0.0;
        while(!(rsP.Eof))
        {
            if ((i == 0.0))
            {
%>
							
							<tr>
							<td>
							</td>
							
							<td>
							
							Weekday</td>
							<td>
							
							Weekend</td>
							<td>
							Holiday	</td>
							<td>
							Hours
							</td>
							
							</tr>
							
							
<%
            }
            i = i + 1.0;
%>
								<tr>
									<td>
<%= rsP.Fields["vc_description"].Value %>&nbsp;price:
									</td>
									<td>
<%
            if (Convert.ToDouble(rsP.Fields["nu_precioDayWeek"].Value) > 0.00)
            {
%>
$<%= rsP.Fields["nu_precioDayWeek"].Value %>&nbsp;&nbsp;<%
            }
%>
									</td>
									<td>
<%
            if (Convert.ToDouble(rsP.Fields["nu_precioDayWeekend"].Value) > 0.00)
            {
%>
$<%= rsP.Fields["nu_precioDayWeekend"].Value %>&nbsp;&nbsp;<%
            }
%>
									</td>
									<td>
<%
            if (Convert.ToDouble(rsP.Fields["nu_precioHolyday"].Value) > 0.00)
            {
%>
$<%= rsP.Fields["nu_precioHolyday"].Value %><%
            }
%>
									</td>
									<td>
<%
            if (Convert.ToString(rsP.Fields["hours_from"].Value) != "")
            {
%>
<%= rsP.Fields["hours_from"].Value %><%
            }
            if (Convert.ToString(rsP.Fields["hours_to"].Value) != "")
            {
%>
 TO <%= rsP.Fields["hours_to"].Value %>
<%
            }
%>
									</td>
									
								</tr>
<%
            rsP.MoveNext();
        }
        rsP.Close();
        rsP = null;
%>
				
				</table>
			  
			
		</div>



	
	
	

		
	
				
				
		
			
		
		
<%
    }
%>
	
		
		
	
	<div class="calendar_boatdetails" >

	
		
		
		<div class="calendar_boatdetails" >

			
			
			
			
			
			
			
			
			
			
			
			
			<table cellpadding="0" cellspacing="0">
				
				
				
				<tr>
					<td	valign="top" bgcolor="F1F5F5">
						<table class="boatdetails_table" cellpadding="0" cellspacing="0" width="370">
							<tr>
								<th	colspan="2"	bgcolor="white">Boat Details</th>
							</tr>
							<tr>
								<td	class="boatcat_title">Boat Name:</td>
								<td	class="boatcat_detail"><%= rs.Fields["vc_name"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title">Make:</td>
								<td	class="boatcat_detail"><%= rs.Fields["vc_make"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title">Model:</td>
								<td	class="boatcat_detail"><%= rs.Fields["vc_model"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title">Length:</td>
								<td	class="boatcat_detail"><%= rs.Fields["vc_size"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title">Passengers:</td>
								<td	class="boatcat_detail"><%= rs.Fields["in_maxPassengers"].Value %></td>
							</tr>
							
							
<%
        if (NVL(Convert.ToString(rs.Fields["Is_boat_sale"].Value), "0") == "1")
        {
%>
							
							<tr>
							
								<td	class="boatcat_title">This Boat	is for Sale:</td>
								<td	class="boatcat_detail">$<%= rs.Fields["boat_sale_amount"].Value %></td>
							
							</tr>
							
<%
    }
%>
							
							
							<tr>
								<td	class="boatcat_title">Captain&nbsp;or&nbsp;Guide Available&nbsp;for&nbsp;Hire:</td>
								<td	class="boatcat_detail"><%
    if (NVL(Convert.ToString(rs.Fields["ti_captain"].Value),"0") == "1")
    {
%>
Yes<%
    }
    else
    {
%>
No<%
    }
%>
</td>
							</tr>
							<tr>
								<td	class="boatcat_title" valign="top">Description:</td>
								<td	class="boatcat_detail"><%= rs.Fields["vc_description"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title" valign="top">Facility	Area & Attractions:</td>
								<td	class="boatcat_detail"><%= rs.Fields["vc_facilityArea"].Value %></td>
							</tr>
							
						
						</table>
						
						
					</td>
					
					
					
					
					<td	valign="top"  bgcolor="F1F5F5">
						<table class="boatdetails_table" cellpadding="0" cellspacing="0" width="370" border="0">
							<tr>
								<th	colspan="2"	bgcolor="white">Rental Details</th>
							</tr>
							<tr>
								<td	style="width: 153px" class="boatcat_title">Requirements:</td>
								<td	style="width: 217px" class="rentdetails"><%= rs.Fields["vc_requirements"].Value %></td>
							</tr>
							
							<tr>
								<td	class="boatcat_title">Facility #</td>
								<td	class="rentdetails"><%= rs.Fields["in_marinaID"].Value %> </td>
							
							 </tr>
							 
							 <tr>
								<td	class="boatcat_title">More From	this Facility</td>
								<td	class="rentdetails">
								
								<input type="button" value="search"	onclick="document.location.href='./facility.aspx?id=<%= rs.Fields["in_marinaID"].Value %>'"	id=button1 name=button1>
								
								</td>
							
							 </tr>
						
							<tr>
								<td	class="boatcat_title">Tax Rates:</td>
								<td	class="rentdetails"><%= rs.Fields["nu_tax"].Value %> %</td>
							</tr>
							<tr>
								<td	class="boatcat_title">Reservation&nbsp;Deposit:</td>
								<td	class="rentdetails"><%= rs.Fields["nu_reservation"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title">Security Deposit:</td>
								<td	class="rentdetails"><%= rs.Fields["nu_deposit"].Value %></td>
							</tr>
							<tr>
								<td	class="boatcat_title" valign="top">Facility&nbsp;Cancellation&nbsp;Policy:</td>
								<td	class="rentdetails"><%= rs.Fields["vc_depositPolicy"].Value %></td>
							</tr>
							<tr>
								<td	colspan="2"	align="right"><font	size="1" face="Arial"><br>
								&nbsp;</font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
<%
    if (((Request.Form["hdn_add"] == "1") && (flgAvailable == "0")))
    {
%>
<script language="javascript">
 
  alert("Your Reservation could not be processed \n\t  Some of the hours/days you requested are not available.\n \t Please, change your booking dates and try again.");
  
</script>
<%
    }
    if (((Request.Form["hdn_add"] == "1") && (LoginSuccessFlag == "0") && (Request["txtNewUser"] != "1")))
    {
%>
<script language="javascript">
 
  alert("Please, use a valid Email ID or use new customer");
  
</script>


<%
    }
%>
		
		
		<div id="footer">
			<div id="footer_details">
<%= rs.Fields["StateName"].Value %>
<%
    if (!(Convert.ToString(rs.Fields["vc_city"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_city"].Value %><%
    }
    if (!(Convert.ToString(rs.Fields["ch_zip"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["ch_zip"].Value %><%
    }
    if (!(Convert.ToString(rs.Fields["vc_bodywater"].Value) == ""))
    {
%>
&nbsp;-&nbsp;<%= rs.Fields["vc_bodywater"].Value %><%
    }
%>

                                                                
 &middot; 631-286-7816 &middot;	<a href="mailto:info@boatrenting.com">info@boatrenting.com </a> 
		</div>
	
	
	</div> <!--	Container Ends Here	-->


</div>
</div>

<script>
ChangeTypeRent();

</script>


</form>

<div class="text" id="popupcalendar" style="background-color: #F5F2E5; z-index: 2"  ></div>

	





<script	language="JavaScript">
function Pics(){
    window.open('morepics.aspx?marina=<%= Request.QueryString["MarinaID"] %>&boat=<%= Request.QueryString["BoatID"] %>', 'morePics', 'width=383,height=200,location=0');
}

function QuickSearch(x){
	document.frm_boat.cmb_boat.value = x;
	document.frm_boat.cmb_country.value	= 0;
	document.frm_boat.cmb_body.value = 0;
	document.frm_boat.cmb_facility.value = 0;
	document.frm_boat.cmb_state.value =	0;
	document.frm_boat.cmb_zip.value	= 0;
	document.frm_boat.action = "results.aspx";
	document.frm_boat.submit();
}

</script>

<script	src="http://www.google-analytics.com/urchin.js"	type="text/java_script">
</script>
<script	type="text/java_script">
_uacct = "UA-872206-1";
urchinTracker();
</script>
</body>
</html>
