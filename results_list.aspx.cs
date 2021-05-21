using nce.adoole;
using nce.scripting;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
namespace BoatRenting
{

  public partial class results_list_aspx_cs : System.Web.UI.Page
  {
    public string con = "";
    public Connection oConn = null;
    //------Constantes----'
    //---- DataTypeEnum Values ----'
    public const int adEmpty = 0;
    public const int adTinyInt = 16;
    public const int adSmallInt = 2;
    public const int adInteger = 3;
    public const int adBigInt = 20;
    public const int adUnsignedTinyInt = 17;
    public const int adUnsignedSmallInt = 18;
    public const int adUnsignedInt = 19;
    public const int adUnsignedBigInt = 21;
    public const int adSingle = 4;
    public const int adDouble = 5;
    public const int adCurrency = 6;
    public const int adDecimal = 14;
    public const int adNumeric = 131;
    public const int adBoolean = 11;
    public const int adError = 10;
    public const int adUserDefined = 132;
    public const int adVariant = 12;
    public const int adIDispatch = 9;
    public const int adIUnknown = 13;
    public const int adGUID = 72;
    public const int adDate = 7;
    public const int adDBDate = 133;
    public const int adDBTime = 134;
    public const int adDBTimeStamp = 135;
    public const int adBSTR = 8;
    public const int adChar = 129;
    public const int adVarChar = 200;
    public const int adLongVarChar = 201;
    public const int adWChar = 130;
    public const int adVarWChar = 202;
    public const int adLongVarWChar = 203;
    public const int adBinary = 128;
    public const int adVarBinary = 204;
    public const int adLongVarBinary = 205;
    public const int adChapter = 136;
    public const int adFileTime = 64;
    public const int adPropVariant = 138;
    public const int adVarNumeric = 139;
    public const int adArray = 0x2000;
    //---- CommandTypeEnum Values ------------'
    public const int adCmdStoredProc = 0x0004;
    //---- ParameterDirectionEnum Values ----'
    public const int adParamInput = 0x0001;
    public const int adParamOutput = 0x0002;
    public string sMes = "";
    public string sCadena = "";
    public string cmb_country = "";
    public string cmb_body = "";
    public string cmb_facility = "";
    public string cmb_state = "";
    public string cmb_boat = "";
    public string txt_zip = "";
    public string txt_city = "";
    public int IntRegistros = 0;
    public int IntMostrados = 0;
    public string sMenu = "";
    public string c1 = "";
    public string c2 = "";
    public string c3 = "";
    public string c4 = "";
    public string c5 = "";
    public string c6 = "";
    public string c7 = "";
    public string c8 = "";
    public string c9 = "";
    public string c10 = "";
    public string c11 = "";
    public string c12 = "";
    public string c13 = "";
    public string c14 = "";
    public string c16 = "";
    public string cHome = "";
    public string flgID = "";
    public string path = "";
    public int i = 0;
    public Command cmd = null;
    public Recordset rs = null;
    public Recordset rs2 = null;
    public Command cmd2 = null;
    public FileSystemObject fs = null;
    public string NVL(string InputValue, object NullReplaceValue) 
    {
        string NVL = "";
        //if (Convert.IsDBNull(InputValue))
        if (string.IsNullOrEmpty(InputValue))
        {
            NVL = Convert.ToString(NullReplaceValue);
        }
        else
        {
            if ((InputValue.Trim()).Length == 0)
            {
                NVL = Convert.ToString(NullReplaceValue);
            }
            else
            {
                NVL = InputValue;
            }
        }
        return NVL;
    }

