<%@ Page language="C#" CodeFile="facilities_inactivate.aspx.cs" Inherits="BoatRenting.facilities_inactivate_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }

    sRegister = Request.QueryString["MarinaID"];
    
    //sListInactivate = NVL(Request.Form["txtInactivate"], "");
    //if (sListInactivate == "")
    if (sRegister == "")
    {
        Response.Redirect("facilities_list.aspx");
    }
    //sLongitud = sListInactivate.Length;
    //sRegister = "";
    //while(sLongitud != 0)
    //{
    //    if (sListInactivate.Substring(1 - 1, 1) != "-")
    //    {
    //      sRegister = sRegister + sListInactivate.Substring(1 - 1, 1);
    //    }
    //    else
    //    {
            InactivateReg(Convert.ToDouble(sRegister));
    //        sRegister = "";
    //    }
    //    sListInactivate = sListInactivate.Substring(2 - 1, sLongitud - 1);
    //    sLongitud = sListInactivate.Length;
    //}
    Response.Redirect("facilities_list.aspx");
%>
