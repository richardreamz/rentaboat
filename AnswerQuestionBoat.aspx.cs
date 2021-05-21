using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
[DataContract]

public partial class AnswerQuestionBoat : System.Web.UI.Page
{
    private string GetUserIp()
    {
        var visitorsIpAddr = string.Empty;

        if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            visitorsIpAddr = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        else if (!string.IsNullOrEmpty(Request.UserHostAddress))
        {
            visitorsIpAddr = Request.UserHostAddress;
        }

        return visitorsIpAddr;
    }

    protected bool ValidateReCaptcha()
    {
        //start building recaptch api call
        var sb = new StringBuilder();
        sb.Append("https://www.google.com/recaptcha/api/siteverify?secret=");

        //our secret key
        var secretKey = "6Lcn5RkTAAAAAOkdXdLpn1_8KX6tlkg5MEXhn-bK";
        sb.Append(secretKey);

        //response from recaptch control
        sb.Append("&");
        sb.Append("response=");
        var reCaptchaResponse = Request["g-recaptcha-response"];
        sb.Append(reCaptchaResponse);

        //client ip address
        //---- This Ip address part is optional. If you donot want to send IP address you can
        //---- Skip(Remove below 4 lines)
        sb.Append("&");
        sb.Append("remoteip=");
        var clientIpAddress = GetUserIp();
        sb.Append(clientIpAddress);

        //make the api call and determine validity
        using (var client = new WebClient())
        {
            var uri = sb.ToString();
            var json = client.DownloadString(uri);
            var serializer = new DataContractJsonSerializer(typeof(RecaptchaApiResponse));
            var ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            var result = serializer.ReadObject(ms) as RecaptchaApiResponse;

            //--- Check if we are able to call api or not.
            if (result == null)
            {
               // lblM.Text = "Captcha was unable to make the api call";
                return false;
            }
            else // If Yes
            {
                //api call contains errors
                if (result.ErrorCodes != null)
                {
                    if (result.ErrorCodes.Count > 0)
                    {
                        foreach (var error in result.ErrorCodes)
                        {
                          //  lblM.Text = "reCAPTCHA Error: " + error;
                            return false;
                        }
                    }
                }
                else //api does not contain errors
                {
                    if (!result.Success) //captcha was unsuccessful for some reason
                    {
                      //  lblM.Text = "Captcha did not pass, please try again.";
                        return false;
                    }
                    else //---- If successfully verified. Do your rest of logic.
                    {
                       // lblM.Text = "Captcha cleared ";
                        return true;

                    }
                }

            }

        }

        return true;

    }

    void CheckBoatOwnerANDLogin(string qid, string username, string password)
    {
        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];


