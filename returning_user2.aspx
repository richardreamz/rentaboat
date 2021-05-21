<%@ Page language="C#" CodeFile="returning_user2.aspx.cs" Inherits="BoatRenting.returning_user2_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    //, rs
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
    cmd = new Command();

    //*************
    debugTEST_Kart = Convert.ToString(Session["Kart"]);
    debugTEST_clientID = Convert.ToString(Session["clientID"]);
    //*************
    if (!String.IsNullOrEmpty(Request.QueryString["k"]))
    {
        Session["Kart"] = Request.QueryString["k"];
    }
    if (!String.IsNullOrEmpty(Request.QueryString["c"]))
    {
        Session["clientID"] = Request.QueryString["c"];
    }
    //Session.Add("Kart", Request.Form["hdn_session"]);
    //Session["Kart"] = Convert.ToString(Request.Form["hdn_session"]);
    //Set rs=Server.CreateObject("ADODB.Recordset")
    //Session["clientID"] = Request.Form["hdn_clientID"];
    
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_KART_UPDATECLIENT";
    cmd.CommandType = adCmdStoredProc;
    cmd.Parameters.Refresh();
    //cmd.Parameters[1] = Session["Kart"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_vc_sessionID", adVarChar, adParamInput, 100, 0));
    cmd.Parameters["@p_vc_sessionID"].Value = Session["Kart"];
    //'cstr(request.Form("hdn_session"))
    //cmd.Parameters[2] = Request.Form["hdn_clientID"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_clientID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_clientID"].Value = Session["clientID"]; //Session["clientID"];Request.Form["hdn_clientID"]
    //rs.Open cmd
    cmd.Execute();
    //Response.Write (" session id is " &  cstr(request.Form("hdn_session")))
    //Response.Write (" session id is " &  request.Form("hdn_clientID"))
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">

body {
	font-family: Arial, Helvetica, Verdana, sans-serif;
	background-color: white;
	text-align: left;
	color: black;
	padding: 0;
	margin: 0;
	font-size: 10pt;
	}

a:link {
	font-size: 8pt;
	color: #607489;
	border: none
	}

a:visited {
	font-size: 8pt;
	color: #607489;
	border: none
	}

a:hover {
	color: #FF9933;
	border: none
	}

.align_right {
	text-align: right;
	}

form {
	padding: 0px;
	margin: 0px;
	}

#container {
	background: red;
	margin: auto;
	width: 782px;
	/*border-width: 0px 1px 0px 1px;
	border-style: solid;
	border-color: #999;*/
	background: url(images/container_bg.gif) repeat-y;
	padding: 0px;
	margin-top: 15px;
	}

#banner {
	margin-left: 1px;
	width: 780px;
	height: 78px;
	background: url(images/banner.gif) 10px 8px no-repeat #4D8DD5; 
	z-index:-1
	}

#banner_ad
{
	position:relative;
	
	
}


#menu {
	margin-left: 1px;
	padding-left: 1px;
	width: 779px;
	height: 17px;
	background: #4D8DD5;
	overflow: hidden;
	}

#menu ul {
	margin:0;
	padding:0;
	list-style:none;
	}

#menu ul li {
	float: left;
	margin: 0px;
	padding: 0px;
	background: url(images/tab_right.gif) no-repeat top right;
	}

#menu a {
	float: left;
	padding: 0px 6px 0px 8px;
	display: block;
	font-size: 11px;
	font-weight: bold;
	line-height: 17px;
	background: url(images/tab_left.gif) no-repeat top left;
	color: #CCCCCC;
	}

/* Commented Backslash Hack hides rule from IE5-Mac \*/
#menu a {float:none;}
/* End IE5-Mac hack */

#menu a:hover {
	color: white;
	}

#menu #current {
	background: url(images/tab_current_right.gif) no-repeat top right;
	}

#menu #current a{
	background: url(images/tab_current_left.gif) no-repeat top left;
	color: #666;
	text-decoration: none;
	}

#menu #current a:hover{
	color: #333;
	}

#main_boat_picture {
	margin-top: 7px;
	float: left;
	margin-left: 10px;
	width: 350px;
	height:254px;
	background: url(images/boat_home.jpg) no-repeat;
	}

#search_field {
	margin-top: 7px;
	margin-left: 388px;
	width: auto;
	margin-right: 8px;
	height: 252px;
	background: #EFEBE0;
	border-style: solid;
	border-width: 1px 1px 1px 1px;
	border-color: #ccc;
	
	}

#search_field form {
	padding: 0px;
	margin: 0px;
	}



#footer {
	padding-top: 28px;
	line-height: 10px;
	height: 12px;
	clear: both;
	margin-left: 1px;
	width: 780px;
	background: url(images/footer_bg.gif) repeat-x;
	}

