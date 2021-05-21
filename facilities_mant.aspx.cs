using nce.adosql;
using Microsoft.VisualBasic;
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
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Mail;
namespace BoatRenting
{

  public partial class facilities_mant_aspx_cs : System.Web.UI.Page
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
    public string hdn_Action = "";
    public string txt_marinaID = "";
    public string hdn_Redirect = "";
    public string hdn_ChangeState = "";
    public object countryID = null;
    public string txt_ContactName = "";
    public string txt_BusinessName = "";
    public string txt_MarinaName = "";
    public string txt_addressLine1 = "";
    public string txt_addressLine2 = "";
    public string txt_city = "";
    public object cbo_State = null;
    public string txt_zip = "";
    public string cbo_Country = "";
    public string cbo_BodyWater = "";
    public string txt_phone = "";
    public string txt_fax = "";
    public string txt_tax = "";
    public string txt_email = "";
    public string cbo_multipleLocations = "";
    public string cbo_accomodations = "";
    public string cbo_captain = "";
    public string txta_depositPolicy = "";
    public string txta_facilityDirections = "";
    public string txta_facilityArea = "";
    public string txt_start = "";
    public string txt_end = "";
    public string txt_rating = "";
    public string txt_facilitywebsite = "";
    public string txt_displayadlandingpage = "";
    public string txt_displayadtype = "";
    public Command cmd = null;
    public Recordset rs = null;
    public Command cmd2 = null;
    public Recordset rs2 = null;
    public string txt_fee = "";
    public string txt_feeType = "";
    public object nPag = null;
    public object txt_explain = null;
    public string txt_MarinaID = "";
    public string txt_marinaName = "";
    public string txt_usser = "";
    public string txt_pass = "";
    public int txt_UserID = 0;
    public string strBody = "";
    public CDO.Message oNewMail = null;

