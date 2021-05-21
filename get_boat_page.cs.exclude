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
    public string sfecha1 = "";
    public string SDate1 = "";
    public string dia1 = "";
    public string mes1 = "";
    public string anio1 = "";
    public string sfecha2 = "";
    public string SDate2 = "";
    public string dia2 = "";
    public string mes2 = "";
    public string anio2 = "";
    public string txt_date1 = "Today";
    public string TxtToDate = "";
    public string txt_date2 = "Today";
    public object txt_date1_day = null;
    public int txt_date1_month = 0;
    public int txt_date1_year = 0;
    public double i = 0;
    public string mes = "";
    public string fecha = "";
    public Command cmd = null;
    public Recordset rs = null;
    public Command cmdF = null;
    public Recordset rsF = null;
    public Command cmdLogin = null;
    public Recordset rsLogin = null;
    public string LoginSuccessFlag = "";
    //'if (LoginSuccessFlag = "1") then
    public string flgAvailable = "";
    public Command cmd3 = null;
    public Recordset rs3 = null;
    public Command cmd2 = null;
    public Recordset rs2 = null;
    public double totalhours = 0;
    public Command cmdF2 = null;
    public Recordset rsF2 = null;
    public Command cmdVideo = null;
    public Recordset rsVideo = null;
    public Command cmdP = null;
    public Recordset rsP = null;
    public object TypeRent() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_TYPERENT_LIST_XBOAT";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = Request.Form["hdnBoatID"];
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Request.Form["hdnBoatID"];
        //cmd.Parameters[2] = Request.Form["hdnMarinaID"];
        cmd.Parameters["@p_in_marinaID"].Value = Request.Form["hdnMarinaID"];
        rs = cmd.Execute();
        Response.Write("<select name=\"cmb_typerent\"  tabindex=\"1\" onchange=\"javascript:ChangeTypeRent()\">\r\n");
        Response.Write("	");
        Response.Write("<!--<option value=\"0\">- Select Type of Reservation -</option>-->");
        while(!(rs.Eof))
        {
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_typerentID"].Value);
            Response.Write("\" ");
            if (Request.Form["cmb_typerent"] == Convert.ToString(rs.Fields["in_typerentID"].Value))
            {
                Response.Write("selected");
            }
            Response.Write(">");
            Response.Write(rs.Fields["vc_description"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	\r\n");
        Response.Write("  	</select>\r\n");
        Response.Write("  \r\n");
        Response.Write("  	\r\n");
        rs.Close();
        return null;
    }

    public double getMilitary(double i) 
    {
        //if ( i < 10 ) then
        //else
        //getMilitary=i*100
        //end if
        return i * 100.0;
    }

    public double getMilitaryHalf(double i) 
    {
        //if ( i < 10 ) then
        //else
        //getMilitaryHalf=i*100+30
        //end if
        return i * 100.0 + 30.0;
    }

    public string NVL(string InputValue, string NullReplaceValue)
    {
        string NVL = "";
        //if (Convert.IsDBNull(InputValue))
        if (string.IsNullOrEmpty(InputValue))
        {
            NVL = NullReplaceValue;
        }
        else
        {
            if ((InputValue.Trim()).Length == 0)
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

  }

} 
