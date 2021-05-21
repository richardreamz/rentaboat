using nce.scripting;
using nce.adosql;
//using BoatRenting.clsUpload;
using Microsoft.VisualBasic;
//using BoatRenting.clsField;
//using BoatRenting.clsProgress;
using System;
using System.Web;
using System.Web.SessionState;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace BoatRenting {

  public partial class boats_save_aspx_cs : System.Web.UI.Page
  {
    public string con = "";
    public Connection oConn = null;
    public string sMes = "";
    public const bool FileSystemObjectEnabled = false;
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
    //If your ISP does not allow the File System Object to
    //be used, then set this value to false.  Some features
    //will be disabled such as verifying folders exist,
    //Assigning unique names to files, displaying progress,
    //and interacting with existing files (Move, Copy, Delete,
    //Rename)
    public const int BufferSize = 0x10000;
    //Changing buffer size may change the length of time
    //it takes to upload a file.  You may want to begin
    //with 64KB and go from there to find the optimal
    //number for your website.
    //Since the Progress Information class writes to
    //a file each itteration, this can degrade performance
    //a lot when using small buffers.
    //Do not go below 100 bytes, or you will begin to risk
    //not being able to parse boundaries.  Data may not upload
    //properly.
    //For your reference:
    //1 KB		1024		&H400
    //2 KB		2048		&H800
    //4 KB		4096		&H1000
    //8 KB		8192		&H2000
    //16 KB		16384		&H4000
    //32 KB		32768		&H8000
    //64 KB		65536		&H10000
    //128 KB	131072		&H20000
    //256 KB	262144		&H40000
    //------------------------------------------------------------------------------
    //Author:		Lewis Moten
    //Email:		Lewis@Moten.com
    //URL:		http://www.lewismoten.com
    //Date:		September 1, 2003
    //------------------------------------------------------------------------------
    //Upload class retrieves multi-part form data posted to web page
    //and parses it into objects that are easy to interface with.
    //Requires MDAC (ADODB) COM components found on most servers today
    //Additional compenents are not necessary.
    //
    //Demo:
    //Set objUpload = new clsUpload
    //Initializes object and parses all posted multi-part from data.
    //Once this as been done, Access to the Request object is restricted
    //
    //objUpload.Count
    //Number of fields retrieved
    //
    //use: Response.Write "There are " & objUpload.Count & " fields."
    //
    //objUpload.Fields
    //Access to field objects.  This is the default propert so it does
    //not necessarily have to be specified.  You can also determine if
    //you wish to specify the field index, or the field name.
    //
    //Use:
    //Set objField = objUpload.Fields("File1")
    //Set objField = objUpload("File1")
    //Set objField = objUpload.Fields(0)
    //Set objField = objUpload(0)
    //Response.Write objUpload("File1").Name
    //Response.Write objUpload(0).Name
    //
    //------------------------------------------------------------------------------
    //
    //List of all fields passed:
    //
    //For i = 0 To objUpload.Count - 1
    //Response.Write objUpload(i).Name & "<BR>"
    //Next
    //
    //------------------------------------------------------------------------------
    //
    //HTML needed to post multipart/form-data
    //
    //<FORM method="post" encType="multipart/form-data" action="Upload.aspx">
    //<INPUT type="File" name="File1">
    //<INPUT type="Submit" value="Upload">
    //</FORM>
    //------------------------------------------------------------------------------
    //
    //Customized Errors:
    //(vbObjectError + ##)
    //
    //1:  Object does not exist within the ordinal reference.
    //2:  Failed to save file ... common reasons
    //3:  Failed to parse posted binary data delimiter
    //4:  Failed to save file ... unknown
    //5:  Used Request.Form ... Failed to read posted form data
    //6:  Failed to read posted form data for unknown reason.
    //7:  Folder does not exist.
    //8:  Filename is not valid
    //9:  Folder is not valid
    //10: ADODB.Version below 2.5
    //11: Not enough free space available.
    //12: File System Object has been disabled.
    //13: multipart/form-data was not received.
    //------------------------------------------------------------------------------
    //
    public object gBinaryData = null;
    public object txt_MarinaID = null;
    public string strUploadPath = "";
    public FileSystemObject fso = null;
    public object txt_BoatID = null;
    public string hdn_Action = "";
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
    public string txt_reservation = "";
    public string txt_requirements = "";
    public string txt_boat_sale_amount = "";
    public int chk_captain = 0;
    public int chk_Is_boat_sale = 0;
    public Command cmd = null;
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
    public string txt_resultName = "";
    public string txt_resultDesc = "";
    public string txt_detailImage = "";
    public string txt_other1Image = "";
    public string txt_other1Name = "";
    public string txt_other1Desc = "";
    public string txt_other2Image = "";
    public string txt_other2Name = "";
    public string txt_other2Desc = "";
    public string txt_other3Image = "";
    public string txt_other3Name = "";
    public string txt_other3Desc = "";
    public string txt_other4Image = "";
    public string txt_other4Name = "";
    public string txt_other4Desc = "";
    public string txt_BoatVideoImage = "";
    public string txt_BoatVideoName = "";
    public string txt_BoatVideoDesc = "";
    //public clsUpload objUpload = null;
    public object strFileName = null;
    public object strPath = null;
    public string NVL(string InputValue, object NullReplaceValue) 
    {
        string NVL = "";
        if (Convert.IsDBNull(InputValue))
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


  }

} 