#footer_details {
	padding-left: 8px;
	font-size: 7pt;
	color: white;
	height: 10px;
	line-height: 8px;
	}

#footer_details a{
	font-size: 8pt;
	color: #ccc;
	text-decoration: none;
	}

#footer_details a:hover {
	font-size: 8pt;
	color: white;
	font-weight: normal;
	}

#login {
	margin-top: 7px;
	font-weight: bold;
	color: #666;
	width: auto;
	padding-left: 15px;
	padding-right: 15px;
	font-size: 10pt;
	height: 15px;
	line-height: 12px;
	vertical-align: middle;
	}

#login .question {
	padding-top: 2px;
	height: 20px;
	margin-top: 27px;
	width: auto;
	line-height: 23px;
	}

#login .question a:link, #login .question a:visited {
	font-size: 7pt;
	}

#login a.button {
	margin-top: 10px;
	display: block;
	height: 12px;
	font-size: 8pt;
	color: white;
	background-color: #FF9933;
	padding: 2px 4px 2px 4px;
	width: 66px;
	text-align: center;
	margin-left: 144px;
	text-decoration: none;
	}

#login a:hover{
	text-decoration: underline;
	}

#login h1{
	padding-left: 12px;
	background: url(images/login_icon.gif) top left no-repeat;
	font-size: 10pt;
	font-weight: bold;
	margin-bottom: 5px;
	}

.align_right {
	text-align: right;
	}

.login_table {
	margin-top: 20px;
	width: 100%;
	vertical-align: middle;
	margin-bottom: 0px;
	}

.login_table td {
	padding-left: 5px;
	}

.login_table td.align_right {
	text-align: right;
	font-size: 7pt;
	width: 120px;
	}

.login_username {
	width: 140px;
	}

.login_password {
	width: 140px;
	}

#search {
	margin-top: 7px;
	font-weight: bold;
	color: #666;
	width: 200px;
	padding-left: 15px;
	font-size: 10pt;
	height: 15px;
	line-height: 12px;
	position:absolute;
	}

#search h1{
	padding-left: 12px;
	background: url(images/search_icon.gif) top left no-repeat;
	font-size: 10pt;
	font-weight: bold;
	margin-bottom: 5px;
	}

#search .button {
	margin-top: 3px;
	float: left;
	display: block;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	color: white;
	background-color: #FF9933;
	padding: 2px 4px 2px 4px;
	width: 66px;
	text-align: center;
	margin-left: 5px;
	text-decoration: none;
	
	}

#search a:hover{
	text-decoration: underline;
	}
	

.bold {
	font-weight: bold;
	}

.formtextsm {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	color: #555555;
	text-decoration: none
	}

.water {
	height: 20px;
	width: 130px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	font-style: normal;
	font-weight: normal;
	color: #555555;
	text-decoration: none;
	margin-top: 0px;
	margin-bottom: 0px;
	}

.state1 {
	height: 20px;
	width: 120px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	font-style: normal;
	font-weight: normal;
	color: #555555;
	text-decoration: none;
	margin-top: 0px;
	margin-bottom: 0px;
	}

.city1 {
	height: 13px;
	width: 114px;
	font-family: Arial, sans-serif;
	font-size: 8pt;
	font-weight: normal;
	padding: 1px;
	}

.zip1 {
	font-family: Arial, sans-serif;
	font-size: 8pt;
	height: 13px;
	width: 45px;
	font-weight: normal;
	padding: 1px;
	}

#hireacaptain {
	display: inline;
	height: 15px;
	margin-top: 7px;
	margin-left: 8px;
	width: 100px;
	float: left;
	}

#hireacaptain a {
	margin-left: 5px;
	color: #607489;
	font-weight: bold;
	}

#hireacaptain a:hover {
	color: #FF9933;
	font-weight: bold;
	}

#sponsored_packages .button {
	margin-top: 3px;
	display: block;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	color: white;
	background-color: #FF9933;
	padding: 3px 4px 3px 4px;
	width: 150px;
	text-align: center;
	margin-left: 324px;
	text-decoration: none;
	}

#sponsored_packages a{
	font-weight: bold;
	}

#sponsored_packages a:hover{
	text-decoration: underline;
	}

#sponsored_packages .localrates {
	font-size: 9pt;
	margin-top: 5px;
	float: left;
	display: inline;
	margin-left: 4px;
	font-weight: normal;
	}

a:hover.localrates {
	color: #68A700;
	}


#results {
	margin-top: 7px;
	width: auto;
	margin-left: 1px;
	margin-right: 1px;
	padding-left: 7px;
	padding-right: 7px;
	}

