<%@ Page language="C#" CodeFile="users_list.aspx.cs" Inherits="BoatRenting.users_list_aspx_cs" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>


<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html>
   <!--#include file="__dbConnection.aspx"-->
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }
    
    //if (Request.Form["hdnPag"] == "")
    if (string.IsNullOrEmpty(Request.Form["hdnPag"]))
    {
        nPag = 1;
    }
    else
    {
        nPag = Convert.ToInt32(Request.Form["hdnPag"]);
    }
    nRegistros = 20;
    if (Request.Form["hdnOrder"] == "")
    {
        nOrder = 4;
    }
    else
    {
        nOrder = Convert.ToInt32(Request.Form["hdnOrder"]);
    }
    if (Request.Form["hdnWay"] == "")
    {
        nWay = 2;
    }
    else
    {
        nWay = Convert.ToInt32(Request.Form["hdnWay"]);
    }
    
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open();
 

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";</style>

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
</head>

<script language="javascript">
function Previous() {

	document.frm_users_list.hdnPag.value=eval(document.frm_users_list.hdnPag.value)-1;
  	document.frm_users_list.action="users_list.aspx";
  	document.frm_users_list.submit();

}
function Next() {

	document.frm_users_list.hdnPag.value=eval(document.frm_users_list.hdnPag.value)+1;
  	document.frm_users_list.action="users_list.aspx";
  	document.frm_users_list.submit();

}


function New() {
	document.frm_users_list.hdn_Action.value="N";
  	document.frm_users_list.action="users_mant.aspx" ;
  	document.frm_users_list.submit();
}


function Edit(UserID) {
	document.frm_users_list.hdn_Action.value="E";
  	document.frm_users_list.action="users_mant.aspx?UserID=" + UserID ;
  	document.frm_users_list.submit();

}

function Delete(nCount){

if (confirm("Confirm Action !  \n \n Claims selected will be deleted, are you sure to perform this task") )
{
	numMarks = 0;
	if (nCount == 1){
		if (document.frm_users_list.checkList.checked){
			numMarks = 1;
			document.frm_users_list.txtDelete.value = document.frm_users_list.checkList.value + "-";
		}
	}
	else if (nCount > 1){
		numChecks = document.frm_users_list.checkList.length;

		for(i=0; i<numChecks; i++){
			if (document.frm_users_list.checkList[i].checked){
				numMarks  = numMarks + 1;
				//alert(document.frm_users_list.checkList[i].value);
				document.frm_users_list.txtDelete.value = document.frm_users_list.txtDelete.value + document.frm_users_list.checkList[i].value + "-" ;
			}
		}
	}

	if (numMarks == 0){
		alert("Choose a record to delete");
	}
	else{
  		document.frm_users_list.action="users_delete.aspx" ;
  		document.frm_users_list.submit();
  	}
 }
}

function Order(x) {
    document.frm_users_list.hdnOrder.value=x;
	if (document.frm_users_list.hdnWay.value==1)
	{document.frm_users_list.hdnWay.value=2;}
	else
	{document.frm_users_list.hdnWay.value=1;}

  	document.frm_users_list.action="users_list.aspx";
  	document.frm_users_list.submit();
}

function LogOut() {
  	document.frm_users_list.action="logout.aspx";
  	document.frm_users_list.submit();
}

</script>
<body runat="server">

<form name="frm_users_list" method="POST" runat="server" id="frm_users_list">
<input type="hidden" name="hdnPag" value="<%= nPag %>">
<input type="hidden" name="hdn_Action" value="E">
<input type="hidden" name="txtDelete" value="">
<input type="hidden" name="hdnOrder" value="<%= nOrder %>">
<input type="hidden" name="hdnWay" value="<%= nWay %>">

     <header id="header">
    
     <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />

   <div class="container" > <div class="row_header-admin-dashboard" >
           <div align="center"><h1 class="white">DASHBOARD</h1></div>                 
      </div>
         
</div>

</header>
	  <div class="container">
	   <uc1:ctlAdminMenu runat="server" ID="ctlAdminMenu" />



            <div class="row">
         <div class="col-lg-12 col-sm-12 padbot20">

			<div id="table_div">
				<h1>User List</h1>
				<table class="list_table" cellpadding="0" cellspacing="0">
<%
    nLinea = 1;
    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_USER_LIST";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = Session["MarinaID"];
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(Session["MarinaID"]);
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
    while((!(rs.Eof)) && (nContador < nRegistros))
    {
        nContador = nContador + 1;
        rs.MoveNext();
    }
%>
				<tr>
			 <th  class="box"></th>
			  <th colspan="2">
				<b>&nbsp;&nbsp;&nbsp;&nbsp;
				 Displaying
			      Results  <%= ((nPag - 1) * 20) + 1 %>-<%= ((nPag - 1) * 20) + nContador %> of <%= nTotal %>
				 </b>
				 <p>
			  	</th>
				  </tr>
					<tr >
						<th  class="box">&nbsp; </th>
						<th>Name</th>
						<th>Level</th>
					</tr>
<%
    if (nContador > 0)
    {
        nContador = 0;
        rs.PageSize = nRegistros;
        rs.AbsolutePage = nPag;
    }
    while((!(rs.Eof)) && (nContador < nRegistros))
    {
        nContador = nContador + 1;
        if (nLinea == 1)
        {
            //sColor = "#FBFBF9"
            sColor = "";
            nLinea = 0;
        }
        else
        {
            sColor = "bluerow";
            nLinea = 1;
        }
%>
				<tr class="<%= sColor %>" >
						<td class="box"  height="20" ><input type="checkbox"  name="checkList" value="<%= rs.Fields["in_UserID"].Value %>" ></td>
				<td  ><a href="javascript:Edit(<%= rs.Fields["in_UserID"].Value %>)" ><%= rs.Fields["vc_UserName"].Value %></a></td>
				<td ><%= rs.Fields["vc_Description"].Value %></td>
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
%>

			  	<a href="javascript:New();" class="button">New</a>
	<a href="javascript:Delete(<%= nContador %>);" class="button">Delete</a>

		</div>
	      </div>
        </div>
              <script>

                  setSelectedMenu("liUserList");
        </script>
	</div>
	</form>
</body>
</html>
