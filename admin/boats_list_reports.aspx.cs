using nce.adosql;
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
namespace BoatRenting {

  public partial class boats_list_reports_aspx_cs : System.Web.UI.Page
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
    public string dia = "";
    public string mes = "";
    public Command cmd2 = null;
    public Recordset rs2 = null;
    public string sCadena = "";
    public int nPag = 0;
    public int nRegistros = 0;
    public string multiple = "";
    public string cbo_BoatFacility = "";
    public string TxtEndDate = "";
    public string TxtStartDate = "";
    public string TxtEndDate1 = "";
    public string cbo_Week = "";
    public string cbo_Monthly = "";
    public string Selection1 = "";
    public string Selection3 = "";
    public string select1 = "";
    public string Selection2 = "";
    public string dia1 = "";
    public object anio = null;
    public string fecha = "";
    public int nLinea = 0;
    public Command cmd = null;
    public Recordset rs = null;
    public int nTotal = 0;
    public int nContador = 0;
    public string sColor = "";
    public object NVL(object InputValue, object NullReplaceValue) 
    {
        object NVL = null;
        if (Convert.IsDBNull(InputValue))
        {
            NVL = NullReplaceValue;
        }
        else
        {
            if ((Convert.ToString(InputValue).Trim()).Length == 0)
            {
                NVL = NullReplaceValue;
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

    public string ToMDY(string date) 
    {
        dia = date.Substring(5 - 1, 2);
        mes = date.Substring(1 - 1, 3);
        anio = date.Substring(8 - 1, 4);
        switch (mes) {
            case "Jan":
                mes = "01";
                break;
            case "Feb":
                mes = "02";
                break;
            case "Mar":
                mes = "03";
                break;
            case "Apr":
                mes = "04";
                break;
            case "May":
                mes = "05";
                break;
            case "Jun":
                mes = "06";
                break;
            case "Jul":
                mes = "07";
                break;
            case "Aug":
                mes = "08";
                break;
            case "Sep":
                mes = "09";
                break;
            case "Oct":
                mes = "10";
                break;
            case "Nov":
                mes = "11";
                break;
            case "Dec":
                mes = "12";
                break;
        }
        return mes + "/" + dia + "/" + Convert.ToString(anio);
    }

    public object BoatFacility() 
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        cmd2 = new Command();
        rs2 = new Recordset();
        cmd2.ActiveConnection = oConn;
        cmd2.CommandText = "SP_BR_BOATFACILITY";
        cmd2.CommandType = adCmdStoredProc;
        //cmd2.Parameters[1] = Session["MarinaID"];
        cmd2.Parameters.Append(cmd2.CreateParameter("in_marinaID", adInteger, adParamInput, 4, 0));
        cmd2.Parameters["@in_marinaID"].Value = Session["MarinaID"];
        rs2.CursorType = (nce.adodb.CursorType)3;
        rs2.CursorLocation = (nce.adodb.CursorLocation)3;
        rs2.Open(cmd2);
        Response.Write("	<select name=\"cbo_BoatFacility\" class=\"state\"  tabindex=\"5\" >\r\n");
        Response.Write("	<option value=\"0\">[All]</option>\r\n");
        while(!(rs2.Eof))
        {
            if (Convert.ToInt32(rs2.Fields["in_boatID"].Value) == Convert.ToInt32(cbo_BoatFacility))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs2.Fields["in_boatID"].Value);
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs2.Fields["vc_name"].Value);
            Response.Write("</option>\r\n");
            rs2.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }


  }

} 
