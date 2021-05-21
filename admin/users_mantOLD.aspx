<%@ Page language="C#" CodeFile="users_mantOLD.aspx.cs" Inherits="BoatRenting.users_mant_aspx_cs" EnableEventValidation="false" %>
<%@ Register Src="~/admin/ctlTopMenuAdmin.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/admin/ctlAdminMenu.ascx" TagPrefix="uc1" TagName="ctlAdminMenu" %>

<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--#include file="__dbConnection.aspx"-->
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }

    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    hdn_Action = Request["hdn_Action"];
    txt_MarinaID = Session["MarinaID"];
    txt_UserID = Request["UserID"];
    if (hdn_Action == "E" && !IsPostBack)
    {
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_USER_GET";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1].Value = txt_UserID;
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_UserID"].Value = Convert.ToInt32(txt_UserID);
        rs = cmd.Execute();
        txt_UserName = NVL(rs.Fields["vc_UserName"].Value, "");
        txt_password = NVL(rs.Fields["vc_password"].Value, "");
        cbo_UserLevel = NVL(rs.Fields["in_UserLevelID"].Value, "0");
        Session.Add("uname", txt_UserName);
        Session.Add("upass", txt_password);
    }
    if (hdn_Action == "L")
    {
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_USER_LOGIN";
        cmd.CommandType = adCmdStoredProc;
        cmd.Parameters.Append(cmd.CreateParameter("@vc_userName", adVarChar, adParamInput, 100, Session["uname"]));
        cmd.Parameters.Append(cmd.CreateParameter("@vc_password", adVarChar, adParamInput, 30, Session["upass"]));
        rs = cmd.Execute();
        if (!(rs.Eof))
        {
            String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
            String dotNET = Microsoft.VisualBasic.Strings.Right(currentPage, 1);
            String dotNETdb = Microsoft.VisualBasic.Strings.Right(Convert.ToString(rs.Fields["vc_defaultHomePage"].Value), 1);
            if (dotNET == dotNETdb) { dotNET = ""; }
            Session.Add("userID", rs.Fields["in_userID"].Value);
            Session.Add("userLevelID", rs.Fields["in_userLevelID"].Value);
            Session.Add("MarinaID", rs.Fields["in_MarinaID"].Value);
            Session.Add("BusinessName", rs.Fields["vc_BusinessName"].Value);
            Session.Add("defaultPage", "/admin/" + NVL(rs.Fields["vc_defaultHomePage"].Value, "") + dotNET);
        }
        Response.Redirect(Convert.ToString(Session["defaultPage"]));
    //response.write( Session("defaultPage") )
    }
%>


<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br_admin.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>

<script language="javascript">

function Validar() {
    var chk=false;
	//Initialise variables
	var errorMsg = "";
	//Check for a Name
	if (document.getElementById("txt_userName").value == ""){
		errorMsg += "\n\t User Name \t\t                  - Enter your User Name";
	}

	//Check for a Name
	if (document.getElementById("txt_password").value == ""){
		errorMsg += "\n\t Password \t\t                  - Enter your Password";
	}

	//Check for a userLevel
	if (document.getElementById("cbo_userLevel").value == "0"){
		errorMsg += "\n\t User Level \t\t                  - Enter your User Level";
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


function Save() {
	if (Validar()){
	  	document.frm_users_mant.action="users_save.aspx";
	  	document.frm_users_mant.submit();
	}
}

function Cancel() {
  	document.frm_users_mant.action="users_list.aspx";
  	document.frm_users_mant.submit();
}

function LogOut() {
  	document.frm_users_mant.action="logout.aspx";
  	document.frm_users_mant.submit();
}

function Login() {
  	document.frm_users_mant.action="users_mant.aspx";
      document.frm_users_mant.hdn_Action.value="L";
      
  	document.frm_users_mant.submit();
}



</script>
<body>
<form name="frm_users_mant" id="form1" runat="server">
<input type="hidden" name="hdnPag" value="<%= nPag %>">
<input type="hidden" name="hdn_Action" value="<%= hdn_Action %>">
<input type="hidden" name="hdn_UserID" value="<%= txt_UserID %>">
<!--input type="hidden" name="cbo_userLevel" value="2"--><input type="hidden" name="hdn_original" value="<%= txt_UserName %>">
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

				<table id="facility_table" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="2">
<%
    if (hdn_Action == "N")
    {
%>
						New User
<%
    }
    else
    {
%>
						Edit User
<%
    }
%>
</th>
					</tr>
					<tr>
						<td class="align_right">User Name<span class="hilite">*</span></td>
							<td><input name="txt_userName" type="text" class="user_name" id="txt_userName" value="<%= txt_UserName %>"/></td>
					</tr>
					<tr>
						<td class="align_right">Password<span class="hilite">*</span></td>
						<td><input name="txt_password" type="text" class="password" id="txt_password" value="<%= txt_password %>"/></td>
					</tr>
					<tr>
						<td class="align_right">User Level</td>
						<td> <%
    UserLevel();
%>
</td>
					</tr>
					<tr class="separator_tr">
						<td colspan="2"></td>
					</tr>
				</table>
				<div><span class="hilite">*</span>
				 <span class="hilite_explain">Required fields</span></div>
                 	            <asp:Button ID="btnSave" runat="server" onclick="Button1_Click" Text="Save" 
                    BackColor="#6699CC" ForeColor="White" Height="30px" Width="60px" />

                &nbsp; &nbsp; &nbsp;
	            
	            <asp:Button ID="btnCancel" runat="server"  
                    OnClientClick="JavaScript: window.history.back(1); return false;" Text="Cancel" 
                    BackColor="#6699CC" ForeColor="White" Height="30px" Width="60px" 
                    onclick="btnCancel_Click" />

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
