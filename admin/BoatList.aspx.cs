using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BoatList : System.Web.UI.Page
{

    void bindData()
    {
        DataTable dt = Util.getDataSet("execute usp_list_boat_facility @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];
        gvBoatList.DataSource = dt;

        gvBoatList.DataBind();
        ltrCount.Text = dt.Rows.Count.ToString() + " Records";

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {


            bindData();

            ltrMarinaWelcome.Text = "Welcome " + Util.getMarinaName(Session["marinaID"].ToString());


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
           // lblMessage.Text = "Error creating Static html :" + ex.Message;

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
    /*
    void CreateHTML(string bid)
    {
        try
        {
            // Create HTML Page.

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/BoatStaticPageTemplate.html")))
            {
                body = reader.ReadToEnd();
            }

            DataTable dtBoatInfo = Util.getDataSet("execute usp_get_boat_info " + bid).Tables[0];


            if (dtBoatInfo.Rows.Count > 0)
            {

                body = body.Replace("{BoatName}", dtBoatInfo.Rows[0]["vc_name"].ToString());

                body = body.Replace("{BoatYear}", dtBoatInfo.Rows[0]["vc_year"].ToString());
                body = body.Replace("{BoatMake}", dtBoatInfo.Rows[0]["vc_make"].ToString());
                body = body.Replace("{BoatModel}", dtBoatInfo.Rows[0]["vc_model"].ToString());
                body = body.Replace("{BoatLength}", dtBoatInfo.Rows[0]["vc_size"].ToString() + " " + dtBoatInfo.Rows[0]["vc_size_unit"].ToString());

                body = body.Replace("{BoatPassengers}", dtBoatInfo.Rows[0]["in_maxPassengers"].ToString());

                if (dtBoatInfo.Rows[0]["ti_captain"].ToString() == "1")
                    body = body.Replace("{BoatCaptain}", "Yes");
                else
                    body = body.Replace("{BoatCaptain}", "No");

                body = body.Replace("{BoatDescription}", dtBoatInfo.Rows[0]["vc_description"].ToString());

                //< Title > “City” “State” Boat Rentals | Learn how to rent our boat “size” “make” “Main Category” on “Body of Water” </ title >



                DataTable dtFacility = Util.getDataSet("execute [usp_get_facility_details] " + dtBoatInfo.Rows[0]["in_marinaID"].ToString()).Tables[0];

                string fcity = "";
                string fstate = "";
                string bodyofwater = "";
                string bcategory = "";

                // if (ddMainCategory.SelectedItem != null)

                if (dtBoatInfo.Rows[0]["in_boatTypeID"].ToString().Trim() !="" )
                bcategory = Util.getBoatMainCategoryName(dtBoatInfo.Rows[0]["in_boatTypeID"].ToString());


                if (dtFacility.Rows.Count > 0)
                {
                    fcity = dtFacility.Rows[0]["vc_city"].ToString();
                    fstate = dtFacility.Rows[0]["state"].ToString();
                    bodyofwater = dtFacility.Rows[0]["vc_bodywater"].ToString();
                }

                //                          < title > CITY STATE Boat Rentals | Rent MAKE BODY of WATER CATEGORY </ title >

                //< meta name = "description" content = "Rentaboat.com: Easily find A Boat Rental, Sailboat Charters, Yacht Reservations and Jet Ski Rentals world wide. Reserve a Boat and Book your boat online. Rent your boat as peer to peer.  Rated #1 in customer satisfaction.  View boat photos, Video, Availability and Reserve and book online." >


                string pageTitle = String.Format("{0} &nbsp; {1} &nbsp; Boat Rentals | Rent {2}&nbsp; {3}&nbsp; {4} &nbsp;on &nbsp;{5}", fcity, fstate, dtBoatInfo.Rows[0]["vc_size"].ToString(), dtBoatInfo.Rows[0]["vc_make"].ToString(), bcategory, bodyofwater);


                body = body.Replace("{PageTitle}", pageTitle);





                DataTable dtImages = Util.getDataSet("execute [usp_get_Boat_Images] @in_BoatID=" + bid + ", @in_MarinaID=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString()).Tables[0];

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


                DataTable dtPricing = Util.getDataSet("execute SP_BR_PRICExBOATxTYPERENT_LIST @p_in_BoatID=" + bid + ",@p_in_marinaID=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString()).Tables[0];



                for (int i = 0; i < dtPricing.Rows.Count; i++)
                {

                    pricetable += "<tr><td>" + dtPricing.Rows[i]["vc_description"].ToString() + " price:" + "</td>";
                    pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeek"].ToString() + "</td>";
                    pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeekend"].ToString() + "</td>";
                    pricetable += "<td>" + dtPricing.Rows[i]["nu_precioHolyday"].ToString() + "</td>";

                    pricetable += "<td>" + dtPricing.Rows[i]["hours_from"].ToString() + "&nbsp;TO&nbsp;" + dtPricing.Rows[i]["hours_to"].ToString() + "</td> </tr>";






                }

                pricetable += "</tbody></table>";


                DataTable dtboat = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + bid + ",@in_marinaID=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString()).Tables[0];


                body = body.Replace("{Country}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["country"].ToString().Trim() + "</span>");
                body = body.Replace("{State}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["state"].ToString().Trim() + "</span>");

                body = body.Replace("{City}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["vc_city"].ToString().Trim() + "</span>");
                body = body.Replace("{BodyOfWater}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["vc_bodywater"].ToString().Trim() + "</span>");


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


                body = body.Replace("{FacilityNo}", dtBoatInfo.Rows[0]["in_marinaID"].ToString());

                body = body.Replace("{AreaMapLink}", "<a onclick='return areaMap(" + dtFacility.Rows[0]["ch_zip"].ToString().Trim() + ");'  class='btn btn-primary ' role='button'>Area Map</a>");

                //  body = body.Replace("{ContactBoatOwnerLink}", "<a href='#dvAsk' class='btn btn-primary'>Contact Boat Owner </a>");
                body = body.Replace("{FacilityName}", dtFacility.Rows[0]["vc_marinaName"].ToString());


                //body = body.Replace("{ContactBoatOwnerLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


                //body = body.Replace("{AskBoatQuestionsLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");

                body = body.Replace("{ContactBoatOwnerLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + bid + "&mid=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


                body = body.Replace("{AskBoatQuestionsLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + bid + "&mid=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");



                DataTable tYoutube = Util.getDataSet("execute usp_get_boat_video @in_BoatID=" + bid + ",@in_MarinaID=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString()).Tables[0];


                if (tYoutube.Rows.Count > 0 && tYoutube.Rows[0]["YouTubeLink"].ToString() != "")
                {
                    body = body.Replace("{BoatVideo}", " <iframe width = \"400\" height = \"400\"  id = \"iframeVideo\" style = \"height:400px!important;\" src = \"" + tYoutube.Rows[0]["YouTubeLink"].ToString() + "\"  frameborder = \"0\" allowfullscreen ></iframe>");

                }
                else
                {
                    body = body.Replace("{BoatVideo}", "");

                }







                body = body.Replace("{BoatPriceTable}", pricetable);

                body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + bid + "&mid=" + dtBoatInfo.Rows[0]["in_marinaID"].ToString() + "'  class='btn btn-primary' role='button'>BOOK NOW</a>");


                body = body.Replace("{BoatOwner}", dtFacility.Rows[0]["vc_contactname"].ToString());

                body = body.Replace("{BoatTaxRate}", dtBoatInfo.Rows[0]["nu_tax"].ToString() + "%");

                body = body.Replace("{ReservationDeposit}", "$" + dtBoatInfo.Rows[0]["nu_reservation"].ToString());

                body = body.Replace("{SecurityDeposit}", "$" + dtBoatInfo.Rows[0]["nu_Deposit"].ToString());


                body = body.Replace("{CancellationPolicy}", dtBoatInfo.Rows[0]["vc_cancellation_policy"].ToString());

                body = body.Replace("{AreaAttractions}", dtBoatInfo.Rows[0]["vc_facilityArea"].ToString());

                body = body.Replace("{BoatRequirements}", dtBoatInfo.Rows[0]["vc_requirements"].ToString());




                File.WriteAllText(Server.MapPath("~/BoatHtml/" + "Facility_" + dtBoatInfo.Rows[0]["in_marinaID"].ToString() + "_Boat_" + bid + ".htm"), body);

                //  string url = @"http://www.boatrenting.com/ShowBoat.aspx?bid=" + Session["boatID"].ToString().Trim() + "&mid=" + Session["MarinaID"].ToString().Trim();

                string url = @"https://www.rentaboat.com/BoatHtml/" + "Facility_" + dtBoatInfo.Rows[0]["in_marinaID"].ToString()  + "_Boat_" + bid + ".htm";

                Util.UpdateSiteMap(url, Server.MapPath("~"));
            }

        }
        catch(Exception rx)
        {

        }
        }

    */
    void DeleteHTML(string bid)
    {

        try
        {
            String fpath = Server.MapPath("~/BoatHtml/" + "Facility_" + Session["marinaID"].ToString() + "_Boat_" + bid + ".htm");

            File.Delete(fpath);

        }
        catch(Exception)
        {

        }

    }


    private void CreateOrDeleteStaticHtml(string bid)
    {
        DataTable dtS = Util.getDataSet("execute usp_get_boat_status " + bid).Tables[0];

        if (dtS.Rows.Count > 0)
        {
            if (dtS.Rows[0][0].ToString() == "1")
            {
                // Create HTML
                //CreateHTML(bid);

                if (Util.IsBoatForRenting(Session["marinaID"].ToString()))
                    CreateHtmlBoat(bid);
                else
                    CreateHtmlBoatNoRent(bid);
            }
            else
            {
                // Delete HTML
                DeleteHTML(bid);

            }
        }

    }


    protected void gvBoatList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "changeStatus")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBoatList.Rows[index];
            string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();

            Util.Execute("usp_change_status_boat " + val);

            CreateOrDeleteStaticHtml(val);


        }

        else if (e.CommandName == "edit")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBoatList.Rows[index];
            string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();

            Response.Redirect("boats_mant.aspx?boatID=" + val);





        }
        else if (e.CommandName == "preview")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBoatList.Rows[index];
            string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();

            //  Response.Redirect("boats_mant.aspx?boatID=" + val);

            Session[Util.Session_Selected_BoatID] = val;
            Session[Util.Session_Selected_MarinaID] = Session["marinaID"].ToString();
            //,top =\'+Mtop+\', left=\'+Mleft+\'
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = 10;var Mtop = 10;window.open( '../Calendar.aspx', null, 'height=window.screen.height/2,width=window.screen.width,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no' );", true);



        }

        else if (e.CommandName == "book")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBoatList.Rows[index];
            string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();
            LinkButton lb = (LinkButton)row.Cells[5].Controls[1];
            if (lb.Text == "Not Active")
                ScriptManager.RegisterStartupScript(this, typeof(string), "alertNotActive", "alert('Selected Boat is Not Active. Please make it active in order to Book');", true);



            else
                Response.Redirect("CalendarAdmin.aspx?dd=" + DateTime.Now.Day.ToString() + "&mm=" + DateTime.Now.Month.ToString() + "&aaaa=" + DateTime.Now.Year.ToString() + "&BoatID=" + val);





        }

        else if (e.CommandName == "questions")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBoatList.Rows[index];
            string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();


            Session[Util.Session_Selected_MarinaID] = Session["marinaID"].ToString();
            Session[Util.Session_Selected_BoatID] = val;
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = 10;var Mtop = 10;window.open( './ListBoatQuestions.aspx', null, 'height=window.screen.height/2,width=window.screen.width,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no' );", true);


        }
        bindData();
        
    }

    protected void btnRemoveSelectedBoats_Click(object sender, EventArgs e)
    {

        foreach (GridViewRow row in gvBoatList.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chkSelectedBoat");
            if (chk.Checked)
            {
                int index = row.RowIndex;
                string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();
                Util.Execute("usp_delete_boat " + val);
            }


        }

        bindData();



    }

    protected void btnDeactivateSelectedBoats_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvBoatList.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chkSelectedBoat");
            if (chk.Checked)
            {
                int index = row.RowIndex;
                string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();
                Util.Execute("usp_deactivate_boat " + val);
            }


        }

        bindData();
    }

    protected void btnAddNewBoat_Click(object sender, EventArgs e)
    {
        Response.Redirect("boats_mant.aspx");
    }






    protected void gvBoatList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Retrieve the LinkButton control from the first column.
            LinkButton qButton = (LinkButton)e.Row.FindControl("btnQuestions");

            // Set the LinkButton's CommandArgument property with the
            // row's index.

            int index = e.Row.RowIndex;
            string val = gvBoatList.DataKeys[index]["in_boatID"].ToString();
          DataTable dt =  Util.getDataSet("execute usp_check_unanswered_questions_boat " + val).Tables[0];

            if (dt.Rows.Count > 0)
                qButton.ForeColor = System.Drawing.Color.Red;

           


        }
    }
}