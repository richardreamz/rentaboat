using nce.adosql;
using System;
using System.Collections;
using System.ComponentModel;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
namespace BoatRenting {

  public partial class boats_mant_aspx_cs : System.Web.UI.Page
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
    public object cbo_State = null;
    public string sCadena = "";
    public object cbo_Country = null;
    public string hdn_Action = "";
    public string hdn_Recall = "";
    public object txt_marinaID = null;
    public string txt_BoatID = "";
    public Command cmd = null;
    public Command cmd2 = null;
    public Recordset rs = null;
    public string txt_Name = "";
    public string txt_Description = "";
    public string txt_Make = "";
    public string txt_Model = "";
    public string txt_Year = "";
    public string txt_size = "";
    public string cbo_BoatType = "";
    public string cbo_SubBoatType = "";
    public string txt_MaxPassengers = "";
    public string txt_deposit = "";
    public string txt_requirements = "";
    public string txt_reservation = "";
    public string chk_captain = "";
    public string chk_Is_boat_sale = "";
    public string txt_boat_sale_amount = "";
    public string txt_weekday1 = "";
    public string txt_weekend1 = "";
    public string txt_holiday1 = "";
    public string txt_hoursfrom1 = "";
    public string txt_hoursto1 = "";
    public string txt_weekday2 = "";
    public string txt_weekend2 = "";
    public string txt_holiday2 = "";
    public string txt_hoursfrom2 = "";
    public string txt_hoursto2 = "";
    public string txt_weekday3 = "";
    public string txt_weekend3 = "";
    public string txt_holiday3 = "";
    public string txt_hoursfrom3 = "";
    public string txt_hoursto3 = "";
    public string txt_weekday4 = "";
    public string txt_weekend4 = "";
    public string txt_holiday4 = "";
    public string txt_hoursfrom4 = "";
    public string txt_hoursto4 = "";
    public string txt_resultName = "";
    public string txt_resultDesc = "";
    public string txt_resultOld = "";
    public string txt_detailName = "";
    public string txt_detailDesc = "";
    public string txt_detailOld = "";
    public string txt_other1Name = "";
    public string txt_other1Desc = "";
    public string txt_other1Old = "";
    public string txt_other2Name = "";
    public string txt_other2Desc = "";
    public string txt_other2Old = "";
    public string txt_other3Name = "";
    public string txt_other3Desc = "";
    public string txt_other3Old = "";
    public string txt_other4Name = "";
    public string txt_other4Desc = "";
    public string txt_other4Old = "";
    public string txt_BoatVideoName = "";
    public string txt_BoatVideoDesc = "";
    public string txt_BoatVideoOld = "";
    public object nPag = null;
    public object gBinaryData = null;
    public object txt_MarinaID = null;
    public string strUploadPath = "";
    //public FileSystemObject fso = null;
    public int i = 0;
    public int txt_TypeRentID = 0;
    public string txt_weekday = "";
    public string txt_weekend = "";
    public string txt_holiday = "";
    public int txt_hoursfrom = 0;
    public object txt_hoursto = null;
    public string strFileExtensions = "";
    public string txt_resultImage = "";
    public string StrMensaje = "";
    public string NuevoNombre = "";
    public string txt_detailImage = "";
    public string txt_other1Image = "";
    public string txt_other2Image = "";
    public string txt_other3Image = "";
    public string txt_other4Image = "";
    public string txt_BoatVideoImage = "";
    //public clsUpload objUpload = null;
    public object strFileName = null;
    public object strPath = null;
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