#results a{
	color: #FF9933;
	}

.results_table {
	width: 100%;
	padding: 0px;
	/*border: 1px solid #CDCDCD;*/
	/*background: #E2EAF3;*/
	margin: 0;
	line-height: 15px;
	}

table.results_table th{
	/*border-left: 1px solid #607489;*/
	text-align: left;
	padding-left: 5px;
	color: #607489;
	}

table.results_table td{
	/*border-right: 1px dashed #607489;*/
	text-align: left;
	padding-right: 5px;
	padding: 5px 5px 5px 10px;
	}

table.results_table2 {
	border-width: 0px 0px 0px 0px;
	width: 100%;
	border-style: solid;
	border-color: white;
	}
	
table.results_table2 td{
	border-right: 0px dashed #607489;
	text-align: left;
	padding: 0px 0px 0px 0px;
	}

.next {
	margin-left: 650px;
	font-weight: bold;
	margin-top: 3px;
	display: block;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	color: white;
	padding: 2px 0px 2px 0px;
	width: 80px;
	text-align: center;
	text-decoration: none;
	}

a.next {
	color: white;
	}

a:hover.next{
	text-decoration: underline;
	}

.prev {
	float: left;
	margin-left: 550px;
	font-weight: bold;
	margin-top: 3px;
	display: inline;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	color: white;
	padding: 2px 0px 2px 0px;
	width: 80px;
	text-align: center;
	text-decoration: none;
	}
a.prev {
	color: white;
	}

a:hover.prev{
	text-decoration: underline;
	}


.explanation {
	float: right;
	width: 170px;
	padding: 0px;
	padding-top: 20px;
	margin-right: 10px;
	display: inline;
	}

.exp_title {
	margin-top: 10px;
	text-align: left;
	margin-bottom: 30px;
	color: #114974;
	font-weight: bold;
	font-size: 12pt;
	}

.calendar_boatdetails {
	margin-left: 8px;
	width: 763px;
	border: 1px solid #CCCCCC;
	clear: both;
	padding-top: 20px;
	}

.boatdetails_table {
	width: 382px;
	}

.boatdetails_table th {
	padding-left: 3px;
	color: #495E70;
	border-bottom: 1px solid #D0E4FD;
	}

.boatdetails_table td {
	background-color: #F2F5F7;
	border-bottom: 1px solid white;
	font-size: 9pt;
	}

.boatdetails_table .boatdetails {
	width: 373px;
	}

.boatcat_title {
	padding-left: 7px;
	font-weight: bold;
	width: 113px;
	}

.boatcat_detail {
	padding-left: 7px;
	width: 246px;
	text-align: center;
	}

.rentdetails {
	padding-left: 7px;
	width: 263px;
	text-align: center;
	}

.booking_table {
	margin-left: 15px;
	}

.booking_table td {
	padding-left: 10px;
	}



#no_refund {
	font-size: 8pt;
	margin-left: 550px;
	height: 15px;
	line-height: 17px;
	width: 190px;
	}

.boarder {
	border: solid;
	border-width: 1px;
	border-color: white;
	}

#calendar_tables {
	margin-top: 5px;
	padding:0px;
	}

#boat_specs {
	margin-top: 20px;
	padding: 0px;
	width: 96%;
	}

#boat_specs td{
	background-color: #E6F1FC;
	border: 1px solid white;
	padding-left: 5px;
	padding-bottom: 1px;
	}

#boat_photo_details {
	width: 262px;
	text-align: left;
	padding-left: 7px;
	}

#boat_details td{
	padding-left: 18px;
	width: 100%;
	margin: 0;
	}

#boat_details th{
	padding-left: 18px;
	width: 100%;
	margin: 0;
	color: #496379;
	}

#pay_details {
	width: 782px;
	clear: both;
	}

#pay_details th {
	padding-left: 8px;
	padding-right: 8px;
	}

#pay_details td {
	padding-left: 8px;
	padding-right: 8px;
	}

#book_categories {
	width: 205px;
	text-align: left;
	padding-left: 7px;
	margin-top: 0px;
	vertical-align: top;
	}

#book_categories a.button {
	padding-top: 3px;
	padding-bottom: 3px;
	width: 100%;
	}

.reservation_type {
	width: 200px;
	}

.number_days {
	}

.boat_quantity {
	}

.quantity_cell {
	width: 50px;
	text-align: left;
	}

.number_days_cell {
	width: 110px;
	text-align: left;
	}

.book_categories_table {
	background-color: #E6F1FC;
	
	}

.book_boat_details {
	border: 1px solid #CCCCCC;
	width: 100%;
	}

.book_button_cell {
	background-color: white;
	}

.select_month {
	background-color: #E9EDF1;
	}



