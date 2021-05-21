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

  public partial class users_mant_aspx_cs : System.Web.UI.Page
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
    public object txt_MarinaID = null;
    public string txt_UserID = "";
    public Command cmd = null;
    public Recordset rs = null;
    public Command cmd2 = null;
    public Recordset rs2 = null;
    public string txt_UserName = "";
    public string txt_password = "";
    public string cbo_UserLevel = "";
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

    public object UserLevel() 
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_USERLEVEL_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"cbo_UserLevel\" >\r\n");
        Response.Write("	<option value=\"0\">- Select -</option>\r\n");
        while(!(rs.Eof))
        {
            if (hdn_Action == "E" && Convert.ToInt32(rs.Fields["in_UserLevelID"].Value) == Convert.ToInt32(cbo_UserLevel))
            {
                sCadena = "selected";
            }
            else
            {
                sCadena = "";
            }
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_UserLevelID"].Value);
            Response.Write("\" ");
            Response.Write(sCadena);
            Response.Write(">");
            Response.Write(rs.Fields["vc_description"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }

    private void createAlertScript(string errorMsg)
    {
        System.Text.StringBuilder buf = new System.Text.StringBuilder();

        buf.AppendLine("<script type=\"text/javascript\">");
        buf.AppendFormat("alert('{0}');", errorMsg);
        buf.AppendLine("");
        if (errorMsg == "The information was saved")
            buf.AppendLine("window.location='users_list.aspx';");
        buf.AppendLine("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "err", buf.ToString());
    }

    private String validr()
    {
        Boolean chk = false;
        //Initialise variables
        string errorMsg = "";
        string msg = "";
        //Check for a Name
        if (NVL(Request.Form["txt_userName"], "") == "") //(document.getElementById("txt_userName").value == "")
        {
            errorMsg += "\n\t User Name \t\t                  - Enter your User Name";
        }

        //Check for a Name
        if (NVL(Request.Form["txt_password"], "") == "") //(document.getElementById("txt_password").value == "")
        {
            errorMsg += "\n\t Password \t\t                  - Enter your Password";
        }

        //Check for a userLevel
        if (NVL(Request.Form["cbo_userLevel"], "") == "0") //(document.getElementById("cbo_userLevel").value == "0")
        {
            errorMsg += "\n\t User Level \t\t                  - Enter your User Level";
        }

        //If there is aproblem with the form then display an error
        if (errorMsg != "")
        {
            msg = "______________________________________________________________\n\n";
            msg += "Your enquiry has not been sent because there are problem(s) with the form.\n";
            msg += "Please correct the problem(s) and re-submit the form.\n";
            msg += "______________________________________________________________\n\n";
            msg += "The following field(s) need to be corrected:\n";

            errorMsg += msg + errorMsg + "\n\n";
        }
        return errorMsg;
    }

    private String save()
    {
        string errorMsg = "";

        if (Convert.ToString(Session["userID"]) == "")
        {
            Session.Abandon();
            Response.Redirect("/members.aspx");
        }
        hdn_Action = Request["hdn_Action"];
        txt_MarinaID = Session["MarinaID"];
        txt_UserID = NVL(Request["hdn_UserID"], "0");
        Session.Add("userID", 1);

        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        if (!((Request.Form["hdn_original"] == Request.Form["txt_userName"])))
        {
            cmd2 = new Command();
            rs2 = new Recordset();
            cmd2.ActiveConnection = oConn;
            cmd2.CommandText = "SP_BR_CLIENT_USERNAME_EXISTS";
            cmd2.CommandType = adCmdStoredProc;
            //cmd2.Parameters[1].Value = Request.Form["txt_userName"];
            cmd2.Parameters.Append(cmd2.CreateParameter("@p_vc_username", adVarChar, adParamInput, 100, 0));
            cmd2.Parameters["@p_vc_username"].Value = Request.Form["txt_userName"];
            rs2.Open(cmd2);
            if (Convert.ToString(rs2.Fields[0].Value) == "0")
            {
                txt_UserName = NVL(Request.Form["txt_UserName"], "");
                txt_password = NVL(Request.Form["txt_password"], "");
                cbo_UserLevel = NVL(Request.Form["cbo_UserLevel"], "");
                cmd = new Command();
                cmd.ActiveConnection = oConn;
                cmd.CommandText = "SP_BR_USER_SAVE";
                cmd.CommandType = adCmdStoredProc;
                //cmd.Parameters[1].Value = hdn_Action;
                cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 1, 0));
                cmd.Parameters["@P_Action"].Value = hdn_Action;
                //cmd.Parameters[2].Value = txt_MarinaID;
                cmd.Parameters.Append(cmd.CreateParameter("@P_IN_marinaID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@P_IN_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
                //cmd.Parameters[3].Value = txt_UserID;
                cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@P_IN_UserID"].Value = Convert.ToInt32(txt_UserID);
                //cmd.Parameters[4].Value = txt_UserName;
                cmd.Parameters.Append(cmd.CreateParameter("@P_VC_UserName", adVarChar, adParamInput, 50, 0));
                cmd.Parameters["@P_VC_UserName"].Value = txt_UserName;
                //cmd.Parameters[5].Value = txt_Password;
                cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Password", adVarChar, adParamInput, 50, 0));
                cmd.Parameters["@P_VC_Password"].Value = txt_password;
                //cmd.Parameters[6].Value = Convert.ToInt32(cbo_UserLevel);
                cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserLevelID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@P_IN_UserLevelID"].Value = Convert.ToInt32(cbo_UserLevel);
                //cmd.Parameters[7].Value = Convert.ToInt32(Session["userID"]);
                cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
                cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
                cmd.Execute();
            }
        }
        else
        {
            txt_UserName = NVL(Request.Form["txt_UserName"], "");
            txt_password = NVL(Request.Form["txt_password"], "");
            cbo_UserLevel = NVL(Request.Form["cbo_UserLevel"], "");
            cmd = new Command();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_USER_SAVE";
            cmd.CommandType = adCmdStoredProc;
            //cmd.Parameters[1].Value = hdn_Action;
            cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 1, 0));
            cmd.Parameters["@P_Action"].Value = hdn_Action;
            //cmd.Parameters[2].Value = txt_MarinaID;
            cmd.Parameters.Append(cmd.CreateParameter("@P_IN_marinaID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@P_IN_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
            //cmd.Parameters[3].Value = txt_UserID;
            cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@P_IN_UserID"].Value = Convert.ToInt32(txt_UserID);
            //cmd.Parameters[4].Value = txt_UserName;
            cmd.Parameters.Append(cmd.CreateParameter("@P_VC_UserName", adVarChar, adParamInput, 50, 0));
            cmd.Parameters["@P_VC_UserName"].Value = txt_UserName;
            //cmd.Parameters[5].Value = txt_Password;
            cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Password", adVarChar, adParamInput, 50, 0));
            cmd.Parameters["@P_VC_Password"].Value = txt_password;
            //cmd.Parameters[6].Value = Convert.ToInt32(cbo_UserLevel);
            cmd.Parameters.Append(cmd.CreateParameter("@P_IN_UserLevelID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@P_IN_UserLevelID"].Value = Convert.ToInt32(cbo_UserLevel);
            //cmd.Parameters[7].Value = Convert.ToInt32(Session["userID"]);
            cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
            cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
            cmd.Execute();
        }


        return errorMsg;
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
            createAlertScript("The information was saved");
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("users_list.aspx", true);

    }
}

} 