        if (dt.Rows.Count > 0)
        {
            String currentPage = HttpContext.Current.Request.Url.AbsolutePath;

            Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
            Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
            Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
            Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
           // Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
            Session.Add("userName", dt.Rows[0]["vc_username"].ToString());




            DataTable dtO = Util.getDataSet("execute usp_check_owner_of_boat @Question_Id=" + qid).Tables[0];

            if (dtO.Rows.Count > 0)
            {

                if ((dtO.Rows[0]["in_MarinaID"].ToString() != Session["MarinaID"].ToString() && Session["userLevelID"].ToString() != "1") || int.Parse(Session["userLevelID"].ToString()) > 3)
                {
                    Response.Redirect("MemberSignIn.aspx" + "?askq=2&qid=" + Request.QueryString["qid"]);
                    return;
                }


                ViewState["qid"] = Request.QueryString["qid"];
                ViewState["bid"] = dtO.Rows[0]["in_boatID"].ToString();
                ViewState["mid"] = dtO.Rows[0]["in_marinaID"].ToString();
                ViewState["cuid"] = dtO.Rows[0]["Created_By"].ToString();
                if (!Page.IsPostBack)
                {
                    lblQuestion.Text = dtO.Rows[0]["Question"].ToString();
                    txtQuestion.Text = dtO.Rows[0]["Answer"].ToString();
                }


            }
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //Check it is from email
        if (Request.QueryString["qid"] != null && Request.QueryString["token"] !=null)
        {
            SimplerAES d = new SimplerAES();

            string token = d.Decrypt(Request.QueryString["token"]);

            char[] delimiter = { '|' };

            string[] s = token.Split(delimiter);

            if (s.Length > 1)
            {
                DataTable dtL = Util.getDataSet("execute [usp_verify_email_password] @P_VC_UserName='" + s[0] + "', @P_VC_Password='" + s[1] +"'").Tables[0];
                if (dtL.Rows.Count == 0)
                {
                    Response.Redirect("MemberSignIn.aspx" + "?askq=2&qid=" + Request.QueryString["qid"]);
                }
                else
                {
                    CheckBoatOwnerANDLogin(Request.QueryString["qid"], s[0],s[1]);


                }

            }
            else
            {
                Response.Redirect("MemberSignIn.aspx" + "?askq=2&qid=" + Request.QueryString["qid"]);
            }

        }
        else
        if (Request.QueryString["qid"] == null || Session["userID"] == null)
        {
            string addqid = "";
            if (Request.QueryString["qid"] != null)
                                addqid = "?askq=2&qid=" + Request.QueryString["qid"];
            
            Response.Redirect("MemberSignIn.aspx"+addqid);
            return;
        }
       else
        {
            DataTable dt = Util.getDataSet("execute usp_check_owner_of_boat @Question_Id=" + Request.QueryString["qid"]).Tables[0];

                if (dt.Rows.Count > 0)
                {

                    if ((dt.Rows[0]["in_MarinaID"].ToString() != Session["MarinaID"].ToString() && Session["userLevelID"].ToString() != "1") || int.Parse(Session["userLevelID"].ToString()) > 3)
                    {
                        Response.Redirect("MemberSignIn.aspx" + "?askq=2&qid=" + Request.QueryString["qid"]);
                        return;
                    }


                    ViewState["qid"] = Request.QueryString["qid"];
                    ViewState["bid"] = dt.Rows[0]["in_boatID"].ToString();
                    ViewState["mid"] = dt.Rows[0]["in_marinaID"].ToString();
                    ViewState["cuid"] = dt.Rows[0]["Created_By"].ToString();
                    if (!Page.IsPostBack)
                    {
                        lblQuestion.Text = dt.Rows[0]["Question"].ToString();

                        txtQuestionAdmin.Text = lblQuestion.Text;

                        txtQuestion.Text = dt.Rows[0]["Answer"].ToString();
                    }
                }
            
            else
            {
                Response.Redirect("MemberSignIn.aspx");
                return;

            }
        }




        //if (Session["userLevelID"] == null)
        //{
        //    Response.Redirect("MemberSignIn.aspx?askq=2&qid=");
        //}

        if (!Page.IsPostBack)
        {
            if (Session["userLevelID"].ToString() == "1")
            {
                btnDelete.Visible = true;

                pnlSuperAdmin.Visible = true;


            }
            else
            {
                btnDelete.Visible = false;
                pnlSuperAdmin.Visible = false;

            }


            PopulateBoatInfo(ViewState["bid"].ToString(),ViewState["mid"].ToString());
         
        }
      
    }

    protected void PopulateBoatInfo(string boatid, string marinaid)
    {

        DataTable dtBoatDetails = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + boatid + ",@in_marinaID=" + marinaid).Tables[0];

