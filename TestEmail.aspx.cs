using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
/*
        // Util.SendEMail("info@rentaboat.com", "mmathai@gmail.com", "Test", "Test");
        //  Util.SendEMail("info@rentaboat.com",  "info@rentaboat.com", "RentABoat.com account is Approved !", "Test Email");
        try
        {
            //Util.SendEMail("BookingRequest@rentaboat.com", "mmathai@gmail.com,welcome@rentaboat.com", "Boat Booking Request from RentABoat!", "Testing Reservation");
            Util.SendEMail("welcome@rentaboat.com", "welcome@rentaboat.com,mmathai@gmail.com", "Boat Booking Request from RentABoat!", "Testing Reservation");

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
        */
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";

        try
        {
            if (txtEmail.Text.Trim() != "")
            {
                Util.SendEmailUsingSMTP2Go("BookingRequest@rentaboat.com", txtEmail.Text, "Boat Booking Request from RentABoat!", txtBody.Text.Trim());

                lblMessage.Text = "Email Sent" + Server.MapPath("~");

            }
            else
                lblMessage.Text = "Missing Email";
        }
        catch(Exception ex)
        {

            Response.Write(ex.Message);

        }

    }
}