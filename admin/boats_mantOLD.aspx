<%@ Page language="C#" CodeFile="boats_mantOLD.aspx.cs" Inherits="BoatRenting.boats_mant_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<form name="frm_boats_mant" id="form1" runat="server">
//<!--#include file="__dbConnection.aspx"-->
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/client.net/members.aspx");
    }

    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    Server.ScriptTimeout = 1800;
    hdn_Action = Request["hdn_Action"];
    hdn_Recall = Request["hdn_Recall"];
    txt_marinaID = Session["MarinaID"];
    txt_BoatID = Request["BoatID"];
    //if (hdn_Action == "E" && hdn_Recall == "") string.IsNullOrEmpty(InputValue)
    //if (hdn_Action == "E" && string.IsNullOrEmpty(hdn_Recall))
    if (hdn_Action == "E" && !IsPostBack)
    {
        //Response.Write "Boat ID" & txt_BoatID & txt_marinaID
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BOAT_GET";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = txt_BoatID;
        //cmd.Parameters[2] = txt_marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_marinaID); 
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
        rs = cmd.Execute();
        txt_Name = NVL(Convert.ToString(rs.Fields["vc_Name"].Value), "");
        txt_Description = NVL(Convert.ToString(rs.Fields["vc_Description"].Value), "");
        txt_Make = NVL(Convert.ToString(rs.Fields["vc_Make"].Value), "");
        txt_Model = NVL(Convert.ToString(rs.Fields["vc_Model"].Value), "");
        txt_Year = NVL(Convert.ToString(rs.Fields["vc_Year"].Value), "");
        txt_size = NVL(Convert.ToString(rs.Fields["vc_size"].Value), "");
        //'	txt_city = NVL(rs("vc_city"),"")
        //'	cbo_State = NVL(rs("in_StateID"),0)
        //'	cbo_Country = NVL(rs("in_CountryID"),0)
        cbo_BoatType = NVL(Convert.ToString(rs.Fields["in_BoatTypeID"].Value), "0");
        cbo_SubBoatType = NVL(Convert.ToString(rs.Fields["in_SubBoatTypeID"].Value), "0");
        //'	txt_phone = NVL(rs("vc_phone"),"")
        txt_MaxPassengers = NVL(Convert.ToString(rs.Fields["in_MaxPassengers"].Value), "");
        //'	txt_tax = NVL(rs("nu_tax"),"")
        txt_deposit = NVL(Convert.ToString(rs.Fields["nu_deposit"].Value), "");
        txt_requirements = NVL(Convert.ToString(rs.Fields["vc_requirements"].Value), "");
        txt_reservation = NVL(Convert.ToString(rs.Fields["nu_reservation"].Value), "");
        chk_captain = NVL(Convert.ToString(rs.Fields["ti_captain"].Value), "0");
        chk_Is_boat_sale = NVL(Convert.ToString(rs.Fields["Is_boat_sale"].Value), "0");
        txt_boat_sale_amount = NVL(Convert.ToString(rs.Fields["boat_sale_amount"].Value), "0");
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_PRICExBOATxTYPERENT_LIST";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = txt_BoatID;
        //cmd.Parameters[2] = txt_marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_marinaID);
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
        rs = cmd.Execute();
        if (!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_TypeRentID"].Value) == 1)
            {
                txt_weekday1 = Convert.ToString(rs.Fields["nu_precioDayWeek"].Value);
                txt_weekend1 = Convert.ToString(rs.Fields["nu_precioDayWeekEnd"].Value);
                txt_holiday1 = Convert.ToString(rs.Fields["nu_precioHolyday"].Value);
                txt_hoursfrom1 = Convert.ToString(rs.Fields["Hours_From"].Value);
                txt_hoursto1 = Convert.ToString(rs.Fields["Hours_To"].Value);
                rs.MoveNext();
            }
            if (!(rs.Eof))
            {
                if (Convert.ToInt32(rs.Fields["in_TypeRentID"].Value) == 2)
                {
                    txt_weekday2 = Convert.ToString(rs.Fields["nu_precioDayWeek"].Value);
                    txt_weekend2 = Convert.ToString(rs.Fields["nu_precioDayWeekEnd"].Value);
                    txt_holiday2 = Convert.ToString(rs.Fields["nu_precioHolyday"].Value);
                    txt_hoursfrom2 = Convert.ToString(rs.Fields["Hours_From"].Value);
                    txt_hoursto2 = Convert.ToString(rs.Fields["Hours_To"].Value);
                    rs.MoveNext();
                }
            }
            if (!(rs.Eof))
            {
                if (Convert.ToInt32(rs.Fields["in_TypeRentID"].Value) == 3)
                {
                    txt_weekday3 = Convert.ToString(rs.Fields["nu_precioDayWeek"].Value);
                    txt_weekend3 = Convert.ToString(rs.Fields["nu_precioDayWeekEnd"].Value);
                    txt_holiday3 = Convert.ToString(rs.Fields["nu_precioHolyday"].Value);
                    txt_hoursfrom3 = Convert.ToString(rs.Fields["Hours_From"].Value);
                    txt_hoursto3 = Convert.ToString(rs.Fields["Hours_To"].Value);
                    rs.MoveNext();
                }
            }
            if (!(rs.Eof))
            {
                if (Convert.ToInt32(rs.Fields["in_TypeRentID"].Value) == 4)
                {
                    txt_weekday4 = Convert.ToString(rs.Fields["nu_precioDayWeek"].Value);
                    txt_weekend4 = Convert.ToString(rs.Fields["nu_precioDayWeekEnd"].Value);
                    txt_holiday4 = Convert.ToString(rs.Fields["nu_precioHolyday"].Value);
                    txt_hoursfrom4 = Convert.ToString(rs.Fields["Hours_From"].Value);
                    txt_hoursto4 = Convert.ToString(rs.Fields["Hours_To"].Value);
                }
            }
        }
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_IMAGE_LIST";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = txt_BoatID;
        //cmd.Parameters[2] = txt_marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_marinaID);
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
        rs = cmd.Execute();
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 0)
            {
                txt_resultName = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_resultDesc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_resultOld = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 1)
            {
                txt_detailName = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_detailDesc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_detailOld = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 2)
            {
                txt_other1Name = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_other1Desc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_other1Old = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 3)
            {
                txt_other2Name = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_other2Desc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_other2Old = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 4)
            {
                txt_other3Name = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_other3Desc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_other3Old = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 5)
            {
                txt_other4Name = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_other4Desc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_other4Old = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            if (Convert.ToInt32(rs.Fields["ti_mainpic"].Value) == 100)
            {
                txt_BoatVideoName = Convert.ToString(rs.Fields["vc_nombre"].Value);
                txt_BoatVideoDesc = Convert.ToString(rs.Fields["vc_description"].Value);
                txt_BoatVideoOld = Convert.ToString(rs.Fields["vc_filename"].Value);
            }
            rs.MoveNext();
        }
        //'response.Write(txt_resultOld &"/"& txt_detailOld &"/"& txt_other1Old &"/"& txt_other2Old)
    }
    else
    {
        txt_Name = NVL(Request.Form["txt_Name"], "");
        txt_Description = NVL(Request.Form["txt_Description"], "");
        txt_Make = NVL(Request.Form["txt_Make"], "");
        txt_Model = NVL(Request.Form["txt_Model"], "");
        txt_Year = NVL(Request.Form["txt_Year"], "");
        txt_size = NVL(Request.Form["txt_size"], "");
        //'	txt_city = NVL(Request.Form("txt_city"),"")
        //'	cbo_State = NVL(Request.Form("cbo_State"),0)
        //'	cbo_Country = NVL(Request.Form("cbo_Country"),0)
        cbo_BoatType = NVL(Request.Form["cbo_BoatType"], "0");
        cbo_SubBoatType = NVL(Request.Form["cbo_SubBoatType"], "0");
        //'	txt_phone = NVL(Request.Form("txt_phone"),"")
        txt_MaxPassengers = NVL(Request.Form["txt_MaxPassengers"], "");
        //'	txt_tax = NVL(Request.Form("txt_tax"),"")
        txt_deposit = NVL(Request.Form["txt_deposit"], "");
        txt_requirements = NVL(Request.Form["txt_requirements"], "");
        txt_reservation = NVL(Request.Form["txt_reservation"], "");
        chk_captain = NVL(Request.Form["chk_captain"], "0");
        chk_Is_boat_sale = NVL(Request.Form["chk_Is_boat_Sale"], "0");
        txt_boat_sale_amount = NVL(Request.Form["txt_boat_sale_amount"], "0");
        txt_weekday1 = Request.Form["txt_weekday1"];
        txt_weekend1 = Request.Form["txt_weekend1"];
        txt_holiday1 = Request.Form["txt_holiday1"];
        txt_hoursfrom1 = Request.Form["txt_hoursfrom1"];
        txt_hoursto1 = Request.Form["txt_hoursto1"];
        txt_weekday2 = Request.Form["txt_weekday2"];
        txt_weekend2 = Request.Form["txt_weekend2"];
        txt_holiday2 = Request.Form["txt_holiday2"];
        txt_hoursfrom2 = Request.Form["txt_hoursfrom2"];
        txt_hoursto2 = Request.Form["txt_hoursto2"];
        txt_weekday3 = Request.Form["txt_weekday3"];
        txt_weekend3 = Request.Form["txt_weekend3"];
        txt_holiday3 = Request.Form["txt_holiday3"];
        txt_hoursfrom3 = Request.Form["txt_hoursfrom3"];
        txt_hoursto3 = Request.Form["txt_hoursto3"];
        txt_weekday4 = Request.Form["txt_weekday4"];
        txt_weekend4 = Request.Form["txt_weekend4"];
        txt_holiday4 = Request.Form["txt_holiday4"];
        txt_hoursfrom4 = Request.Form["txt_hoursfrom4"];
        txt_hoursto4 = Request.Form["txt_hoursto4"];
        txt_resultName = Request.Form["txt_resultName"];
        txt_resultDesc = Request.Form["txt_resultDesc"];
        txt_resultOld = Request.Form["txt_resultOld"];
        txt_detailName = Request.Form["txt_detailName"];
        txt_detailDesc = Request.Form["txt_detailDesc"];
        txt_detailOld = Request.Form["txt_detailOld"];
        txt_other4Name = Request.Form["txt_other4Name"];
        txt_other4Desc = Request.Form["txt_other4Desc"];
        txt_other4Old = Request.Form["txt_other4Old"];
        txt_other3Name = Request.Form["txt_other3Name"];
        txt_other3Desc = Request.Form["txt_other3Desc"];
        txt_other3Old = Request.Form["txt_other3Old"];
        txt_other2Name = Request.Form["txt_other2Name"];
        txt_other2Desc = Request.Form["txt_other2Desc"];
        txt_other2Old = Request.Form["txt_other2Old"];
        txt_other1Name = Request.Form["txt_other1Name"];
        txt_other1Desc = Request.Form["txt_other1Desc"];
        txt_other1Old = Request.Form["txt_other1Old"];
        txt_BoatVideoName = Request.Form["txt_BoatVideoName"];
        txt_BoatVideoDesc = Request.Form["txt_BoatVideoDesc"];
        txt_BoatVideoOld = Request.Form["txt_BoatVideoOld"];
    }
