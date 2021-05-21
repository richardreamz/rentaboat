using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using System.IO;

public partial class admin_BoatOwnerSignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool IsProfileComplete()
    {
        bool complete = true;

        DataTable dtC = Util.getDataSet("execute usp_is_profile_complete @marinaID=" + Session["MarinaID"].ToString()).Tables[0];

        if (dtC.Rows.Count == 0)
            complete = false;



        return complete;

    }

    void SendWelcomeEmail()
    {
        string body = string.Empty;

       

        using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/WelcomeOwnerSignupEmailTemplate.html")))
        {
            body = reader.ReadToEnd();
        }

        body = body.Replace("{BoatOwnerName}", txtContactName.Text.Trim());

        body = body.Replace("{BoatOwnerName}", txtContactName.Text.Trim() + " " + txtFacilityName.Text);

        body = body.Replace("{FacilityID}", Session["MarinaID"].ToString());


        //  Util.LogEMail("BookingRequest@rentaboat.com", orderSummary.ClientEmail + ",BookingRequest@rentaboat.com", "Boat Booking Request Sent from RentABoat!", body, "Order Email to Renter");

        Util.LogEMail("Welcome@rentaboat.com", txtEmail.Text + ",Welcome@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Welcome to RentABoat.com !", body, "Welcome Email Owner Signup");


        Util.SendEMail("Welcome@rentaboat.com", txtEmail.Text + ",Welcome@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Welcome to RentABoat.com !", body);



    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


        if (txtContactName.Text.Trim() == "")
        {
            lblMessage.Text = "Empty First Name";
            return;



        }

        if (txtFacilityName.Text.Trim() == "")
        {
            lblMessage.Text = "Empty Last Name";
            return;



        }


        if (txtEmail.Text.Trim() == "")
        {
            lblMessage.Text = "Empty Email";
            return;



        }


        if (txtSignupPassword.Text.Trim() == "")
        {
            lblMessage.Text = "Empty Password";
            return;



        }

        if (Util.IsUserExists(txtEmail.Text))
        {

            lblMessage.Text = "Email already exists in the system.";
            return;

        }





        if (txtEmail.Text != txtEmailConfirm.Text)
        {
            lblMessage.Text = "Email does not match.";
            return;
        }

        if (txtSignupPassword.Text != txtSignupPasswordConfirm.Text)
        {
            lblMessage.Text = "Password does not match.";
            return;
        }


        try
        {


            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_new_boat_owner_signup", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    

                    cmd.Parameters.AddWithValue("@vc_contactName", txtContactName.Text);
                    cmd.Parameters.AddWithValue("@vc_BusinessName", txtFacilityName.Text);



                    cmd.Parameters.AddWithValue("@vc_password", txtSignupPassword.Text);

                    cmd.Parameters.AddWithValue("@vc_email", txtEmail.Text);
                    cmd.ExecuteNonQuery();


                    DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtEmail.Text.Trim() + "' , @p_vc_password='" + txtSignupPassword.Text.Trim() + "'").Tables[0];


                    if (dt.Rows.Count > 0)
                    {
                        String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
                        String dotNET = Strings.Right(currentPage, 1);


                        String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
                        if (dotNET == dotNETdb) { dotNET = ""; }
                        Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
                        Session.Add("userName", dt.Rows[0]["vc_username"].ToString());

                        Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
                        Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
                        Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
                        Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);


                        SendWelcomeEmail();
                        Util.Execute("execute [SP_BR_MARINA_NOTES_SAVE] @P_IN_MarinaID=" + dt.Rows[0]["in_MarinaID"].ToString() + ",@P_VC_Notes='Sign on date:" + DateTime.Now.ToString("f") + "'");

                    }

                }
            }

            Session["newfacility"] = true;

            Response.Redirect("facilities_mant.aspx");

        }
        catch(Exception ex)
        {

            lblMessage.Text = "Error Inserting Record. " + ex.Message;


        }





    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtContactName.Text = txtEmail.Text = txtEmailConfirm.Text = txtSignupPassword.Text = txtSignupPasswordConfirm.Text = "";

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Lat"] = txtLat.Value;
        Session["Lon"] = txtLon.Value;
        int zcode;
        if (txtLat.Value != "24.55573589999999" && txtLon.Value != "-81.78265369999997")
        {
            if (int.TryParse(txtSearch.Value.Trim(), out zcode))
                Session["zipcode"] = zcode;

            else
                Session["zipcode"] = txtZipCode.Value;

            Session["city"] = txtCityName.Value;

            Session["state"] = txtState.Value;
            Session["searchterm"] = txtSearch.Value;
        }
        else
        {
            Session["Lat"] = "";
            Session["Lon"] = "";
            Session["searchterm"] = "Florida Keys";

        }
        Response.Redirect("Results.aspx?t=2");





    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];

        try
        {
            if (dt.Rows.Count > 0)
            {
                String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
                String dotNET = Strings.Right(currentPage, 1);
                String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
                if (dotNET == dotNETdb) { dotNET = ""; }
                Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
                Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
                Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
                Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
                Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
                Session.Add("userName", dt.Rows[0]["vc_username"].ToString());

                // lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

                //    lblLoginLogout.Text = "Sign out";

                if (dt.Rows[0]["in_userLevelID"].ToString() == "4")
                {

                    Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



                    Response.Redirect("UpdateClientInfo.aspx", true);

                }

                // else
                // Response.Redirect(Convert.ToString(Session["defaultPage"]));
                else if (Session["userLevelID"].ToString() == "1")
                    Response.Redirect("~/admin/facilities_list.aspx");

                else if (Session["userLevelID"].ToString() == "2" || Session["userLevelID"].ToString() == "3")
                {
                    //  Session["marinaID"].ToString()
                    if (IsProfileComplete())
                    {

                        //   Server.Transfer(ResolveUrl("~/admin/FacilityCalendarView.aspx"));
                        Page.Response.Redirect(ResolveUrl("~/admin/FacilityCalendarView.aspx"), false);
                        //  Context.ApplicationInstance.CompleteRequest();
                        Response.End();
                        //  Context.ApplicationInstance.CompleteRequest();


                        //  RegisterStartupScript(ResolveUrl("~/admin/FacilityCalendarView.aspx"));


                        return;

                    }
                    else
                    {
                        Response.Redirect("~/admin/Facilities_mant.aspx", false);
                        //     Context.ApplicationInstance.CompleteRequest();
                        //  Response.End();
                        return;
                    }

                }




            }
        }
        catch (Exception ex)
        {

        }

    }
}