#new_users {
	margin-top: 7px;
	float: left;
	margin-left: 8px;
	width: 300px;
	border: 1px solid #CCCCCC;
	display: inline;
	padding-bottom: 7px;
	}

#returning_customers {
	margin-top: 7px;
	margin-left: 316px;
	margin-right: 8px;
	width: auto;
	border: 1px solid #CCCCCC;
	padding-bottom: 7px;
	}

.users_title {
	clear: none;
	width: 100%-1px;
	background-color: #E9EDF1;
	padding-top: 10px;
	padding-bottom: 10px;
	text-indent: 10px;
	font-size: 10pt;
	font-weight: bold;
	color: #333;
	}

#new_users_explanation {
	width: 290px;
	text-align: center;
	margin-top: 10px;
	padding-top: 0px;
	height: 70px;
	}

#new_users a.button {
	margin-left: 170px;
	width: 100px;
	text-decoration: none;
	color: white;
	display: block;
	background-color: #FF9933;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	}

#new_users a.button:hover {
	text-decoration: underline;
	}

#returning_customers input {
	width: 120px;
	}

#returning_customers form {
	margin-left: 60px;
	text-align: right;
	margin-right: 130px;
	margin-top: 0px;
	margin-bottom: 0px;
	}

.floatleft {
	float: left;
	}

#returning_customers a.button {
	margin-left: 324px;
	width: 100px;
	text-decoration: none;
	color: white;
	display: block;
	background-color: #FF9933;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	}

#returning_customers a.button:hover {
	text-decoration: underline;
	}

#returning_customers_forms {
	margin-top: 10px;
	height: 70px;
	text-align: center;
	}




#new_user_creation {
	padding-left: 8px;
	padding-right: 8px;
	width: 766px;
	margin-top: 7px;
	}

#new_user_table {
	margin-left: 0px;
	width: 760px;
	text-align: left;
	margin: 0px;
	background-color: #E9EDF1;
	border-bottom: 10px solid #E9EDF1;
	}
	
#new_user_table th {
	font-size: 12pt;
	color: #607489;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	
	}

#new_user_table td {
	padding-top: 0px;
	padding-bottom: 0px;
	}

#new_user_table .align_right {
	text-align: right;
	width: 179px;
	}

.form_firstname {
	width: 150px;
	}

.form_lastname {
	width: 150px;
	}

.form_email {
	width: 150px;
	}

.form_address {
	width: 310px;
	}

.form_city {
	width: 150px;
	}

.form_zipcode {
	width: 40px;
	}

.form_phone {
	width: 90px;
	}

.form_state {
	width: 45px;
	}

#payment_info_table {
	margin-top: 10px;
	width: 760px;
	font-weight: normal;
	background: #E9EDF1;
	margin-bottom: 0px;
	border-bottom: 10px solid #E9EDF1;
	}
	
#payment_info_table th{
	font-size: 12pt;
	color: #607489;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	
	}



.new_user_category_column {
	text-align: right;
	width: 179px;
	}

#new_user_creation a.button {
	margin-top: 10px;
	width: 100px;
	text-decoration: none;
	color: white;
	display: inline;
	background-color: #FF9933;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	float: left;
	margin-right: 10px;
	}

#new_user_creation a.button:hover {
	text-decoration: underline;
	}

/* ****FORGOTTEN PASSWORD**** */

#forgotten_password {
	width: 500px;
	margin-top: 20px;
	text-align: center;
	padding-bottom: 10px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #CCCCCC;
	}

#forgotten_password_title {
	width: 100%;
	clear: none;
	background-color: #E9EDF1;
	padding-top: 10px;
	padding-bottom: 10px;
	text-indent: 10px;
	font-size: 10pt;
	font-weight: bold;
	color: #333;
	}

#forgotten_password_form {
	width: 100%;
	height: 20px;
	margin-top: 10px;
	margin-bottom: 20px;
	}

#forgotten_password a.button {
	width: 100px;
	text-decoration: none;
	color: white;
	display: block;
	background-color: #FF9933;
	padding-top: 1px;
	padding-bottom: 1px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	margin: auto;
	margin-bottom: 10px;}

#forgotten_password a.button:hover {
	text-decoration: underline;
	}



#welcome_back {
	margin-top: 7px;
	margin-left: 8px;
	margin-right: 8px;
	width: auto;
	background-color: #E9EDF1;
	border: 1px solid #ccc;
	padding: 7px;
	}

#welcome_back h1 {
	font-size: 12pt;
	font-weight: bold;
	margin-top: 2px;
	margin-bottom: 15px;
	color: #495E70;
	}

#order_summary h1 {
	font-size: 12pt;
	font-weight: bold;
	margin-top: 2px;
	margin-bottom: 15px;
	color: #495E70;
	}

