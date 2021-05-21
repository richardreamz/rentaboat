using Microsoft.VisualBasic;
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

  public partial class calendar_aspx_cs : System.Web.UI.Page
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
    public string scadena = "";
    public int nMonth = 0;
    public int nYear = 0;
    public int nPag = 0;
    public int nRegistros = 0;
    //public object nMonthnlastMonth = null;
    public string nMonthnlastMonth = DateTime.Today.Month.ToString();
    public int nlastMonth = 0;
    public int lastDiasMes = 0;
    public int DiasMes = 0;
    public DateTime Fecha;
    public int numday = 0;
    public int lastweek = 0;
    public int IniRestDays = 0;
    public int FinRestDays = 0;
    public DateTime Fecha2;
    public int numday2 = 0;
    public int lastweek2 = 0;
    public int IniRestDays2 = 0;
    public int FinRestDays2 = 0;
    public string BoatSelected = "";
    public string MarinaID = "";
    public int contYear = 0;
    public string s1Check = "";
    public string s2Check = "";
    public int contrest = 0;
    public int cont = 0;
    public int finfirstweek = 0;
    public DateTime nFecha;
    public Command cmd = null;
    public Recordset rsReserve = null;
    public string sLink = "";
    public string style = "";
    public int inter_week = 0;
    public int num_week = 0;
    public int finweek = 0;
    public int contrest2 = 0;
    public string NVL(string InputValue, int NullReplaceValue) 
    {
        string NVL = "";
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

    public object BoatName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BOATxMARINA_RESERVATION_LIST";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = Session["MarinaID"];
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_MarinaID"].Value = Convert.ToInt32(Session["MarinaID"]);
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_BoatID\" class=\"cal_boat_select\" onChange=\"javascript:Recall();\">\r\n");
        Response.Write("	<option value=\"0\">[All]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_BoatID"].Value) == Convert.ToInt32(BoatSelected))
            {
                scadena = "selected";
            }
            else
            {
                scadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_BoatID"].Value);
            Response.Write("\" ");
            Response.Write(scadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }


  }

} 
