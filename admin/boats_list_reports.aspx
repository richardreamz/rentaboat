<%@ Page language="C#" CodeFile="boats_list_reports.aspx.cs" Inherits="BoatRenting.boats_list_reports_aspx_cs" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html >
   
<html xmlns="http://www.w3.org/1999/xhtml"><%
    if (Request["hdnPag"] == null)
    {
        nPag = 1;
    }
    else
    {
        nPag = Convert.ToInt32(Request["hdnPag"]);
    }
    nRegistros = 20;
    multiple = Request["multiple"];
    cbo_BoatFacility = Request["cbo_BoatFacility"];
    TxtEndDate = Request.Form["TxtEndDate"];
    TxtStartDate = Request["TxtStartDate"];
    TxtEndDate1 = Request["TxtEndDate1"];
    cbo_Week = Request["cbo_Week"];
    cbo_Monthly = Request["cbo_Monthly"];
%>
<head>
<title>Welcome to BoatRenting.com!</title>
<%--<style type="text/css" media="screen">import "br_admin.css"</style>
<style type="text/css" media="screen">@import "br_admin.css";</style>--%>
<link rel="stylesheet" href="calendar/cal_RedCell.css" type="text/css" />



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
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
 
    
    
    <script>
      $(function () {
          $("#datepicker").datepicker();
      });
      $("#ImageButton1").click(function () {
                  $("#datepicker").datepicker('show');
      });
        $(function () {
            $("#datepicker0").datepicker();
        });
        $("#ImageButton1").click(function () {
            $("#datepicker0").datepicker('show');
        });
        $(function () {
            $("#datepicker1").datepicker();
        });
        $("#ImageButton1").click(function () {
            $("#datepicker1").datepicker('show');
        });


  </script>
</head>

