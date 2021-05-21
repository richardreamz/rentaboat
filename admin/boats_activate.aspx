<%@ Page language="C#" CodeFile="boats_activate.aspx.cs" Inherits="BoatRenting.boats_activate_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
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

    Boat_ID = Request["BoatID"];
    cmd = new Command();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOAT_ACTIVATE_UPD";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = Boat_ID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(Boat_ID);
    cmd.Execute();
    Response.Redirect("boats_list.aspx");
%>
