<%@ Page language="C#" CodeFile="users_delete.aspx.cs" Inherits="BoatRenting.users_delete_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="__dbConnection.aspx"-->
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }
    
    sListDelete = NVL(Request.Form["txtDelete"], "");
    if (sListDelete == "")
    {
        Response.Redirect("users_list.aspx");
    }

    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    sLongitud = sListDelete.Length;
    sRegister = "";
    while(sLongitud != 0)
    {
        if (sListDelete.Substring(1 - 1, 1) != "-")
        {
            sRegister = sRegister + sListDelete.Substring(1 - 1, 1);
        }
        else
        {
            DeleteReg(Convert.ToDouble(sRegister));
            sRegister = "";
        }
        sListDelete = sListDelete.Substring(2 - 1, sLongitud - 1);
        sLongitud = sListDelete.Length;
    }
    Response.Redirect("users_list.aspx");
%>