    public object StateName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_STATE_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_State\" class=\"state\"  tabindex=\"7\" >\r\n");
        Response.Write("	<option value=\"0\">[Select]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_StateID"].Value) == Convert.ToInt32(cbo_State))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_stateID"].Value);
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }

    public object CountryName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_COUNTRY_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_Country\" class=\"country\"  tabindex=\"8\" >\r\n");
        Response.Write("	<option value=\"0\">[Select]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_CountryID"].Value) == Convert.ToInt32(cbo_Country))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_CountryID"].Value);
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }

    public object BoatTypeName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BOATTYPE_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_BoatType\" class=\"boat_type\"  tabindex=\"5\"  onchange=\"javascript:Recall();\" >\r\n");
        Response.Write("	<option value=\"0\">[Select]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_BoatTypeID"].Value) == Convert.ToInt32(cbo_BoatType))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_BoatTypeID"].Value);
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Description"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }

    public void SubBoatTypeName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_SUBBOATTYPE_LIST";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1].Value = Convert.ToInt32(cbo_BoatType);
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boattypeID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boattypeID"].Value = Convert.ToInt32(cbo_BoatType);
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_SubBoatType\" class=\"boat_type\"  tabindex=\"6\" >\r\n");
        Response.Write("	<option value=\"0\">[Select]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToString(rs.Fields["in_SubBoatTypeID"].Value) == cbo_SubBoatType)
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_SubBoatTypeID"].Value);
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Description"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
    }

    private void createAlertScript(string errorMsg)
    {
        System.Text.StringBuilder buf = new System.Text.StringBuilder();

        buf.AppendLine("<script type=\"text/javascript\">");
        buf.AppendFormat("alert('{0}');", errorMsg);
        buf.AppendLine("");
        if (errorMsg == "The information was saved")
        buf.AppendLine("window.location='boats_list.aspx';");
        buf.AppendLine("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "err", buf.ToString());
    }
    private String validr()
    {
            Boolean chk = false;

            //Initialise variables
            string errorMsg = "";
            string msg = "";
            String s = "Phone numbers, email or web address Character Sequences are not allowed in text form.Please remove any Phone numbers, email or web address Character Sequences";



//Check for a Name
if (NVL(Request.Form["txt_Name"], "") == "")
{
    errorMsg += "\\n\\t Name \\t\\t                  - Enter your Name";
}

//Check for a Name
if (NVL(Request.Form["txt_Description"], "") == "")
{
    errorMsg += "\n\t Description \\t\\t                  - Enter your Description";
}


if (IsFieldContainsEmail(NVL(Request.Form["txt_Description"], "")))
{
    errorMsg += "\\n\\t Description \\t\\t   " + s;
}


if ( IsFieldContainsPhone(NVL(Request.Form["txt_Description"], "")))
{
            errorMsg += "\\n\\t Description \\t\\t   "+s;
 
}

if (IsFieldContainsWeb(NVL(Request.Form["txt_Description"], "")))
{
    errorMsg += "\\n\\t Description \\t\\t   " + s;

}

if ( IsFieldContainsEmail(NVL(Request.Form["txt_requirements"], "")))
{
            errorMsg += "\\n\\t Requirements \\t\\t   "+s;
}


if (IsFieldContainsPhone(NVL(Request.Form["txt_requirements"], "")))
{
    errorMsg += "\\n\\t Requirements \\t\\t   " + s;

}

if (IsFieldContainsWeb(NVL(Request.Form["txt_requirements"], "")))
{
    errorMsg += "\\n\\t Requirements \\t\\t   " + s;

}

if (NVL(Request.Form["txt_Make"], "") == ""){
    errorMsg += "\\n\\t Make \\t\\t                  - Enter Make";
}

if (NVL(Request.Form["txt_Model"], "") == ""){
    errorMsg += "\\n\\t Model \\t\\t                  - Enter your Model";
}

if (NVL(Request.Form["txt_Year"], "") == "")
{
    errorMsg += "\\n\\t Year \\t\\t                  - Enter Year";
}
if (NVL(Request.Form["txt_Year"], "") != "")
{
    int num;
    if (!int.TryParse(Request.Form["txt_Year"],out num))
        errorMsg += "\\n\\t Year \\t\\t                  - Enter a Numeric value in Year";
}

if (NVL(Request.Form["txt_size"], "") == "")
{
    errorMsg += "\\n\\t Size \\t\\t                  - Enter Size";
}

    if (Request.Form["cbo_BoatType"].ToString() == "0")
{
    errorMsg += "\\n\\t Boat Type \\t\\t                  - Enter Boat Type";
}

//    if (document.getElementById("txt_MaxPassengers").value == ""){
if (NVL(Request.Form["txt_MaxPassengers"], "") == "")
{
    errorMsg += "\\n\\t MaxPassengers \\t\\t                  - Enter MaxPassengers";
}
//    else
if (NVL(Request.Form["txt_MaxPassengers"], "") != "")
{
    int num;
    if (!int.TryParse(Request.Form["txt_MaxPassengers"],out num))
//    {  if (isNaN(parseInt(document.getElementById("txt_MaxPassengers").value)))
        errorMsg += "\\n\\t MaxPassengers \\t\\t                  - Enter a Numeric value in MaxPassengers field";
}


//    if (document.getElementById("txt_reservation").value == ""){
if (NVL(Request.Form["txt_reservation"], "") == ""){
    errorMsg += "\\n\\t Reservation \\t\\t                  - Enter Reservation";
}
//    //else
//    //{  if (isNaN(parseFloat(document.getElementById("txt_reservation").value)))
//    //	  errorMsg += "\n\t Reservation \t\t                  - Enter a Numeric value in //Reservation field";
//    //}

//    if (document.getElementById("txt_deposit").value == ""){
if (NVL(Request.Form["txt_deposit"], "") == ""){
    errorMsg += "\\n\\t Security Deposit \\t\\t                  - Enter Security Deposit";
}
if (Request.Form["chk_Is_boat_sale"] == "1")
{
    Decimal dnum;
    decimal.TryParse(Request.Form["txt_boat_sale_amount"], out dnum);
    //      if (document.getElementById("txt_boat_sale_amount").value == "")
    if (dnum == 0)
    {
        errorMsg += "\\n\\t Boat Sale Amount \\t\\t                  - Enter Boat Sale Amount";
    }
        //        else   if (isNaN(parseFloat(document.getElementById("txt_boat_sale_amount").value)))
        //          errorMsg += "\n\t Boat Sale Amount \t\t                  - Enter a Numeric value in Boat Sale Amount";
}

// TODO **** Price section check goes here ****	    
	  

////alert("test");


//    //If there is aproblem with the form then display an error
    if (errorMsg != ""){
        msg = "______________________________________________________________\\n\\n";
        msg += "Your enquiry has not been sent because there are problem(s) with the form.\\n";
        msg += "Please correct the problem(s) and re-submit the form.\\n";
        msg += "______________________________________________________________\\n\\n";
        msg += "The following field(s) need to be corrected:\\n";

        errorMsg = msg + errorMsg + "\\n\\n";
    }
//        else {
//        alert(document.getElementById("txt_MaxPassengers").value);
//        }


        return errorMsg;
    }
  private Boolean IsFieldContainsEmail(String em)
  {
    String rex = "([a-zA-Z0-9])+([.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(.[a-zA-Z0-9_-]+)+";
      if (Regex.IsMatch(em, rex))
    return true;
      else
    return false;
   }
  private Boolean IsFieldContainsPhone(String ph)
  {
      String rex = @"\(?\d{3}(\)\s*|-)\d{3}-\d{4}";
      if (Regex.IsMatch(ph, rex))
          return true;
      else
          return false;
  }
  private Boolean IsFieldContainsWeb(String we)
  {
      String rex = "(http:\\/\\/www.|https:\\/\\/www.|ftp:\\/\\/www.|www.){1}([\\w]+)(.[\\w]+){1,2}";
      if (Regex.IsMatch(we, rex))
          return true;
      else
          return false;
  }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string errorMessage;
        errorMessage = validr();
        if (errorMessage.Length > 0)
        {
            createAlertScript(errorMessage);
        }
        else
        {
            saveBoat();
            createAlertScript("The information was saved");
            //Response.Redirect("boats_list.aspx", true);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("boats_list.aspx", true);
    }
    private String saveBoat()
    {
        string errorMsg = "";

        if (Convert.ToString(Session["userID"]) == "")
        {
            Session.Abandon();
            Response.Redirect("/client.net/members.aspx");
        }

        txt_MarinaID = Session["MarinaID"];
        Session.Add("userID", 1);
        //''
        //dim x
        //x=Request.Form("txt")
        //Instantiate Upload Class
        //BoatRenting.clsUpload objUpload = new BoatRenting.clsUpload();
        //Grab the file name
        //strFileName = objUpload.Fields("File1").FileName;
        //dim cnt,fld1
        //cnt=objUpload.Count
        //fld1=objUpload("txt").value
        //fld1=objUpload.Fields("txt").value
        //Compile path to save file to
        //strPath = Server.MapPath("Uploads") & "\" & strFileName
        //Save the binary data to the file system
        //objUpload("File1").SaveAs strPath
        //''
        //Dim objUpload
        //on error resume next
        //Set objUpload = Server.CreateObject("ASPUploadComponent.cUpload")
        //response.Write("er:"&err.description&"/")
        //******************* This should be added in order to work on my machine Manoj ***********
        //strUploadPath = Server.MapPath("\BoatRenting\client\boats\")
        strUploadPath = Server.MapPath("\\client.net\\boats\\");
        //strUploadPath = Server.MapPath("BoatImages\")
        //strUploadPath = Server.MapPath("..\client\boats\")
        //fso = new FileSystemObject();
        txt_BoatID = NVL(Convert.ToString(Request.QueryString["BoatID"]), "0");
        if (txt_BoatID == "0")
        {
            hdn_Action = "N";
        }
        else
        {
            hdn_Action = "E";
        }
        //hdn_Action = NVL(Convert.ToString(hdn_Action), "");
        txt_Name = NVL(Convert.ToString(Request.Form["txt_Name"]), "");
        txt_Description = NVL(Convert.ToString(Request.Form["txt_Description"]), "");
        txt_Make = NVL(Convert.ToString(Request.Form["txt_Make"]), "");
        txt_Model = NVL(Convert.ToString(Request.Form["txt_Model"]), "");
        txt_Year = NVL(Convert.ToString(Request.Form["txt_Year"]), "");
        txt_size = NVL(Convert.ToString(Request.Form["txt_size"]), "");
        cbo_BoatType = NVL(Convert.ToString(Request.Form["cbo_BoatType"]), "0");
        cbo_SubBoatType = NVL(Convert.ToString(Request.Form["cbo_SubBoatType"]), "0");
        txt_MaxPassengers = NVL(Convert.ToString(Request.Form["txt_MaxPassengers"]), "0");
        txt_deposit = NVL(Convert.ToString(Request.Form["txt_deposit"]), "");
        txt_reservation = NVL(Convert.ToString(Request.Form["txt_reservation"]), "0");
        txt_requirements = NVL(Convert.ToString(Request.Form["txt_requirements"]), " ");
        txt_boat_sale_amount = NVL(Convert.ToString(Request.Form["txt_boat_sale_amount"]), "0");
        chk_captain = NVL(Convert.ToString(Request.Form["chk_captain"]), "0");
        if (((Convert.ToString(chk_captain)).Trim()).Length > 0)
        {
            chk_captain = Convert.ToString(Request.Form["chk_captain"]);
        }
        else
        {
            chk_captain = "0";
        }
        if (((Convert.ToString(chk_Is_boat_sale)).Trim()).Length > 0)
        {
            chk_Is_boat_sale = "1";
        }
        else
        {
            chk_Is_boat_sale = "0";
        }
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BOAT_SAVE";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1].Value = hdn_Action;
        cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 1, 0));
        cmd.Parameters["@P_Action"].Value = hdn_Action;
        //cmd.Parameters[2].Value = txt_MarinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
        //cmd.Parameters[3].Value = txt_BoatID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
        //cmd.Parameters[4].Value = txt_Name;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_NAME", adVarChar, adParamInput, 50, 0));
        cmd.Parameters["@P_VC_NAME"].Value = txt_Name;
        //cmd.Parameters[5].Value = txt_Description;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Description", adVarChar, adParamInput, 2000, 0));
        cmd.Parameters["@P_VC_Description"].Value = txt_Description;
        //cmd.Parameters[6].Value = txt_Make;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MAKE", adVarChar, adParamInput, 50, 0));
        cmd.Parameters["@P_VC_MAKE"].Value = txt_Make;
        //cmd.Parameters[7].Value = txt_Model;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MODEL", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_VC_MODEL"].Value = txt_Model;
        //cmd.Parameters[8].Value = txt_size;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_SIZE", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_VC_SIZE"].Value = txt_size;
        //cmd.Parameters[9].Value = Convert.ToInt32(cbo_BoatType);
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BoatTypeID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_BoatTypeID"].Value = Convert.ToInt32(cbo_BoatType);
        //cmd.Parameters[10].Value = Convert.ToInt32(cbo_SubBoatType);
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_SubBoatTypeID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_SubBoatTypeID"].Value = Convert.ToInt32(cbo_SubBoatType);
        //cmd.Parameters[11].Value = txt_MaxPassengers;
        cmd.Parameters.Append(cmd.CreateParameter("@P_in_MaxPassengers", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_in_MaxPassengers"].Value = Convert.ToInt32(txt_MaxPassengers);
        //cmd.Parameters[12].Value = txt_deposit;
        cmd.Parameters.Append(cmd.CreateParameter("@P_nu_deposit", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_nu_deposit"].Value = txt_deposit;
        //cmd.Parameters[13].Value = txt_reservation;
        cmd.Parameters.Append(cmd.CreateParameter("@P_nu_reservation", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_nu_reservation"].Value = txt_reservation;
        //cmd.Parameters[14].Value = txt_requirements;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_requirements", adVarChar, adParamInput, 2000, 0));
        cmd.Parameters["@P_VC_requirements"].Value = txt_requirements;
        //cmd.Parameters[15].Value = chk_captain;
        cmd.Parameters.Append(cmd.CreateParameter("@P_TI_captain", adTinyInt, adParamInput, 4, 0));
        cmd.Parameters["@P_TI_captain"].Value = Convert.ToInt16(chk_captain);
        //cmd.Parameters[16].Value = Convert.ToInt32(Session["userID"]);
        cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
        //cmd.Parameters[17].Value = txt_Year;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Year", adVarChar, adParamInput, 4, 0));
        cmd.Parameters["@P_VC_Year"].Value = txt_Year;
        //cmd.Parameters[18].Value = chk_Is_boat_sale;
        cmd.Parameters.Append(cmd.CreateParameter("@P_Is_Boat_Sale", adTinyInt, adParamInput, 4, 0));
        cmd.Parameters["@P_Is_Boat_Sale"].Value = Convert.ToInt16(chk_Is_boat_sale);
        //cmd.Parameters[19].Value = txt_boat_sale_amount;
        cmd.Parameters.Append(cmd.CreateParameter("@P_Boat_Sale_Amount", adDecimal, adParamInput, 20, 0));
        cmd.Parameters["@P_Boat_Sale_Amount"].Value = Convert.ToDecimal(txt_boat_sale_amount);
        cmd.Execute();
        if (hdn_Action == "N")
        {
            //txt_BoatID = Convert.ToInt32(cmd.Parameters[3].Value);
        }
        cmd2 = new Command();
        cmd2.ActiveConnection = oConn;
        cmd2.CommandText = "SP_BR_PRICExBOATxTYPERENT_DEL";
        cmd2.CommandType = adCmdStoredProc;
        //cmd.Parameters[2].Value = txt_MarinaID;
        cmd2.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd2.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
        //cmd.Parameters[3].Value = txt_BoatID;
        cmd2.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd2.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
        cmd2.Execute();
        for (i = 1; i <= 4; i += 1)
        {
            txt_TypeRentID = i;
            if (((Convert.ToString(txt_weekday)).Trim()).Length > 0)
            {
                txt_weekday = NVL(Convert.ToString(txt_weekday), "0");
            }
            else
            {
                txt_weekday = "0";
            }
            if (((Convert.ToString(txt_weekend)).Trim()).Length > 0)
            {
                txt_weekend = NVL(Convert.ToString(txt_weekend), "0");
            }
            else
            {
                txt_weekend = "0";
            }
            if (((Convert.ToString(txt_holiday)).Trim()).Length > 0)
            {
                txt_holiday = NVL(Convert.ToString(txt_holiday), "0");
            }
            else
            {
                txt_holiday = "0";
            }
            //txt_hoursfrom = Convert.ToInt32(txt_hoursfrom);
          //  txt_hoursto = Convert.ToInt32(txt_hoursto);


           if (!((txt_weekday == "0" && txt_weekend == "0" && txt_holiday == "0")))
            {
                cmd.CommandText = "SP_BR_PRICExBOATxTYPERENT_SAVE";
                cmd.CommandType = adCmdStoredProc;
                //cmd.Parameters[1].Value = "N";
                cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 1, 0));
                cmd.Parameters["@P_Action"].Value = "N";
                //hdn_Action
                //cmd.Parameters[2].Value = txt_MarinaID;
                cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@P_IN_MarinaID"].Value = Convert.ToInt32(txt_MarinaID);
                //cmd.Parameters[3].Value = txt_BoatID;
                cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BoatID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@P_IN_BoatID"].Value = Convert.ToInt32(txt_BoatID);
                //cmd.Parameters[4].Value = txt_TypeRentID;
                cmd.Parameters.Append(cmd.CreateParameter("@P_IN_TypeRentID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@P_IN_TypeRentID"].Value = Convert.ToInt32(txt_TypeRentID);
                //cmd.Parameters[5].Value = txt_weekday;
                cmd.Parameters.Append(cmd.CreateParameter("@P_NU_PriceWeekDay", adDecimal, adParamInput, 20, 0));
                cmd.Parameters["@P_NU_PriceWeekDay"].Value = Convert.ToDecimal(txt_weekday);
                //cmd.Parameters[6].Value = txt_weekend;
                cmd.Parameters.Append(cmd.CreateParameter("@P_NU_PriceWeekEnd", adDecimal, adParamInput, 20, 0));
                cmd.Parameters["@P_NU_PriceWeekEnd"].Value = Convert.ToDecimal(txt_weekend);
                //cmd.Parameters[7].Value = txt_holiday;
                cmd.Parameters.Append(cmd.CreateParameter("@P_NU_PriceHoliday", adDecimal, adParamInput, 20, 0));
                cmd.Parameters["@P_NU_PriceHoliday"].Value = Convert.ToDecimal(txt_holiday);
                //cmd.Parameters[8].Value = txt_hoursfrom;
                cmd.Parameters.Append(cmd.CreateParameter("@P_Hours_From", adVarChar, adParamInput, 50, 0));
                cmd.Parameters["@P_Hours_From"].Value = txt_hoursfrom;
                //cmd.Parameters[9].Value = txt_hoursto;
                cmd.Parameters.Append(cmd.CreateParameter("@P_Hours_To", adVarChar, adParamInput, 50, 0));
                cmd.Parameters["@P_Hours_To"].Value = txt_hoursto;
                //cmd.Parameters[10].Value = Convert.ToInt32(Session["userID"]);
                cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
                cmd.Execute();
            }
        }
        return errorMsg;
    }
}

} 