<script type="text/javascript">
function Previous() {
	document.frmBR.hdnPag.value=eval(document.frmBR.hdnPag.value)-1;
  	document.frmBR.action="boats_list_reports.aspx";
  	document.frmBR.submit();
}
function Next() {
	document.frmBR.hdnPag.value=eval(document.frmBR.hdnPag.value)+1;
  	document.frmBR.action="boats_list_reports.aspx";
  	document.frmBR.submit();
}
function Search() {
	document.frmBR.hdnPag.value="";
	var i 
    for (i=0;i<document.frmBR.multiple.length;i++){ 
       if (document.frmBR.multiple[i].checked) 
          break; 
    } 
	if ((document.frmBR.multiple[i].value)==1){
		if (Validar1()){
		document.frmBR.action="boats_list_reports.aspx";
  		document.frmBR.submit();
		}
	}
	if ((document.frmBR.multiple[i].value)==2){
		if (Validar2()){
		document.frmBR.action="boats_list_reports.aspx";
  		document.frmBR.submit();
		}
	}
	if ((document.frmBR.multiple[i].value)==3){
		if (Validar3()){
		document.frmBR.action="boats_list_reports.aspx";
  		document.frmBR.submit();
		}
	}
  
}
function Validar1 () {
    var chk=false;
	//Initialise variables
	var errorMsg = "";
	//Check for a Name
	//if (document.getElementById("cbo_BoatFacility").value == "0"){
		//errorMsg += "\n\tBoat  \t                - Enter your Boat";
	//}
	if (document.getElementById("TxtEndDate").value == ""){
		errorMsg += "\n\tDaily  \t                - Enter your Daily";
	}
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
function Validar2() {
    var chk=false;
	//Initialise variables
	var errorMsg = "";
	//Check for a Name
	//if (document.getElementById("cbo_BoatFacility").value == "0"){
		//errorMsg += "\n\tBoat  \t                - Enter your Boat";
	//}
	if (document.getElementById("TxtStartDate2").value == ""){
		errorMsg += "\n\tFrom  \t                - Enter your From";
	}
		if (document.getElementById("TxtEndDate3").value == ""){
		errorMsg += "\n\tTo  \t                - Enter your To";
	}

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
function Validar3() {
    var chk=false;
	//Initialise variables
	var errorMsg = "";
	//Check for a Name
	//if (document.getElementById("cbo_BoatFacility").value == "0"){
	//	errorMsg += "\n\tBoat  \t                - Enter your Boat";
	//}
	if (document.getElementById("cbo_Monthly").value == "0"){
		errorMsg += "\n\tMonthly  \t                - Enter your Monthly";
	}
	
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

function habilitar() {
  	
	var i 
    for (i=0;i<document.frmBR.multiple.length;i++){ 
       if (document.frmBR.multiple[i].checked) 
          break; 
    } 
	if ((document.frmBR.multiple[i].value)==1){
			document.frmBR.TxtEndDate.disabled=false;
	 		document.frmBR.TxtStartDate2.disabled=true;
			document.frmBR.TxtEndDate3.disabled=true;
			document.frmBR.cbo_Monthly.disabled=true;
			
		}
	if ((document.frmBR.multiple[i].value)==2){
			document.frmBR.TxtEndDate.disabled=true;
			document.frmBR.TxtStartDate2.disabled=false;
			document.frmBR.TxtEndDate3.disabled=false;
			document.frmBR.cbo_Monthly.disabled=true;
			
	}
	if ((document.frmBR.multiple[i].value)==3){
			document.frmBR.TxtEndDate.disabled=true;
	 		document.frmBR.TxtStartDate2.disabled=true;
			document.frmBR.TxtEndDate3.disabled=true;
			document.frmBR.cbo_Monthly.disabled=false;
			
	}
	
}

function LogOut() {
  	document.frmBR.action="logout.aspx";
  	document.frmBR.submit();
}

</script>
<script type="text/javascript">

    function showMenu(){
      isActive = true;
    //  document.getElementById("cboReportTo").style.visibility="hidden";

    }

    function hideMenu(){
      isActive = false;
      setTimeout('hide()',100);
    }

    function hide(){
      if(!isActive){
      //  document.getElementById("cboReportTo").style.visibility="visible";
      }
    }

</script>
<script type="text/javascript">
function launchpopup(url){
  popup=window.open(url,"popup","width=700,height=500,top=10,left=30,resizable=yes,scrollbars=yes,menubar=yes,toolbar=no,status=no,location=no")
}
</script>

<body runat="server">
    
      <form id="form1" runat="server" name="frmBR" >
    <header id="header">
    
     <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

   <div class="container" > <div class="row_header-admin-dashboard" >
           <div align="center"><h1 class="white">DASHBOARD</h1></div>                 
      </div>
         
</div>

</header>
 


<input type="hidden" name="hdnPag" value="<%= nPag %>" />
	
	  <div class="container">
	   <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />


     


		

       

                <div class="row">
         <div class="col-lg-12 col-sm-12 padbot20">

			<div id="table_div">
				<b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
					 Welcome  <%= Session["BusinessName"] %> Marina</font></b>
				<h1>Reports</h1>
				
				<table cellpadding="0" cellspacing="0" border="0">
				  <tr>
				     <td>&nbsp;&nbsp;&nbsp;Boat<span class="hilite">*</span><%
    BoatFacility();
%>
</td>
				  </tr>
				
				  <tr>
				    	<td>
					        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="multiple" 
                                Text="Daily" />
    
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                            <input type="text" id="datepicker" name=TxtEndDate onclick="return datepicker_onclick()" onclick="return datepicker_onclick()" style="width:120px!important" />&nbsp;&nbsp;
					</td>
				  </tr>
                   <tr>
				    <td>
					    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="multiple" Text="Monthly"/>
                           
					   &nbsp;&nbsp;
					   <select name="cbo_Monthly" tabindex="5" tabindex="5">
<%
    //if (multiple == "" || multiple == "1" || multiple == "2")
    if (multiple == "RadioButton1" || multiple == "RadioButton2")
    { 
        select1 = "disabled";
    }
%>
<%= select1 %>>
				         <option value="0">[Select]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<%
    if (cbo_Monthly == "1")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">January</option>
<%
    }
    else
    {
%>
						 <option value="01">January</option>
<%
    }
    if (cbo_Monthly == "2")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">February</option>
<%
    }
    else
    {
%>
						 <option value="02">February</option>
<%
    }
    if (cbo_Monthly == "3")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">March</option>
<%
    }
    else
    {
%>
						 <option value="03">March</option>
<%
    }
    if (cbo_Monthly == "4")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">April</option>