#order_summary {
	margin-top: 7px;
	margin-left: 8px;
	margin-right: 8px;
	width: auto;
	background-color: #E9EDF1;
	border: 1px solid #ccc;
	padding: 7px;
	}

#order_summary table{
	border-width: 1px 0px 0px 1px;
	border-style: solid;
	border-color: #607489;
	width: 100%;
	}

#order_summary table td{
	border-style: solid;
	border-width: 0px 1px 1px 0px;
	border-color: #607489;
	padding-left: 5px;
	padding-top:5px;
	padding-bottom: 5px;
	padding-right: 5px;
	text-align: center;
	background-color: white;
	}

#order_summary table th {
	color: white;
	background-color: #607489;
	text-align: center;
	border-bottom: 1px solid #607489;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	}

#returning_customers_summary a.button {
	float: left;
	width: 100px;
	text-decoration: none;
	color: white;
	display: block;
	background-color: #FF9933;
	padding-top: 1px;
	padding-bottom: 1px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	margin-left: 20px;
	margin-top: 7px;
	}

#returning_customers_summary a.button:hover {
	text-decoration: underline;
	}

#returning_user_payment_info {
	margin-top: 7px;
	margin-left: 8px;
	margin-right: 8px;
	width: auto;
	background-color: #E9EDF1;
	border: 1px solid #ccc;
	padding: 7px;
	}

#returning_user_payment_info h1 {
	font-size: 12pt;
	font-weight: bold;
	margin-top: 2px;
	margin-bottom: 15px;
	color: #495E70;
	}

#returning_user_payment_info table {
	width: 100%;
	}

#returning_user_payment_info table td{
	padding-right: 10px;
	padding-left: 10px;
	}

#returning_customers_payment a.button{
	float: left;
	width: 100px;
	text-decoration: none;
	color: white;
	display: block;
	background-color: #FF9933;
	padding-top: 1px;
	padding-bottom: 1px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	margin-left: 20px;
	margin-top: 7px;
	}

#returning_customers_payment a.button:hover {
	text-decoration: underline;
	}

#final_cost {
	margin-top: 15px;
	font-weight: bold;
	margin-left: 15px;
	margin-right: 15px;
	width: auto;
	text-align: right;
	padding-right: 280px;
	}

#order_thank_you {
	margin-top: 7px;
	margin-left: 8px;
	margin-right: 8px;
	width: auto;
	background-color: #E9EDF1;
	border: 1px solid #ccc;
	padding: 7px;
	}

#order_thank_you h1 {
	font-size: 12pt;
	font-weight: bold;
	margin-top: 2px;
	margin-bottom: 15px;
	color: #495E70;
	}

#sub_menu {
	margin-left: 1px;
	width: 720px;
	text-align: left;
	margin-top: 1px;
	padding-left: 30px;
	padding-right: 30px;
	color: #666;
	height: 20px;
	line-height: 8px;
	
	}
	
	
	#sub_menu ul {
	margin:0;
	padding:0;
	list-style:none;
	color: #666;
	}

#sub_menu ul li {
	float: left;
	margin: 0px;
	padding: 0px;
	color: #666;
	background: url(images/sub_menu_bg.gif) no-repeat top right;
	}




#rentwithus_smallbox {
	margin-top: 7px;
	font-weight: bold;
	color: #666;
	padding-left: 15px;
	font-size: 10pt;
	line-height: 12px;
	width: auto;
	}

#rentwithus_smallbox .button {
	margin-top: 8px;
	float: left;
	display: block;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	color: white;
	background-color: #FF9933;
	padding: 2px 8px 2px 8px;
	/*width: 66px;*/
	text-align: center;
	margin-left: 5px;
	text-decoration: none;
	}

#rentwithus_smallbox a.button:hover {
	text-decoration: underline;
	}


#rentwithus_smallbox h1{
	background: url(images/contactus_icon.gif) top left no-repeat;
	padding-left: 20px;
	font-size: 10pt;
	font-weight: bold;
	margin-bottom: 5px;
	}

#rentwithus_smallbox h2{
	padding-left: 10px;
	font-size: 10pt;
	font-weight: bold;
	/*margin-bottom: 5px;*/
	color: #FF9933;
	margin-top: 10px;
	margin-bottom: 10px;
	}

#rentwithus_smallbox p {
	margin-top: 0px;
	padding: 0px;
	margin: 0px;
	}

#rentwithus_main {
	margin-left: 8px;
	margin-right: 8px;
	width: auto;
	margin-top: 7px;
	padding-left: 7px;
	padding-right: 7px;
	}