    void Page_Load(object source, EventArgs e)
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        hdn_Action = "N";
        txt_marinaID = Request["MarinaID"];
        //'Response.write ("Action" & Request("hdn_Action") & "<BR>")
        //'Response.write ("Action" & Request("MarinaID"))
        hdn_Redirect = Request["hdn_Redirect"];
        hdn_ChangeState = NVL(Request["hdn_ChangeState"], "");
        //countryID = 0;
        countryID = cboCountry.SelectedIndex;
        countryID = Request.Form["cboCountry"];
        //if (!(Request["country"] == ""))
        //{
        //    countryID = Request["country"];
        //}
        txt_ContactName = NVL(Request["txt_ContactName"], "");
        txt_BusinessName = NVL(Request["txt_BusinessName"], "");
        txt_MarinaName = NVL(Request["txt_MarinaName"], "");
        txt_addressLine1 = NVL(Request["txt_addressLine1"], "");
        txt_addressLine2 = NVL(Request["txt_addressLine2"], "");
        txt_city = NVL(Request["txt_city"], "");
        cbo_State = 0;
        //'NVL(Request("cbo_State"),0)
        txt_zip = NVL(Request["txt_zip"], "");
        cbo_Country = NVL(Request["cbo_Country"], "0");
        cbo_BodyWater = NVL(Request["cbo_BodyWater"], "");
        txt_phone = NVL(Request["txt_phone"], "");
        txt_fax = NVL(Request["txt_fax"], "");
        txt_tax = NVL(Request["txt_tax"], "0");
        txt_email = NVL(Request["txt_email"], "");
        cbo_multipleLocations = NVL(Request["cbo_multipleLocations"], "");
        cbo_accomodations = NVL(Request["cbo_accomodations"], "");
        cbo_captain = NVL(Request["cbo_captain"], "");
        txta_depositPolicy = NVL(Request["txta_depositPolicy"], "");
        txta_facilityDirections = NVL(Request["txta_facilityDirections"], "");
        txta_facilityArea = NVL(Request["txta_facilityArea"], "");
        txt_start = NVL(Request["txt_start"], "");
        txt_end = NVL(Request["txt_end"], "");
        txt_rating = NVL(Request["txt_rating"], "0");
        txt_facilitywebsite = NVL(Request["facilityWebsite"], "");
        txt_displayadlandingpage = NVL(Request["displayadlandingpage"], "");
        txt_displayadtype = NVL(Request["displayadtype"], "");
        if (hdn_Action == "N" && !IsPostBack)
        {
            loadCountry();
            Session.Add("MarinaID", txt_marinaID);
            cmd = new Command();
            rs = new Recordset();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_MARINA_GET";
            cmd.CommandType = adCmdStoredProc;
            //cmd.Parameters[1].Value = Convert.ToInt32(txt_marinaID);
            cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_marinaID);
            rs = cmd.Execute();
            txt_ContactName = NVL(Convert.ToString(rs.Fields["vc_ContactName"].Value), "");
            txt_BusinessName = NVL(Convert.ToString(rs.Fields["vc_BusinessName"].Value), "");
            txt_MarinaName = NVL(Convert.ToString(rs.Fields["vc_MarinaName"].Value), "");
            txt_addressLine1 = NVL(Convert.ToString(rs.Fields["vc_addressLine1"].Value), "");
            txt_addressLine2 = NVL(Convert.ToString(rs.Fields["vc_addressLine2"].Value), "");
            txt_city = NVL(Convert.ToString(rs.Fields["vc_city"].Value), "");
            txt_zip = NVL(Convert.ToString(rs.Fields["ch_zip"].Value), "");
            //if (hdn_ChangeState == "")
            //{
            //    cbo_Country = NVL(Convert.ToString(rs.Fields["in_CountryID"].Value), "0");
            //    cbo_State = NVL(Convert.ToString(rs.Fields["in_StateID"].Value), "0");
            //}
            if (Convert.ToInt32(cbo_State) > 51)
            {
                cbo_State = Convert.ToDouble(cbo_State) - 51.0;
            }
            //countryID = cbo_Country;
            cbo_BodyWater = NVL(Convert.ToString(rs.Fields["vc_BodyWater"].Value), "");
            txt_phone = NVL(Convert.ToString(rs.Fields["vc_phone"].Value), "");
            txt_fax = NVL(Convert.ToString(rs.Fields["vc_fax"].Value), "");
            txt_tax = NVL(Convert.ToString(rs.Fields["nu_tax"].Value), "0");
            txt_email = NVL(Convert.ToString(rs.Fields["vc_email"].Value), "");
            cbo_multipleLocations = NVL(Convert.ToString(rs.Fields["ch_multipleLocations"].Value), "");
            cbo_accomodations = NVL(Convert.ToString(rs.Fields["ch_accomodations"].Value), "");
            //'	txt_explain = NVL(rs("vc_explain"),"")
            //'	cbo_securityDeposit = NVL(rs("ch_securityDeposit"),"")
            cbo_captain = NVL(Convert.ToString(rs.Fields["ti_captain"].Value), "");
            txta_depositPolicy = NVL(Convert.ToString(rs.Fields["vc_depositPolicy"].Value), "");
            txta_facilityDirections = NVL(Convert.ToString(rs.Fields["vc_facilityDirections"].Value), "");
            txta_facilityArea = NVL(Convert.ToString(rs.Fields["vc_facilityArea"].Value), "");
            txt_start = NVL(Convert.ToString(rs.Fields["vc_startHour"].Value), "");
            txt_end = NVL(Convert.ToString(rs.Fields["vc_endHour"].Value), "");
            txt_fee = NVL(Convert.ToString(rs.Fields["nu_fee"].Value), "15");
            txt_feeType = NVL(Convert.ToString(rs.Fields["ch_feeType"].Value), "1");
            txt_rating = NVL(Convert.ToString(rs.Fields["in_rating"].Value), "0");
            txt_facilitywebsite = NVL(Convert.ToString(rs.Fields["facilityWebsite"].Value), "");
            txt_displayadlandingpage = NVL(Convert.ToString(rs.Fields["displayadlandingpage"].Value), "");
            txt_displayadtype = NVL(Convert.ToString(rs.Fields["displayadtype"].Value), "");
        }

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

    private void loadStates()
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstring");
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_STATE_LIST @CountryID=" + cboCountry.SelectedValue ;
        cmd.CommandType = adCmdStoredProc;
        SqlDataAdapter adp = new SqlDataAdapter(cmd.CommandText, con);
        DataTable dt = new DataTable();
        DataRow dr = dt.NewRow();
        try
        {
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
                dr = dt.NewRow();
            dr["in_stateID"] = 0;
            dr["vc_name"] = "[Select]";

            {
                cboStates.DataSource = dt;
                cboStates.DataValueField = "in_stateID";
                cboStates.DataTextField = "vc_name";
                dt.Rows.Add(dr);
                cboStates.DataBind();
                cboStates.SelectedIndex = 0;
                if (Convert.ToInt32(cboCountry.SelectedValue) > 0)
                {
                    cboStates.SelectedIndex = cboStates.Items.IndexOf(cboStates.Items.FindByValue(cbo_State.ToString()));
                }
                else
                {
                    cboStates.SelectedIndex = cboStates.Items.IndexOf(cboStates.Items.FindByText("[Select]"));
                }
            }
        }
        catch (Exception ex)
        {
            createAlertScript(ex.Message);
        }
    }
    public object StateName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_STATE_LIST";
        cmd.CommandType = adCmdStoredProc;
        cmd.Parameters.Refresh();
        cmd.Parameters["@CountryID"].Value = Convert.ToInt32(countryID);
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_State\" class=\"state\" tabindex=\"9\" >\r\n");
        Response.Write("	<option value=\"0\">[Select]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToInt32(rs.Fields["in_StateID"].Value) == Convert.ToInt32(cbo_State) && Convert.ToInt32(cbo_State) != 0)
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_stateID"].Value);
            //Response.Write("\">");
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        if (Convert.ToInt32(countryID) == 1)
        {
            if (Convert.ToInt32(cbo_State) == 151)
            {
                Response.Write("  <script> document.frm_facilities_mant.cbo_State.selectedIndex = 1 </script>\r\n");
            }
            else
            {
                Response.Write("	<script> document.frm_facilities_mant.cbo_State.selectedIndex = ");
                Response.Write((Convert.ToDouble(cbo_State) + 1.0));
                Response.Write(" </script>\r\n");
            }
        }
        else
        {
            Response.Write("  \r\n");
            Response.Write("  <script> document.frm_facilities_mant.cbo_State.selectedIndex = ");
            Response.Write(cbo_State);
            Response.Write(" </script>\r\n");
            Response.Write("  \r\n");
        }
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
        Response.Write("	<select name=\"cbo_Country\" class=\"country\" tabindex=\"19\" onchange=\"javascript:LoadStates();\">\r\n");
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
            //Response.Write("\"  >");
            Response.Write("\"   ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_Name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        Response.Write("	<script> document.frm_facilities_mant.cbo_Country.selectedIndex = ");
        Response.Write(countryID);
        Response.Write(" </script>\r\n");
        return null;
    }

    private void loadCountry()
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstring");
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_COUNTRY_LIST";
        cmd.CommandType = adCmdStoredProc;
        SqlDataAdapter adp = new SqlDataAdapter(cmd.CommandText,con);
        DataTable dt = new DataTable();
        DataRow dr = dt.NewRow();
        try
        {
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            dr = dt.NewRow();
            dr["in_countryID"] = 0;
            dr["vc_name"] = "[Select]";

            {
                cboCountry.DataSource = dt;
                cboCountry.DataValueField = "in_countryID";
                cboCountry.DataTextField = "vc_name";
                dt.Rows.Add(dr);
                cboCountry.DataBind();
                cboCountry.SelectedIndex = 0;
                cboCountry.SelectedIndex = cboCountry.Items.IndexOf(cboCountry.Items.FindByText("[Select]"));
            }
        }
        catch (Exception ex)
        {
            createAlertScript(ex.Message);
        }
    }
      
      public object BodyWaterName() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_BODYWATER_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_BodyWater\" class=\"body_of_water\" >\r\n");
        Response.Write("	<option value=\"0\">[Select]</option>\r\n");
        while(!(rs.Eof))
        {
            if (Convert.ToString(rs.Fields["in_BodyWaterID"].Value) == cbo_BodyWater)
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_BodyWaterID"].Value);
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
    private void createAlertScript(string errorMsg)
    {
        System.Text.StringBuilder buf = new System.Text.StringBuilder();

        //StreamReader streamReader = new StreamReader("C:\\Inetpub\\wwwroot\\BoatRenting\\client.net\\admin\\validar.js");
        //string text = streamReader.ReadToEnd();
        //streamReader.Close(); buf.AppendLine("<script type=\"text/javascript\">");

        buf.AppendLine("<script type=\"text/javascript\">");
        buf.AppendFormat("alert('{0}');", errorMsg);
        buf.AppendLine("");
        if (errorMsg == "The information was saved")
            buf.AppendLine("window.location='facilities_successful.aspx';");
        buf.AppendLine("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "err", buf.ToString());
        //ClientScript.RegisterStartupScript(this.GetType(), "err", text, false);
    }
    private String validr()
    {
        string errorMsg = "";
        string msg = "";
        String s = "Phone numbers, email or web address Character Sequences are not allowed in text form.Please remove any Phone numbers, email or web address Character Sequences";

    if (chkUser() == "1"){
        errorMsg += "\\n\\t E-mail or User Name \\t                  - Name is already registered in the system";
    }

    if ((NVL(Request.Form["txt_contactName"], "") == "")){
	errorMsg += "\\n\\t Contact Name \\t                  - Enter your Contact Name";
	}

    if ((NVL(Request.Form["txt_pass"], "") == ""))
    {
        errorMsg += "\\n\\t Password \\t                  - Password cannot be blank";
    }

    if ((NVL(Request.Form["txt_businessName"], "") == ""))
    {
		errorMsg += "\\n\\t Bussiness Name \\t                  - Enter your Bussiness Name";
	}

	if (NVL(Request.Form["cbo_State"], "") == "0" &&
		(NVL(Request.Form["cbo_Country"], "") == "1"  ||/*USA*/
		 NVL(Request.Form["cbo_Country"], "") == "5" /*Canada*/
		)
		){
		errorMsg += "\\n\\t State Name \\t                  - Enter State";
	}
	if (NVL(Request.Form["cbo_Country"], "") == "0"){
		errorMsg += "\\n\\t Country Name \\t                  - Enter Country";
	}
	if (NVL(Request.Form["cbo_BodyWater"], "") == ""){
		errorMsg += "\\n\\t Body of Water \\t                  - Enter Body of Water";
	}


if ( IsFieldContainsEmail(NVL(Request.Form["txt_addressLine1"], "")))
{
		errorMsg += "\\n\\t Address Line 1  \\t\\t                 "+s; 
}

if ( IsFieldContainsPhone(NVL(Request.Form["txt_addressLine1"], "")))
{
		errorMsg += "\\n\\t Address Line 1 \\t\\t                 "+s;
 
}

if ( IsFieldContainsWeb(NVL(Request.Form["txt_addressLine1"], "")))
{
		errorMsg += "\\n\\t Address Line 1 \\t\\t           "+s;
 
}

if ( IsFieldContainsEmail(NVL(Request.Form["txta_facilityDirections"], "")))
{
		errorMsg += "\\n\\t Facility Direction  \\t\\t                "+s;
}

if ( IsFieldContainsPhone(NVL(Request.Form["txta_facilityDirections"], "")))
{
		errorMsg += "\\n\\t Facility Direction  \\t\\t              "+s;
}

if ( IsFieldContainsWeb(NVL(Request.Form["txta_facilityDirections"], "")))
{
		errorMsg += "\\n\\t Facility Direction  \\t\\t               "+s;
}


if (IsFieldContainsEmail(NVL(Request.Form["txta_depositPolicy"], "")))
{
    errorMsg += "\\n\\t Facility Cancellation Policy  \\t\\t                " + s;

}

if (IsFieldContainsPhone(NVL(Request.Form["txta_depositPolicy"], "")))
{
    errorMsg += "\\n\\t Facility Cancellation Policy  \\t\\t              " + s;
}

if (IsFieldContainsWeb(NVL(Request.Form["txta_depositPolicy"], "")))
{
    errorMsg += "\\n\\t Facility Cancellation Policy  \\t\\t            " + s;
}

if (IsFieldContainsEmail(NVL(Request.Form["txta_facilityArea"], "")))
{
    errorMsg += "\\n\\t Facility Area + Attraction  \\t\\t                " + s;
}

if (IsFieldContainsPhone(NVL(Request.Form["txta_facilityArea"], "")))
{
    errorMsg += "\\n\\t Facility Area + Attraction  \\t\\t            " + s;
}

if (IsFieldContainsWeb(NVL(Request.Form["txta_facilityArea"], "")))
{
    errorMsg += "\\n\\t Facility Area + Attraction  \\t\\t  " + s;
}

	if (NVL(Request.Form["txt_phone"], "") == ""){
		errorMsg += "\\n\\t Phone \\t\\t                  - Enter Phone";
	}

	if (NVL(Request.Form["txt_email"], "") == ""){
		errorMsg += "\\n\\t E-mail \\t\\t                  - Write your E-mail";
	}

/*
	if (document.getElementById("txt_email").value != "")
	{
		strEmail = document.getElementById("txt_email").value;
		if (strEmail.length>0)
		{
			if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
			{
				errorMsg += "\n\t E-mail \t\t                  - Your E-mail address is invalid";
			}
		}
	}
*/

	if (NVL(Request.Form["txt_tax"], "") == ""){
		errorMsg += "\\n\\t Tax rate \\t\\t                  - Enter Tax Rate";
	}

	if (Request.Form["rdo_fee[0]"] == "1"){
		if (NVL(Request.Form["txt_fee"], "") == ""){
			errorMsg += "\\n\\t Commission Fee \\t\\t  - Enter Percentage";
		}
	}

	if (Request.Form["rdo_fee[1]"] == "1"){
		if (NVL(Request.Form["txt_fee2"], "") == ""){
			errorMsg += "\\n\\t Commission Fee \\t\\t  - Enter Flat Rate";
		}
	}

if (Request.Form["rdo_fee[2]"] == "1"){
		if (NVL(Request.Form["txt_fee3"], "") == ""){
			errorMsg += "\\n\\t Display Ad Fee \\t\\t  - Enter Display Ad";
		}
		
		if ((NVL(Request.Form["txt_displayadtype[0]"], "Z") != "Y") && (NVL(Request.Form["txt_displayadtype[1]"], "Z") != "Y")) 
	
	    {
	     errorMsg += "\\n\\t Display Ad Type \\t\\t- Enter Display Ad Type";
	     
	    }	
	
	}

    //if (NVL(Request.Form["txt_facilitywebsite"], "") == ""){
    //    errorMsg += "\\n\\t Facility Web Site \\t\\t  - Enter Your Website address. If you dont have a Website, enter www.BoatRenting.com";
    //}
	
	
	if (NVL(Request.Form["txt_start"], "") == ""){
		errorMsg += "\\n\\t Business Hours \\t\\t  - Open";
	}


	if (NVL(Request.Form["txt_end"], "") == ""){
		errorMsg += "\\n\\t Business Hours \\t\\t  - Closed";
	}

    if (Request.Form["chk_accept"] != "ON")
    {
        errorMsg += "\\n\\t  You have to accept the Terms and Conditions to register your facility";
    }

        //    //If there is aproblem with the form then display an error
        if (errorMsg != "")
        {
            msg = "______________________________________________________________\\n\\n";
            msg += "Your enquiry has not been sent because there are problem(s) with the form.\\n";
            msg += "Please correct the problem(s) and re-submit the form.\\n";
            msg += "______________________________________________________________\\n\\n";
            msg += "The following field(s) need to be corrected:\\n";

            errorMsg = msg + errorMsg + "\\n\\n";
        }

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
        //String rex = "[A-Z0-9]{7}|[A-Z0-9][A-Z0-9-]{7}";
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
            save();
            sendEmail();  
            createAlertScript("The information was saved");
        }
    }

    private String chkUser()
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
    cmd2.CommandText = "SP_BR_CLIENT_USERNAME_EXISTS";
    cmd2.CommandType = adCmdStoredProc;
    //cmd2.Parameters[1] = Request.Form["txt_usser"];
    cmd2.Parameters.Append(cmd2.CreateParameter("@p_vc_username", adVarChar, adParamInput, 100, 0));
    cmd2.Parameters["@p_vc_username"].Value = Request.Form["txt_usser"];
    rs2.Open(cmd2);
    return (Convert.ToString(rs2.Fields[0].Value));
    }

    private String save()
    {
        string errorMsg = "";

        //if (Convert.ToString(Session["userID"]) == "")
        //{
        //    Session.Abandon();
        //    Response.Redirect("/members.aspx");
        //}

        hdn_Action = Request["hdn_Action"];
        txt_MarinaID = NVL(Request["hdn_MarinaID"], "0");
        Session.Add("userID", 1);
        txt_ContactName = NVL(Request.Form["txt_ContactName"], "");
        txt_BusinessName = NVL(Request.Form["txt_BusinessName"], "");
        txt_marinaName = NVL(Request.Form["txt_marinaName"], "");
        txt_addressLine1 = NVL(Request.Form["txt_addressLine1"], "");
        txt_addressLine2 = NVL(Request.Form["txt_addressLine2"], "");
        txt_city = NVL(Request.Form["txt_city"], "");
        cbo_State = NVL(Request.Form["cboStates"], "0");
        txt_zip = NVL(Request.Form["txt_zip"], "");
        cbo_Country = NVL(Request.Form["cboCountry"], "0");
        cbo_BodyWater = NVL(Request.Form["cbo_BodyWater"], "");
        txt_phone = NVL(Request.Form["txt_phone"], "");
        txt_fax = NVL(Request.Form["txt_fax"], "");
        txt_tax = NVL(Request.Form["txt_tax"], "0");
        txt_email = NVL(Request.Form["txt_email"], "");
        cbo_multipleLocations = NVL(Request.Form["cbo_multipleLocations"], "");
        cbo_accomodations = NVL(Request.Form["cbo_accomodations"], "");
        txt_usser = NVL(Request.Form["txt_usser"], "");
        txt_pass = NVL(Request.Form["txt_pass"], "");
        //txt_explain = NVL(Request.Form("txt_explain"),"")
        //cbo_securityDeposit = NVL(Request.Form("cbo_securityDeposit"),"")
        txta_depositPolicy = NVL(Request.Form["txta_depositPolicy"], "");
        cbo_captain = NVL(Request.Form["cbo_captain"], "0");
        txta_facilityDirections = NVL(Request.Form["txta_facilityDirections"], "");
        txta_facilityArea = NVL(Request.Form["txta_facilityArea"], "");
        txt_start = NVL(Request.Form["txt_start"], "");
        txt_end = NVL(Request.Form["txt_end"], "");

        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_MARINA_CLIENT_SAVE";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = hdn_Action;
        cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 1, 0));
        cmd.Parameters["@P_Action"].Value = hdn_Action;
        //cmd.Parameters[2].Value = txt_MarinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_marinaID", adInteger, adParamOutput, 4, 0));
        //cmd.Parameters["@P_IN_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
        //cmd.Parameters[3] = txt_ContactName;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_ContactName", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_VC_ContactName"].Value = txt_ContactName;
        //cmd.Parameters[4] = txt_BusinessName;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_BusinessName", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_VC_BusinessName"].Value = txt_BusinessName;
        //cmd.Parameters[5] = txt_marinaName;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MarinaName", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_VC_MarinaName"].Value = txt_marinaName;
        //cmd.Parameters[6] = txt_addressLine1;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_AddressLine1", adVarChar, adParamInput, 200, 0));
        cmd.Parameters["@P_VC_AddressLine1"].Value = txt_addressLine1;
        //cmd.Parameters[7] = txt_addressLine2;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_AddressLine2", adVarChar, adParamInput, 200, 0));
        cmd.Parameters["@P_VC_AddressLine2"].Value = txt_addressLine2;
        //cmd.Parameters[8] = txt_city;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_city", adVarChar, adParamInput, 50, 0));
        cmd.Parameters["@P_VC_city"].Value = txt_city;
        //cmd.Parameters[9] = Convert.ToInt32(cbo_State);
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_StateID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_StateID"].Value = Convert.ToInt32(cbo_State);
        //cmd.Parameters[10] = txt_zip;
        cmd.Parameters.Append(cmd.CreateParameter("@P_CH_zip", adVarChar, adParamInput, 5, 0));
        cmd.Parameters["@P_CH_zip"].Value = txt_zip;
        //cmd.Parameters[11] = Convert.ToInt32(cbo_Country);
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_CountryID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_CountryID"].Value = Convert.ToInt32(cbo_Country);
        //cmd.Parameters[12] = cbo_BodyWater;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_BodyWater", adVarChar, adParamInput, 200, 0));
        cmd.Parameters["@P_VC_BodyWater"].Value = cbo_BodyWater;
        //cmd.Parameters[13] = txt_phone;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Phone", adVarChar, adParamInput, 20, 0));
        cmd.Parameters["@P_VC_Phone"].Value = txt_phone;
        //cmd.Parameters[14] = txt_fax;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Fax", adVarChar, adParamInput, 20, 0));
        cmd.Parameters["@P_VC_Fax"].Value = txt_fax;
        //cmd.Parameters[15] = cbo_multipleLocations;
        cmd.Parameters.Append(cmd.CreateParameter("@P_CH_multipleLocations", adVarChar, adParamInput, 1, 0));
        cmd.Parameters["@P_CH_multipleLocations"].Value = cbo_multipleLocations;
        //cmd.Parameters[16] = cbo_accomodations;
        cmd.Parameters.Append(cmd.CreateParameter("@P_CH_accomodations", adVarChar, adParamInput, 1, 0));
        cmd.Parameters["@P_CH_accomodations"].Value = cbo_accomodations;
        //cmd.Parameters[17] = cbo_captain;
        cmd.Parameters.Append(cmd.CreateParameter("@P_TI_captain", adTinyInt, adParamInput, 4, 0));
        cmd.Parameters["@P_TI_captain"].Value = Convert.ToInt16(cbo_captain);
        //.Parameters(18)=txt_explain
        //cmd.Parameters[18] = Convert.ToInt32(Session["userID"]);
        cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
        //.Parameters(20)=cbo_securityDeposit
        //cmd.Parameters[19] = txta_depositPolicy.Substring(0, 1000);
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_depositPolicy", adVarChar, adParamInput, 1000, 0));
        cmd.Parameters["@P_VC_depositPolicy"].Value = txta_depositPolicy; //.Substring(0, 1000);
        //cmd.Parameters[20] = txta_facilityDirections.Substring(0, 1000);
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_facilityDirections", adVarChar, adParamInput, 1000, 0));
        cmd.Parameters["@P_VC_facilityDirections"].Value = txta_facilityDirections; //.Substring(0, 1000);
        //cmd.Parameters[21] = txta_facilityArea.Substring(0, 1000);
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_facilityArea", adVarChar, adParamInput, 1000, 0));
        cmd.Parameters["@P_VC_facilityArea"].Value = txta_facilityArea; //.Substring(0, 1000);
        //cmd.Parameters[22] = txt_tax;
        cmd.Parameters.Append(cmd.CreateParameter("@P_nu_tax", adNumeric, adParamInput, 12, 0));
        cmd.Parameters["@P_nu_tax"].Value = Convert.ToDecimal(txt_tax);
        //cmd.Parameters[23] = txt_email;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Email1", adVarChar, adParamInput, 100, 0));
        cmd.Parameters["@P_VC_Email1"].Value = txt_email;
        //cmd.Parameters[24] = txt_start;
        cmd.Parameters.Append(cmd.CreateParameter("@P_vc_startHour", adVarChar, adParamInput, 8, 0));
        cmd.Parameters["@P_vc_startHour"].Value = txt_start;
        //cmd.Parameters[25] = txt_end;
        cmd.Parameters.Append(cmd.CreateParameter("@P_vc_endHour", adVarChar, adParamInput, 8, 0));
        cmd.Parameters["@P_vc_endHour"].Value = txt_end;
        cmd.Execute();
        txt_MarinaID = cmd.Parameters["@P_IN_marinaID"].Value.ToString();

        txt_UserID = 0;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_USER_SAVE";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = "N";
        cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 1, 0));
        cmd.Parameters["@P_Action"].Value = "N";
        //cmd.Parameters[2] = txt_marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
        //cmd.Parameters[3] = txt_UserID;
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_UserID"].Value = Convert.ToInt32(txt_UserID);
        //cmd.Parameters[4] = txt_usser;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_UserName", adVarChar, adParamInput, 50, 0));
        cmd.Parameters["@P_VC_UserName"].Value = txt_usser;
        //cmd.Parameters[5] = txt_pass;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Password", adVarChar, adParamInput, 50, 0));
        cmd.Parameters["@P_VC_Password"].Value = txt_pass;
        //cmd.Parameters[6] = 3;
        //User level
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserLevelID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_UserLevelID"].Value = 3;
        //cmd.Parameters[7] = Convert.ToInt32(Session["userID"]);
        cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
        cmd.Execute();

        return errorMsg;
    }
    private void sendEmail()
    {
        //sends email
        strBody = "<html>";
        strBody = strBody + "<head>";
        strBody = strBody + "<title>Welcome to BoatRenting.com!</title>";
        //strBody = strBody +"<link href='http://69.18.177.23/client/br.css' rel='stylesheet' type='text/css'>"
        strBody = strBody + "<style type='text/css'>";
        strBody = strBody + "	#forgotten_password {";
        strBody = strBody + "	width: 500px;";
        strBody = strBody + "	margin-top: 20px;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	padding-bottom: 10px;";
        strBody = strBody + "	margin-left: auto;";
        strBody = strBody + "	margin-right: auto;";
        strBody = strBody + "	border: 1px solid #CCCCCC;";
        strBody = strBody + "	}";
        strBody = strBody + "#forgotten_password_title {";
        strBody = strBody + "	width: 100%;";
        strBody = strBody + "	clear: none;";
        strBody = strBody + "	background-color: #E9EDF1;";
        strBody = strBody + "	padding-top: 10px;";
        strBody = strBody + "	padding-bottom: 10px;";
        strBody = strBody + "	text-indent: 10px;";
        strBody = strBody + "	font-size: 10pt;";
        strBody = strBody + "	font-weight: bold;";
        strBody = strBody + "	color: #333;";
        strBody = strBody + "	}";
        strBody = strBody + "#forgotten_password_form {";
        strBody = strBody + "	width: 100%;";
        strBody = strBody + "	height: 20px;";
        strBody = strBody + "	margin-top: 10px;";
        strBody = strBody + "	margin-bottom: 20px;";
        strBody = strBody + "	}";
        strBody = strBody + "#forgotten_password a.button {";
        strBody = strBody + "	width: 100px;";
        strBody = strBody + "	text-decoration: none;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	display: block;";
        strBody = strBody + "	background-color: #FF9933;";
        strBody = strBody + "	padding-top: 1px;";
        strBody = strBody + "	padding-bottom: 1px;";
        strBody = strBody + "	padding-left: 10px;";
        strBody = strBody + "	padding-right: 10px;";
        strBody = strBody + "	font-weight: bold;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	margin: auto;";
        strBody = strBody + "	margin-bottom: 10px;}";
        strBody = strBody + "#forgotten_password a.button:hover {";
        strBody = strBody + "	text-decoration: underline;";
        strBody = strBody + "	}";
        strBody = strBody + "#footer_details {";
        strBody = strBody + "	padding-left: 8px;";
        strBody = strBody + "	font-size: 7pt;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	height: 10px;";
        strBody = strBody + "	line-height: 8px;";
        strBody = strBody + "	}";
        strBody = strBody + "#footer_details a{";
        strBody = strBody + "	font-size: 8pt;";
        strBody = strBody + "	color: #ccc;";
        strBody = strBody + "	text-decoration: none;";
        strBody = strBody + "	}";
        strBody = strBody + "#footer_details a:hover {";
        strBody = strBody + "	font-size: 8pt;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	font-weight: normal;";
        strBody = strBody + "	}";
        strBody = strBody + "</style>";
        strBody = strBody + "</head>";
        strBody = strBody + "<body>";
        strBody = strBody + "<table cellpadding='0' cellspacing='0' border='0'>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' height='78' valign='middle' align='left' bgcolor='#4D8DD5'><img src='http://www.boatrenting.com/images/banner.gif'></td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' height='12' background='http://www.boatrenting.com/images/sub_menu_bg.gif'>&nbsp;</td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' align='center'>";
        strBody = strBody + "		<div id='forgotten_password'>";
        strBody = strBody + "			<div id='forgotten_password_title'>New Facility Registration</div>";
        strBody = strBody + "			<div style='padding-top: 30px; height: 30px; margin-bottom: 20px;'>There is a new Facility registered at the website:<br>";
        strBody = strBody + "				<b>Contact Name</b>:&nbsp;" + txt_ContactName + "<br>";
        strBody = strBody + "				<b>Business Name</b>:&nbsp;" + txt_BusinessName + "<br>";
        strBody = strBody + "				<b>Marina Name</b>:&nbsp;" + txt_marinaName + "<br>";
        strBody = strBody + "				<b>Address 1</b>:&nbsp;" + txt_addressLine1 + "<br>";
        strBody = strBody + "				<b>Email</b>:&nbsp;" + txt_email + "<br>";
        strBody = strBody + "				<b>Phone</b>:&nbsp;" + txt_phone + "</div>";
        strBody = strBody + "			<div class='link'>";
        strBody = strBody + "				In order to view the full information <a class='button' href='http://www.boatrenting.com/admin/login.aspx' style='width:200px'>Click here &raquo;</a>";
        strBody = strBody + "			</div>";
        strBody = strBody + "		</div>	";
        strBody = strBody + "	</td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' height='40' background='http://www.boatrenting.com/images/footer_bg.gif'>";
        strBody = strBody + "		<div id='footer_details'>";
        strBody = strBody + "			<br><br><br>BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href='mailto:info@boatrenting.com'>info@boatrenting.com</a>";
        strBody = strBody + "		</div>	";
        strBody = strBody + "	</td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "</table>";
        strBody = strBody + "</body>";
        strBody = strBody + "</html>";
        //oNewMail = new CDO.Message();
        //oNewMail.To = "Enngines@aol.com,info@boatrenting.com,ken@boatrenting.com";
        //oNewMail.From = "info@boatrenting.com";
        //oNewMail.Subject = "http://www.boatrenting.com - New Facility registration";
        //oNewMail.HTMLBody = strBody;
        //oNewMail.Send();
        //oNewMail = null;
        MailMessage msg = new MailMessage();
        msg.To = "Enngines@aol.com,info@boatrenting.com,Kenny@boatrenting.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com";
        //msg.To = "paul.toto@idserve.com"; //<- For Testing ****0000
        msg.From = "info@boatrenting.com";
        msg.Subject = "http://www.boatrenting.com - New Facility registration";
        msg.Body = strBody;
        msg.BodyFormat = MailFormat.Html;

        //lblStatus.Text = "Sending...";
        SmtpMail.SmtpServer = "localhost";
        SmtpMail.Send(msg);

    }
      
      protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void cboCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadStates();
    }
}

} 
