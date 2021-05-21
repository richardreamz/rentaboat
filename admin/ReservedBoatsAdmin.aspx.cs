using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
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


    void SendEMailToOwner(clsOrderSummary orderSummary)
    {

        //    Price { Price}
        //per: { SelectedTime} < br />


        //{ AmountTimePeriod}
        //x { Price}

        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/OwnerEmailTemplate.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{FacilityName}", orderSummary.FacilityName);
        body = body.Replace("{CustomerName}", orderSummary.ClientFirstName + " " + orderSummary.ClientLastName);

        body = body.Replace("{CustomerAddress}", orderSummary.ClientAddress + ", " + orderSummary.ClientCity + ", " + orderSummary.ClientState + " " + orderSummary.ClientCountry);
        body = body.Replace("{CustomerPhone}", orderSummary.ClientContactPhone);
        body = body.Replace("{CustomerEMail}", orderSummary.ClientEmail);
        body = body.Replace("{BoatName}", orderSummary.BoatName);
        body = body.Replace("{BoatMake}", orderSummary.BoatMake);

        body = body.Replace("{BoatModel}", orderSummary.BoatModel);

        body = body.Replace("{BoatYear}", orderSummary.BoatYear);

        body = body.Replace("{BoatSize}", orderSummary.BoatSize);

        body = body.Replace("{RentType}", orderSummary.RentTypeDescription);

        body = body.Replace("{RentalStartDate}", orderSummary.RentStartDate);

        body = body.Replace("{RentalEndDate}", orderSummary.RentEndDate);

        //   body = body.Replace("{Price}", "$" + orderSummary.DailyOrHourlyPrice.ToString("F"));

        body = body.Replace("{SelectedTime}", orderSummary.RentingTimeFromTo);

        //if (orderSummary.RentTypeId == "1")
        //    body = body.Replace("{AmountTimePeriod}", orderSummary.NumberOfDays.ToString());
        //else if (orderSummary.RentTypeId == "2" || orderSummary.RentTypeId == "3")
        //    body = body.Replace("{AmountTimePeriod}", "1");

        //else if (orderSummary.RentTypeId == "4")
        //    body = body.Replace("{AmountTimePeriod}", orderSummary.NumberOfHoursRented.ToString());

        if (orderSummary.RequestedCurrencyId == 2)
        {

            body = body.Replace("{TotalPrice}", "&euro;" + orderSummary.TotalRentAmount.ToString("F"));
            body = body.Replace("{RentalOnlineFee}", "&euro;" + orderSummary.MarinaOnlineReservationFee.ToString("F"));
            body = body.Replace("{DueCustomer}", "&euro;" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


        }
        else
        {
            body = body.Replace("{TotalPrice}", "$" + orderSummary.TotalRentAmount.ToString("F"));
            body = body.Replace("{RentalOnlineFee}", "$" + orderSummary.MarinaOnlineReservationFee.ToString("F"));
            body = body.Replace("{DueCustomer}", "$" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


        }




        body = body.Replace("{TaxRate}", orderSummary.TaxRate);











        // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Tentative Boat Reservation!", body);


        Util.LogEMail("BookingRequest@rentaboat.com", orderSummary.MarinaEMail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request from RentABoat!", body, "Order Email to Owner");


        Util.SendEMail("BookingRequest@rentaboat.com", orderSummary.MarinaEMail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request from RentABoat!", body);


    }





    void SendEmailToRenter(string sessionid)
    {

        //    Price { Price}
        //per: { SelectedTime} < br />


        //{ AmountTimePeriod}
        //x { Price}

     /*   DataTable dtBookingDetails = Util.getDataSet("execute usp_get_booking_details @in_BookDateID=" + in_bookDateID).Tables[0];

        string cartid = "";

        if (dtBookingDetails.Rows.Count > 0)
        {
            cartid = dtBookingDetails.Rows[0]["in_kartID"].ToString();

            
        }*/

        clsOrderSummary orderSummary = clsOrderSummary.getOrderSummary(sessionid);



     //   clsOrderSummary.LoadClientDetails(orderSummary,);




        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/RenterEmailTemplate.html")))
        {
            body = reader.ReadToEnd();
        }

        string uname = "";
        string pass = "";

        DataTable dtUser = Util.getDataSet("usp_get_client_user_name @in_ClientID=" + orderSummary.ClientID.ToString()).Tables[0];

        if (dtUser.Rows.Count > 0)
        {
            uname = dtUser.Rows[0]["vc_username"].ToString();
            pass = dtUser.Rows[0]["vc_password"].ToString();
        }

        body = body.Replace("{Username}", uname);

      
        int len = pass.Length;
        if (len > 3)
        {
            pass = pass.Substring(0, 3) + String.Concat(Enumerable.Repeat("_", (len - 3)));

        }


        body = body.Replace("{Password}", pass);



        body = body.Replace("{BoatID}", orderSummary.BoatID.ToString());
        body = body.Replace("{BoatName}", orderSummary.BoatName);

        body = body.Replace("{BoatYear}", orderSummary.BoatYear);
        body = body.Replace("{BoatMake}", orderSummary.BoatMake);
        body = body.Replace("{BoatModel}", orderSummary.BoatModel);
        body = body.Replace("{BoatSize}", orderSummary.BoatSize);
        body = body.Replace("{MaximumPassengers}", orderSummary.MaximumPassengers.ToString());

        body = body.Replace("{BoatDescription}", orderSummary.BoatDescription);

        body = body.Replace("{Requirement}", orderSummary.BoatRequirements);

        body = body.Replace("{MarinaAddress}", orderSummary.AddressLine1 + " " + orderSummary.AddressLine2 + ", " + orderSummary.City + ", " + orderSummary.StateName + ", " + orderSummary.CountryName + " " + orderSummary.Zipcode);

        body = body.Replace("{OwnerName}", orderSummary.ContactName);


        body = body.Replace("{FacilityNumber}", orderSummary.MarinaID.ToString());


        body = body.Replace("{TaxRate}", orderSummary.TaxRate.ToString() + "%");



        body = body.Replace("{FacilityName}", orderSummary.FacilityName);

        body = body.Replace("{MarinaName}", orderSummary.MarinaName);

        body = body.Replace("{BoatAddress}", orderSummary.AddressLine1 + " " + orderSummary.AddressLine2 + ", " + orderSummary.City + ", " + orderSummary.StateName + ", " + orderSummary.CountryName + " " + orderSummary.Zipcode);


        body = body.Replace("{OwnerPhone}", orderSummary.MarinaPhone);

        body = body.Replace("{OwnerEmail}", orderSummary.MarinaEMail);

        body = body.Replace("{OwnerWebsite}", orderSummary.FacilityWebsite);

        body = body.Replace("{CancellationPolicy}", orderSummary.FacilityCancellationPolicy);

        body = body.Replace("{Direction}", orderSummary.FacilityDirection);

        body = body.Replace("{RentalStartDate}", orderSummary.RentStartDate);

        body = body.Replace("{RentalEndDate}", orderSummary.RentEndDate);

        //   body = body.Replace("{Price}", "$" + orderSummary.DailyOrHourlyPrice.ToString("F"));

        body = body.Replace("{SelectedTime}", orderSummary.RentingTimeFromTo);

        //if (orderSummary.RentTypeId == "1")
        //    body = body.Replace("{AmountTimePeriod}", orderSummary.NumberOfDays.ToString());
        //else if (orderSummary.RentTypeId == "2" || orderSummary.RentTypeId == "3")
        //    body = body.Replace("{AmountTimePeriod}", "1");

        //else if (orderSummary.RentTypeId == "4")
        //    body = body.Replace("{AmountTimePeriod}", orderSummary.NumberOfHoursRented.ToString());


        if (orderSummary.RequestedCurrencyId == 2)
        {
            body = body.Replace("{TotalPrice}", "&euro;" + orderSummary.TotalRentAmount.ToString("F"));
            body = body.Replace("{RentalOnlineFee}", "&euro;" + orderSummary.MarinaOnlineReservationFee.ToString("F"));

            body = body.Replace("{TotalPriceminusRentalOnlineFee}", "&euro;" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


            body = body.Replace("{DueAtDock}", "&euro;" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));

            body = body.Replace("{ReservationDeposit}", "&euro;" + orderSummary.ReservationDeposit.ToString());
            body = body.Replace("{SecurityDeposit}", "&euro;" + orderSummary.FacilitySecurityDeposit.ToString());



        }
        else
        {
            body = body.Replace("{TotalPrice}", "$" + orderSummary.TotalRentAmount.ToString("F"));
            body = body.Replace("{RentalOnlineFee}", "$" + orderSummary.MarinaOnlineReservationFee.ToString("F"));

            body = body.Replace("{TotalPriceminusRentalOnlineFee}", "$" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));

            body = body.Replace("{DueAtDock}", "$" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


            body = body.Replace("{ReservationDeposit}", "$" + orderSummary.ReservationDeposit.ToString());
            body = body.Replace("{SecurityDeposit}", "$" + orderSummary.FacilitySecurityDeposit.ToString());

        }




        body = body.Replace("{TaxRate}", orderSummary.TaxRate);




        body = body.Replace("{RenterFullname}", orderSummary.ClientFirstName + " " + orderSummary.ClientLastName);



        Util.LogEMail("BookingRequest@rentaboat.com", orderSummary.ClientEmail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body, "Order Email to Renter");

       Util.SendEMail("BookingRequest@rentaboat.com", orderSummary.ClientEmail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body);

        SendEMailToOwner(orderSummary);

        
        // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Tentative Boat Reservation!", body);


        String csname1 = "PopupScript1";
        Type cstype = this.GetType();

        // Get a ClientScriptManager reference from the Page class.
        ClientScriptManager cs = Page.ClientScript;

        // Check to see if the startup script is already registered.
      
            StringBuilder cstext1 = new StringBuilder();
            cstext1.Append("<script type=text/javascript> alert('Successfully Send Email') </");
            cstext1.Append("script>");

         //  cs.RegisterStartupScript(cstype, csname1, cstext1.ToString());

        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType()
                                                     , csname1, "ShowSuccessMessage();", true);
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
        else if (e.CommandName == "Email")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBookedBoats.Rows[index];
            string val = gvBookedBoats.DataKeys[index]["in_BookDateID"].ToString();
            DataTable dtBookingDetails = Util.getDataSet("execute usp_get_booking_details @in_BookDateID=" + val).Tables[0];

            Session["modify_in_BookDateID"] = val;
            pnlTime.Visible = false;

            SendEmailToRenter(Util.getCartSessionID(val));



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