#rentwithus_main h1{
	margin-top: 0px;
	padding: 0;
	color: #495E70;
	font-size: 12pt;
	margin-bottom: 5px;
	}

#rentwithus_main h2{
	margin-top: 1px;
	padding: 0;
	color: #F93;
	font-size: 10pt;
	margin-bottom: 0px;
	}

#contactus_main {
	margin-left: 8px;
	margin-right: 8px;
	width: auto;
	margin-top: 7px;
	padding-left: 7px;
	padding-right: 7px;
	text-align: center;
	}

#contactus_main h1{
	margin-top: 0px;
	padding: 0;
	color: #495E70;
	font-size: 12pt;
	margin-bottom: 5px;
	}

#contactus_main h2{
	margin-top: 1px;
	padding: 0;
	color: #F93;
	font-size: 10pt;
	margin-bottom: 0px;
	}

.large {
	font-size: 14pt;
	}

.underline {
	text-decoration: underline;
	}

#facility_table {

	background-color: #E9EDF1;
	
	width: 100%;
	}

#facility_table td{
	font-size: 7.5pt;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 0px;
	padding-bottom: 0px;
	}

#facility_table input, #facility_table select {
	font-size: 8pt;
	}


.separator_tr {
	height: 15px;
	}

.align_top_right {
	vertical-align: top;
	text-align: right;
	}

#facility_table th {
	font-size: 12pt;
	color: #607489;
	font-weight: bold;
	padding-left: 10px;
	padding-top: 0px;
	padding-bottom: 0px;
	}

.align_right {
	text-align: right;
	}

.hilite {
	color: #FF9933;
	font-size: 1.5em;
	}

#table_div {
	width:766;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 7px;
	}

.buttonMenu {
	margin-top: 3px;
	float: left;
	display: block;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	color: white;
	background-color: #FF9933;
	padding: 2px 4px 2px 4px;
	width: 66px;
	text-align: center;
	margin-left: 5px;
	text-decoration: none;
	}

.buttonMenu-Sign {
	margin-top: 3px;
	float: left;
	display: block;
	height: 10px;
	line-height: 10px;
	font-size: 10px;
	color: white;
	background-color: #FF9933;
	padding: 2px 4px 2px 4px;
	width: 90px;
	text-align: center;
	margin-left: 5px;
	text-decoration: none;
	}

.buttonMenu-Sign1 {
	margin-top: 3px;
	height: 10px;
	line-height: 10px;
	font-size: 8pt;
	font-weight: bold;
	background-color: #FF9933;
	padding: 2px 4px 2px 4px;
	width: 90px;
	text-align: center;
	text-decoration:none;
	}

.buttonMenu:hover{
	text-decoration: underline;
	}

#results .results_table3 {
	width: 100%;
	padding: 0px;
	
	margin: 0;
	line-height: 15px;
	}

#results table.results_table3 th{
	
	text-align: center;
	padding-left: 5px;
	font-weight: bold;
	
	color:#666;

	background: url(images/results_table3_th_bg.gif) bottom left repeat-x;
	padding-bottom: 4px;
	}

#results table.results_table3 th a:link, #results table.results_table3 th a:visited {
	text-decoration: underline;
	color: #3399ff;
	}

#results table.results_table3 th a:hover {
	color: #ff9933;
	}

#results table.results_table3 td {
	font-size: 0.9em;
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
	border: none;
	width: 96px;
	}

#results table.results_table3 td.imagecell {
	width: 80px;
	height: 50px;
	padding-left: 5px;
	padding-right: 5px;
	}
	
#results table.results_table3 td.cell {
	text-align:left;
	padding-left: 10px;
	width: 190px;
	}

#results table.results_table3 td.moreinfo {
	text-align:right;
	padding-left: 10px;
	width: 300px;
	}
	
#results table.results_table3 tr.celda {	
	background: url(images/results_table3_th_bg.gif) bottom left repeat-x;
	background-color:#FFFFCC;
	}
	
#results table.results_table3 tr.normal {
	background: url(images/results_table3_th_bg.gif) bottom left repeat-x;
	}
	