<%
    }
    else
    {
%>
						 <option value="04">April</option>
<%
    }
    if (cbo_Monthly == "5")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">May</option>
<%
    }
    else
    {
%>
						 <option value="05">May</option>
<%
    }
    if (cbo_Monthly == "6")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">June</option>
<%
    }
    else
    {
%>
						 <option value="06">June</option>
<%
    }
    if (cbo_Monthly == "7")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">July</option>
<%
    }
    else
    {
%>
						 <option value="7">July</option>
<%
    }
    if (cbo_Monthly == "8")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">August</option>
<%
    }
    else
    {
%>
						 <option value="08">August</option>
<%
    }
    if (cbo_Monthly == "9")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">September</option>
<%
    }
    else
    {
%>
						 <option value="09">September</option>
<%
    }
    if (cbo_Monthly == "10")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">October</option>
<%
    }
    else
    {
%>
						 <option value="10">October</option>
<%
    }
    if (cbo_Monthly == "11")
    {
%>
						 <option value="<%= cbo_Monthly %>" selected="selected">November</option>
<%
    }
    else
    {
%>
						 <option value="11">November</option>
<%
    }
    if (cbo_Monthly == "12")
    {
%>
 						 <option value="<%= cbo_Monthly %>" selected="selected">December</option>
<%
    }
    else
    {
%>
						 <option value="12">December</option>
<%
    }
%>
				       </select>
				    </td>
				 </tr>
				 <tr>
					<td>
<%--					<input type="radio" value="2" onclick="habilitar();" /><%
--%>    
<%--//if (multiple == "2")
    if (RadioButton2.Checked == true)
    {
        Selection2 = "checked";
    }
%>
--%><%= Selection2 %>
				        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="multiple" Text="Range" />
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="datepicker0" name="TxtStartDate" style="width:120px!important"
                            onclick="return datepicker_onclick()" onclick="return datepicker_onclick()" />
                        &nbsp;&nbsp;
                        <input 
                            type="text" id="datepicker1" name="TxtEndDate1"  style="width:120px!important"
                            onclick="return datepicker_onclick()" onclick="return datepicker_onclick()" />
<script type="text/javascript" type="text/javascript">    function datepicker_onclick() {

    }

</script>
<%--                			<input readonly="false" size="15" maxlength="11" value="<%= TxtStartDate2 %>" />
						<a txtstartdate2="," txtstartdate2="," txtstartdate2="," img_enddate2=");return false;" href="javascript:calClick();return false;">
         				   	<img height="17" alt="Select Date" src="imagescal/calendar.gif" width="18" align="absMiddle" border="0" name="IMG_EndDate2" /></a> 
--%>				     					   
				    </td>
					
<script type="text/javascript" type="text/javascript" type="text/javascript">function datepicker_onclick() {

}

function datepicker_onclick() {

}

function datepicker_onclick() {

}

</script>
<%--                			<input readonly="false" size="15" maxlength="11" value="<%= TxtEndDate3 %>" />
							<a txtenddate3="," txtenddate3="," txtenddate3="," img_enddate3=");return false;" href="javascript:calClick();return false;">
         				   	<img height="17" alt="Select Date" src="imagescal/calendar.gif" width="18" align="absMiddle" border="0" name="IMG_EndDate3" /></a> 