%>



<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";
    .style1
    {
        text-align: right;
        height: 20px;
    }
    .style2
    {
        height: 20px;
    }
</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>

<script language="javascript">

function ShowCalendar()
{


var w = document.getElementById("HolidayCalendar");
w.style.visibility="visible"; 

}


function makeHolidayInvisible()
{
var w = document.getElementById("HolidayCalendar");
w.style.visibility="hidden"; 

//document.HolidayCalendar.style.display ="none";

}
function ShowHelp(opt){
if (opt==1){
text='A subcategory is an additional search category that your boat fits under in addition to the main category. For example, if you have a speed boat that could be used as a cabin boat then your main category would be "speed" and your subcategory would be "cabin." In a search, this boat would come up under both listings.'
}
if (opt==2){
text='This feature allows you to insert a photo from your own computer onto your boat page. Press the browse button, then select your photo files and save them to the page.'
}
if (opt==3){
text='Some facilities offer a captain to drive the boat for the renter, or someone to guide the renter. If you answer yes, the customer will be asked if he would like to choose this service at booking. If selected, you will be notified and must contact the customer yourself with pricing details.'
}
if (opt==4){
text='This is where you can add your boat to our website. Please remember to be specific in your description. This will avoid confusion for the customer and help you to better rent your boats.'
}
if (opt==5){
text='Fill in your boat rental price in the text box next to the Rental Time Slots that are available for your boat. If you do not offer a certain time slot leave it blank.'
}
if (opt==6){
text='This name needs to be unique. This is how you will determine between your boats. If you have three of the same types of boats, you may want to name them unit 01 through unit 03.'
}
window.open('../help.aspx?text='+text, 'help'+opt, 'scrollbars=no,height=220,width=300,status=no');

}

