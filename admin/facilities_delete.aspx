<%@ Page language="C#" CodeFile="facilities_delete.aspx.cs" Inherits="BoatRenting.facilities_delete_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
//<!--#include file="__dbConnection.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }

    sRegister = Request.QueryString["MarinaID"];

    //sListDelete = NVL(Request.Form["txtDelete"], "");
    //if (sListDelete == "")
    if (sRegister == "")
    {
        Response.Redirect("facilities_list.aspx");
    }
    //sLongitud = sListDelete.Length;
    //sRegister = "";
    //while(sLongitud != 0)
    //{
    //    if (sListDelete.Substring(1 - 1, 1) != "-")
    //    {
    //        sRegister = sRegister + sListDelete.Substring(1 - 1, 1);
    //    }
    //    else
    //    {
            DeleteReg(Convert.ToDouble(sRegister));
            sRegister = "";
    //    }
    //    sListDelete = sListDelete.Substring(2 - 1, sLongitud - 1);
    //    sLongitud = sListDelete.Length;
    //}
    Response.Redirect("facilities_list.aspx");
%>
