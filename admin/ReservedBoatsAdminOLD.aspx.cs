using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ReservedBoatsAdmin : System.Web.UI.Page
{
    void bindDataGrid()
    {

        lblShowingRecords.Text = "Displaying Rented Boats for " + ((DateTime)Session["log_Date"]).ToShortDateString();


        DataTable dtGrid = Util.getDataSet("execute usp_get_booked_boats @booked_Date='" + ((DateTime)Session["log_Date"]).ToShortDateString() + "',@BoatID=" + Session["log_BoatID"].ToString() + ",@MarinaID=" + Session["MarinaID"].ToString()).Tables[0];

        gvBookedBoats.DataSource = dtGrid;

        gvBookedBoats.DataBind();

        if (dtGrid.Rows.Count == 0)
            btnDeleteReservation.Visible = false;
     




    }

    protected void gvBookedBoats_SelectedIndexChanged(object sender, EventArgs e)
    {

        string id = gvBookedBoats.SelectedDataKey.Value.ToString();

        Session[Util.Session_Cart_Id] = Util.getCartSessionID(id);


        string url = "boats_printAgreement.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=600,height=600,left=100,top=100,resizable=yes');";
       // ClientScript.RegisterStartupScript(UpdatePanel1.GetType(), "script", s, true);
        ScriptManager.RegisterStartupScript(this.Page,this.GetType(), "script", s, true);


    }

    protected void btnDeleteReservation_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";


        foreach (GridViewRow row in gvBookedBoats.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkDelete") as CheckBox);
                if (chkRow.Checked)
                {
                    string id = gvBookedBoats.DataKeys[row.RowIndex].Value.ToString();

                    try
                    {
                        Util.Execute("execute usp_delete_booking @in_BookDateID=" + id);
                        lblMessage.Text = "Successfully deleted the reservation.";

                    }

                    catch (Exception ex)
                    {

                        lblMessage.Text = "Error deleting the reservations . " + ex.Message;

                    }


                }
            }
        }

        bindDataGrid();


    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacilityCalendarView.aspx");
    }

    protected void btnPreviousDay_Click(object sender, EventArgs e)
    {
        Session["log_Date"] = ((DateTime)Session["log_Date"]).AddDays(-1);

        if ((DateTime)Session["log_Date"] < DateTime.Now.AddDays(-1))
        {

            btnDeleteReservation.Visible = false;

        }
        else
            btnDeleteReservation.Visible = true;


        bindDataGrid();

    }

    protected void btnNextDay_Click(object sender, EventArgs e)
    {

        Session["log_Date"] = ((DateTime)Session["log_Date"]).AddDays(1);


        if ((DateTime)Session["log_Date"] > DateTime.Now.AddDays(-1))
        {

            btnDeleteReservation.Visible = true;

        }
        else
            btnDeleteReservation.Visible = false;

        bindDataGrid();

    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        { 
        string month = Request.QueryString["mm"];
        string day = Request.QueryString["dd"];
        string year = Request.QueryString["aaaa"];
        string boatID = Request.QueryString["BoatID"];
        DateTime dt = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));

       if (dt < DateTime.Now.AddDays(-1))
            {

                btnDeleteReservation.Visible = false;

            }
       else
                btnDeleteReservation.Visible = true;

            Session["log_Date"] = dt;
        Session["log_BoatID"] = boatID;


        bindDataGrid();
            bindPickupDropOffTime();

        }

    }

    protected void btnChangeDate_Click(object sender, EventArgs e)
    {

    }
    public double getMilitary(double i)
    {
        //if ( i < 10 ) then
        //else
        //getMilitary=i*100
        //end if
        return i * 100.0;
    }
    void bindPickupDropOffTime()
    {
        for (double i = 9.0; i <= 11.00; i += 1.0)
        {
            ddStartTime.Items.Add(new ListItem(i.ToString() + ":00 AM", getMilitary(i).ToString()));
            // ddStartTime.Items.Add(new ListItem(i.ToString() + ":30 AM", getMilitaryHalf(i).ToString()));


            ddEndTime.Items.Add(new ListItem(i.ToString() + ":00 AM", getMilitary(i).ToString()));
            // ddEndTime.Items.Add(new ListItem(i.ToString() + ":30 AM", getMilitaryHalf(i).ToString()));

        }

        ddStartTime.Items.Add(new ListItem("12:00 PM", "1200"));
        //ddStartTime.Items.Add(new ListItem( "12:30 PM", "1230"));

        ddEndTime.Items.Add(new ListItem("12:00 PM", "1200"));
        //ddEndTime.Items.Add(new ListItem("12:30 PM", "1230"));

        for (double i = 13.0; i <= 17.00; i += 1.0)
        {
            ddStartTime.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
            // ddStartTime.Items.Add(new ListItem((i-12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

            ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
            //ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

        }

        ddStartTime.Items.Insert(0, "Pick up time");
        ddEndTime.Items.Insert(0, "Drop off time");

    }


    protected void btnChangeDate_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "changedate")
        {

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBookedBoats.Rows[index];
            string val = gvBookedBoats.DataKeys[index]["in_BookDateID"].ToString();
            DataTable dtBookingDetails = Util.getDataSet("execute usp_get_booking_details @in_BookDateID=" + val).Tables[0];

            if (dtBookingDetails.Rows.Count > 0)
            {
                txtFromDate.Text = ((DateTime)dtBookingDetails.Rows[0]["dt_beginDate"]).ToShortDateString();
                txtToDate.Text = ((DateTime)dtBookingDetails.Rows[0]["dt_endDate"]).ToShortDateString();

                Session["modify_renttype"] = dtBookingDetails.Rows[0]["in_typeRentID"].ToString();
                Session["modify_in_BookDateID"] = val;
                Session["modify_in_boatID"] = dtBookingDetails.Rows[0]["in_boatID"].ToString();
                Session["modify_in_marinaID"] = dtBookingDetails.Rows[0]["in_marinaID"].ToString();

                if (dtBookingDetails.Rows[0]["in_typeRentID"].ToString() == "4")
                {
                    pnlTime.Visible = true;

                    if (ddStartTime.Items.FindByValue(dtBookingDetails.Rows[0]["ch_beginHourMilitary"].ToString()) !=null)
                    {
                        ddStartTime.ClearSelection();
                        ddStartTime.Items.FindByValue(dtBookingDetails.Rows[0]["ch_beginHourMilitary"].ToString()).Selected = true;

                    }

                    if (ddEndTime.Items.FindByValue(dtBookingDetails.Rows[0]["ch_endHourMilitary"].ToString()) != null)
                    {
                        ddEndTime.ClearSelection();
                        ddEndTime.Items.FindByValue(dtBookingDetails.Rows[0]["ch_endHourMilitary"].ToString()).Selected = true;

                    }


                }
                else
                {
                    pnlTime.Visible = false;


                }
            }

            // string id = e.CommandArgument.ToString();

            mdlPopupChangeDate.Show();


        }


    }

    bool CheckIfAvailable()
    {

        /*

        @p_in_boatID		integer,
@p_in_marinaID		integer,
@p_in_typerentID	integer,
@p_begindate		char(10),
@p_enddate		char(10),
@p_beginhour		varchar(8)=null,
@p_endhour		varchar(8)=null,
@p_hours_military_from integer=null,
@p_hours_military_to integer=null

        */

        bool available = true;
        using (SqlConnection con = Util.getConnection())
        {
            using (SqlCommand cmd = new SqlCommand("[usp_modification_availability]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_in_boatID", Session["modify_in_boatID"].ToString());
                cmd.Parameters.AddWithValue("@p_in_MarinaId", Session["modify_in_marinaID"].ToString());
                cmd.Parameters.AddWithValue("@p_in_typerentID", Session["modify_renttype"].ToString()) ;
                cmd.Parameters.AddWithValue("@p_begindate",  txtFromDate.Text.Trim());

                //if (Session[Util.Session_Selected_DropOffDate] == null)
                //    Session[Util.Session_Selected_DropOffDate] = Session[Util.Session_Selected_PickupDate];


                cmd.Parameters.AddWithValue("@p_enddate", txtToDate.Text.Trim());

                cmd.Parameters.AddWithValue("@p_in_BookDateId", Session["modify_in_BookDateID"].ToString());


                if (Session["modify_renttype"].ToString() == "4") // Hourly
                {
                    cmd.Parameters.AddWithValue("@p_beginhour", ddStartTime.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@p_endhour", ddEndTime.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@p_hours_military_from", ddStartTime.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@p_hours_military_to", ddEndTime.SelectedItem.Value);


                }

                DataSet dst = new DataSet();

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dst);

                DataTable dtA = dst.Tables[0];

                if (dtA.Rows[0][0].ToString() == "0")
                    available = false;




            }
        }



        return available;
    }

