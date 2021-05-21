using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_facilities_mant : System.Web.UI.Page
{


    public double getMilitary(double i)
    {
        //if ( i < 10 ) then
        //else
        //getMilitary=i*100
        //end if
        return i * 100.0;
    }

    public double getMilitaryHalf(double i)
    {
        //if ( i < 10 ) then
        //else
        //getMilitaryHalf=i*100+30
        //end if
        return i * 100.0 + 30.0;
    }

    void BindCountryList()
    {


        DataTable dtC = Util.getDataSet("execute [SP_BR_COUNTRY_LIST] ").Tables[0];

        ddCountry.DataSource = dtC;


        ddCountry.DataTextField = "vc_name";
        ddCountry.DataValueField = "in_countryID";

        ddCountry.DataBind();




        ddCountry.Items.Insert(0, "Select a Country");




        //  ddCountry.SelectedIndex = 1;
        if (ddCountry.Items.FindByValue("1") != null)
            ddCountry.Items.FindByValue("1").Selected = true;


        bindStateList();


      //  ddState.Items.Clear();





    }

    void bindStateList()
    {

        if (ddCountry.SelectedIndex > 0)
        {

            DataTable dtState = Util.getDataSet("execute [SP_BR_STATE_LIST] @CountryID=" + ddCountry.SelectedItem.Value).Tables[0];

            ddState.DataSource = dtState;

            ddState.DataTextField = "vc_name";
            ddState.DataValueField = "in_stateID";
            ddState.DataBind();

            ddState.Items.Insert(0, "Select a State");

            ddState.SelectedIndex = 0;




        }

    }

    void bindDropDownHours(DropDownList dd)
    {


        dd.Items.Add(new ListItem("12:00 AM", "0000"));
        for (double i = 1.0; i <= 11.00; i += 1.0)
        {
            dd.Items.Add(new ListItem(i.ToString() + ":00 AM", getMilitary(i).ToString()));
            //   dd.Items.Add(new ListItem(i.ToString() + ":30 AM", getMilitaryHalf(i).ToString()));




        }

        dd.Items.Add(new ListItem("12:00 PM", "1200"));
        //ddStartTime.Items.Add(new ListItem( "12:30 PM", "1230"));

        //dd.Items.Add(new ListItem("12:00 PM", "1200"));
        //ddEndTime.Items.Add(new ListItem("12:30 PM", "1230"));

        for (double i = 13.0; i < 24.00; i += 1.0)
        {
            dd.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
            // ddStartTime.Items.Add(new ListItem((i-12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

            //  dd.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
            //ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

        }

        dd.Items.Insert(0, new ListItem("Select Hours", "-1"));

    }
    //void bindDropDownHours(DropDownList dd)
    //{


    //    for (double i = 0.0; i <= 11.00; i += 1.0)
    //    {
    //        dd.Items.Add(new ListItem(i.ToString() + ":00 AM", getMilitary(i).ToString()));
    //        //   dd.Items.Add(new ListItem(i.ToString() + ":30 AM", getMilitaryHalf(i).ToString()));




    //    }

    //    dd.Items.Add(new ListItem("12:00 PM", "1200"));
    //    //ddStartTime.Items.Add(new ListItem( "12:30 PM", "1230"));

    //    //dd.Items.Add(new ListItem("12:00 PM", "1200"));
    //    //ddEndTime.Items.Add(new ListItem("12:30 PM", "1230"));

    //    for (double i = 13.0; i <= 24.00; i += 1.0)
    //    {
    //        dd.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
    //        // ddStartTime.Items.Add(new ListItem((i-12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

    //        //  dd.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
    //        //ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

    //    }

    //    dd.Items.Insert(0, new ListItem("Select Hours", "-1"));


    //}

    void populateFacilityOpenClose()
    {


        bindDropDownHours(ddOpenHour);
        bindDropDownHours(ddClosedHour);




    }



    void PopulateFacility(string marinaid)
    {



        DataTable dt = Util.getDataSet("execute sp_br_marina_get @p_in_marinaID=" + marinaid).Tables[0];

        if (dt.Rows.Count > 0)
        {
            txtContactName.Text = dt.Rows[0]["vc_contactName"].ToString();
            txtFacilityName.Text = dt.Rows[0]["vc_businessName"].ToString();

            //txtMarinaName.Text = dt.Rows[0]["vc_marinaName"].ToString();
            txtAddress1.Text = dt.Rows[0]["vc_addressline1"].ToString();
            txtAddress2.Text = dt.Rows[0]["vc_addressline2"].ToString();

            ddCountry.ClearSelection();

            if (ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()) != null)
                ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()).Selected = true;
            else
            // ddCountry.SelectedIndex = 1;
            {

                if (ddCountry.Items.FindByValue("1") != null)
                    ddCountry.Items.FindByValue("1").Selected = true;


            }



            bindStateList();
            ddState.ClearSelection();
            if (ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()) != null)
                ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()).Selected = true;





            txtCity.Text = dt.Rows[0]["vc_city"].ToString();
            txtZipCode.Text = dt.Rows[0]["ch_Zip"].ToString();
            //txtBodyOfWater.Text = dt.Rows[0]["vc_bodywater"].ToString();
            txtPhone.Text = dt.Rows[0]["vc_phone"].ToString();
            txtFax.Text = dt.Rows[0]["vc_fax"].ToString();
            txtEmail.Text = dt.Rows[0]["vc_email"].ToString();
            txtFacilityWebSite.Text = dt.Rows[0]["facilityWebSite"].ToString();

            //txtTaxRate.Text = dt.Rows[0]["nu_tax"].ToString();

            //if (int.Parse(Session["userLevelID"].ToString()) == 1)
            //{
            // Pay per click

            txtPayClickAmount.Text = "";
            txtPercentageAmount.Text = "10.00";
            txtFlatRateAmount.Text = "";
            txtDiplayAdAmount.Text = "";

            Session["OriginalFeeType"] = dt.Rows[0]["ch_feeType"].ToString();

            if (dt.Rows[0]["ch_feeType"].ToString() !="")
            {

               
                if (int.Parse(dt.Rows[0]["ch_feeType"].ToString()) == 0)
                {
                    rdPayPerClick.Checked = true;

                if (dt.Rows[0]["nu_fee"].ToString() != "")
                    txtPayClickAmount.Text = ((decimal)dt.Rows[0]["nu_fee"]).ToString("F");

                }

                if (int.Parse(dt.Rows[0]["ch_feeType"].ToString()) == 1)
                {
                    rdPercentage.Checked = true;
                if (dt.Rows[0]["nu_fee"].ToString() != "")
                    txtPercentageAmount.Text = ((decimal)dt.Rows[0]["nu_fee"]).ToString("F");

                }

                if (int.Parse(dt.Rows[0]["ch_feeType"].ToString()) == 2)
                {
                    rdFlatRate.Checked = true;

                if (dt.Rows[0]["nu_fee"].ToString() !="")
                  txtFlatRateAmount.Text = ((decimal)dt.Rows[0]["nu_fee"]).ToString("F");

                }


                if (int.Parse(dt.Rows[0]["ch_feeType"].ToString()) == 3)
                {
                    rdDisplayAd.Checked = true;
                if (dt.Rows[0]["nu_fee"].ToString() != "")
                    txtDiplayAdAmount.Text = ((decimal)dt.Rows[0]["nu_fee"]).ToString("F");

                    if (dt.Rows[0]["DisplayAdType"].ToString() == "M")
                        rdMonthly.Checked = true;
                    else if (dt.Rows[0]["DisplayAdType"].ToString() == "Y")
                        rdYearly.Checked = true;


                }
            }



            txtDisplayLandingPage.Text = dt.Rows[0]["DisplayAdLandingPage"].ToString();

            //ddMultipleLocation.ClearSelection();

            //if (dt.Rows[0]["ch_multipleLocations"].ToString() == "1")
            //    ddMultipleLocation.SelectedIndex = 1;
            //else if (dt.Rows[0]["ch_multipleLocations"].ToString() == "0")
            //    ddMultipleLocation.SelectedIndex = 2;
            //else
            //    ddMultipleLocation.SelectedIndex = 0;

            //ddAccomodations.ClearSelection();

            //if (dt.Rows[0]["ch_accomodations"].ToString() == "1")
            //    ddAccomodations.SelectedIndex = 1;
            //else if (dt.Rows[0]["ch_accomodations"].ToString() == "0")
            //    ddAccomodations.SelectedIndex = 2;
            //else
            //    ddAccomodations.SelectedIndex = 0;


            //ddCaptian.ClearSelection();
            //if (dt.Rows[0]["ti_captain"].ToString() == "1")
            //    ddCaptian.SelectedIndex = 1;
            //else if (dt.Rows[0]["ti_captain"].ToString() == "0")
            //    ddCaptian.SelectedIndex = 2;
            //else
            //    ddCaptian.SelectedIndex = 0;


            //if (dt.Rows[0]["AllowSameDayRental"].ToString() == "0")
            //    chkNoSameDay.Checked = true;

            //else if (dt.Rows[0]["AllowSameDayRental"].ToString() == "1")
            //    chkNoSameDay.Checked = false;
            //else
            //    chkNoSameDay.Checked = false;



            ddOpenHour.ClearSelection();

            if (ddOpenHour.Items.FindByText(dt.Rows[0]["vc_startHour"].ToString()) != null)
                ddOpenHour.Items.FindByText(dt.Rows[0]["vc_startHour"].ToString()).Selected = true;


            ddClosedHour.ClearSelection();

            if (ddClosedHour.Items.FindByText(dt.Rows[0]["vc_endHour"].ToString()) != null)
                ddClosedHour.Items.FindByText(dt.Rows[0]["vc_endHour"].ToString()).Selected = true;




          
                  //   txtFacilityDirections.Text = dt.Rows[0]["vc_facilityDirections"].ToString();

          
            txtRating.Text = dt.Rows[0]["in_rating"].ToString();

            txtWebSiteAddress.Text = "https://www.RentABoat.com/facility.aspx?id=" + Session["marinaID"].ToString();



        }


    }



    protected void Page_Load(object sender, EventArgs e)
    {

      

        if (Session["userLevelID"] == null || (int.Parse(Session["userLevelID"].ToString()) != 1 && int.Parse(Session["userLevelID"].ToString()) != 3))
            {

            Response.Redirect("../index.aspx");
            return;
             }


        if (!Page.IsPostBack)
        {
            if (Request.QueryString["MarinaID"] != null)
                Session["marinaID"] = Request.QueryString["MarinaID"];


            populateFacilityOpenClose();
            BindCountryList();

            Session["P_Action"] = "N";
            if (int.Parse(Session["userLevelID"].ToString()) != 1)
            {
                pnlCommissionFee.Visible = false;

                pnlRating.Visible = false;


            }


            if (Session["marinaID"] != null)
            {

//Request.QueryString["MarinaID"]
                PopulateFacility(Session["marinaID"].ToString());
              //  Session["MarinaID"] = Request.QueryString["MarinaID"];


                Session["P_Action"] = "E";
            }

            else
            {
                Session["MarinaID"] = "0";

            }


           // Util.SendSMSMessage("");

        }

    }


    private string ValidateInput(string value, string fieldname)
    {
        string valid = "";

        string regPhone = @"\W*?(\([0-9]{3}\)|[0-9]{3}-)*([0-9]{3}-|[0-9]{3})[0-9]{4}\W*";
        string regWebAddres = @"\W*(\.com|\.COM|\.net|\.NET|\.org|\.ORG)\W*";


        if (fieldname != "Phone" && fieldname != "Email")
        { 
            if (Regex.IsMatch(value, regPhone))
            {

                if (!value.Contains("631-286-7816"))
                    valid = fieldname + " contains Phone Number. \\n";

            }
        if (Regex.IsMatch(value, regWebAddres))
        {
            if (!value.Contains("www.rentaboat.com"))
                valid = fieldname + " contains Web Address. \\n";

        }
    }
        switch (fieldname)
        {
            case "First Name":
                if (value.Trim() == "")
                valid = "Missing " + fieldname + "\\n"; 

                break;

            case "Last Name":
                if (value.Trim() == "")
                    valid = "Missing " + fieldname + "\\n";

                break;

            

            case "Address 1":
                if (value.Trim() == "")
                    valid = "Missing " + fieldname + "\\n";
                break;

            case "Zip/Postal Code":
                if (value.Trim() == "" && ddCountry.SelectedItem.Value == "1")
                    valid = "Missing " + fieldname + "\\n";
                break;

            case "City/Region":
                if (value.Trim() == "")
                    valid = "Missing " + fieldname + "\\n";
                break;

            case "State/Province":
                if (value.Trim() == "Select a State" &&   ddCountry.SelectedItem.Value == "1")
                    valid = "Missing " + fieldname + "\\n";
                break;

            
            case "Phone":
                if (value.Trim() == "")
                    valid = "Missing " + fieldname + "\\n";
                break;

            case "Email":
                if (value.Trim() == "")
                    valid = "Missing " + fieldname + "\\n";
                break;


        }
        return valid;


       

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (int.Parse(Session["userLevelID"].ToString()) == 1)
        {
            rvRating.Validate();

            if (!rvRating.IsValid)
                return;

        }




        string errormessage = "";


        errormessage += ValidateInput(txtContactName.Text, "First Name") ;

        errormessage += ValidateInput(txtFacilityName.Text, "Last Name") ;

      //  errormessage += ValidateInput(txtMarinaName.Text, "Marina Name");

        errormessage += ValidateInput(txtAddress1.Text, "Address 1")  ;
      //  errormessage += ValidateInput(txtAddress2.Text, "Address 2");



        errormessage += ValidateInput(txtZipCode.Text.Trim(), "Zip/Postal Code");

        if (ddCountry.SelectedItem == null || ddCountry.SelectedIndex == 0)
            errormessage += "Missing  Country. \\n";


        errormessage += ValidateInput(txtCity.Text.Trim(), "City/Region");
        errormessage += ValidateInput(ddState.SelectedItem.Value, "State/Province");


        //  errormessage += ValidateInput(txtFacilityCancellationPolicy.Text, "Cancellation Policy");

        //  errormessage += ValidateInput(txtFacilityAreaAttractions.Text, "Area & Attractions");

        errormessage += ValidateInput(txtPhone.Text, "Phone");

        errormessage += ValidateInput(txtEmail.Text, "Email");


        if (errormessage != "")
        {
            // string alertMessageP = "alert('Failed to Save due to " + errormessage + "');";

            string al = "alert('Failed to Update. \\n" + errormessage + "');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "popAlertFailed", al, true);
            return;

        }
        try
        {

            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[SP_BR_MARINA_SAVE]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
               
                    cmd.Parameters.AddWithValue("@P_Action", Session["P_Action"].ToString());


                   

                    cmd.Parameters.AddWithValue("@P_IN_MarinaID", Session["MarinaID"].ToString());


                    if (txtContactName.Text.Trim() !="")
                    cmd.Parameters.AddWithValue("@P_VC_ContactName", txtContactName.Text.Trim());


                    if (txtFacilityName.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_BusinessName", txtFacilityName.Text.Trim());

                    //if (txtMarinaName.Text.Trim() != "")
                    //    cmd.Parameters.AddWithValue("@P_VC_MarinaName", txtMarinaName.Text.Trim());

                    if (txtAddress1.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_AddressLine1", txtAddress1.Text.Trim());
                    if (txtAddress2.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_AddressLine2", txtAddress2.Text.Trim());

                    if (txtCity.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_city", txtCity.Text.Trim());

                    if (ddState.SelectedItem !=null && ddState.SelectedIndex > 0)
                    cmd.Parameters.AddWithValue("@P_IN_StateID", ddState.SelectedItem.Value);

                    if (txtZipCode.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_CH_zip",txtZipCode.Text.Trim());

                    if (ddCountry.SelectedItem != null && ddCountry.SelectedIndex > 0)
                    cmd.Parameters.AddWithValue("@P_IN_CountryID", ddCountry.SelectedItem.Value);

                    //if (txtBodyOfWater.Text.Trim() != "")
                    //    cmd.Parameters.AddWithValue("@P_VC_BodyWater", txtBodyOfWater.Text);

                    if (txtPhone.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_Phone", txtPhone.Text);

                    if (txtFax.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_Fax", txtFax.Text.Trim());

                    //if (ddMultipleLocation.SelectedItem != null && ddMultipleLocation.SelectedIndex > 0)
                    //    cmd.Parameters.AddWithValue("@P_CH_multipleLocations", ddMultipleLocation.SelectedItem.Value);

                    //if (ddAccomodations.SelectedItem != null && ddAccomodations.SelectedIndex > 0)
                    //    cmd.Parameters.AddWithValue("@P_CH_accomodations", ddAccomodations.SelectedItem.Value);


                    //if (ddCaptian.SelectedItem != null && ddCaptian.SelectedIndex > 0)
                    //    cmd.Parameters.AddWithValue("@P_TI_captain", ddCaptian.SelectedItem.Value);





                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());

                   
                   // if (txtFacilityDirections.Text.Trim() != "")
                       // cmd.Parameters.AddWithValue("@P_VC_facilityDirections", txtFacilityDirections.Text.Trim());

                   
                    //if (txtTaxRate.Text.Trim() != "")
                    //    cmd.Parameters.AddWithValue("@P_nu_tax", txtTaxRate.Text.Trim());

                    if (txtEmail.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@P_VC_Email1", txtEmail.Text.Trim());



                   


                    if (ddOpenHour.SelectedItem != null && ddOpenHour.SelectedIndex >0)
                    cmd.Parameters.AddWithValue("@P_vc_startHour", ddOpenHour.SelectedItem.Text);

                    if (ddClosedHour.SelectedItem != null && ddClosedHour.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@P_vc_endHour", ddClosedHour.SelectedItem.Text);


                    string changedFeeType = "0";
                    if (rdPayPerClick.Checked)
                    {


                        decimal payperclick;

                       if (! decimal.TryParse(txtPayClickAmount.Text.Trim(),out payperclick))
                        {
                            string al = "alert('Failed to Update. \\n Pay/Click is Invalid');";
                            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "popAlertFailed", al, true);
                            return;
                        }

                        cmd.Parameters.AddWithValue("@p_nu_fee", txtPayClickAmount.Text.Trim());

                        cmd.Parameters.AddWithValue("@p_ch_feeType","0");
                        changedFeeType = "0";

                    }

                    else if (rdPercentage.Checked)
                    {

                        decimal peram;

                        if (!decimal.TryParse(txtPercentageAmount.Text.Trim(), out peram))
                        {
                            string al = "alert('Failed to Update. \\n Percentage is Invalid');";
                            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "popAlertFailed", al, true);
                            return;
                        }



                        cmd.Parameters.AddWithValue("@p_nu_fee", txtPercentageAmount.Text.Trim());

                        cmd.Parameters.AddWithValue("@p_ch_feeType", "1");
                        changedFeeType = "1";


                }

                  else if (rdFlatRate.Checked)
                    {


                        decimal pertr;

                        if (!decimal.TryParse(txtFlatRateAmount.Text.Trim(), out pertr))
                        {
                            string al = "alert('Failed to Update. \\n Per Transaction is Invalid');";
                            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "popAlertFailed", al, true);
                            return;
                        }
                        cmd.Parameters.AddWithValue("@p_nu_fee", txtFlatRateAmount.Text.Trim());

                cmd.Parameters.AddWithValue("@p_ch_feeType", "2");
                        changedFeeType = "2";



            }
                    else if (rdDisplayAd.Checked)
                    {


                        decimal dispad;

                        if (!decimal.TryParse(txtDiplayAdAmount.Text.Trim(), out dispad))
                        {
                            string al = "alert('Failed to Update. \\n Display Ad is Invalid');";
                            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "popAlertFailed", al, true);
                            return;
                        }

                        changedFeeType = "3";
                        cmd.Parameters.AddWithValue("@p_nu_fee", txtDiplayAdAmount.Text.Trim());

                        cmd.Parameters.AddWithValue("@p_ch_feeType", "3");

                        if (rdMonthly.Checked)
                            cmd.Parameters.AddWithValue("@p_displayadtype", "M");
                        else if (rdYearly.Checked)
                            cmd.Parameters.AddWithValue("@p_displayadtype", "Y");

                    }



                    //if (chkNoSameDay.Checked)
                    //    cmd.Parameters.AddWithValue("@p_AllowSameDayRental", "0");
                    //else
                    //    cmd.Parameters.AddWithValue("@p_AllowSameDayRental", "1");

                    if (txtFacilityWebSite.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_facilityWebsite", txtFacilityWebSite.Text.Trim());



                    if (txtDisplayLandingPage.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_displayadlandingpage", txtDisplayLandingPage.Text.Trim());

                    if (txtRating.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_in_rating", txtRating.Text.Trim());


                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Successfully Saved Record";

                    if (Session["OriginalFeeType"].ToString() != changedFeeType)
                    {
                        RecreateAllBoatHtmls();

                    }

                    if (Session["newfacility"] !=null )
                    {
                        Session["newfacility"] = null;
                        Response.Redirect("boats_mant.aspx");


                    }



                        PopulateFacility(Session["MarinaID"].ToString());







              

                   




                }
            }


        }

        catch(Exception ex)
        {

            lblMessage.Text = "Error saving the record." + ex.Message;


        }



    }

    void CreateHtmlBoatNoRent(string bid)

    {

        try
        {
            // Create HTML Page.

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/BoatStaticPageTemplateNoRent.html")))
            {
                body = reader.ReadToEnd();
            }


            DataTable dtBoat = Util.getDataSet("execute [usp_get_boat_details] @in_boatId=" + bid + ",@in_marinaID=" + Session["marinaID"].ToString()).Tables[0];

            body = body.Replace("{BoatName}", dtBoat.Rows[0]["vc_name"].ToString());

            body = body.Replace("{BoatYear}", dtBoat.Rows[0]["vc_year"].ToString());
            body = body.Replace("{BoatMake}", dtBoat.Rows[0]["vc_make"].ToString());
            body = body.Replace("{BoatModel}", dtBoat.Rows[0]["vc_model"].ToString());



            body = body.Replace("{BoatLength}", dtBoat.Rows[0]["vc_size"].ToString() + " " + dtBoat.Rows[0]["vc_size_unit"].ToString());

            body = body.Replace("{BoatPassengers}", dtBoat.Rows[0]["in_maxPassengers"].ToString());

            if (dtBoat.Rows[0]["ti_Captain"].ToString() == "1")
                body = body.Replace("{BoatCaptain}", "Yes");
            else
                body = body.Replace("{BoatCaptain}", "No");

            body = body.Replace("{BoatDescription}", dtBoat.Rows[0]["vc_description"].ToString());

            //< Title > “City” “State” Boat Rentals | Learn how to rent our boat “size” “make” “Main Category” on “Body of Water” </ title >



            DataTable dtFacility = Util.getDataSet("execute [usp_get_facility_details] " + Session["marinaID"].ToString()).Tables[0];

            string fcity = "";
            string fstate = "";
            string bodyofwater = "";
            string bcategory = "";

            //   if (ddMainCategory.SelectedItem != null)
            if (dtBoat.Rows[0]["in_boatTypeID"].ToString().Trim() !="")
            bcategory = Util.getBoatMainCategoryName(dtBoat.Rows[0]["in_boatTypeID"].ToString());





            if (dtBoat.Rows.Count > 0)
            {
                fcity = dtBoat.Rows[0]["vc_city"].ToString();
                fstate = dtBoat.Rows[0]["state"].ToString();
                bodyofwater = dtBoat.Rows[0]["vc_bodywater"].ToString();
            }

            //                          < title > CITY STATE Boat Rentals | Rent MAKE BODY of WATER CATEGORY </ title >

            //< meta name = "description" content = "Rentaboat.com: Easily find A Boat Rental, Sailboat Charters, Yacht Reservations and Jet Ski Rentals world wide. Reserve a Boat and Book your boat online. Rent your boat as peer to peer.  Rated #1 in customer satisfaction.  View boat photos, Video, Availability and Reserve and book online." >


            //  string pageTitle = String.Format("{0} &nbsp; {1} &nbsp; Boat Rentals | Rent {2}&nbsp; {3}&nbsp; {4} &nbsp;on &nbsp;{5}", fcity, fstate, dtBoat.Rows[0]["vc_size"].ToString(), dtBoat.Rows[0]["vc_make"].ToString(), bcategory, bodyofwater);

            string pageTitle = String.Format("Boat Rentals In {0}, &nbsp; {1}, &nbsp;{2},&nbsp;{3}.&nbsp; Rent A Boat", fcity, fstate, dtBoat.Rows[0]["country"].ToString(),bodyofwater);

            body = body.Replace("{PageTitle}", pageTitle);
            body = body.Replace("{headDescriptionCity}", fcity);

            body = body.Replace("{keywordCity}", fcity);
            body = body.Replace("{keywordState}", fstate);

            body = body.Replace("{keywordBodyOfWater}", bodyofwater);

            body = body.Replace("{keywordBoatName}", dtBoat.Rows[0]["vc_name"].ToString());


            string address = "";

            if (dtBoat.Rows[0]["vc_addressline1"].ToString().Trim() != "")
                address = dtBoat.Rows[0]["vc_addressline1"].ToString().Trim();


            if (dtBoat.Rows[0]["vc_addressline2"].ToString().Trim() != "")
                if (address == "")
                    address = dtBoat.Rows[0]["vc_addressline2"].ToString().Trim();
                else
                    address += ", " + dtBoat.Rows[0]["vc_addressline2"].ToString().Trim();

            if (dtBoat.Rows[0]["vc_city"].ToString().Trim() != "")
                if (address == "")
                    address = dtBoat.Rows[0]["vc_city"].ToString().Trim();
                else
                    address += ", " + dtBoat.Rows[0]["vc_city"].ToString().Trim();


            if (dtBoat.Rows[0]["state"].ToString().Trim() != "")
                if (address == "")
                    address = dtBoat.Rows[0]["state"].ToString().Trim();
                else
                    address += ", " + dtFacility.Rows[0]["state"].ToString().Trim();


            if (dtBoat.Rows[0]["ch_zip"].ToString().Trim() != "")
                if (address == "")
                    address = dtBoat.Rows[0]["ch_zip"].ToString().Trim();
                else
                    address += " " + dtBoat.Rows[0]["ch_zip"].ToString().Trim();


            body = body.Replace("{MarinaAddress}", address);

            body = body.Replace("{MarinaName}", dtFacility.Rows[0]["vc_contactName"].ToString() + " " + dtFacility.Rows[0]["vc_businessName"].ToString());

            body = body.Replace("{MarinaPhoneNumber}", dtBoat.Rows[0]["vc_Phone"].ToString() + " " + dtFacility.Rows[0]["vc_businessName"].ToString());

            DataTable dtImages = Util.getDataSet("execute [usp_get_Boat_Images] @in_BoatID=" + bid + ", @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];

            string imgMore = "";


            for (int i = 0; i < dtImages.Rows.Count; i++)
            {

                if (dtImages.Rows[i]["ti_mainPic"].ToString() == "0")
                {
                    body = body.Replace("{BoatImageTag}", "<img src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "' id='mainboatPic'   alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' />   ");

                }
                else
                {
                    imgMore += "<a  id = 'pop' onclick = 'showImagePopup(this)' > <img class='cover-item' src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "'   width='400'  alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' /> </a>  ";


                }

            }

            body = body.Replace("{BoatImageMore}", imgMore);




            //body = body.Replace("{BoatRequirements}", txtRequirement.Text.Trim());


            //string pricetable = "<table class='boatPriceTable'><thead><tr><th class='boatPriceTable'></th><th class='boatPriceTable'>Weekday</th><th class='boatPriceTable'>Weekend</th><th class='boatPriceTable'>Holiday</th><th class='boatPriceTable'>Hours</th></tr></thead><tbody>";


            //DataTable dtPricing = Util.getDataSet("execute SP_BR_PRICExBOATxTYPERENT_LIST @p_in_BoatID=" + bid + ",@p_in_marinaID=" + Session["marinaID"].ToString()).Tables[0];



            //for (int i = 0; i < dtPricing.Rows.Count; i++)
            //{

            //    pricetable += "<tr><td>" + dtPricing.Rows[i]["vc_description"].ToString() + " price:" + "</td>";
            //    pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeek"].ToString() + "</td>";
            //    pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeekend"].ToString() + "</td>";
            //    pricetable += "<td>" + dtPricing.Rows[i]["nu_precioHolyday"].ToString() + "</td>";

            //    pricetable += "<td>" + dtPricing.Rows[i]["hours_from"].ToString() + "&nbsp;TO&nbsp;" + dtPricing.Rows[i]["hours_to"].ToString() + "</td> </tr>";






            //}

            //pricetable += "</tbody></table>";


            //  DataTable dtboat = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + bid + ",@in_marinaID=" + Session["marinaID"].ToString()).Tables[0];


            body = body.Replace("{Country}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["country"].ToString().Trim() + "</span>");
            body = body.Replace("{State}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["state"].ToString().Trim() + "</span>");

            body = body.Replace("{City}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["vc_city"].ToString().Trim() + "</span>");
            body = body.Replace("{BodyOfWater}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["vc_bodywater"].ToString().Trim() + "</span>");


            body = body.Replace("{BoatNo}", bid);


            int rating = 0;
            string ratingstars = "";


            if (dtFacility.Rows[0]["in_rating"].ToString() != "")
                rating = int.Parse(dtFacility.Rows[0]["in_rating"].ToString());

            if (rating != 0)
                for (int i = 0; i < rating; i++)
                    ratingstars += "<img src='../img/starselected.png' height='30px;' />";

            for (int i = rating; i < 5; i++)
                ratingstars += "<img src='../img/star.png' height='30px;' />";

            body = body.Replace("{BoatRating}", ratingstars);


            body = body.Replace("{FacilityNo}", Session["MarinaID"].ToString());

            body = body.Replace("{AreaMapLink}", "<a onclick='return areaMap(" + dtFacility.Rows[0]["ch_zip"].ToString().Trim() + ");'  class='btn btn-primary ' role='button'>Area Map</a>");

            //  body = body.Replace("{ContactBoatOwnerLink}", "<a href='#dvAsk' class='btn btn-primary'>Contact Boat Owner </a>");
            body = body.Replace("{FacilityName}", dtFacility.Rows[0]["vc_marinaName"].ToString());


            //body = body.Replace("{ContactBoatOwnerLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


            //body = body.Replace("{AskBoatQuestionsLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");

            body = body.Replace("{ContactBoatOwnerLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


            body = body.Replace("{AskBoatQuestionsLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");



            DataTable tYoutube = Util.getDataSet("execute usp_get_boat_video @in_BoatID=" + bid + ",@in_MarinaID=" + Session["MarinaID"].ToString()).Tables[0];


            if (tYoutube.Rows.Count > 0 && tYoutube.Rows[0]["YouTubeLink"].ToString() != "")
            {
                body = body.Replace("{BoatVideo}", " <iframe width = \"400\" height = \"400\"  id = \"iframeVideo\" style = \"height:400px!important;\" src = \"" + tYoutube.Rows[0]["YouTubeLink"].ToString() + "\"  frameborder = \"0\" allowfullscreen ></iframe>");

            }
            else
            {
                body = body.Replace("{BoatVideo}", "");

            }







          //  body = body.Replace("{BoatPriceTable}", pricetable);

          //  body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>BOOK NOW</a>");


            //body = body.Replace("{BoatOwner}", dtFacility.Rows[0]["vc_contactname"].ToString());

            //body = body.Replace("{BoatTaxRate}", dtBoat.Rows[0]["nu_Tax"].ToString() + "%");

            //body = body.Replace("{ReservationDeposit}", "$" + dtBoat.Rows[0]["nu_reservation"].ToString());

            //body = body.Replace("{SecurityDeposit}", "$" + dtBoat.Rows[0]["nu_deposit"].ToString());


            //body = body.Replace("{CancellationPolicy}", dtBoat.Rows[0]["vc_cancellation_policy"].ToString());

            body = body.Replace("{AreaAttractions}", dtBoat.Rows[0]["vc_facilityArea"].ToString());

            body = body.Replace("{BoatRequirements}", dtBoat.Rows[0]["vc_requirements"].ToString());




            File.WriteAllText(Server.MapPath("~/BoatHtml/" + "Facility_" + Session["MarinaID"].ToString() + "_Boat_" + bid + ".htm"), body);


        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error creating Static html :" + ex.Message;

        }

    }


    void CreateHtmlBoat(string bid)

    {

        try
        {
            // Create HTML Page.

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/BoatStaticPageTemplate.html")))
            {
                body = reader.ReadToEnd();
            }


            DataTable dtBoat = Util.getDataSet("execute [usp_get_boat_details] @in_boatId="+ bid + ",@in_marinaID=" + Session["marinaID"].ToString() ).Tables[0];

            body = body.Replace("{BoatName}", dtBoat.Rows[0]["vc_name"].ToString());

            body = body.Replace("{BoatYear}", dtBoat.Rows[0]["vc_year"].ToString());
            body = body.Replace("{BoatMake}", dtBoat.Rows[0]["vc_make"].ToString());
            body = body.Replace("{BoatModel}", dtBoat.Rows[0]["vc_model"].ToString());



            body = body.Replace("{BoatLength}", dtBoat.Rows[0]["vc_size"].ToString() + " " + dtBoat.Rows[0]["vc_size_unit"].ToString());

            body = body.Replace("{BoatPassengers}", dtBoat.Rows[0]["in_maxPassengers"].ToString());

            if (dtBoat.Rows[0]["ti_Captain"].ToString() == "1")
                body = body.Replace("{BoatCaptain}", "Yes");
            else
                body = body.Replace("{BoatCaptain}", "No");

            body = body.Replace("{BoatDescription}", dtBoat.Rows[0]["vc_description"].ToString());

            //< Title > “City” “State” Boat Rentals | Learn how to rent our boat “size” “make” “Main Category” on “Body of Water” </ title >



            DataTable dtFacility = Util.getDataSet("execute [usp_get_facility_details] " + Session["marinaID"].ToString()).Tables[0];

            string fcity = "";
            string fstate = "";
            string bodyofwater = "";
            string bcategory = "";

            //   if (ddMainCategory.SelectedItem != null)

            if (dtBoat.Rows[0]["in_boatTypeID"].ToString().Trim() != "")
                bcategory = Util.getBoatMainCategoryName(dtBoat.Rows[0]["in_boatTypeID"].ToString());





            if (dtBoat.Rows.Count > 0)
            {
                fcity = dtBoat.Rows[0]["vc_city"].ToString();
                fstate = dtBoat.Rows[0]["state"].ToString();
                bodyofwater = dtBoat.Rows[0]["vc_bodywater"].ToString();
            }

            //                          < title > CITY STATE Boat Rentals | Rent MAKE BODY of WATER CATEGORY </ title >

            //< meta name = "description" content = "Rentaboat.com: Easily find A Boat Rental, Sailboat Charters, Yacht Reservations and Jet Ski Rentals world wide. Reserve a Boat and Book your boat online. Rent your boat as peer to peer.  Rated #1 in customer satisfaction.  View boat photos, Video, Availability and Reserve and book online." >


            //  string pageTitle = String.Format("{0} &nbsp; {1} &nbsp; Boat Rentals | Rent {2}&nbsp; {3}&nbsp; {4} &nbsp;on &nbsp;{5}", fcity, fstate, dtBoat.Rows[0]["vc_size"].ToString(), dtBoat.Rows[0]["vc_make"].ToString(), bcategory, bodyofwater);
            string pageTitle = String.Format("Boat Rentals In {0}, &nbsp; {1}, &nbsp;{2},&nbsp;{3}.&nbsp; Rent A Boat", fcity, fstate, dtBoat.Rows[0]["country"].ToString(), bodyofwater);


            body = body.Replace("{PageTitle}", pageTitle);
            body = body.Replace("{headDescriptionCity}", fcity);

            body = body.Replace("{keywordCity}", fcity);
            body = body.Replace("{keywordState}", fstate);

            body = body.Replace("{keywordBodyOfWater}", bodyofwater);

            body = body.Replace("{keywordBoatName}", dtBoat.Rows[0]["vc_name"].ToString());





            DataTable dtImages = Util.getDataSet("execute [usp_get_Boat_Images] @in_BoatID=" + bid + ", @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];

            string imgMore = "";


            for (int i = 0; i < dtImages.Rows.Count; i++)
            {

                if (dtImages.Rows[i]["ti_mainPic"].ToString() == "0")
                {
                    body = body.Replace("{BoatImageTag}", "<img src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "' id='mainboatPic'   alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' />   ");

                }
                else
                {
                    imgMore += "<a  id = 'pop' onclick = 'showImagePopup(this)' > <img class='cover-item' src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "'   width='400'  alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' /> </a>  ";


                }

            }

            body = body.Replace("{BoatImageMore}", imgMore);




            //body = body.Replace("{BoatRequirements}", txtRequirement.Text.Trim());


            string pricetable = "<table class='boatPriceTable'><thead><tr><th class='boatPriceTable'></th><th class='boatPriceTable'>Weekday</th><th class='boatPriceTable'>Weekend</th><th class='boatPriceTable'>Holiday</th><th class='boatPriceTable'>Hours</th></tr></thead><tbody>";


            DataTable dtPricing = Util.getDataSet("execute SP_BR_PRICExBOATxTYPERENT_LIST @p_in_BoatID=" + bid + ",@p_in_marinaID=" + Session["marinaID"].ToString()).Tables[0];



            for (int i = 0; i < dtPricing.Rows.Count; i++)
            {

                pricetable += "<tr><td>" + dtPricing.Rows[i]["vc_description"].ToString() + " price:" + "</td>";
                pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeek"].ToString() + "</td>";
                pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeekend"].ToString() + "</td>";
                pricetable += "<td>" + dtPricing.Rows[i]["nu_precioHolyday"].ToString() + "</td>";

                pricetable += "<td>" + dtPricing.Rows[i]["hours_from"].ToString() + "&nbsp;TO&nbsp;" + dtPricing.Rows[i]["hours_to"].ToString() + "</td> </tr>";






            }

            pricetable += "</tbody></table>";


          //  DataTable dtboat = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + bid + ",@in_marinaID=" + Session["marinaID"].ToString()).Tables[0];


            body = body.Replace("{Country}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["country"].ToString().Trim() + "</span>");
            body = body.Replace("{State}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["state"].ToString().Trim() + "</span>");

            body = body.Replace("{City}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["vc_city"].ToString().Trim() + "</span>");
            body = body.Replace("{BodyOfWater}", "<span style='color:#4CAEB8;'>" + dtBoat.Rows[0]["vc_bodywater"].ToString().Trim() + "</span>");


            body = body.Replace("{BoatNo}", bid);


            int rating = 0;
            string ratingstars = "";


            if (dtFacility.Rows[0]["in_rating"].ToString() != "")
                rating = int.Parse(dtFacility.Rows[0]["in_rating"].ToString());

            if (rating != 0)
                for (int i = 0; i < rating; i++)
                    ratingstars += "<img src='../img/starselected.png' height='30px;' />";

            for (int i = rating; i < 5; i++)
                ratingstars += "<img src='../img/star.png' height='30px;' />";

            body = body.Replace("{BoatRating}", ratingstars);


            body = body.Replace("{FacilityNo}", Session["MarinaID"].ToString());

            body = body.Replace("{AreaMapLink}", "<a onclick='return areaMap(" + dtFacility.Rows[0]["ch_zip"].ToString().Trim() + ");'  class='btn btn-primary ' role='button'>Area Map</a>");

            //  body = body.Replace("{ContactBoatOwnerLink}", "<a href='#dvAsk' class='btn btn-primary'>Contact Boat Owner </a>");
            body = body.Replace("{FacilityName}", dtFacility.Rows[0]["vc_marinaName"].ToString());


            //body = body.Replace("{ContactBoatOwnerLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


            //body = body.Replace("{AskBoatQuestionsLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");

            body = body.Replace("{ContactBoatOwnerLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


            body = body.Replace("{AskBoatQuestionsLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");



            DataTable tYoutube = Util.getDataSet("execute usp_get_boat_video @in_BoatID=" + bid + ",@in_MarinaID=" + Session["MarinaID"].ToString()).Tables[0];


            if (tYoutube.Rows.Count > 0 && tYoutube.Rows[0]["YouTubeLink"].ToString() != "")
            {
                body = body.Replace("{BoatVideo}", " <iframe width = \"400\" height = \"400\"  id = \"iframeVideo\" style = \"height:400px!important;\" src = \"" + tYoutube.Rows[0]["YouTubeLink"].ToString() + "\"  frameborder = \"0\" allowfullscreen ></iframe>");

            }
            else
            {
                body = body.Replace("{BoatVideo}", "");

            }







            body = body.Replace("{BoatPriceTable}", pricetable);

            body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>BOOK NOW</a>");


            body = body.Replace("{BoatOwner}", dtFacility.Rows[0]["vc_contactname"].ToString());

            body = body.Replace("{BoatTaxRate}", dtBoat.Rows[0]["nu_Tax"].ToString() + "%");

            body = body.Replace("{ReservationDeposit}", "$" + dtBoat.Rows[0]["nu_reservation"].ToString());

            body = body.Replace("{SecurityDeposit}", "$" + dtBoat.Rows[0]["nu_deposit"].ToString());


            body = body.Replace("{CancellationPolicy}", dtBoat.Rows[0]["vc_cancellation_policy"].ToString());

            body = body.Replace("{AreaAttractions}", dtBoat.Rows[0]["vc_facilityArea"].ToString());

            body = body.Replace("{BoatRequirements}", dtBoat.Rows[0]["vc_requirements"].ToString());




            File.WriteAllText(Server.MapPath("~/BoatHtml/" + "Facility_" + Session["MarinaID"].ToString() + "_Boat_" + bid + ".htm"), body);


        }
        catch (Exception ex)
        {

        }

    }

    void DeleteAllBoatHtmls()
    {
        try
        {
            Util.DeleteAllStaticHTMLPages(Session["marinaID"].ToString(), Server.MapPath("~/BoatHtml/"));
            Util.DeleteSiteMapElements(Session["marinaID"].ToString(), Server.MapPath("~"));
        }
        catch(Exception ex)
        {
            lblMessage.Text = "Error deleting Static html :" + ex.Message;
        }
    }


    void RecreateAllBoatHtmls()
    {

        try
        {
            DeleteAllBoatHtmls();


            DataTable dtBoatList = Util.getDataSet("usp_get_all_boat_list_marina @in_marinaID=" + Session["marinaID"].ToString()).Tables[0];


            if (Util.IsBoatForRenting(Session["marinaID"].ToString()))
                for (int i = 0; i < dtBoatList.Rows.Count; i++)
                    CreateHtmlBoat(dtBoatList.Rows[i][0].ToString());
            else
                for (int i = 0; i < dtBoatList.Rows.Count; i++)
                    CreateHtmlBoatNoRent(dtBoatList.Rows[i][0].ToString());


        }

        catch(Exception ex)
        {

            lblMessage.Text = "Error creating Static html :" + ex.Message;

        }





    }



    protected void btnCancel_Click(object sender, EventArgs e)
    {

        if (int.Parse(Session["UserLevelID"].ToString()) == 1)
            Response.Redirect("facilities_list.aspx");
        else
            Response.Redirect("boats_list.aspx");


    }

    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindStateList();

    }
}