.separador-celda{
background-image: url(images/separador.gif'); 
background-repeat: no-repeat; 
background-position-y: top;
}


</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>
<body>
<form name="frm_newuser" method="post">
<input type="hidden" name="hdn_clientID" value="<%= Request.Form["hdn_clientID"] %>">
<input type="hidden" name="hdn_session" value="<%= Convert.ToString(Request.Form["hdn_session"]) %>">
<input type="hidden" name="cmb_boat">
<input type="hidden" name="cmb_country">
<input type="hidden" name="cmb_body">
<input type="hidden" name="cmb_facility">
<input type="hidden" name="cmb_state">
<input type="hidden" name="cmb_zip">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
<%--				<li id="current"><a href="http://www.boatrenting.com/default.aspx">Home</a></li>
--%>				<li><a href="javascript:QuickSearch(3)">Boating Clubs</a></li>
				<li><a href="javascript:QuickSearch(12)">Cabin</a></li>
				<li><a href="javascript:QuickSearch(8)">Charters</a></li>
				<li><a href="javascript:QuickSearch(10)">Dinner</a></li>
				<li><a href="javascript:QuickSearch(9)">Excursions</a></li>
				<li><a href="javascript:QuickSearch(1)">Fishing</a></li>
				<li><a href="javascript:QuickSearch(7)">Jet Ski</a></li>
				<li><a href="javascript:QuickSearch(4)">Paddle</a></li>
				<li><a href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li><a href="javascript:QuickSearch(2)">Sailing</a></li>
				<li><a href="javascript:QuickSearch(6)">Speed</a></li>
				<li><a href="javascript:QuickSearch(5)">Yachts</a></li>
			</ul>
		</div>
		<div id="sub_menu"></div>
		<div id="returning_customers_payment">
			<div id="order_summary">
				<h1>Order Summary:</h1>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				This online fee will be deducted off the rental price
				<table cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="2">Boat Description</th>
						<th>Type of Rental</th>
						<th>Occupied Days</th>
						<th>Online Fee</th>
					</tr>
<%
    cmd3 = new Command();
    rs3 = new Recordset();
    cmd3.ActiveConnection = oConn;
    cmd3.CommandText = "SP_BR_KART_LIST";
    cmd3.CommandType = adCmdStoredProc;
    //cmd3.Parameters[1] = Convert.ToString(Request.Form["hdn_session"]);
    cmd3.Parameters.Append(cmd.CreateParameter("@p_vc_sessionID", adVarChar, adParamInput, 100, 0));
    cmd3.Parameters["@p_vc_sessionID"].Value = Session["Kart"]; //Session["Kart"];Convert.ToString(Request.Form["hdn_session"]);
    //'session("Kart")
    rs3.Open(cmd3);
    if (rs3.Eof)
    {
        flgData = "0";
%>
						<tr>
							<td colspan="5" align="center">There are no Boats in your Shopping kart</td>
						</tr>
<%
    }
    else
    {
        flgData = "1";
        Cont = 0;
        while(!(rs3.Eof))
        {
            Cont = Cont + 1;
%>
					<tr>
						<td width="90"><img src="boats/<%= rs3.Fields["vc_filename"].Value %>" alt="<%= rs3.Fields["IDescrip"].Value %>" width="80" height="50"></td>
						<td width="280">
<%= rs3.Fields["vc_name"].Value %>:&nbsp;<%= rs3.Fields["vc_make"].Value %>&nbsp;<%= rs3.Fields["vc_model"].Value %><br>
						Length:&nbsp;<%= rs3.Fields["vc_size"].Value %>&nbsp;-&nbsp;Passengers:&nbsp;<%= rs3.Fields["in_maxPassengers"].Value %><br>
						Description:&nbsp;<%= rs3.Fields["Bdescrip"].Value %><br>
						Location:&nbsp;<%= rs3.Fields["CountryName"].Value %>&nbsp;-&nbsp;<%= rs3.Fields["StateName"].Value %>&nbsp;-&nbsp;<%= rs3.Fields["vc_city"].Value %><br>
<%= rs3.Fields["vc_bodywater"].Value %>
						</td>
						<td width="140"><%= rs3.Fields["Tdescrip"].Value %><%
            if (!(Convert.ToString(rs3.Fields["BEHour"].Value) == ""))
            {
%>
<br><%= rs3.Fields["BEHour"].Value %><%
            }
%>
</td>
						<td width="160">From: <%= rs3.Fields["Begindate"].Value %><br>
							To: <%= rs3.Fields["Enddate"].Value %></td>
						<td  width="80">
<%
            if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
            {
%>
								Price $<%= Strings.FormatNumber(rs3.Fields["nu_Price"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
                broker_fee = (Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0));
%>

								<br>
								Broker Fee $<%= Strings.FormatNumber(broker_fee, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
							      <br>
								Due at Facility $<%= Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)) - broker_fee, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
            }
            else
            {
%>
								$<%= Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
            }
%>

						</td>
					</tr>
<%
            rs3.MoveNext();
        }
        rs3.Close();
        rs3 = null;
    }
%>
				</table>
			</div>

			<div id="returning_user_payment_info">
						<h1>Payment Information</h1>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="16%">Payment Type:</td>
						<td width="23%"><select name="cmb_type" id="cmb_type" style="width:152px">
							<option selected value="-1">Please Select</option>
							<option value="1">Master Card</option>
							<option value="2">Visa</option>
							<option value="3">American Express</option>
							<option value="4">Discover</option>
							</select>
						</td>
						<td width="61%"></td>
					</tr>
					<tr>
						<td>Number:</td>
						<td><input type="text" name="txt_number" id="txt_number" class="form_number" style="width:146px"/></td>
						<td>No spaces or dashes. Credit Card number.
					</tr>
					<tr>
						<td>Expiration Date:</td>
						<td><select name="cmb_month" id="cmb_month">
								<option selected value="-1">Month</option>
								<option value="01">January</option>
								<option value="02">February</option>
								<option value="03">March</option>
								<option value="04">April</option>
								<option value="05">May</option>
								<option value="06">June</option>
								<option value="07">July</option>
								<option value="08">August</option>
								<option value="09">September</option>
								<option value="10">October</option>
								<option value="11">November</option>
								<option value="12">December</option>
							</select>
							<select name="cmb_year" id="cmb_year">
								<option selected value="-1">Year</option>
<%
    for(imonth = DateTime.Now.Year; imonth <= DateTime.Now.Year + 10; imonth += 1)
    {
%>
									<option value="<%= (Convert.ToString(imonth)).Substring((Convert.ToString(imonth)).Length - 2) %>"><%= imonth %></option>
<%
    }
%>
							</select>
							</td>
					    <td>Credit Card expiration date.</td>
					</tr>
					<tr>
						<td>CID #:</td>
						<td><input type="text" name="txt_cid" id="txt_cid" class="form_cid_number" maxlength="4" style="width:146px"/>
						<td>3-digit number on back of card. Credit Card Customer ID number or for American Express Card 4-digits on front. </td>
					</tr>
				</table>
			</div>
			<a href="javascript:goBack()" class="button">&laquo; Go Back</a>
			<a href="javascript:Purchase()" class="button">Continue &raquo;</a>
		</div>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com � 320 South Country Road � Brookhaven/Bellport
				NY 11719 � 888-610-2628 � <a href="mailto:info@boatrenting.com">
				info@boatrenting.com</a>&nbsp; Web Design by
                <a href="http://www.boatrenting.com/contactus.aspx">
                Hilderbrandt Industries</a> &nbsp /&nbsp </div>

		</div>
	</div> <!-- Container Ends Here -->
</form>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-872206-1";
urchinTracker();
</script>

</body>
<script language="JavaScript">
function goBack(){
window.history.back();
}

function Validar () {
    var chk=false;

	//Initialise variables
	var errorMsg = "";



	if (document.forms[0].cmb_type.options[document.forms[0].cmb_type.selectedIndex].value == "-1"){
		errorMsg += "\n\t Payment Type \t\t- Select your payment type";
	}

	if (document.forms[0].txt_number.value == ""){
		errorMsg += "\n\t Number \t\t	- Enter your Credit Card number";
	}


	if (document.forms[0].cmb_month.options[document.forms[0].cmb_month.selectedIndex].value == "-1"){
		errorMsg += "\n\t Exp. Date \t\t- Select your Credit Card expiration month";
	}

	if (document.forms[0].cmb_year.options[document.forms[0].cmb_year.selectedIndex].value == "-1"){
		errorMsg += "\n\t Exp. Date \t\t- Select your Credit Card expiration year";
	}

	if (document.forms[0].txt_cid.value == ""){
		errorMsg += "\n\t CID# \t\t	- Enter your Credit Card ID number";
	}
	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		//msg = "______________________________________________________________\n\n";
		msg = "Your enquiry has not been sent because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		//msg += "______________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected:\n";

            errorMsg= msg + errorMsg;

		alert(errorMsg);
		return false;
	}
	return true;
}

function Purchase(){
	if (Validar()){
	    document.frm_newuser.action = "https://boatrenting.com/purchase_boat.aspx"; //PRODUCTION
//	    document.frm_newuser.action = "http://localhost:50331/client.net/purchase_boat.aspx";  //TEST ONLY
	  	document.frm_newuser.submit();
	}
}

function QuickSearch(x){
	document.frm_newuser.cmb_boat.value = x;
	document.frm_newuser.cmb_country.value = 0;
	document.frm_newuser.cmb_body.value = 0;
	document.frm_newuser.cmb_facility.value = 0;
	document.frm_newuser.cmb_state.value = 0;
	document.frm_newuser.cmb_zip.value = 0;
	document.frm_newuser.action = "http://www.boatrenting.com/results.aspx";
	document.frm_newuser.submit();
}
function Contact(){
	document.frm_newuser.action = "http://www.boatrenting.com/contactus.aspx";
	document.frm_newuser.submit();
}
</script>


</html>
