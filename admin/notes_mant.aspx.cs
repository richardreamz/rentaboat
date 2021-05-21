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

  public partial class notes_mant_aspx_cs : System.Web.UI.Page
  {
    public string con = "";
    public Connection oConn = null;
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
    public const int adCmdStoredProc = 0x0004;
    public const int adParamInput = 0x0001;
    public const int adParamOutput = 0x0002;
    public string sMes = "";
    public string txt_marinaID = "";
    public string hdn_Redirect = "";
    public Command cmd = null;
    public Recordset rs = null;
    public string txt_ContactName = "";
    public string txt_BusinessName = "";
    public string txt_MarinaName = "";
    public string txt_addressLine1 = "";
    public string txt_city = "";
    public string txt_phone = "";
    public string txta_notes = "";
    public object nPag = null;
    public string NVL(object InputValue, string NullReplaceValue) 
    {
        string NVL = "";
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
                NVL = Convert.ToString(InputValue);
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


    protected void Button2_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState 
        //contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
            //Previous page by retrieving the PreviousPage Url from ViewState.
        }

        else
            {
                Response.Redirect("Facilities_List.aspx");

            }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txt_marinaID = NVL(Request["hdn_MarinaID"], "0");
        Session.Add("userID", 1);
        txta_notes = NVL(Request.Form["txta_notes"], "");
        //response.End

        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_MARINA_NOTES_SAVE";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = txt_marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@P_IN_MarinaID"].Value = Convert.ToInt32(txt_marinaID);
        //cmd.Parameters[2] = txta_notes;
        cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Notes", adVarChar, adParamInput, 1000, 0));
        cmd.Parameters["@P_VC_Notes"].Value = txta_notes;
        cmd.Execute();

        createAlertScript("The information was saved ");
    }
    private void createAlertScript(string errorMsg)
    {
        System.Text.StringBuilder buf = new System.Text.StringBuilder();

        buf.AppendLine("<script type=\"text/javascript\">");
        buf.AppendFormat("alert('{0}');", errorMsg);
        buf.AppendLine("");
        if (errorMsg == "The information was saved")
            buf.AppendLine("window.location='facilities_list.aspx';");
        buf.AppendLine("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "err", buf.ToString());
    }

}

} 