        if (dtBoatDetails.Rows.Count > 0)
        {

            // lblBoatName.Text = dtBoatDetails.Rows[0]["vc_name"].ToString();
            lblBoatName1.Text = dtBoatDetails.Rows[0]["vc_name"].ToString();
            lblBoatLength.Text = dtBoatDetails.Rows[0]["vc_size"].ToString() + " " + dtBoatDetails.Rows[0]["vc_size_unit"].ToString();
            lblBoatMake.Text = dtBoatDetails.Rows[0]["vc_make"].ToString();

            lblBoatModel.Text = dtBoatDetails.Rows[0]["vc_model"].ToString();

            lblBoatYear.Text = dtBoatDetails.Rows[0]["vc_year"].ToString();
            if (dtBoatDetails.Rows[0]["ti_captain"].ToString() == "1")
                lblCaptain.Text = "Yes";
            else
                lblCaptain.Text = "No";


            lblBoatID.Text = dtBoatDetails.Rows[0]["in_boatID"].ToString();
            lblFacilityNumber.Text = dtBoatDetails.Rows[0]["in_MarinaID"].ToString();


            // lblMoreBoatsFromOwner
            //lblOwner

            lblPassengers.Text = dtBoatDetails.Rows[0]["in_maxPassengers"].ToString();
            //lblRequirements.Text = dtBoatDetails.Rows[0]["vc_requirements"].ToString();

            //lblReservationDeposit.Text = dtBoatDetails.Rows[0]["nu_reservation"].ToString();
            ////  lblSecurityDeposit.Text = dtBoatDetails.Rows[0]["vc_model"].ToString();
            //  lblTaxRate.Text = dtBoatDetails.Rows[0]["nu_Tax"].ToString();

            //  lblSecurityDeposit.Text = 


            //lblBoatDescription.Text = dtBoatDetails.Rows[0]["vc_description"].ToString();


            //lblSecurityDeposit.Text = dtBoatDetails.Rows[0]["nu_deposit"].ToString();


            if (dtBoatDetails.Rows[0]["Is_boat_sale"].ToString() == "1")
            {
                divBoatSale.Visible = true;

                if (dtBoatDetails.Rows[0]["boat_sale_amount_currency_Id"].ToString() == "2")
                    lblBoatSalePrice.Text = "&euro;" + dtBoatDetails.Rows[0]["boat_sale_amount"].ToString();
                else
                   lblBoatSalePrice.Text = "$" + dtBoatDetails.Rows[0]["boat_sale_amount"].ToString();
            }
            else
                divBoatSale.Visible = false;



        }

        // Get Boat main Pic 

        DataTable dtMainPic = Util.getDataSet("execute usp_get_main_boat_pic @in_boatID=" + ViewState["bid"].ToString() + ",@in_marinaID=" + ViewState["mid"].ToString()).Tables[0];

        if (dtMainPic.Rows.Count > 0)
        {
            mainboatpic.Src = @"./boats/" + dtMainPic.Rows[0]["vc_filename"].ToString();
            mainboatpic.Alt = dtMainPic.Rows[0]["vc_nombre"].ToString();

            hpicmain.Value = @"./boats/" + dtMainPic.Rows[0]["vc_filename"].ToString();

        }