    public string ConvierteFecha(ref string sStartDate) 
    {
        string ConvierteFecha = "";
        object sPaola = null;
        if (Convert.IsDBNull(sStartDate))
        {
            ConvierteFecha = "";
        }
        else
        {
            if (sStartDate == "")
            {
                ConvierteFecha = "";
            }
            else
            {
                if (sStartDate.Length != 11)
                {
                    ConvierteFecha = "";
                }
                else
                {
                    sStartDate = sStartDate.ToUpper();
                    sMes = sStartDate.Substring(4 - 1, 3);
                    if (sMes == "JAN")
                    {
                        sMes = "01";
                    }
                    if (sMes == "FEB")
                    {
                        sMes = "02";
                    }
                    if (sMes == "MAR")
                    {
                        sMes = "03";
                    }
                    if (sMes == "APR")
                    {
                        sMes = "04";
                    }
                    if (sMes == "MAY")
                    {
                        sMes = "05";
                    }
                    if (sMes == "JUN")
                    {
                        sMes = "06";
                    }
                    if (sMes == "JUL")
                    {
                        sMes = "07";
                    }
                    if (sMes == "AUG")
                    {
                        sMes = "08";
                    }
                    if (sMes == "SEP")
                    {
                        sMes = "09";
                    }
                    if (sMes == "OCT")
                    {
                        sMes = "10";
                    }
                    if (sMes == "NOV")
                    {
                        sMes = "11";
                    }
                    if (sMes == "DEC")
                    {
                        sMes = "12";
                    }
                    ConvierteFecha = sStartDate.Substring(1 - 1, 2) + "/" + sMes + "/" + sStartDate.Substring(8 - 1, 4);
                }
            }
        }
        return ConvierteFecha;
    }

    public object Country() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_COUNTRY_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cmb_country\" class=\"water\" tabindex=\"1\" onchange=\"javascript:loadStates()\">\r\n");
        Response.Write("	<option value=\"0\">- All Countries -</option>\r\n");
        while(!(rs.Eof))
        {
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_countryID"].Value);
            Response.Write("\" >");
            Response.Write(rs.Fields["vc_name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        Response.Write("	<script> document.frm_search.cmb_country.selectedIndex = ");
        Response.Write(cmb_country);
        Response.Write(" </script>\r\n");
        rs.Close();
        return null;
    }

    public object States() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_STATE_LIST";
        cmd.CommandType = adCmdStoredProc;
//xxx        cmd.Parameters["@CountryID"] = cmb_country;
        cmd.Parameters["@CountryID"].Value = 1;
        rs = cmd.Execute();
        Response.Write("	<select name=\"cmb_state\" class=\"state1\" tabindex=\"6\" style=\"width:113px\" onchange=\"javascript:Search()\">\r\n");
        Response.Write("	<option value=\"0\">- Any State -</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_stateID"].Value) == Convert.ToInt32(Request.Form["cmb_state"]))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_stateID"].Value);
            Response.Write("\" ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        rs.Close();
        return null;
    }

    public object Facility() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_MARINA_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cmb_facility\" class=\"water\" tabindex=\"4\" onchange=\"javascript:ClearFileds(1)\" >\r\n");
        Response.Write("	<option value=\"0\">- Any Facility -</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_marinaID"].Value) == Convert.ToInt32(Request.Form["cmb_facility"]))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_marinaID"].Value);
            Response.Write("\" ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_businessName"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        rs.Close();
        return null;
    }

    public object BoatType() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BOATTYPE_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cmb_boat\" class=\"water\" tabindex=\"5\">\r\n");
        Response.Write("	<option value=\"0\" >- Any Boat Types -</option>\r\n");
        while(!(rs.Eof))
        {
            //If rs("in_boatTypeID") = cint(request.Form("cmb_boat")) Then sCadena= "selected" Else sCadena = "" End If
            if ((Convert.ToInt32(rs.Fields["in_boatTypeID"].Value) == Convert.ToInt32(cmb_boat)))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	        \r\n");
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_boatTypeID"].Value);
            Response.Write("\" ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_description"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        rs.Close();
        return null;
    }

    public object BodyWater() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BODYWATER_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cmb_body\" class=\"water\" tabindex=\"3\" onchange=\"javascript:ClearFileds(2)\">\r\n");
        Response.Write("	<option value=\"0\">- Any Body of Water -</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToString(rs.Fields["vc_bodywater"].Value) == Request.Form["cmb_body"])
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["vc_bodywater"].Value);
            Response.Write("\" ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_bodywater"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        rs.Close();
        return null;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string resultsPage = "results.aspx";
        string where2go = Request.Form["s"];
        if (where2go != "")
        {
            string url = @"https://maps.googleapis.com/maps/api/geocode/xml?address=" + where2go;
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(url);
            XmlNode latNode = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/location/lat");
            resultsPage = resultsPage + "?lat=" + latNode.InnerText;
            XmlNode lngNode = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/location/lng");
            resultsPage = resultsPage + "&lng=" + lngNode.InnerText;
        }
        Response.Redirect(resultsPage);

    }
}

} 