function Validar () {
    var chk=false;

	//Initialise variables
	var errorMsg = "";
var s="Phone numbers, email or web address Characters Sequence are not allowed in text form.Please remove any Phone numbers, email or web address Character Sequences";



	//Check for a Name
	if (document.getElementById("txt_Name").value == ""){
		errorMsg += "\n\t Name \t\t                  - Enter your Name";
	}

	//Check for a Name
	if (document.getElementById("txt_Description").value == ""){
		errorMsg += "\n\t Description \t\t                  - Enter your Description";
	}


if ( IsFieldContainsEmail(document.getElementById("txt_Description").value))
{
			errorMsg += "\n\t Description \t\t   "+s;
		
 
}


if ( IsFieldContainsPhone(document.getElementById("txt_Description").value))
{
			errorMsg += "\n\t Description \t\t   "+s;
 
}

if ( IsFieldContainsWeb(document.getElementById("txt_Description").value))
{
			errorMsg += "\n\t Description \t\t   "+s;
 
}


if ( IsFieldContainsEmail(document.getElementById("txt_requirements").value))
{
			errorMsg += "\n\t Requirements \t\t   "+s;
		
 
}


if ( IsFieldContainsPhone(document.getElementById("txt_requirements").value))
{
			errorMsg += "\n\t Requirements \t\t   "+s;
 
}

if ( IsFieldContainsWeb(document.getElementById("txt_requirements").value))
{
			errorMsg += "\n\t Requirements \t\t   "+s;
 
}





	if (document.getElementById("txt_Make").value == ""){
		errorMsg += "\n\t Make \t\t                  - Enter Make";
	}

	if (document.getElementById("txt_Model").value == ""){
		errorMsg += "\n\t Model \t\t                  - Enter your Model";
	}


		
	if (document.getElementById("txt_Year").value != "")
	{
	 if (isNaN(parseInt(document.getElementById("txt_Year").value)))
		  errorMsg += "\n\t Year \t\t                  - Enter a Numeric value in Year";
	}

	

	if (document.getElementById("txt_size").value == ""){
		errorMsg += "\n\t Size \t\t                  - Enter Size";
	}


//(document.forms[0].cbo_BoatType.options[document.forms[0].cbo_BoatType.selectedIndex].value == "0") 

if (document.forms[0].cbo_BoatType.options[document.forms[0].cbo_BoatType.selectedIndex].value == "0") 
{
		errorMsg += "\n\t Boat Type \t\t                  - Enter Boat Type";
	}



	if (document.getElementById("txt_MaxPassengers").value == ""){
		errorMsg += "\n\t MaxPassengers \t\t                  - Enter MaxPassengers";
	}
	else
	{  if (isNaN(parseInt(document.getElementById("txt_MaxPassengers").value)))
		  errorMsg += "\n\t MaxPassengers \t\t                  - Enter a Numeric value in MaxPassengers field";
	}


	if (document.getElementById("txt_reservation").value == ""){
		errorMsg += "\n\t Reservation \t\t                  - Enter Reservation";
	}
	//else
	//{  if (isNaN(parseFloat(document.getElementById("txt_reservation").value)))
	//	  errorMsg += "\n\t Reservation \t\t                  - Enter a Numeric value in //Reservation field";
	//}

	if (document.getElementById("txt_deposit").value == ""){
		errorMsg += "\n\t Security Deposit \t\t                  - Enter Security Deposit";
	}
	
	
	if (document.getElementById("chk_Is_boat_sale").checked)
	{

	  if (document.getElementById("txt_boat_sale_amount").value == "")
	    errorMsg += "\n\t Boat Sale Amount \t\t                  - Enter Boat Sale Amount";
	  	else   if (isNaN(parseFloat(document.getElementById("txt_boat_sale_amount").value)))
		  errorMsg += "\n\t Boat Sale Amount \t\t                  - Enter a Numeric value in Boat Sale Amount";
	}
	    
	  

//alert("test");


	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "______________________________________________________________\n\n";
		msg += "Your enquiry has not been sent because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "______________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected:\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	return true;
}


