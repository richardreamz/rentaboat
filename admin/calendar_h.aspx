<%@ Page language="C#" CodeFile="calendar_h.aspx.cs" Inherits="BoatRenting.calendar_h_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"><%
        //Variable used for misc. loops
        //Get selected date.  There are two ways to do this.
        //First check if we were passed a full date in RQS("date").
        //If so use it, if not look for seperate variables, putting them togeter into a date.
        //Lastly check if the date is valid...if not use today
    if (Information.IsDate(Request.QueryString["date"]))
    {
        dDate = Convert.ToDateTime(Request.QueryString["date"]);
    }
    else
    {
        if (Information.IsDate(Request.QueryString["month"] + "-" + Request.QueryString["day"] + "-" + Request.QueryString["year"]))
        {
            dDate = Convert.ToDateTime(Request.QueryString["month"] + "-" + Request.QueryString["day"] + "-" + Request.QueryString["year"]);
        }
        else
        {
            dDate = DateTime.Today;
                //The annoyingly bad solution for those of you running IIS3
            //if ((Request.QueryString["month"]).Length != 0 || (Request.QueryString["day"]).Length != 0 || (Request.QueryString["year"]).Length != 0 || (Request.QueryString["date"]).Length != 0)
            //{
            //    Response.Write("The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>");
            //}
        //The elegant solution for those of you running IIS4
            if (Request.QueryString.Count != 0)
            {
                Response.Write("The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>");
            }
        }
    }
    //Now we've got the date.  Now get Days in the choosen month and the day of the week it starts on.
    iDIM = GetDaysInMonth(dDate.Month, dDate.Year);
    iDOW = GetWeekdayMonthStartsOn(dDate);
    Response.Buffer = true;
    Response.Clear();
    Response.Expires = 0;

    for (i = 0; i <= 31; i += 1)
    {
        //TODO Redim Preserve not supported.
        ArrDaysStyle = new string[i + 1];
        ArrDaysStyle[i] = "calendar_nonholiday";
    }
    
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;

    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    boatID = Request.QueryString["hdnBoat"];
    marinaID = Request.QueryString["hdnMarina"];
    cmd = new Command();
    rs = new Recordset();
    if (Request.QueryString["dateclicked"] == "1")
    {
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_Update_Holiday";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = boatID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(boatID);
        //cmd.Parameters[2] = marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(marinaID);
        //cmd.Parameters[3] = dDate.Month;
        cmd.Parameters.Append(cmd.CreateParameter("@p_month", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_month"].Value = Convert.ToInt32(dDate.Month);
        //cmd.Parameters[4] = dDate.Year;
        cmd.Parameters.Append(cmd.CreateParameter("@p_year", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_year"].Value = Convert.ToInt32(dDate.Year);
        //cmd.Parameters[5] = dDate.Day;
        cmd.Parameters.Append(cmd.CreateParameter("@p_day", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_day"].Value = Convert.ToInt32(dDate.Day);
        cmd.Execute();
    }
    if (boatID !="")
    {
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_Holiday_List";
        cmd.CommandType = adCmdStoredProc;
        //cmd.Parameters[1] = boatID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(boatID);
        //cmd.Parameters[2] = marinaID;
        cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(marinaID);
        //cmd.Parameters[3] = dDate.Month;
        cmd.Parameters.Append(cmd.CreateParameter("@p_month", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_month"].Value = Convert.ToInt32(dDate.Month);
        //cmd.Parameters[4] = dDate.Year;
        cmd.Parameters.Append(cmd.CreateParameter("@p_year", adInteger, adParamInput, 4, 0));
        cmd.Parameters["@p_year"].Value = Convert.ToInt32(dDate.Year);
        rs.Open(cmd);
        for (i = 0; i <= 31; i += 1)
        {
            //TODO Redim Preserve not supported.
            ArrDaysStyle = new string[i + 1];
            ArrDaysStyle[i] = "calendar_nonholiday";
        }
        while (!(rs.Eof))
        {
            ArrDaysStyle[Convert.ToInt32(rs.Fields["dday"])] = "calendar_holiday";
            rs.MoveNext();
        }
    }
%>
<!-- The outer table is simply to get the pretty border. -->

<style type="text/css" media="screen"><![CDATA[import url(../br.css);]]></style>

<table border="10" cellspacing="0" cellpadding="0">
<tr><td>
<table border="1" cellspacing="0" cellpadding="1" bgcolor="#99CCFF">
	<tr>
		<td bgcolor="#000099" align="center" colspan="7">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right"><a href="calendar_h.aspx?date=<%= SubtractOneMonth(dDate) %>&nodate=1&hdnBoat=<%= boatID %>&hdnMarina=<%= marinaID %>"><font color="#FFFF00" size="-1">&lt;&lt;</font></a></td>
					<td align="center"><font color="#FFFF00"><strong><%= DateAndTime.MonthName(dDate.Month, false) + "  " + Convert.ToString(dDate.Year) %></strong></font></td>
					<td align="left"><a href="calendar_h.aspx?date=<%= AddOneMonth(dDate) %>&nodate=1&hdnBoat=<%= boatID %>&hdnMarina=<%= marinaID %>"><font color="#FFFF00" size="-1">&gt;&gt;</font></a></td>
				<td align="left"><a href="javascript:window.parent.makeHolidayInvisible();"><img src="../imagescal/btn_close_small.gif" alt="close"/ border="0"></a>&nbsp;
	</td>
				
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Sun</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Mon</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Tue</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Wed</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Thu</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Fri</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
		<td align="center" bgcolor="#0000CC"><font color="#FFFF00"><strong>Sat</strong></font><br /><img src="images/spacer.gif" width="60" height="1" border="0" /></td>
	</tr>
<%
        //Write spacer cells at beginning of first row if month doesn't start on a Sunday.
    if (iDOW != 1)
    {
        Response.Write("\t" + "<tr>" + "\r\n");
        iPosition = 1;
        while(iPosition < iDOW)
        {
            Response.Write("\t" + "\t" + "<td>&nbsp;</td>" + "\r\n");
            iPosition = iPosition + 1;
        }
    }
    //Write days of month in proper day slots
    iCurrent = 1;
    iPosition = iDOW;
    while(iCurrent <= iDIM)
    {
            //If we're at the begginning of a row then write TR
        if (iPosition == 1)
        {
            Response.Write("\t" + "<tr>" + "\r\n");
        }
            //If the day we're writing is the selected day then highlight it somehow.
        if (ArrDaysStyle[iCurrent] == "calendar_nonholiday")
        {
            Response.Write("\t" + "\t" + "<td bgcolor=#00FFFF ><a href=calendar_h.aspx?date=" + Convert.ToString(dDate.Month) + "-" + Convert.ToString(iCurrent) + "-" + Convert.ToString(dDate.Year) + "&dateclicked=1&hdnBoat=" + boatID + "&hdnMarina=" + marinaID + "><font size=-1>" + Convert.ToString(iCurrent) + "</font></a><br /><br /></td>" + "\r\n");
        }
        else
        {
            Response.Write("\t" + "\t" + "<td bgcolor=#FFFFB4><a href=calendar_h.aspx?date=" + Convert.ToString(dDate.Month) + "-" + Convert.ToString(iCurrent) + "-" + Convert.ToString(dDate.Year) + "&dateclicked=1&hdnBoat=" + boatID + "&hdnMarina=" + marinaID + "><font size=-1>" + Convert.ToString(iCurrent) + "</font></a><br /><br /></td>" + "\r\n");
        }
            //If we're at the endof a row then write /TR
        if (iPosition == 7)
        {
            Response.Write("\t" + "</tr>" + "\r\n");
            iPosition = 0;
        }
        //Increment variables
        iCurrent = iCurrent + 1;
        iPosition = iPosition + 1;
    }
        //Write spacer cells at end of last row if month doesn't end on a Saturday.
    if (iPosition != 1)
    {
        while(iPosition <= 7)
        {
            Response.Write("\t" + "\t" + "<td>&nbsp;</td>" + "\r\n");
            iPosition = iPosition + 1;
        }
        Response.Write("\t" + "</tr>" + "\r\n");
    }
%>
</table>
</td></tr>
</table>

<br />

<form action="calendar_h.aspx" method="get">

<input type="hidden" name="hdnMonth" value="<%= nMonth %>" />
<input type="hidden" name="hdnYear" value="<%= nYear %>" />
<input type="hidden" name="hdnBoat" value="<%= boatID %>" />
<input type="hidden" name="hdnMarina" value="<%= marinaID %>" />
<input type="hidden" name="hdndateClicked" value="<%= dateClicked %>" />

</form>
</html>