--%>					
					</tr>
				   <tr>
				 <td>
				&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" BackColor="#6699CC" Font-Bold="True" 
                         ForeColor="White" />
				</td>
				</tr>
				</table>
				<br />
<%
    if (DateTime.Now.Day >= 1 && DateTime.Now.Day <= 9)
    {
        dia1 = "0" + Convert.ToString(DateTime.Now.Day);
    }
    else
    {
        dia1 = Convert.ToString(DateTime.Now.Day);
    }
    anio = DateTime.Now.Year;
    fecha = cbo_Monthly + "/" + dia1 + "/" + Convert.ToString(anio);
    if (multiple != null)
    {
        //Response.Write("entro");
%>
<%--			&nbsp;&nbsp;<a aling="" valign="middle" href="javascript:launchpopup(" boats_list_reports_print.aspx?cbo_boatfacility="<%= cbo_BoatFacility %>&TxtEndDate=<%= TxtEndDate %>&TxtStartDate=<%= TxtStartDate %>&TxtEndDat1e=<%= TxtEndDate1 %>&cbo_Monthly=<%= cbo_Monthly %>&multiple=<%= multiple %>')"" class="verd10Rollazu">
--%>
			&nbsp;&nbsp;<a aling="" valign="middle" href="boats_list_reports_print.aspx?cbo_boatfacility=<%= cbo_BoatFacility %>&TxtEndDate=<%= TxtEndDate %>&TxtStartDate=<%= TxtStartDate %>&TxtEndDate1=<%= TxtEndDate1 %>&cbo_Monthly=<%= cbo_Monthly %>&multiple=<%= multiple %>" target="_blank">
<img border="0" src="images/printer.gif" width="15" height="20" valign="middle" />
&nbsp;Printer-friendly&nbsp;version

</a>
	<br />
	<br />
				<table class="list_table" cellpadding="0" cellspacing="0">
<%
        if (IsPostBack)
        {
            //if (RadioButton1.Checked == true)
            //{
            //    multiple = "1";
            //}
            con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
            Response.Expires = 0;
            oConn = new Connection();
            oConn.ConnectionString = con;
            oConn.ConnectionTimeout = 500;
            oConn.Open(null);
            nLinea = 1;
            cmd = new Command();
            rs = new Recordset();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_REPORTDATE";
            cmd.CommandType = adCmdStoredProc;
            //cmd.Parameters[1] = Convert.ToInt32(cbo_BoatFacility);
            cmd.Parameters.Append(cmd.CreateParameter("@in_boatID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@in_boatID"].Value = Convert.ToInt32(cbo_BoatFacility);
            //cmd.Parameters[2] = Session["MarinaID"];
            cmd.Parameters.Append(cmd.CreateParameter("@in_marinaID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@in_marinaID"].Value = Session["MarinaID"];
            if (multiple == "RadioButton1")
            {
                //cmd.Parameters[3] = ToMDY(TxtEndDate);
                cmd.Parameters.Append(cmd.CreateParameter("@dt_begindate", adVarChar, adParamInput, 18, 0));
                cmd.Parameters["@dt_begindate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtEndDate);
                //ConvierteFecha(TxtEndDate)
                //cmd.Parameters[4] = ToMDY(TxtEndDate);
                cmd.Parameters.Append(cmd.CreateParameter("@dt_Enddate", adVarChar, adParamInput, 18, 0));
                cmd.Parameters["@dt_Enddate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtEndDate);
                //ConvierteFecha(TxtEndDate)
            }
            if (multiple == "RadioButton2")
            {
                //cmd.Parameters[3] = ToMDY(TxtStartDate2);
                cmd.Parameters.Append(cmd.CreateParameter("@dt_begindate", adVarChar, adParamInput, 18, 0));
                cmd.Parameters["@dt_begindate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtStartDate);
                //ConvierteFecha(TxtStartDate2)
                //cmd.Parameters[4] = ToMDY(TxtEndDate3);
                cmd.Parameters.Append(cmd.CreateParameter("@dt_Enddate", adVarChar, adParamInput, 18, 0));
                cmd.Parameters["@dt_Enddate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", TxtEndDate1);
                //ConvierteFecha(TxtEndDate3)
            }
            if (multiple == "RadioButton3")
            {
                //cmd.Parameters[3] = fecha;
                cmd.Parameters.Append(cmd.CreateParameter("@dt_begindate", adVarChar, adParamInput, 18, 0));
                cmd.Parameters["@dt_begindate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", fecha); //Convert.ToString(nFecha);
                //cmd.Parameters[4] = fecha;
                cmd.Parameters.Append(cmd.CreateParameter("@dt_Enddate", adVarChar, adParamInput, 18, 0));
                cmd.Parameters["@dt_Enddate"].Value = String.Format("{0:MM/dd/yyyy HH:mmtt}", fecha); //Convert.ToString(nFecha);
            }
            //cmd.Parameters[5] = Convert.ToInt32(multiple);
            cmd.Parameters.Append(cmd.CreateParameter("@flat", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@flat"].Value = Convert.ToInt32(multiple.Substring(11,1));
            rs.CursorType = (nce.adodb.CursorType)3;
            rs.CursorLocation = (nce.adodb.CursorLocation)3;
            rs.Open(cmd);
            if (!(rs.Eof))
            {
                rs.PageSize = nRegistros;
                rs.AbsolutePage = nPag;
                nTotal = rs.RecordCount;
            }
            nContador = 0;
            while ((!(rs.Eof)) && (nContador < nRegistros))
            {
                nContador = nContador + 1;
                rs.MoveNext();
            }
%>
				<tr>
			
			  <th colspan="7">
				<b>
				 Displaying
			      Results  <%= ((nPag - 1) * 20) + 1%>-<%= ((nPag - 1) * 20) + nContador%> of <%= nTotal%>
				 </b>

			  	</th>
				  </tr>
					<tr>
						<th>Boat</th>
						<th>FirstName</th>
						<th>LastName</th>
						<th>Phone</th>
						<th>E-Mail</th>
						<th>Begin date</th>
						<th>End Date</th>
					
					</tr>
<%
            if (nContador > 0)
            {
                nContador = 0;
                rs.PageSize = nRegistros;
                rs.AbsolutePage = nPag;
            }
            while ((!(rs.Eof)) && (nContador < nRegistros))
            {
                nContador = nContador + 1;
                if (nLinea == 1)
                {
                    sColor = "#FBFBF9";
                    sColor = "";
                    nLinea = 0;
                }
                else
                {
                    sColor = "bluerow";
                    nLinea = 1;
                }
%>
				<tr class="<%= sColor %>">
					<td><%= rs.Fields["vc_name"].Value%></td>
					<td><%= rs.Fields[1].Value%></td>
					<td><%= rs.Fields[2].Value%></td>
					<td><%= rs.Fields[3].Value%></td>
					<td> <%= rs.Fields[4].Value%></td>
					<td><%= rs.Fields[5].Value%></td>
					<td><%= rs.Fields[6].Value%></td>
				</tr>

<%
                rs.MoveNext();
            }
%>
					</table>
<%
            if (nPag > 1)
            {
%>
			     <a href="javascript:Previous()" class="button">Previous</a>
<%
            }
            if (rs.PageCount > nPag)
            {
%>
              <a href="javascript:Next()" class="button">Next</a>
<%
            }
        }
    }
%>


		</div>
	
        </div>
          </div>

            <script>

            setSelectedMenu("liReports");
        </script>

     </div>
	
	</form>
	<div class="text" id="popupcalendar" style="background-color: #F5F2E5; z-index: 2" onmouseover="showMenu();" onmouseout="hideMenu();"></div>
</body>
</html>