function XIsFieldContainsEmail(str)
{
var em = /([a-zA-Z0-9])+([\.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(\.[a-zA-Z0-9_-]+)+/



if (em.test(str))
return true;
else 
return false;


}

                  
function IsFieldContainsPhone(str)
{
var ph = /((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}/
  


if (ph.test(str))
return true;
else 
return false;


}


function IsFieldContainsWeb(str)
{
var we = /(http:\/\/www.|https:\/\/www.|ftp:\/\/www.|www.){1}([\w]+)(.[\w]+){1,2}/; 
  


if (we.test(str))
return true;
else 
return false;


}


function Save() {
	if (Validar()){
		busyBox.Show();
	  	document.frm_boats_mant.action="boats_save.aspx";
	  	document.frm_boats_mant.submit();
		//alert('boats_save.aspx');               
	}
}

function Recall() {
	  	document.frm_boats_mant.hdn_Recall.value="1";
	  	document.frm_boats_mant.action="boats_temp.aspx";
	  	document.frm_boats_mant.submit();
	  	//alert('boats_temp.aspx');               

}

function Cancel() {
  	document.frm_boats_mant.action="boats_list.aspx";
//history.go(-1);
//  	document.frm_boats_mant.submit();
}

function LogOut() {
  	document.frm_boats_mant.action="logout.aspx";
  	document.frm_boats_mant.submit();
}


function ChangeDisplay()
{
if (document.getElementById("chk_Is_boat_sale").checked)
		 document.getElementById("divboatsale").style.visibility ="visible";
else
document.getElementById("divboatsale").style.visibility ="hidden";

	 
	  
	
}

function cuenta1(FORM1) {
var n = document.frm_boats_mant.txt_Description.value.length;
//if (n>=231)
if (n>=2000)
{

	window.event.keyCode = 0;
	alert('The field Boat Description can not contain more than 2000 characters');
	return false;
}
return true;
}

function cuenta2(FORM1) {
var n = document.frm_boats_mant.txt_requirements.value.length;
//if (n>=453)
if (n>=2000)
{
	window.event.keyCode = 0;
	alert('The field Requirements can not contain more than 2000 characters');
	return false;
}
return true;
}

function OnlyNumbers() {
	var key=window.event.keyCode;
		if ((key < 48 || key > 57) && key!=46 ){
		window.event.keyCode=0;
		alert('Type only numbers');
	}
}

</script>

<body >
<script language="javascript" src="CastleBusyBox.js"></script>
<input type="hidden" name="hdnPag" value="<%= nPag %>"/>
<input type="hidden" name="hdn_Action" value="<%= hdn_Action %>"/>
<input type="hidden" name="hdn_Recall" value=""/>
<input type="hidden" name="hdn_BoatID" value="<%= txt_BoatID %>"/>
<input type="hidden" name="txt_resultOld" value="<%= txt_resultOld %>">
<input type="hidden" name="txt_detailOld" value="<%= txt_detailOld %>">
<input type="hidden" name="txt_other1Old" value="<%= txt_other1Old %>">
<input type="hidden" name="txt_other2Old" value="<%= txt_other2Old %>">

<input type="hidden" name="txt_other3Old" value="<%= txt_other3Old %>">
<input type="hidden" name="txt_other4Old" value="<%= txt_other4Old %>">

<input type="hidden" name="txt_BoatVideoOld" value="<%= txt_BoatVideoOld %>">

	<div id="container">
		<div id="banner"></div>
		<!--div id="admin_menu">
			<span class="floatright"><a href="javascript:LogOut();">Log Out</a></span>
			<a href="boats_list.aspx">Boat</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="calendar.ASP">Calendar</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="boats_list_reservation.ASP">New Reservation</a>
		</div-->
		<div id="menu">
			<ul>
						<li ><a href="facilities_mant.aspx?MarinaID=<%= Session["MarinaID"] %>&hdn_Action=E&hdn_redirect=B">Facility Edit</a></li>
			<li><a href="users_list.aspx">Add User</a></li>
			<li id="current"><a href="boats_list.aspx">Boat List</a></li>
			<li><a href="calendar.aspx">Calendar</a></li>
			<li><a href="boats_list_reservation.aspx">New Reservation</a></li>
			<li><a href="boats_list_reports.aspx">Reports</a></li>
<%--			<li><a href="javascript:LogOut();">Log Out</a></li>--%>
			    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/logout.aspx" 
                    BackColor="#607489" Width="48px">Log Out</asp:HyperLink>
			</ul>
		</div>
		<div id="sub_menu"><h1 style="font-size:8pt">Facility Boat Listings</h1></div>
			<div id="table_div">
<%= Session["BusinessName"] %> Marina
				<table id="facility_table" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="4">
<%
    if (hdn_Action == "N")
    {
%>
						Add Boat&nbsp;&nbsp;<a href="javascript:ShowHelp(4);return false;"><img src="images/help.png" border="0" alt="Help!"></a>
<%
    }
    else
    {
%>
						Edit Boat
<%
    }
%>
						</th>
					</tr>
					<tr>
						<td class="align_right">Name<span class="hilite">*</span>&nbsp;<a href="javascript:ShowHelp(6)"><img src="images/help.png" border="0" alt="Help!"></a></td>
						<td colspan="3"><input name="txt_Name" type="text"  id="txt_Name" value="<%= txt_Name %>" tabindex="1"  maxlength="50"/></td>
					</tr>
					<tr>
					<td class="align_right">Make<span class="hilite">*</span></td>
						<td colspan="3"><input name="txt_Make" type="text"  id="txt_Make" value="<%= txt_Make %>" tabindex="2" maxlength="50"/></td>
					</tr>
					<tr>
						<td class="align_right">Model <span class="hilite">*</span></td>
						<td colspan="3"><input name="txt_Model" type="text"  id="txt_Model" value="<%= txt_Model %>" tabindex="3" maxlength="50"/></td>
					</tr>
				   
				   <tr>
						<td class="align_right">Year </td>
						<td colspan="3"><input name="txt_Year" type="text"  id="txt_Year" value="<%= txt_Year %>" tabindex="3" maxlength="50"/></td>
					</tr>
				   <tr>
                      <td class="align_right">Size <span class="hilite">*</span></td>
                      <td colspan="3"><input name="txt_size" type="text"  id="txt_size" value="<%= txt_size %>"  tabindex="4" maxlength="50" /> </td>
					</tr>
					<tr>
						<td class="align_right">Main category <span class="hilite">*</span></td>
						<td colspan="3">
							<!--input name="cbo_BodyWater" class="body_of_water"--><%
    BoatTypeName();
%>
						</td>
					</tr>
					<tr>
						<td class="align_right">Sub category<span class="hilite">*</span>&nbsp;<a href="javascript:ShowHelp(1);"><img src="images/help.png" border="0" alt="Help!"></a></td>
						<td colspan="3"><%
    SubBoatTypeName();
%>
</td>
					</tr>
					<tr>
						<td class="align_top_right">Boat Description<span class="hilite">*</span></td>
						<td colspan="3"><textarea name="txt_Description" cols="50" rows="5" wrap="hard" id="txt_Description" tabindex="7" onkeypress="javascript:cuenta1();" ><%= txt_Description %></textarea></td>
					</tr>
					<tr>
						<td class="align_right">Max Passengers <span class="hilite">*</span></td>
                    	<td colspan="3"><input name="txt_MaxPassengers" type="text" id="txt_MaxPassengers" value="<%= txt_MaxPassengers %>" tabindex="8" onkeypress="javascript:OnlyNumbers();"/></td>
					</tr>
					<tr>
						<td class="align_top_right">Requirements <span class="hilite">*</span></td>
						<td colspan="3"><textarea name="txt_requirements" cols="50" rows="5" wrap="hard"  id="txt_requirements" tabindex="9" onkeypress="javascript:cuenta2();" type="text"><%= txt_requirements %></textarea></td>
					</tr>
					<tr>
					  <td class="align_right">Reservation Deposit <span class="hilite">*</span></td>
						<td colspan="3"><input name="txt_reservation" type="text" id="txt_reservation" value="<%= txt_reservation %>" tabindex="10" maxlength="100"/></td>
					</tr>
					<tr>
						<td class="style1">Security Deposit <span class="hilite">*</span></td>
						<td colspan="3" class="style2"><input name="txt_deposit" type="text" id="txt_deposit" value="<%= txt_deposit %>" tabindex="11"  maxlength="100" /></td>
					</tr>
					<tr>
						<td class="align_right">Captain or Guide Available<span class="hilite"></span>&nbsp;<a href="javascript:ShowHelp(3)"><img src="images/help.png" border="0" alt="Help!"></a></td>
						<td colspan="3"><input  name="chk_captain" type="checkbox" value="1" <%
    if (Convert.ToInt32(chk_captain) == 1)
    {
%>
checked<%
    }
%>
 tabindex="12"  ></td>
					</tr>
					
						<tr>
						<td colspan="4">
						
						  <table align="left">
							<tr>
							<td class="align_right">
						       <img src="images/spacer.gif" width="90" height="1"> Boat is for Sale </td>
						    <td>
						
							<input  name="chk_Is_boat_sale" id="chk_Is_boat_sale" type="checkbox" value="1" <%
    if (Convert.ToInt32(chk_Is_boat_sale) == 1)
    {
%>
checked<%
    }
%>
 tabindex="13"  onclick="ChangeDisplay()" >  </td>
							<td><div id="divboatsale" style="<%
    if (chk_Is_boat_sale != "0")
    {
%>
 visibility: visible <%
    }
    else
    {
%>
 visibility: hidden <%
    }
%>
" >
							<STRONG>$</STRONG><input name="txt_boat_sale_amount" type="text" id="txt_reservation" value="<%= txt_boat_sale_amount %>" tabindex="13" maxlength="100"/></td>
					
							</tr>
							</table>
					    </td>
					    
					
					
					</tr>
					
					<tr class="separator_tr">
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr class="separator_tr">
						<td colspan="4"><div align="center">Photos to be Used&nbsp;<a href="javascript:ShowHelp(2)"><img src="images/help.png" border="0" alt="Help!"></a></div></td>
					</tr>
					<tr>
						<td colspan="4" height="8"></td>
					</tr>
					<tr>
					  <td class="align_right">&nbsp;</td>
					  <td>Name</td>
					  <td>Description</td>
					  <td>Image File</td>
				  </tr>
					<tr>
					  <td class="align_right">Result & Detail Pic</td>
					  <td><input name="txt_resultName" type="text" value="<%= txt_resultName %>" tabindex="15"/ onchange="javascript:txt_detailName.value=txt_resultName.value;"> </td>
					  <td ><input name="txt_resultDesc" type="text" value="<%= txt_resultDesc %>" tabindex="16"/ onchange="javascript:txt_detailDesc.value=txt_resultDesc.value;"> </td>
					  <td><input type="file"  name="txt_resultImage"  tabindex="17" ></td>
				  </tr>
					<tr style="display:none">
					  <td class="align_right">Detail Pic</td>
					  <td><input name="txt_detailName" type="text" value="<%= txt_detailName %>" tabindex="18"/> </td>
					  <td ><input name="txt_detailDesc" type="text" value="<%= txt_detailDesc %>" tabindex="19"/> </td>
					  <td><input type="file"  name="txt_detailImage"  tabindex="20" >
					   </td>
				  </tr>
					<tr>
					  <td class="align_right">Other Pic1</td>
					   <td><input name="txt_other1Name" type="text" value="<%= txt_other1Name %>" tabindex="21"/> </td>
					  <td ><input name="txt_other1Desc" type="text" value="<%= txt_other1Desc %>" tabindex="22"/> </td>
					  <td><input type="file"  name="txt_other1Image"  tabindex="23" ></td>
				  </tr>
					<tr>
					  <td class="align_right">Other Pic2</td>
					 <td><input name="txt_other2Name" type="text" value="<%= txt_other2Name %>" tabindex="24"/> </td>
					  <td ><input name="txt_other2Desc" type="text" value="<%= txt_other2Desc %>" tabindex="25"/> </td>
					  <td><input type="file"  name="txt_other2Image"  tabindex="26" ></td>
				  </tr>
				  
				  
				  	<tr>
					  <td class="align_right">Other Pic3</td>
					 <td><input name="txt_other3Name" type="text" value="<%= txt_other3Name %>" tabindex="24"/> </td>
					  <td ><input name="txt_other3Desc" type="text" value="<%= txt_other3Desc %>" tabindex="25"/> </td>
					  <td><input type="file"  name="txt_other3Image"  tabindex="26" ></td>
				  </tr>
				  
				  	<tr>
					  <td class="align_right">Other Pic4</td>
					 <td><input name="txt_other4Name" type="text" value="<%= txt_other4Name %>" tabindex="24"/> </td>
					  <td ><input name="txt_other4Desc" type="text" value="<%= txt_other4Desc %>" tabindex="25"/> </td>
					  <td><input type="file"  name="txt_other4Image"  tabindex="26" ></td>
				  </tr>
				   <tr>
						<td colspan="4" height="12px"></td>
					</tr>
				  <tr>
				  <td  colspan=4><div align="center"><b>Add Video to your boat Listing</b></div></td>
				  
				  
				  </tr>
				    <tr>
						<td colspan="4" height="8px"></td>
					</tr>
				   <tr>
				  <td colspan="4" height="5" align="center">Simply use the upload tool to add video to your boat 
				  listing  page. Or call us we can send you the video camera<br> that you can use. After use it should 
				  be returned. 
				  
				  </td>
				  
				  
				  </tr>
				  <tr>
						<td colspan="4" height="8"></td>
					</tr>
					<tr>
					  <td class="align_right">&nbsp;</td>
					  <td>Name</td>
					  <td>Description</td>
					  <td>Video File</td>
				  </tr>
				  <tr>
				 <td></td>
				 
					 <td><input name="txt_boatVideoName" type="text" value="<%= txt_BoatVideoName %>" /> </td>
					  <td ><input name="txt_BoatVideoDesc" type="text" value="<%= txt_BoatVideoDesc %>" /> </td>
					  <td><input type="file"  name="txt_BoatVideoImage"  / ></td>
				  
				  
				  </tr>
				  
				  

					<tr class="separator_tr">
						<td colspan="4" height="22">&nbsp;</td>
					</tr>
					<tr class="separator_tr">
						<td colspan="4"><div align="center">Pricing</div></td>
					</tr>
					<tr>
						<td colspan="4" height="5" align="center"><span class="hilite">*</span>Fill in your boat rental price in at least one of the boxes next to the Rental Time Slots that are<br>
						 available for your boat and the hours available. If you do not offer a certain Time Slot leave it blank.</td>
					</tr>
					<tr>
					<td colspan="4">
						<table align="center" border="0">
						<tr >
						  <td>&nbsp;</td>
						  <td class="align_right">&nbsp;</td>
						  <td>Week Day
						  	<iframe id="HolidayCalendar" name="HolidayCalendar" src="calendar_h.aspx?hdnBoat=<%= txt_BoatID %>&hdnMarina=<%= txt_marinaID %>" marginheight="0" marginwidth="0"   frameborder="0" scrolling="no"	height="300" width="500" style="POSITION:absolute;left:200;top:200;zIndex:999999;visibility:hidden" ></iframe>

						  </td>
						  <td>Weekend Day</td>
						  <td>
						  <input name="btnHoliday" type="button" onclick="ShowCalendar();" value="Holiday">
						 
						  
						  </td>
						 
						
						  <td>Hours From </td>
						  <td>Hours To </td>
						 
						  </tr>
						<tr >
						 <td></td>
						 <td class="align_right">Full Day</td>
						 <td><input name="txt_weekday1" type="text"  onkeypress="javascript:OnlyNumbers();" tabindex="27" value="<%= txt_weekday1 %>" size="10" />	</td>
						<td ><input name="txt_weekend1" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="28" value="<%= txt_weekend1 %>" size="10" /></td>
						<td><input name="txt_holiday1" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="29" value="<%= txt_holiday1 %>" size="10" />&nbsp;&nbsp;</td>
						
						<td>
						<input name="txt_hoursfrom1" type="text"  tabindex="29" value="<%= txt_hoursfrom1 %>" size="10" />&nbsp;&nbsp;
						</td>
						
						<td>
						<input name="txt_hoursto1" type="text"  tabindex="29" value="<%= txt_hoursto1 %>" size="10" />&nbsp;&nbsp;
						</td>
						
						</tr>
						<tr >
						 <td></td>
						 <td class="align_right">Half Day am</td>
						 <td><input name="txt_weekday2" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="30" value="<%= txt_weekday2 %>" size="10" />	</td>
						<td ><input name="txt_weekend2" type="text" onkeypress="javascript:OnlyNumbers();"  tabindex="31" value="<%= txt_weekend2 %>" size="10" /></td>
						<td><input name="txt_holiday2" type="text"  onkeypress="javascript:OnlyNumbers();" tabindex="32" value="<%= txt_holiday2 %>" size="10" /></td>
							<td>
						<input name="txt_hoursfrom2" type="text"  tabindex="32" value="<%= txt_hoursfrom2 %>" size="10" />&nbsp;&nbsp;
						</td>
						
						<td>
						<input name="txt_hoursto2" type="text"  tabindex="32" value="<%= txt_hoursto2 %>" size="10" />&nbsp;&nbsp;
						</td>
						</tr>
						
						
						<tr>
						 <td></td>
						 <td class="align_right">Half Day pm</td>
						 <td><input name="txt_weekday3" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="33"  value="<%= txt_weekday3 %>" size="10" />	</td>
						<td ><input name="txt_weekend3" type="text" onkeypress="javascript:OnlyNumbers();"  tabindex="34"  value="<%= txt_weekend3 %>" size="10" /></td>
						<td><input name="txt_holiday3" type="text"  onkeypress="javascript:OnlyNumbers();" tabindex="35" value="<%= txt_holiday3 %>" size="10" /></td>
							<td>
						<input name="txt_hoursfrom3" type="text"  tabindex="35" value="<%= txt_hoursfrom3 %>" size="10" />&nbsp;&nbsp;
						</td>
						
						<td>
						<input name="txt_hoursto3" type="text"  tabindex="35" value="<%= txt_hoursto3 %>" size="10" />&nbsp;&nbsp;
						</td>
						</tr>
						
						<tr>
						 <td></td>
						 <td class="align_right">Hourly</td>
						 <td><input name="txt_weekday4" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="36"  value="<%= txt_weekday4 %>" size="10" />	</td>
						<td ><input name="txt_weekend4" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="37" value="<%= txt_weekend4 %>" size="10" /></td>
						<td><input name="txt_holiday4" type="text" onkeypress="javascript:OnlyNumbers();" tabindex="38" value="<%= txt_holiday4 %>" size="10" /></td>
							<td>
						<input name="txt_hoursfrom4" type="text"  tabindex="38" value="<%= txt_hoursfrom4 %>" size="10" />&nbsp;&nbsp;
						</td>
						
						<td>
						<input name="txt_hoursto4" type="text"  tabindex="38" value="<%= txt_hoursto4 %>" size="10" />&nbsp;&nbsp;
						</td>
						</tr>
						</table>

					</td>

					</tr>
<%
    if (hdn_Action == "E")
    {
%>
                                        <tr>

                                         <td colspan="4"> 
                                          <table align="center">
                                           <tr><td align="center"><b>Have a Website? Drive Traffic To Your Site - Link to Us and We Will Link Back to You.</b><br>
							To Your Own Customized Boat Page Showing Your Customers ONLY Your Boats, Prices and Pictures.<br>
							Copy and Paste the Bellow URL to any Text, Button or Picture on Your Website<br>
						Questions call web tech 632-286-7817

						 </td> 
                                                  </tr>
						<tr>
						<td>
						<textarea type="text" id="urltext" name="urltext" rows="4" cols="60"  readonly>www.boatrenting.com\client\bookboat.aspx?mid=<%= txt_marinaID %>&bid=<%= txt_BoatID %>" </textarea>
						</td>
						
						</tr>
					 </table>
					
					</td>
					</tr>

<%
    }
%>

                                     

				</table>
				<div><span class="hilite">*</span>
				 <span class="hilite_explain">Required fields</span></div>
<%--				 <a href="javascript:Save();" class="button" tabindex="39" >Save</a>
				 <a href="javascript:Cancel();" class="button" tabindex="40" >Cancel</a>--%>
	
	

	            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                    BackColor="#6699CC" ForeColor="White" Height="20px" Width="60px" />
	            
                &nbsp; &nbsp; &nbsp;

	            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" 
                    BackColor="#6699CC" ForeColor="White" Height="20px" Width="60px" />
	

	  </div>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
		
		
	</div>
<iframe id="BusyBoxIFrame" name="BusyBoxIFrame" frameBorder="0" scrolling="no" ondrop="return false;">
			</iframe>
			

	
			
			<script>
			//
				// Instantiate our BusyBox object
				var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "gears_ani_", ".gif", 125, 147, 207,"BusyBox.htm");
			</script>
	
	
	
	</form>

 
</body>

</html>