void  ModifyKart()
    {


        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_modify_kart]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@p_in_boatID", Session["modify_in_boatID"].ToString());
                    cmd.Parameters.AddWithValue("@p_in_MarinaId", Session["modify_in_marinaID"].ToString());
                    cmd.Parameters.AddWithValue("@p_in_typerentID", Session["modify_renttype"].ToString());
                    cmd.Parameters.AddWithValue("@p_begindate", txtFromDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@p_enddate",txtToDate.Text.Trim());

                    if (Session["modify_renttype"].ToString() == "4")
                    { 
                    //RentTime rstime = (RentTime)Session[Util.Session_Selected_PickupTime];
                   // RentTime retime = (RentTime)Session[Util.Session_Selected_DropOffTime];
                    cmd.Parameters.AddWithValue("@p_beginhour", ddStartTime.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@p_endhour", ddEndTime.SelectedItem.Text);

                    cmd.Parameters.AddWithValue("@p_beginhourMilitary", ddStartTime.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@p_endhourMilitary", ddEndTime.SelectedItem.Value);

                        int thours = (int.Parse(ddEndTime.SelectedItem.Value) - int.Parse(ddStartTime.SelectedItem.Value)) / 100;

                        cmd.Parameters.AddWithValue("@p_totalHours", thours);

                    }
                    else
                    {
                        string[] rentH = Util.getMarinaOpenAndCloseTime(Session["modify_in_marinaID"].ToString(), "1", Session["modify_in_boatID"].ToString());


                        cmd.Parameters.AddWithValue("@p_beginhour", rentH[0]);
                        cmd.Parameters.AddWithValue("@p_endhour", rentH[1]);

                        cmd.Parameters.AddWithValue("@p_beginhourMilitary", rentH[2]);
                        cmd.Parameters.AddWithValue("@p_endhourMilitary", rentH[3]);
                        cmd.Parameters.AddWithValue("@p_totalHours", 24);
                    }
                    //Session[Util.Session_Cart_Id] = generateUniqueCartID();

                    //cmd.Parameters.AddWithValue("@p_vc_sessionID", Session[Util.Session_Cart_Id].ToString());

                    //cmd.Parameters.AddWithValue("@p_ti_webclient", 1);


                    /// This need to be updated later when client login
                    /// 
                    //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());

                    cmd.Parameters.AddWithValue("@p_in_BookDateID", Session["modify_in_BookDateID"].ToString());

                    cmd.Parameters.AddWithValue("@p_in_CreatedBy",Session["userID"].ToString() );

                    cmd.ExecuteNonQuery();


                }
            }


            Response.Redirect("FacilityCalendarView.aspx");

        }

        catch (Exception ex)
        {

            lblMessagePopup.Text = "Error while adding to Cart " + ex.Message;

            mdlPopupChangeDate.Show();

        }



    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime dStartDate;
        DateTime dEndDate;
        if (txtFromDate.Text.Trim() == "" || txtToDate.Text.Trim() == "")
        {
            lblMessagePopup.Text = "Invalid Pick up or Drop off Date";

            return;
        }

        if (!DateTime.TryParse(txtFromDate.Text,out dStartDate))
        {
            lblMessagePopup.Text = "Invalid Pick up  Date";

            return;
        }
        if (!DateTime.TryParse(txtToDate.Text, out dEndDate))
        {
            lblMessagePopup.Text = "Invalid Drop Off  Date";

            return;
        }

        if (Session["modify_renttype"].ToString() == "4")
        {
            if (ddStartTime.SelectedIndex <= 0 || ddEndTime.SelectedIndex <=0)
            {
                lblMessagePopup.Text = "Invalid Time";
                return;
            }

            if (int.Parse(ddStartTime.SelectedItem.Value.ToString()) >= int.Parse(ddEndTime.SelectedItem.Value.ToString()))

            {
                lblMessagePopup.Text = "Invalid Time";
                return;
            }
        }



        if (!CheckIfAvailable())
        {
            lblMessagePopup.Text = "Selected Date/Time is not available";
            return;

        }
        else
            ModifyKart();





    }
}