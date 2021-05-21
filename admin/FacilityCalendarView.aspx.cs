using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_FacilityCalendarView : System.Web.UI.Page
{



    protected void btnNextMonthStartDate_Click(object sender, EventArgs e)
    {
        DateTime c = new DateTime(calStartDate.VisibleDate.Year, calStartDate.VisibleDate.Month, 1).AddMonths(1);

        if (c.Year > DateTime.Now.Year + 4)
            return;




        calStartDate.VisibleDate = c;

      //  RenderUnavailableDates(calStartDate);

        ddYearStartCalendar.ClearSelection();

        ddYearStartCalendar.Items.FindByValue(c.Year.ToString()).Selected = true;

        ddMonthStartCalendar.ClearSelection();
        ddMonthStartCalendar.Items.FindByValue(c.Month.ToString()).Selected = true;
    }

    protected void btnPreviousMonthStartDate_Click(object sender, EventArgs e)
    {




        DateTime c = new DateTime(calStartDate.VisibleDate.Year, calStartDate.VisibleDate.Month, 1).AddMonths(-1);

        if (c.Year < DateTime.Now.Year)
            return;


        calStartDate.VisibleDate = c;
      //  RenderUnavailableDates(calStartDate);
        ddYearStartCalendar.ClearSelection();

        ddYearStartCalendar.Items.FindByValue(c.Year.ToString()).Selected = true;

        ddMonthStartCalendar.ClearSelection();
        ddMonthStartCalendar.Items.FindByValue(c.Month.ToString()).Selected = true;


    }

    protected void ddMonthStartCalendar_SelectedIndexChanged(object sender, EventArgs e)
    {
        calStartDate.VisibleDate = new DateTime(int.Parse(ddYearStartCalendar.SelectedItem.Value), int.Parse(ddMonthStartCalendar.SelectedItem.Value), 1);
        ///RenderUnavailableDates(calStartDate);
    }

    protected void ddYearStartCalendar_SelectedIndexChanged(object sender, EventArgs e)
    {
        calStartDate.VisibleDate = new DateTime(int.Parse(ddYearStartCalendar.SelectedItem.Value), int.Parse(ddMonthStartCalendar.SelectedItem.Value), 1);
      //  RenderUnavailableDates(calStartDate);
    }



    void bindYearDropDown()
    {

        for (int i = DateTime.Now.Year; i < DateTime.Now.Year + 5; i++)
        {
            ddYearStartCalendar.Items.Add(new ListItem(i.ToString(), i.ToString()));
          

        }
        ddYearStartCalendar.SelectedIndex = 0;


        ddMonthStartCalendar.ClearSelection();
        ddMonthStartCalendar.Items.FindByValue(DateTime.Now.Month.ToString()).Selected = true;



     


       
     

    }
    protected void calStartDate_SelectionChanged(object sender, EventArgs e)
    {
        
        Session[Util.Session_Selected_PickupDate] = calStartDate.SelectedDate;

     
    

        calStartDate.SelectedDates.Clear();

       
    }
    protected void calStartDate_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
    {
        calStartDate.SelectedDate = e.NewDate;

      //  RenderUnavailableDates(calStartDate);

    }


    Dictionary<int,BoatDetails> getAvailableBoats(string boatid, string marinaId, string date)
    {
        var BoatList = new Dictionary<int, BoatDetails>();

        DataTable dtB = Util.getDataSet("execute [SP_BR_CALENDAR_FILTER_AVAILABLE] @Date1='" + date +"', @BoatID=" + boatid + ", @MarinaID=" + marinaId).Tables[0];

        for (int i=0; i < dtB.Rows.Count; i++)
        {
            if (!BoatList.ContainsKey((int)dtB.Rows[i]["in_BoatID"]))
                BoatList.Add((int)dtB.Rows[i]["in_BoatID"], new BoatDetails { BoatName = dtB.Rows[i]["vc_name"].ToString() ,TypeRentId=0});



        }


        return BoatList;

       
    }


    Dictionary<int, BoatDetails> getReservedBoats(string boatid, string marinaId, string date)
    {
        var BoatList = new Dictionary<int, BoatDetails>();

        DataTable dtB = Util.getDataSet("execute [SP_BR_CALENDAR_FILTER] @Date1='" + date + "', @BoatID=" + boatid + ", @MarinaID=" + marinaId).Tables[0];

        for (int i = 0; i < dtB.Rows.Count; i++)
        {
           /// if (!BoatList.ContainsKey((int)dtB.Rows[i]["in_BoatID"]))
            BoatList.Add(i, new BoatDetails { BoatID= dtB.Rows[i]["IN_BOATID"].ToString(),  BoatName = dtB.Rows[i]["vc_name"].ToString(), TypeRentId = (int)dtB.Rows[i]["in_typerentid"] });



        }


        return BoatList;


    }



    protected void calStartDate_DayRender(object sender, DayRenderEventArgs e)
    {

        e.Cell.Attributes.Add("style", "vertical-align:top;");


        string boatid = "0";

        if (ddBoats.SelectedIndex > 0)
            boatid = ddBoats.SelectedItem.Value;


        if (e.Day.Date.AddDays(1) < DateTime.Now)
        {

            e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#D8D8D8");
            e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#72C7CF");

            if (ddAvailReserve.SelectedIndex == 0)
                return;

        }




        Dictionary<int, BoatDetails> bList;

        string pageLink = "ReservedBoatsAdmin.aspx?dd="+ e.Day.Date.Day.ToString() + "&mm=" + e.Day.Date.Month.ToString() + "&aaaa=" + e.Day.Date.Year.ToString() ;


        if (ddAvailReserve.SelectedIndex == 1) // Reserved Boats
        {


            bList = getReservedBoats(boatid, Session["marinaID"].ToString(), e.Day.Date.ToShortDateString());

             
           
        }
        else
        {
            pageLink = "CalendarAdmin.aspx?dd=" + e.Day.Date.Day.ToString() + "&mm=" + e.Day.Date.Month.ToString() + "&aaaa=" + e.Day.Date.Year.ToString() ;
            bList = getAvailableBoats(boatid, Session["marinaID"].ToString(), e.Day.Date.ToShortDateString());




        }

        string bhrefs;

        if (e.Day.Date.ToShortDateString() == DateTime.Now.ToShortDateString())
            bhrefs = "<div class='numberCircleBlue'> <a style='color:white!important' href='" + pageLink+ "&BoatID=0'>" + e.Day.Date.Day.ToString() + "</a></div><br/><br/><br/>";
         else
            bhrefs = "<div class='numberCircle'> <a href='" + pageLink + "&BoatID=0'>" + e.Day.Date.Day.ToString() + "</a></div><br/><br/><br/>";

        /*
           <div align="center" style="background-color:#7427d3; color:#fff; padding:5px; margin-bottom:4px;"><strong>Hourly</strong></div>
           <div align="center" style="background-color:#F77D06; color:#fff; padding:5px; margin-bottom:4px;"><strong>1/2 Day AM</strong></div>
           <div align="center" style="background-color:#2DA9E5; color:#fff; padding:5px; margin-bottom:4px;"><strong>1/2 Day PM</strong></div>
           <div align="center" style="background-color:#67a415; color:#fff; padding:5px; margin-bottom:4px;"><strong>Full Day</strong></div>


        */
        foreach (var b in bList)
        {
            string style = "";
            BoatDetails boat = b.Value;
            if (boat.TypeRentId == 1)
                style = "style='color:#67a415;'";
            else if (boat.TypeRentId == 2)
                style = "style='color:#F77D06;'";
            else if (boat.TypeRentId == 3)
                style = "style='color:#2DA9E5;'";
            else if (boat.TypeRentId == 4)
                style = "style='color:#7427d3;'";


            bhrefs += "<p class='calday'>  <a  href='" + pageLink + "&BoatID=" + b.Key.ToString() + "' " +style +">" + boat.BoatName  + "</a></p> &nbsp;<br>";

         //   bhrefs += "<p class='calday'>  <a  href='" + pageLink + "&BoatID=" + boat.BoatID + "' " + style + ">" + boat.BoatName + "</a></p> &nbsp;<br>";


        }

        e.Cell.Text = bhrefs;


      

        // This is selected date color
        /*
                if (Session[Util.Session_Selected_PickupDate] != null && IsStartDateSelected && e.Day.Date == (DateTime)Session[Util.Session_Selected_PickupDate])
                {


                    e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7df57");
                    e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
                    e.Cell.Attributes.Add("class", "calPickupDropOff");
                    return;
                }


                if (e.Day.Date.AddDays(1) < DateTime.Now)
                {
                    e.Day.IsSelectable = false;
                    // e.Cell.Font.Strikeout = true;
                    e.Cell.ToolTip = "This day is not available";

                    e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                    e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#999");

                    e.Cell.Attributes.Add("class", "calPickupDropOff");



                }
                else if (unAvailableDates.Contains(e.Day.Date))
                {


                    e.Cell.Attributes.Add("class", "calPickupDropOff");

                    e.Day.IsSelectable = false;
                    // e.Cell.Font.Strikeout = true;
                    e.Cell.ToolTip = "This day is not available";

                    e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                    e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#999");

                    // Check if full day is selected half day am or pm available

                    if (ddRentOption.Items.FindByValue("2") != null && ddRentOption.SelectedItem.Value == "1" && !unAvailableDatesHalfDayAM.Contains(e.Day.Date)) // Available am
                    {
                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#F77D06");
                        e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");


                        e.Cell.ToolTip = "Select a Pick Up Date - Half Day AM is available";

                        e.Cell.Attributes.Add("onclick", e.SelectUrl);
                        e.Cell.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Cell.Attributes.Add("onmouseout", "this.style.cursor='default'");

                        e.Cell.Attributes.Add("class", "calPickupDropOff");
                    }

                    else if (ddRentOption.Items.FindByValue("3") != null && ddRentOption.SelectedItem.Value == "1" && !unAvailableDatesHalfDayPM.Contains(e.Day.Date)) // Available pm
                    {
                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#2DA9E5");
                        e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");


                        e.Cell.ToolTip = "Select a Pick Up Date - Half Day PM is available";

                        e.Cell.Attributes.Add("onclick", e.SelectUrl);
                        e.Cell.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Cell.Attributes.Add("onmouseout", "this.style.cursor='default'");

                        e.Cell.Attributes.Add("class", "calPickupDropOff");
                    }

                }

                else
                {
                    e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#93d13f");
                    e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");


                    e.Cell.ToolTip = "Select a Pick Up Date";

                    e.Cell.Attributes.Add("onclick", e.SelectUrl);
                    e.Cell.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                    e.Cell.Attributes.Add("onmouseout", "this.style.cursor='default'");

                    e.Cell.Attributes.Add("class", "calPickupDropOff");
                }

                */


    }

    void bindBoats()
    {
        DataTable dtB = Util.getDataSet("execute usp_get_all_boats_marina " + Session["marinaID"].ToString()).Tables[0];
        ddBoats.DataSource = dtB;
        ddBoats.DataTextField = "vc_name";
        ddBoats.DataValueField = "in_boatID";



        ddBoats.DataBind();

        ddBoats.Items.Insert(0, "[All]");


    }

    void CheckIfAnyUnansweredQuestions()
    {
        DataTable dt = Util.getDataSet("execute usp_check_unanswered_questions_marina " + Session["marinaID"].ToString()).Tables[0];
        if (dt.Rows.Count > 0)
            lnkUnansweredQuestions.Visible = true;
        else
            lnkUnansweredQuestions.Visible = false;

    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            bindYearDropDown();

            bindBoats();


            ddAvailReserve.SelectedIndex = 1;

            calStartDate.SelectedDate = DateTime.Now.AddDays(1 - DateTime.Now.Day);
            calStartDate.VisibleDate = DateTime.Now.AddDays(1 - DateTime.Now.Day);


            if (Session[Util.Session_Selected_CV_Boat_Index] != null)
                ddBoats.SelectedIndex = int.Parse(Session[Util.Session_Selected_CV_Boat_Index].ToString());


            if (Session[Util.Session_Selected_CalendarView_Index] != null)
                ddAvailReserve.SelectedIndex = int.Parse(Session[Util.Session_Selected_CalendarView_Index].ToString());

            CheckIfAnyUnansweredQuestions();


        }


    }

    protected void ddAvailReserve_SelectedIndexChanged(object sender, EventArgs e)
    {
        calStartDate.VisibleDate = calStartDate.VisibleDate;

        Session[Util.Session_Selected_CalendarView_Index] = ddAvailReserve.SelectedIndex;

    }

    protected void ddBoats_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session[Util.Session_Selected_CV_Boat_Index] = ddBoats.SelectedIndex;

        calStartDate.VisibleDate = calStartDate.VisibleDate;

    }
}

class BoatDetails
{
    public string BoatName { get; set; }
    public int TypeRentId { get; set; }

    public string BoatID { get; set; }

}