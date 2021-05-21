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
//public class RecaptchaApiResponse
//{
//    [DataMember(Name = "success")]
//    public bool Success;

//    [DataMember(Name = "error-codes")]
//    public List<string> ErrorCodes;
//}
public partial class AskQuestionBoat : System.Web.UI.Page
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userLevelID"] == null)
        {
            Response.Redirect("MemberSignIn.aspx");
        }

        if (!Page.IsPostBack)
        {
            PopulateBoatInfo();
            txtQuestion.Focus();

        }
      
    }

    protected void PopulateBoatInfo()
    {

        DataTable dtBoatDetails = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

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
                if (dtBoatDetails.Rows[0]["boat_sale_amount_currency_id"].ToString() == "2")
                 lblBoatSalePrice.Text = "&euro;" + dtBoatDetails.Rows[0]["boat_sale_amount"].ToString();
                else
                    lblBoatSalePrice.Text = "$" + dtBoatDetails.Rows[0]["boat_sale_amount"].ToString();
            }
            else
                divBoatSale.Visible = false;



        }

        // Get Boat main Pic 

        DataTable dtMainPic = Util.getDataSet("execute usp_get_main_boat_pic @in_boatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

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


        DataTable dtFacility = Util.getDataSet("execute usp_get_facility_details @in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

        if (dtFacility.Rows.Count > 0)
        {


            //lblTaxRate.Text = dtFacility.Rows[0]["nu_tax"].ToString();

            ViewState["fname"] = dtFacility.Rows[0]["vc_contactname"].ToString();

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



    void SendEmailToBoatOwner(string question, string qid)
    {

        string emailowner = Util.getBoatOwnerEmail(Session[Util.Session_Selected_BoatID].ToString(), Session[Util.Session_Selected_MarinaID].ToString());

        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/BoatOwnerQuestionEmail.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{FacilityName}", ViewState["fname"].ToString());
       
       
        body = body.Replace("{BoatName}", lblBoatName1.Text);
        body = body.Replace("{BoatMake}", lblBoatMake.Text);

        body = body.Replace("{BoatModel}", lblBoatModel.Text);

        body = body.Replace("{BoatYear}", lblBoatYear.Text);

        body = body.Replace("{BoatSize}", lblBoatLength.Text);

        body = body.Replace("{Question}", question);
        body = body.Replace("{BoatID}", lblBoatID.Text);

        body = body.Replace("{FacilityID}", Session[Util.Session_Selected_MarinaID].ToString());



        string token = "boatrentingtoken";

        DataTable dtU = Util.getDataSet("execute usp_get_username_password " + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];


        if (dtU.Rows.Count > 0)
        {
            token = dtU.Rows[0]["vc_username"].ToString() + "|" + dtU.Rows[0]["vc_password"].ToString();

        }

        SimplerAES ency = new SimplerAES();

        token = ency.Encrypt(token);

        body = body.Replace("{UrlAnswerQuestion}", "https://www.rentaboat.com/AnswerQuestionBoat.aspx?qid=" +qid +"&token="+ HttpUtility.UrlEncode(token));


        string decr = ency.Decrypt(token);

       

       // string boatImagePath = Server.MapPath("")+ mainboatpic.Src.Substring(1).Replace("/","\\");


      

        AlternateView htmlView = AlternateView.CreateAlternateViewFromString(body, null, "text/html");


        //LinkedResource bi = new LinkedResource(boatImagePath);
        //bi.ContentId = "BoatImage";

        //htmlView.LinkedResources.Add(bi);



        if (Util.IsProduction)
        {
            Util.LogEMail("Question@rentaboat.com", emailowner + ",Question@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "A Question is asked about your Boat!", body, "Question about boat");
            Util.SendEMail("Question@rentaboat.com", emailowner + ",Question@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "A Question is asked about your Boat!", body, htmlView);
        }
        else
            Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "A Question is asked about your Boat!", body, htmlView);




    }


    public string RemoveDigits(string key)
    {
        string rdigits = Regex.Replace(key, @"\d", "");

        string rdigitsSpell = rdigits.Replace("one", "").Replace("two", "").Replace("three", "").Replace("four", "").Replace("five", "").Replace("six", "").Replace("seven", "").Replace("eight", "").Replace("nine", "");

        return rdigitsSpell;

    }



    private string ValidateInput(string value, string fieldname)
    {
        string valid = "";

        string regPhone = @"\W*?(\([0-9]{3}\)|[0-9]{3}-)*([0-9]{3}-|[0-9]{3})[0-9]{4}\W*";
        string regWebAddres = @"\W*(\.com|\.COM|\.net|\.NET|\.org|\.ORG)\W*";



        if (Regex.IsMatch(value, regPhone))
        {

            if (!value.Contains("631-286-7816"))
                valid =  "Error: Question contains phone number. <br/>";

        }
        if (Regex.IsMatch(value, regWebAddres))
        {
            if (!value.Contains("www.rentaboat.com"))
                valid =  "Error: Question contains web address. <br/>";

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


        txtQuestion.Text = RemoveDigits(txtQuestion.Text);


        errormessage += ValidateInput(txtQuestion.Text, "Question ");

        if (errormessage !="")
        {
            lblM.Text = errormessage;
            lblM.ForeColor = System.Drawing.Color.Red;

            string al = "alert('Failed. \\n" + errormessage.Replace("<br/>","\\n") + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popAlertFailed", al, true);


            return;
        }


        try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_add_question", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                        cmd.Parameters.AddWithValue("@in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());
                        cmd.Parameters.AddWithValue("@Created_By", Session["userID"].ToString());
                        cmd.Parameters.AddWithValue("@question", txtQuestion.Text);

                        cmd.Parameters.Add("@question_id", SqlDbType.Int);
                        cmd.Parameters["@question_id"].Direction = ParameterDirection.Output;

                        cmd.ExecuteNonQuery();
                        lblM.Text = "Successfully saved ";

                        SendEmailToBoatOwner(txtQuestion.Text, cmd.Parameters["@question_id"].Value.ToString());



                        modalPopup.Show();


                    }
                }
            }
            catch (Exception ex)
            {
                lblM.Text = "Could not Send Question due to technical difficulties." + ex.Message;

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
}
