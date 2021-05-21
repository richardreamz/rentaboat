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

  public partial class calendar_h_aspx_cs : System.Web.UI.Page
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
    public string boatID = "";
    public string marinaID = "";
    public int i = 0;
    public object nMonth = null;
    public object nYear = null;
    public object dateClicked = null;
    //***End Function Declaration***
    public DateTime dDate;
    //Date we're displaying calendar for
    public int iDIM = 0;
    //Days In Month
    public int iDOW = 0;
    //Day Of Week that month starts on
    public int iCurrent = 0;
    //Variable we use to hold current day of month as we write table
    public int iPosition = 0;
    //Variable we use to hold current position in table
    public object iLooper = null;
    public Command cmd = null;
    public Recordset rs = null;
    public string[] ArrDaysStyle = null;
    //*******************************************************
    //*     ASP 101 Sample Code - http://www.asp101.com/    *
    //*                                                     *
    //*   This code is made available as a service to our   *
    //*      visitors and is provided strictly for the      *
    //*               purpose of illustration.              *
    //*                                                     *
    //*      http://www.asp101.com/samples/license.aspx      *
    //*                                                     *
    //* Please direct all inquiries to webmaster@asp101.com *
    //*******************************************************
    //***Begin Function Declaration***
    //New and improved GetDaysInMonth implementation.
    //Thanks to Florent Renucci for pointing out that I
    //could easily use the same method I used for the
    //revised GetWeekdayMonthStartsOn function.
    public int GetDaysInMonth(int iMonth, int iYear) 
    {
        DateTime dTemp;
        dTemp = DateAndTime.DateAdd("d", -1.0, new DateTime(iYear, iMonth + 1, 1));
        return dTemp.Day;
    }

    //Previous implementation of GetDaysInMonth
    //Function GetDaysInMonth(iMonth, iYear)
    //Select Case iMonth
    //Case 1, 3, 5, 7, 8, 10, 12
    //GetDaysInMonth = 31
    //Case 4, 6, 9, 11
    //GetDaysInMonth = 30
    //Case 2
    //If IsDate("February 29, " & iYear) Then
    //GetDaysInMonth = 29
    //Else
    //GetDaysInMonth = 28
    //End If
    //End Select
    //End Function
    public int GetWeekdayMonthStartsOn(DateTime dAnyDayInTheMonth) 
    {
        DateTime dTemp;
        dTemp = DateAndTime.DateAdd("d", -(dAnyDayInTheMonth.Day - 1), dAnyDayInTheMonth);
        return DateAndTime.Weekday(dTemp, Microsoft.VisualBasic.FirstDayOfWeek.Sunday);
    }

    public DateTime SubtractOneMonth(DateTime dDate) 
    {
        return DateAndTime.DateAdd("m", -1.0, dDate);
    }

    public DateTime AddOneMonth(DateTime dDate) 
    {
        return DateAndTime.DateAdd("m", 1.0, dDate);
    }


  }

} 