        PopulateFacilityDetails();

    }
    private void PopulateFacilityDetails()
    {
        // Cancellation Policy

        // Owner : Facility Name
        //lblCancellationPolicy.Text = dtBoatDetails.Rows[0]["vc_requirements"].ToString();


        DataTable dtFacility = Util.getDataSet("execute usp_get_facility_details @in_marinaID=" + ViewState["mid"].ToString()).Tables[0];

        if (dtFacility.Rows.Count > 0)
        {


            //lblTaxRate.Text = dtFacility.Rows[0]["nu_tax"].ToString();

            ViewState["fname"] = dtFacility.Rows[0]["vc_marinaName"].ToString();

            //lblOwner.Text = dtFacility.Rows[0]["vc_marinaName"].ToString();
            //lblCancellationPolicy.Text = dtFacility.Rows[0]["vc_depositPolicy"].ToString();
            //lblAreaAttractions.Text = dtFacility.Rows[0]["vc_facilityArea"].ToString();

            string address = "";

            if (dtFacility.Rows[0]["vc_addressline1"].ToString().Trim() != "")
                address = dtFacility.Rows[0]["vc_addressline1"].ToString().Trim();


            if (dtFacility.Rows[0]["vc_addressline2"].ToString().Trim() != "")
                if (address == "")
                    address = dtFacility.Rows[0]["vc_addressline2"].ToString().Trim();
                else
                    address += ", " + dtFacility.Rows[0]["vc_addressline2"].ToString().Trim();

            if (dtFacility.Rows[0]["vc_city"].ToString().Trim() != "")
                if (address == "")
                    address = dtFacility.Rows[0]["vc_city"].ToString().Trim();
                else
                    address += ", " + dtFacility.Rows[0]["vc_city"].ToString().Trim();


            if (dtFacility.Rows[0]["state"].ToString().Trim() != "")
                if (address == "")
                    address = dtFacility.Rows[0]["state"].ToString().Trim();
                else
                    address += ", " + dtFacility.Rows[0]["state"].ToString().Trim();


            if (dtFacility.Rows[0]["ch_zip"].ToString().Trim() != "")
                if (address == "")
                    address = dtFacility.Rows[0]["ch_zip"].ToString().Trim();
                else
                    address += " " + dtFacility.Rows[0]["ch_zip"].ToString().Trim();


           



            int rating = 0;

            if (dtFacility.Rows[0]["in_rating"].ToString() != "")
                rating = int.Parse(dtFacility.Rows[0]["in_rating"].ToString());

            if (rating != 0)
                for (int i = 0; i < rating; i++)
                    ltrRating.Text += "<img src='img/starselected.png' height='30px;' />";

            for (int i = rating; i < 5; i++)
                ltrRating.Text += "<img src='img/star.png' height='30px;' />";

            // lblMarinaAddress.Text = address;

            //  lblMarinaAddress.Text = "<table class='calPickupDropOff'><tr class='calPickupDropOff'><td class='calPickupDropOff' align='center'>State <br/>" + dtFacility.Rows[0]["state"].ToString().Trim() + "</td><td class='calPickupDropOff' align='center'>| </td><td class='calPickupDropOff' align='center'>City<br/>" + dtFacility.Rows[0]["vc_city"].ToString().Trim() + "</td><td class='calPickupDropOff' align='center'>| </td><td class='calPickupDropOff' align='center'>Zip/Postal Code<br/>" + dtFacility.Rows[0]["ch_zip"].ToString().Trim() + "</td><td class='calPickupDropOff' align='center'>| </td><td class='calPickupDropOff'>Body Of Water<br/>" + dtFacility.Rows[0]["vc_bodywater"].ToString().Trim() + "</td></tr></table>";

            //lblState.Text = dtFacility.Rows[0]["state"].ToString().Trim();


            //lblPostalCode.Text = dtFacility.Rows[0]["country"].ToString().Trim();


            //lblCity.Text = dtFacility.Rows[0]["vc_city"].ToString().Trim();
            //lblBodyOfWater.Text = dtFacility.Rows[0]["vc_bodywater"].ToString().Trim();


            //ctlNoRentingInfo.setAddress(address);

            //ctlNoRentingInfo.setPhonenumber(dtFacility.Rows[0]["vc_phone"].ToString().Trim());
            //ctlNoRentingInfo.setName(dtFacility.Rows[0]["vc_BusinessName"].ToString().Trim());

            //ctlNoRentingInfo.setWebsitePage(dtFacility.Rows[0]["DisplayAdLandingPage"].ToString().Trim(), dtFacility.Rows[0]["facilityWebSite"].ToString().Trim());



        }

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Lat"] = txtLat.Value;
        Session["Lon"] = txtLon.Value;
        int zcode;

        if (txtLat.Value != "24.55573589999999" && txtLon.Value != "-81.78265369999997")
        {
            if (int.TryParse(txtSearch.Text.Trim(), out zcode))
                Session["zipcode"] = zcode;

            else
                Session["zipcode"] = txtZipCode.Value;

            Session["city"] = txtCityName.Value;

            Session["state"] = txtState.Value;
            Session["searchterm"] = txtSearch.Text;


        }
        else
        {
            Session["Lat"] = "";
            Session["Lon"] = "";
            Session["searchterm"] = "Florida Keys";

        }

        Response.Redirect("Results.aspx?t=2");





    }
    
 


    void SendEmailToClient()
    {

        //string emailowner = Util.getBoatOwnerEmail(Session[Util.Session_Selected_BoatID].ToString(), Session[Util.Session_Selected_MarinaID].ToString());

        DataTable dtCleint = Util.getDataSet("execute usp_get_client_details_from_userid " + ViewState["cuid"].ToString()).Tables[0];

        string clientname = "";
        string clientemail = "";

        if (dtCleint.Rows.Count > 0)
        {
            clientname = dtCleint.Rows[0]["vc_firstname"].ToString();
            clientemail = dtCleint.Rows[0]["vc_email"].ToString();
        }


        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/BoatOwnerAnswerEmail.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{ClientName}", clientname);

        body = body.Replace("{BoatID}", lblBoatID.Text);

        body = body.Replace("{FacilityID}", ViewState["mid"].ToString());


        body = body.Replace("{BoatName}", lblBoatName1.Text);
        body = body.Replace("{BoatMake}", lblBoatMake.Text);

        body = body.Replace("{BoatModel}", lblBoatModel.Text);

        body = body.Replace("{BoatYear}", lblBoatYear.Text);

        body = body.Replace("{BoatSize}", lblBoatLength.Text);

        body = body.Replace("{Question}", lblQuestion.Text);

        body = body.Replace("{Answer}", txtQuestion.Text);

        body = body.Replace("{boatUrlCalendar}", "https://www.rentaboat.com/ShowBoat.aspx?mid=" + lblFacilityNumber.Text + "&bid=" + lblBoatID.Text);


      //  string boatImagePath = Server.MapPath("") + mainboatpic.Src.Substring(1).Replace("/", "\\");

       // string boatImagePath = Server.MapPath("")  + mainboatpic.Src.Substring(1).Replace("/", "\\");



        AlternateView htmlView = AlternateView.CreateAlternateViewFromString(body, null, "text/html");


        //LinkedResource bi = new LinkedResource(boatImagePath);
        //bi.ContentId = "BoatImage";

        //htmlView.LinkedResources.Add(bi);


        if (Util.IsProduction)
        {
            Util.LogEMail("Question@rentaboat.com", clientemail + ",Question@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "A Question is asked about your Boat!", body, "Question about boat");


            Util.SendEMail("Question@rentaboat.com", clientemail + ",Question@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "A Question is asked about your Boat!", body, htmlView);
        }
        else

            Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Got answer to your Question ", body, htmlView);




    }
    private string ValidateInput(string value, string fieldname)
    {
        string valid = "";

        string regPhone = @"\W*?(\([0-9]{3}\)|[0-9]{3}-)*([0-9]{3}-|[0-9]{3})[0-9]{4}\W*";
        string regWebAddres = @"\W*(\.com|\.COM|\.net|\.NET|\.org|\.ORG)\W*";



        if (Regex.IsMatch(value, regPhone))
        {

            if (!value.Contains("631-286-7816"))
                valid = " Error: Answer contains phone number.  ";

        }
        if (Regex.IsMatch(value, regWebAddres))
        {
            if (!value.Contains("www.rentaboat.com"))
                valid = " Error: Answer contains web address. ";

        }
        return valid;

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (!ValidateReCaptcha())
        {
            lblM.Text = "Please Click on the I am not Robot.";
            return;

        }

        string errormessage = "";


        errormessage += ValidateInput(txtQuestion.Text, "Question ");

        if (errormessage != "")
        {
            lblM.Text = errormessage;
            lblM.ForeColor = System.Drawing.Color.Red;


            string al = "alert('Failed. \\n" + errormessage + "');";
            ScriptManager.RegisterStartupScript(this,this.GetType(),  "popAlertFailed", al,true);
           

            return;
        }

        else
        {
            try
            {





                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_answer_question", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Question_Id", ViewState["qid"].ToString());
                        cmd.Parameters.AddWithValue("@Answer", txtQuestion.Text);
                        cmd.Parameters.AddWithValue("@Answered_By", Session["userID"].ToString());
                        cmd.ExecuteNonQuery();
                        lblM.Text = "Successfully saved ";

                       
                        SendEmailToClient();



                        modalPopup.Show();


                    }
                }
            }
            catch (Exception ex)
            {
                lblM.Text = "Could not Send Question due to technical difficulties.";

            }
        }


        }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calendar.aspx");

    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calendar.aspx");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_delete_question", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Question_Id", ViewState["qid"].ToString());
                  
                    cmd.ExecuteNonQuery();
                    lblM.Text = "Successfully saved ";


                    Response.Redirect("Calendar.aspx");



                  


                }
            }
        }
        catch (Exception ex)
        {
            lblM.Text = "Could not Send Question due to technical difficulties.";

        }

    }

    protected void btnUpdateQuestion_Click(object sender, EventArgs e)
    {

        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_modify_answer_question]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Question_Id", ViewState["qid"].ToString());

                    cmd.Parameters.AddWithValue("@Answer", txtQuestion.Text.Trim());

                    cmd.Parameters.AddWithValue("@Question", txtQuestionAdmin.Text);



                    cmd.ExecuteNonQuery();
                    lblM.Text = "Successfully saved ";


                    Response.Redirect("Calendar.aspx");






                }
            }
        }
        catch (Exception ex)
        {
            lblM.Text = "Could not Send Question due to technical difficulties.";

        }



    }
}
