using nce.adosql;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AjaxControlToolkit;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace BoatRenting {

  public partial class calendarLand_aspx_cs : System.Web.UI.Page
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
      private void PopulateRentOPtions()
      {

          DataTable dtRentOption = Util.getDataSet("execute SP_BR_TYPERENT_LIST_XBOAT @p_in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@p_in_boatID=" + Session[Util.Session_Selected_BoatID].ToString()).Tables[0];

          ddRentOption.DataSource = dtRentOption;
          ddRentOption.DataTextField = "vc_description";
          ddRentOption.DataValueField = "in_typerentID";
          ddRentOption.DataBind();

          ddRentOption.Items.Insert(0, "Choose Type of Rental");

          pnlStartDateHide.Visible = false;




          // This need to be pouplated per Boat later 
          // Currently 9: AM to 5:00 PM


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
              ddStartTime.Items.Add(new ListItem((i-12).ToString() + ":00 PM", getMilitary(i).ToString()));
             // ddStartTime.Items.Add(new ListItem((i-12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

              ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
              //ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

          }

          ddStartTime.Items.Insert(0, "Pick up time");
          ddEndTime.Items.Insert(0, "Drop off time");



      }


      private void PopulateFacilityDetails()
      {
          // Cancellation Policy

          // Owner : Facility Name
          //lblCancellationPolicy.Text = dtBoatDetails.Rows[0]["vc_requirements"].ToString();


          DataTable dtFacility = Util.getDataSet("execute usp_get_facility_details @in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

          if (dtFacility.Rows.Count > 0)
          {


             //   lblTaxRate.Text = dtFacility.Rows[0]["nu_tax"].ToString();
              

                lblBoatOwnerName.Text = dtFacility.Rows[0]["vc_contactname"].ToString();
                lblAddress.Text = dtFacility.Rows[0]["vc_addressline1"].ToString();
                lblCityStateZip.Text = dtFacility.Rows[0]["vc_city"].ToString() + ", " + dtFacility.Rows[0]["state"].ToString() +" "+ dtFacility.Rows[0]["ch_zip"].ToString();
                lblCountry.Text = dtFacility.Rows[0]["country"].ToString();
                lblPhoneEmail.Text = dtFacility.Rows[0]["vc_phone"].ToString() +" / " + dtFacility.Rows[0]["vc_email"].ToString();

                lblOwner.Text = dtFacility.Rows[0]["vc_marinaName"].ToString();
              lblCancellationPolicy.Text = dtFacility.Rows[0]["vc_depositPolicy"].ToString();
              lblAreaAttractions.Text = dtFacility.Rows[0]["vc_facilityArea"].ToString();

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


                btnShowAreaMap.Attributes.Add("onclick", "return areaMap(" + dtFacility.Rows[0]["ch_zip"].ToString().Trim() + ")");




              int rating = 0;

              if ( dtFacility.Rows[0]["in_rating"].ToString() != "")
                  rating = int.Parse(dtFacility.Rows[0]["in_rating"].ToString());

              if (rating != 0)
             for (int i=0; i < rating; i++)
               ltrRating.Text +="<img src='img/starselected.png' height='30px;' />";

              for (int i = rating; i < 5; i++)
                  ltrRating.Text += "<img src='img/star.png' height='30px;' />";

              lblMarinaAddress.Text = address;
                ctlNoRentingInfo.setAddress(address);

                ctlNoRentingInfo.setPhonenumber(dtFacility.Rows[0]["vc_phone"].ToString().Trim());
                ctlNoRentingInfo.setName(dtFacility.Rows[0]["vc_BusinessName"].ToString().Trim());

                ctlNoRentingInfo.setWebsitePage(dtFacility.Rows[0]["DisplayAdLandingPage"].ToString().Trim(), dtFacility.Rows[0]["facilityWebSite"].ToString().Trim());



            }

      }


    

      private void populatePricing()
      {

          DataTable dtPricing = Util.getDataSet("execute SP_BR_PRICExBOATxTYPERENT_LIST @p_in_BoatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@p_in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

          ltrPricing.Text ="<table class='boatPriceTable'><thead><tr><th></th><th>Weekday</th><th>Weekend</th><th>Holiday</th><th>Hours</th></tr></thead><tbody>";

          for (int i = 0; i < dtPricing.Rows.Count; i++)
          {

              ltrPricing.Text += "<tr><td>" + dtPricing.Rows[i]["vc_description"].ToString() + " price:" + "</td>";
              ltrPricing.Text += "<td>" + dtPricing.Rows[i]["nu_precioDayWeek"].ToString() +"</td>";
              ltrPricing.Text += "<td>" + dtPricing.Rows[i]["nu_precioDayWeekend"].ToString()  + "</td>";
              ltrPricing.Text += "<td>" + dtPricing.Rows[i]["nu_precioHolyday"].ToString() + "</td>";

              ltrPricing.Text += "<td>" + dtPricing.Rows[i]["hours_from"].ToString() + "&nbsp;TO&nbsp;" + dtPricing.Rows[i]["hours_to"].ToString() + "</td> </tr>";

          }

          ltrPricing.Text += "</tbody></table>";
      }


        protected void PopulateBoatInfo()
        {

            DataTable dtBoatDetails = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

            if (dtBoatDetails.Rows.Count > 0)
            {

                lblBoatName.Text = dtBoatDetails.Rows[0]["vc_name"].ToString();
                lblBoatName1.Text = lblBoatName.Text;
                lblBoatLength.Text = dtBoatDetails.Rows[0]["vc_size"].ToString();
                lblBoatMake.Text = dtBoatDetails.Rows[0]["vc_make"].ToString();

                lblBoatModel.Text = dtBoatDetails.Rows[0]["vc_model"].ToString();

                if (dtBoatDetails.Rows[0]["ti_captain"].ToString() == "1")
                    lblCaptain.Text = "Yes";
                else
                    lblCaptain.Text = "No";


                lblBoatID.Text = dtBoatDetails.Rows[0]["in_boatID"].ToString();
                lblFacilityNumber.Text = dtBoatDetails.Rows[0]["in_MarinaID"].ToString();


                // lblMoreBoatsFromOwner
                //lblOwner

                lblPassengers.Text = dtBoatDetails.Rows[0]["in_maxPassengers"].ToString();
                lblRequirements.Text = dtBoatDetails.Rows[0]["vc_requirements"].ToString();

                lblReservationDeposit.Text = dtBoatDetails.Rows[0]["nu_reservation"].ToString();
                //  lblSecurityDeposit.Text = dtBoatDetails.Rows[0]["vc_model"].ToString();
              //  lblTaxRate.Text = dtBoatDetails.Rows[0]["nu_Tax"].ToString();

              //  lblSecurityDeposit.Text = 


                lblBoatDescription.Text = dtBoatDetails.Rows[0]["vc_description"].ToString();


                lblSecurityDeposit.Text = dtBoatDetails.Rows[0]["nu_deposit"].ToString();




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


      protected void Page_Load(object sender, System.EventArgs e)
      {

          if (!Page.IsPostBack)
          {



                txtAllowSameDayRental.Value = Util.IsSameDayRentalAllowed(Session[Util.Session_Selected_MarinaID].ToString()).ToString();




                if (!Util.IsBoatForRenting(Session[Util.Session_Selected_MarinaID].ToString()))
                {

                    pnlNoRenting.Visible = true;
                    pnlRenting.Visible = false;

                    ctlNoRentingInfo.PopulateFields();

                    PopulateBoatInfo();

                    divMarinaAddress.Visible = true;

                }

                else
                {

                    pnlNoRenting.Visible = false;
                    pnlRenting.Visible = true;

                    divMarinaAddress.Visible = false;


                    bindYearDropDown();

                    PopulateBoatInfo();



               /*     DataTable dtBoatDetails = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

                    if (dtBoatDetails.Rows.Count > 0)
                    {

                        lblBoatName.Text = dtBoatDetails.Rows[0]["vc_name"].ToString();
                        lblBoatName1.Text = lblBoatName.Text;
                        lblBoatLength.Text = dtBoatDetails.Rows[0]["vc_size"].ToString();
                        lblBoatMake.Text = dtBoatDetails.Rows[0]["vc_make"].ToString();

                        lblBoatModel.Text = dtBoatDetails.Rows[0]["vc_model"].ToString();

                        if (dtBoatDetails.Rows[0]["ti_captain"].ToString() == "1")
                            lblCaptain.Text = "Yes";
                        else
                            lblCaptain.Text = "No";


                        lblBoatID.Text = dtBoatDetails.Rows[0]["in_boatID"].ToString();



                        // lblMoreBoatsFromOwner
                        //lblOwner

                        lblPassengers.Text = dtBoatDetails.Rows[0]["in_maxPassengers"].ToString();
                        lblRequirements.Text = dtBoatDetails.Rows[0]["vc_requirements"].ToString();

                        lblReservationDeposit.Text = dtBoatDetails.Rows[0]["nu_deposit"].ToString();
                        //  lblSecurityDeposit.Text = dtBoatDetails.Rows[0]["vc_model"].ToString();
                        lblTaxRate.Text = dtBoatDetails.Rows[0]["nu_Tax"].ToString();

                        lblBoatDescription.Text = dtBoatDetails.Rows[0]["vc_description"].ToString();

                    }

                    // Get Boat main Pic 

                    DataTable dtMainPic = Util.getDataSet("execute usp_get_main_boat_pic @in_boatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

                    if (dtMainPic.Rows.Count > 0)
                    {
                        mainboatpic.Src = @"./boats/" + dtMainPic.Rows[0]["vc_filename"].ToString();
                        mainboatpic.Alt = dtMainPic.Rows[0]["vc_nombre"].ToString();

                        hpicmain.Value = @"./boats/" + dtMainPic.Rows[0]["vc_filename"].ToString();

                    }*/

                    populatePricing();

                    PopulateRentOPtions();

                 

                    ShowVideoLink();

                    lblMoreBoatsFromOwner.Text = "<a href='results.aspx?t=1' >Click Here</a>";





                    pnlEndDateHide.Visible = false;

                    pnlContinueHide.Visible = false;
                    pnlStartEndTimeHide.Visible = false;


                    pnlStartDateHide.Visible = false;

                    ddRentOption.SelectedIndex = 1;

                    ddRentOption_SelectedIndexChanged(this, null);

                    Session[Util.Session_Selected_RentType] = "1";

                    Session[Util.Session_Selected_PickupDate] = null;

                    //    pnlEndDate.Visible = false;
                    IsStartDateSelected = false;


                }
          }

          ScriptManager.RegisterStartupScript(this, this.GetType(), "PageLoad", "Javascript:initialize();", true);
          
      }


    




  
        void ShowVideoLink()
        {

            DataTable dtV = Util.getDataSet("execute usp_get_video_info @in_BoatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

            if (dtV.Rows.Count > 0)
            {
                if (dtV.Rows[0]["YoutubeLink"].ToString().Trim() != "" )
                    //  iframeVideo.Src = dtV.Rows[0]["YoutubeLink"].ToString().Trim();
                    iframeVideo.Attributes.Add("src", dtV.Rows[0]["YoutubeLink"].ToString().Trim());
                else if (dtV.Rows[0]["Video_Filename"].ToString().Trim() != "")
                    //   iframeVideo.Src = "~/BoatVideos/" + dtV.Rows[0]["Video_Filename"].ToString();
                   

                    iframeVideo.Attributes.Add("src", Page.ResolveUrl("~/BoatVideos/") + dtV.Rows[0]["Video_Filename"].ToString());
            }


     



        }
     

      bool CheckIfHalfDayAvailable(string typerentid)
      {
          bool available = true;
          using (SqlConnection con = Util.getConnection())
          {
              using (SqlCommand cmd = new SqlCommand("[SP_BR_KART_ADDITION_AVAILABILITY]", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                  cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());
                  cmd.Parameters.AddWithValue("@p_in_typerentID", typerentid);
                  cmd.Parameters.AddWithValue("@p_begindate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());

                    Session[Util.Session_Selected_DropOffDate] = Session[Util.Session_Selected_PickupDate];

                    cmd.Parameters.AddWithValue("@p_enddate", ((DateTime)Session[Util.Session_Selected_DropOffDate]).ToShortDateString());
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


    

      void AddToCartShowSummaryHourly()
      {

          try
          {
              using (SqlConnection con = Util.getConnection())
              {
                  using (SqlCommand cmd = new SqlCommand("[usp_save_kart]", con))
                  {
                      cmd.CommandType = CommandType.StoredProcedure;
                      cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                      cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());
                      cmd.Parameters.AddWithValue("@p_in_typerentID", "4");
                      cmd.Parameters.AddWithValue("@p_begindate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());
                      cmd.Parameters.AddWithValue("@p_enddate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());
                    

                      RentTime rstime = (RentTime) Session[Util.Session_Selected_PickupTime];
                      RentTime retime =(RentTime) Session[Util.Session_Selected_DropOffTime];
                          cmd.Parameters.AddWithValue("@p_beginhour", rstime.Text );
                          cmd.Parameters.AddWithValue("@p_endhour", retime.Text);

                          cmd.Parameters.AddWithValue("@p_beginhourMilitary", rstime.Value);
                          cmd.Parameters.AddWithValue("@p_endhourMilitary", retime.Value);
                    

                      Session[Util.Session_Cart_Id] = generateUniqueCartID();

                      cmd.Parameters.AddWithValue("@p_vc_sessionID", Session[Util.Session_Cart_Id].ToString());

                      cmd.Parameters.AddWithValue("@p_ti_webclient", 1);

                      int thours = (int.Parse(ddEndTime.SelectedItem.Value) - int.Parse(ddStartTime.SelectedItem.Value))/100;

                      cmd.Parameters.AddWithValue("@p_totalHours", thours);
                      
                      /// This need to be updated later when client login
                      /// 
                      //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());
                      
                      
                      cmd.ExecuteNonQuery();


                  }
              }


              Response.Redirect("OrderSummary.aspx");

          }

          catch (Exception ex)
          {

              lblMessageContinue.Text = "Error while adding to Cart " + ex.Message;



          }



      }






      bool AddToCartShowSummaryHalfDay(string typerentid)
      {

          bool addedToCart = true;

          try
          {
              using (SqlConnection con = Util.getConnection())
              {
                  using (SqlCommand cmd = new SqlCommand("[usp_save_kart]", con))
                  {
                      cmd.CommandType = CommandType.StoredProcedure;
                      cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                      cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());
                      cmd.Parameters.AddWithValue("@p_in_typerentID", typerentid);
                      cmd.Parameters.AddWithValue("@p_begindate", Session[Util.Session_Selected_PickupDate].ToString());
                      cmd.Parameters.AddWithValue("@p_enddate", Session[Util.Session_Selected_PickupDate].ToString());


                        /*DataTable dtRentHours = new DataTable();
                        if (typerentid == "2" || typerentid == "3" || typerentid == "1") // Get the hours
                            dtRentHours = Util.getDataSet("execute usp_get_begin_end_hour_half_day @in_BoatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@in_typerentid=" +typerentid).Tables[0];


                        string beginHour = "";
                        string endHours = "";

                        if (dtRentHours.Rows.Count > 0)
                        {
                            beginHour = dtRentHours.Rows[0]["Hours_From"].ToString();
                            endHours = dtRentHours.Rows[0]["Hours_To"].ToString();



                        }


                        if (typerentid == "2")
                      {
                          cmd.Parameters.AddWithValue("@p_beginhour", beginHour);
                          cmd.Parameters.AddWithValue("@p_endhour", endHours);

                          cmd.Parameters.AddWithValue("@p_beginhourMilitary", "0");
                          cmd.Parameters.AddWithValue("@p_endhourMilitary", "1159");
                      }
                      else
                      {
                          cmd.Parameters.AddWithValue("@p_beginhour", beginHour);
                          cmd.Parameters.AddWithValue("@p_endhour", endHours);

                          cmd.Parameters.AddWithValue("@p_beginhourMilitary", "1200");
                          cmd.Parameters.AddWithValue("@p_endhourMilitary", "2359");
                      }
                      */

                        string[] rentH = Util.getMarinaOpenAndCloseTime(Session[Util.Session_Selected_MarinaID].ToString(), typerentid, Session[Util.Session_Selected_BoatID].ToString());


                         cmd.Parameters.AddWithValue("@p_beginhour", rentH[0]);
                        cmd.Parameters.AddWithValue("@p_endhour", rentH[1]);

                        cmd.Parameters.AddWithValue("@p_beginhourMilitary", rentH[2]);
                        cmd.Parameters.AddWithValue("@p_endhourMilitary", rentH[3]);

                        Session[Util.Session_Cart_Id] = generateUniqueCartID();

                      cmd.Parameters.AddWithValue("@p_vc_sessionID", Session[Util.Session_Cart_Id].ToString());

                      cmd.Parameters.AddWithValue("@p_ti_webclient", 1);
                     
                      cmd.Parameters.AddWithValue("@p_totalHours", 12);
                      
                      
                      // This is need to be updated when the Client Login

                     // cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());
                     
                      
                      cmd.ExecuteNonQuery();


                  }
              }


              Response.Redirect("OrderSummary.aspx");

          }

          catch (Exception ex)
          {

              addedToCart = false;

              lblMessageContinue.Text = "Error while adding to Cart " + ex.Message;



          }

          return addedToCart;


      }






      bool CheckIfFullDayAvailable()
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
              using (SqlCommand cmd = new SqlCommand("[SP_BR_KART_ADDITION_AVAILABILITY]", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                  cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());
                  cmd.Parameters.AddWithValue("@p_in_typerentID", "1");
                  cmd.Parameters.AddWithValue("@p_begindate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());

                    if (Session[Util.Session_Selected_DropOffDate] == null)
                        Session[Util.Session_Selected_DropOffDate] = Session[Util.Session_Selected_PickupDate];


                 cmd.Parameters.AddWithValue("@p_enddate", ((DateTime)Session[Util.Session_Selected_DropOffDate]).ToShortDateString());
                  DataSet dst = new DataSet();

                  SqlDataAdapter da = new SqlDataAdapter(cmd);

                  da.Fill(dst);

                  DataTable dtA = dst.Tables[0];

                  if (dtA.Rows[0][0].ToString() == "0")
                      available= false;




              }
          }



          return available;
      }

      string generateUniqueCartID()
      {
          string uniqueid = Session.SessionID + DateTime.Now.ToOADate().ToString();
          return uniqueid;
      }

      void AddToCartShowSummaryFullDay()
      {

      /*    [dbo].[SP_BR_KART_ADDITION] --1,1,6,2005
@p_in_boatID		integer,
@p_in_marinaID		integer,
@p_in_typerentID	integer,
@p_begindate		char(10),
@p_enddate		char(10),
@p_beginhour		varchar(8),
@p_endhour		varchar(8),
@p_vc_sessionID	varchar(100),
@p_ti_webclient		tinyint,
@p_beginhourMilitary int,
@p_endhourMilitary int,
@p_totalHours int
*/
          try
          {
              using (SqlConnection con = Util.getConnection())
              {
                  using (SqlCommand cmd = new SqlCommand("[usp_save_kart]", con))
                  {
                      cmd.CommandType = CommandType.StoredProcedure;
                      cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                      cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());
                      cmd.Parameters.AddWithValue("@p_in_typerentID", "1");

                       cmd.Parameters.AddWithValue("@p_begindate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());
                      cmd.Parameters.AddWithValue("@p_enddate", ((DateTime)Session[Util.Session_Selected_DropOffDate]).ToShortDateString());
                        
                        /*
 cmd.Parameters.AddWithValue("@p_beginhourMilitary", "0");

                      cmd.Parameters.AddWithValue("@p_endhourMilitary", "24");
                        string[] openclose = Util.getMarinaOpenAndCloseTime(Session[Util.Session_Selected_MarinaID].ToString());

                        
                        cmd.Parameters.AddWithValue("@p_beginhour", openclose[0]);

                        cmd.Parameters.AddWithValue("@p_endhour", openclose[1]);*/

                        string[] rentH = Util.getMarinaOpenAndCloseTime(Session[Util.Session_Selected_MarinaID].ToString(), "1", Session[Util.Session_Selected_BoatID].ToString());


                         cmd.Parameters.AddWithValue("@p_beginhour", rentH[0]);
                        cmd.Parameters.AddWithValue("@p_endhour", rentH[1]);

                        cmd.Parameters.AddWithValue("@p_beginhourMilitary", rentH[2]);
                        cmd.Parameters.AddWithValue("@p_endhourMilitary", rentH[3]);



                        Session[Util.Session_Cart_Id] = generateUniqueCartID();

                      cmd.Parameters.AddWithValue("@p_vc_sessionID", Session[Util.Session_Cart_Id].ToString());

                      cmd.Parameters.AddWithValue("@p_ti_webclient", 1);
                     
                      cmd.Parameters.AddWithValue("@p_totalHours", 24);
                      
                      //  ------ This is need to updated once the Cleint login
                      //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());
                     
                      
                      cmd.ExecuteNonQuery();


                  }
              }


              Response.Redirect("OrderSummary.aspx");

          }

          catch (Exception ex)
          {

              lblMessageContinue.Text = "Error while adding to Cart " + ex.Message;



          }
      
      
      
      }

      /*


      protected void lnkReturingCustomer_Click(object sender, EventArgs e)
      {
          lblReturingCustomerMessage.Text = "";
//          @P_VC_UserName VARCHAR(100),
//@P_VC_Password VARCHAR(30)
          DataTable dt = Util.getDataSet("execute [usp_client_login_with_pass] @P_VC_UserName='" + txtUsername.Text.Trim() + "',@P_VC_Password='" + txtPassword.Text + "'").Tables[0];

          if (dt.Rows.Count == 0)
          {
              lblReturingCustomerMessage.Text = "Invalid user name or password. Please try again.";
              Session[Util.Session_Client_Id] = null;

              return;
          }
          else
              Session[Util.Session_Client_Id] = dt.Rows[0]["in_clientID"].ToString();


          if (ddRentOption.SelectedItem.Value == "1")
          {
              if (txtStartDate.Value.Trim() == "")
              {
                  lblReturingCustomerMessage.Text = "Invalid Pick Up Date.";
                  return;
              }

              if (txtEndDate.Text.Trim() == "")
              {
                  lblReturingCustomerMessage.Text = "Invalid Drop Off Date.";
                  return;
              }


          bool available =    CheckIfFullDayAvailable();

          if (available)
          {
              AddToCartShowSummaryFullDay();
          }
          else
          {
              lblReturingCustomerMessage.Text = "Date Requested is not available.";
              return;
          }


          }
          else if (ddRentOption.SelectedItem.Value == "2" || ddRentOption.SelectedItem.Value == "3")
          {
              if (txtStartDate.Value.Trim() == "")
              {
                  lblReturingCustomerMessage.Text = "Invalid Pick Up Date.";
                  return;
              }


              bool available = CheckIfHalfDayAvailable(ddRentOption.SelectedItem.Value);

              if (available)
              {
                  AddToCartShowSummaryHalfDay(ddRentOption.SelectedItem.Value);
              }
              else
              {
                  lblReturingCustomerMessage.Text = "Date Requested is not available.";
                  return;
              }




          }
          else if (ddRentOption.SelectedItem.Value == "4")
          {
              if (txtStartDate.Value.Trim() == "")
              {
                  lblReturingCustomerMessage.Text = "Invalid Pick Up Date.";
                  return;
              }

             

              if (ddStartTime.SelectedIndex >= ddEndTime.SelectedIndex)
              {
                  lblReturingCustomerMessage.Text = "Invalid Start Time or Return Time.";
                  return;
              }

              AddToCartShowSummaryHourly();





          }

          else if (ddRentOption.SelectedItem.Value == "5")
          {
              if (txtStartDate.Value.Trim() == "")
              {
                  lblReturingCustomerMessage.Text = "Invalid Pick Up Date.";
                  return;
              }



              if (ddStartTime.SelectedIndex >= ddEndTime.SelectedIndex)
              {
                  lblReturingCustomerMessage.Text = "Invalid Start Time or Return Time.";
                  return;
              }





          }
      
      }
      
      
      */


      private List<DateTime> unAvailableDates = new List<DateTime>();

        private List<DateTime> unAvailableDatesHalfDayAM = new List<DateTime>();
        private List<DateTime> unAvailableDatesHalfDayPM = new List<DateTime>();


        private void populatePreviousMonth(Calendar c)
      {
          int y = c.SelectedDate.Year;
          int m = c.SelectedDate.Month - 1;

       

          if (m == 0)
          {
              y = c.SelectedDate.Year - 1;
              m = 12;

          }

          DataTable dt = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + m.ToString() + ", @Year=" + y.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=" + ddRentOption.SelectedItem.Value).Tables[0];



            if (dt.Rows.Count > 0)
          {
              for (int i = 0; i < dt.Rows.Count; i++)
                  //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                  unAvailableDates.Add((DateTime)(DateTime)dt.Rows[i][0]);


          }

            // If full day rental check if half day am or pm available
            if (ddRentOption.SelectedItem.Value == "1" && ddRentOption.Items.FindByValue("2") != null)
            {

                DataTable dtAM = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + m.ToString() + ", @Year=" + y.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=2" ).Tables[0];



                if (dtAM.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                        //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                        unAvailableDatesHalfDayAM.Add((DateTime)(DateTime)dt.Rows[i][0]);

                }


            }

            if (ddRentOption.SelectedItem.Value == "1" && ddRentOption.Items.FindByValue("3") != null)
            {

                DataTable dtPM = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + m.ToString() + ", @Year=" + y.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=3").Tables[0];



                if (dtPM.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                        //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                        unAvailableDatesHalfDayPM.Add((DateTime)(DateTime)dt.Rows[i][0]);

                }


            }

        }
      private void populateFollowingMonth(Calendar c)
      {
        

          int y =c.SelectedDate.Year;
          int m = c.SelectedDate.Month+1;

          if (m == 12)
          {
              y = c.SelectedDate.Year + 1;
              m = 1;

          }

          DataTable dt = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + m.ToString() + ", @Year=" +y.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=" + ddRentOption.SelectedItem.Value).Tables[0];
          if (dt.Rows.Count > 0)
          {
              for (int i = 0; i < dt.Rows.Count; i++)
                  // unAvailableFollowing.Add(((DateTime)dt.Rows[i][0]).Day);
                  unAvailableDates.Add((DateTime)dt.Rows[i][0]);
          }


            if (ddRentOption.SelectedItem.Value == "1" && ddRentOption.Items.FindByValue("2") != null)
            {

                DataTable dtAM = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + m.ToString() + ", @Year=" + y.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=2").Tables[0];



                if (dtAM.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                        //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                        unAvailableDatesHalfDayAM.Add((DateTime)(DateTime)dt.Rows[i][0]);

                }


            }

            if (ddRentOption.SelectedItem.Value == "1" && ddRentOption.Items.FindByValue("3") != null)
            {

                DataTable dtPM = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + m.ToString() + ", @Year=" + y.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=3").Tables[0];



                if (dtPM.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                        //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                        unAvailableDatesHalfDayPM.Add((DateTime)(DateTime)dt.Rows[i][0]);

                }


            }




        }
      private void RenderUnavailableDates(Calendar c)
      {

          unAvailableDates.Clear();

            unAvailableDatesHalfDayAM.Clear();
            unAvailableDatesHalfDayPM.Clear();


          if (c.VisibleDate.Month + 1 < DateTime.Now.Month)
              return;
          else if (c.VisibleDate.Month < DateTime.Now.Month)
              populateFollowingMonth(c);
          else
          {
              populateFollowingMonth(c);
              populatePreviousMonth(c);

          }


          DataTable dt = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + c.VisibleDate.Month.ToString() + ", @Year=" + c.VisibleDate.Year.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() +",@TypeRentID=" + ddRentOption.SelectedItem.Value).Tables[0];
          if (dt.Rows.Count > 0)
          {
              for (int i = 0; i < dt.Rows.Count; i++)
                  unAvailableDates.Add(((DateTime)dt.Rows[i][0]));

          }



            if (ddRentOption.SelectedItem.Value == "1" && ddRentOption.Items.FindByValue("2") != null)
            {

                DataTable dtAM = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + c.VisibleDate.Month.ToString() + ", @Year=" + c.VisibleDate.Year.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=2").Tables[0];



                if (dtAM.Rows.Count > 0)
                {
                    for (int i = 0; i < dtAM.Rows.Count; i++)
                        //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                        unAvailableDatesHalfDayAM.Add((DateTime)(DateTime)dtAM.Rows[i][0]);

                }


            }

            if (ddRentOption.SelectedItem.Value == "1" && ddRentOption.Items.FindByValue("3") != null)
            {

                DataTable dtPM = Util.getDataSet("execute usp_get_unavailable_dates @Month=" + c.VisibleDate.Month.ToString() + ", @Year=" + c.VisibleDate.Year.ToString() + ",@BoatId=" + Session[Util.Session_Selected_BoatID].ToString() + ",@MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@TypeRentID=3").Tables[0];



                if (dtPM.Rows.Count > 0)
                {
                    for (int i = 0; i < dtPM.Rows.Count; i++)
                        //unAvailableDatesPrevious.Add(((DateTime)dt.Rows[i][0]).Day);
                        unAvailableDatesHalfDayPM.Add((DateTime)(DateTime)dtPM.Rows[i][0]);

                }


            }


            Session["UnavailableDates"] = unAvailableDates;
            Session["UnavailableDatesAM"] = unAvailableDatesHalfDayAM;
            Session["UnavailableDatesPM"] = unAvailableDatesHalfDayPM;


        }


      bool IsStartDateSelected
        {
            get
            {

                if (Session["IsStartDateSelected"] == null)
                {
                    Session["IsStartDateSelected"] = false;

                  


                }
                return (bool)Session["IsStartDateSelected"];


            }


            set
            {
                Session["IsStartDateSelected"] = value;

            }

        }



        void ReloadUnavailableDatesFromSession()
        {

            unAvailableDates = (List<DateTime>)Session["UnavailableDates"];
            unAvailableDatesHalfDayAM = (List<DateTime>)Session["UnavailableDatesAM"];
            unAvailableDatesHalfDayPM = (List<DateTime>)Session["UnavailableDatesPM"];

        }

        protected void calStartDate_SelectionChanged(object sender, EventArgs e)
      {
         // popupStartDate.Commit(calStartDate.SelectedDate.ToShortDateString());
      //   txtStartDate.Value = calStartDate.SelectedDate.ToShortDateString();

     //   Session["RentStartDate"] = calStartDate.SelectedDate;
         Session[Util.Session_Selected_PickupDate] = calStartDate.SelectedDate;

          lnkSelectADate.Text = "PICK UP DATE : " + calStartDate.SelectedDate.ToShortDateString();

          divStep1.Visible = false;
          divStartDateInfo.Visible = false;

          lnkSelectADate.BackColor = Color.LightBlue;
          IsStartDateSelected = true;
          Session[Util.Session_Selected_DropOffDate] = null;




            /// Check if AM & PM Availablity is clicked

         if (ddRentOption.SelectedItem.Value == "1")
            {


                ReloadUnavailableDatesFromSession();

                if (unAvailableDates.Contains(calStartDate.SelectedDate) && !unAvailableDatesHalfDayAM.Contains(calStartDate.SelectedDate) && ddRentOption.Items.FindByValue("2") != null)
                {
                    ddRentOption.ClearSelection();
                    ddRentOption.Items.FindByValue("2").Selected = true;

                    Session[Util.Session_Selected_RentType] = "2";
                 }

                if (unAvailableDates.Contains(calStartDate.SelectedDate) && !unAvailableDatesHalfDayPM.Contains(calStartDate.SelectedDate) && ddRentOption.Items.FindByValue("3") != null)
                {
                    ddRentOption.ClearSelection();
                    ddRentOption.Items.FindByValue("3").Selected = true;
                    Session[Util.Session_Selected_RentType] = "3";

                }

            }




          if (ddRentOption.SelectedItem.Value == "1" )
          {
              pnlEndDateCalendar.Visible = true;

              pnlEndDateHide.Visible = true;

              pnlStartDateCalendar.Visible = false;

              pnlStartEndTimeHide.Visible = false;

              calEndDate.VisibleDate = calStartDate.SelectedDate;

              RenderUnavailableDates(calEndDate);
              LastStepNo = "4";

              divEndDateInfo.Visible = true;





          }

          if (ddRentOption.SelectedItem.Value == "2" || ddRentOption.SelectedItem.Value == "3")
          {
             
              pnlEndDateHide.Visible = false;

             // pnlStartDateCalendar.Visible = false;
              pnlStartEndTimeHide.Visible = false;

              pnlContinueHide.Visible = true;

              LastStepNo = "3";
          }
          else if (ddRentOption.SelectedItem.Value == "4")
          {
              pnlStartEndTimeHide.Visible = true;
              pnlContinueHide.Visible = true;
              pnlEndDateHide.Visible = false;
             // pnlStartDateCalendar.Visible = false;

              pnlContinueHide.Visible = false;
              divTimeInfo.Visible = true;

              LastStepNo = "4";


          }


            calStartDate.SelectedDates.Clear();

        //  popupEndDate.Cancel();

        //  ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowEndCal", "Javascript:showEndCalendarOnLoad();", true);
      }
      protected void calStartDate_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
      {
          calStartDate.SelectedDate = e.NewDate;

          RenderUnavailableDates(calStartDate);

      }
      protected void calStartDate_DayRender(object sender, DayRenderEventArgs e)
      {
        //  string cddd = calStartDate.VisibleDate.Month.ToString();

     //  e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#93d13f");
            //  e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");

         //   e.Cell.Attributes.Add("class", "calPickupDropOff");


            // This is selected date color

            if (Session[Util.Session_Selected_PickupDate] !=null && IsStartDateSelected && e.Day.Date == (DateTime)Session[Util.Session_Selected_PickupDate])
          {

             // e.Cell.BackColor = Color.Yellow;
              e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7df57");
              e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
                e.Cell.Attributes.Add("class", "calPickupDropOff");
                return;
          }


          if (e.Day.Date.AddDays(1) < DateTime.Now  )
          {
              e.Day.IsSelectable = false;
              // e.Cell.Font.Strikeout = true;
             e.Cell.ToolTip = "This day is not available";

              e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
              e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#999");

                e.Cell.Attributes.Add("class", "calPickupDropOff");
                //e.Cell.Attributes.Add("class", "tooltip");

                //e.Cell.Attributes.Add("title", "This day is not available");



            }

          else  if (e.Day.Date.ToShortDateString()  == DateTime.Now.ToShortDateString() && txtAllowSameDayRental.Value == "0")
            {
                e.Day.IsSelectable = false;
                // e.Cell.Font.Strikeout = true;
                e.Cell.ToolTip = "This day is not available";

                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#999");

                e.Cell.Attributes.Add("class", "calPickupDropOff");
                //e.Cell.Attributes.Add("class", "tooltip");

                //e.Cell.Attributes.Add("title", "This day is not available");



            }

            else if (unAvailableDates.Contains(e.Day.Date) )
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

    


      }


      bool EndDateSelected = false;



      protected void calEndDate_SelectionChanged(object sender, EventArgs e)
      {
         // popupEndDate.Commit(calEndDate.SelectedDate.ToShortDateString());
           // txtEndDate.Value = calEndDate.SelectedDate.ToShortDateString();

            Session[Util.Session_Selected_DropOffDate] = calEndDate.SelectedDate;

            divEndDateInfo.Visible = false;

          

          lnkEndDate.Text = "DROP OFF DATE : " + calEndDate.SelectedDate.ToShortDateString();
          lnkEndDate.BackColor = Color.LightBlue;
         // pnlEndDateCalendar.Visible = false;

          EndDateSelected = true;

            lnkContinueWithOneDayRental.Visible = false;

            divOneDayInfo.Visible = false;


          if (ddRentOption.SelectedItem.Value == "4")
          {
              
              pnlStartEndTimeHide.Visible = true;
              pnlEndDateCalendar.Visible = false;

              pnlContinueHide.Visible = true;


          }
          else
          {
            

              pnlContinueHide.Visible = true;

          }
          LastStepNo = "3";

      }
      protected void calEndDate_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
      {
          RenderUnavailableDates(calEndDate);

      }



     

     




        protected void calEndDate_DayRender(object sender, DayRenderEventArgs e)
      {
//           past dates:#dddddd - font color #999
//Booked dates: #c56666 - font color #fff
//Available dates: #439f43 - font color #fff
//Selected date #f7df57 - font color #000
          
          
        


          if (e.Day.Date == (DateTime)Session[Util.Session_Selected_PickupDate])
          {
              e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7df57");
              e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
                e.Cell.Attributes.Add("class", "calPickupDropOff");

                return;
          }


          if (EndDateSelected && e.Day.Date >= (DateTime)Session[Util.Session_Selected_PickupDate] && e.Day.Date <= (DateTime)Session[Util.Session_Selected_DropOffDate])
          {
             e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7df57");
              e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
                e.Cell.Attributes.Add("class", "calPickupDropOff");

                return;
          }


          if (e.Day.Date < DateTime.Now || e.Day.Date < (DateTime)Session[Util.Session_Selected_PickupDate])
          {
              e.Day.IsSelectable = false;
              // e.Cell.Font.Strikeout = true;
              e.Cell.ToolTip = "This day is not available";

                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#999");

                e.Cell.Attributes.Add("class", "calPickupDropOff");

                //e.Cell.Attributes.Add("class", "tooltip");

                //e.Cell.Attributes.Add("title", "This day is not available");



            }
            else if (unAvailableDates.Contains(e.Day.Date))
              {
                  e.Day.IsSelectable = false;
                  // e.Cell.Font.Strikeout = true;
                  e.Cell.ToolTip = "This day is not available";

                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#999");


                //e.Cell.Attributes.Add("class", "tooltip");

                //e.Cell.Attributes.Add("title", "This day is not available");


            }

          

          else
          {

                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#93d13f");
                e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");

                e.Cell.ToolTip = "Select a Drop Off Date";

                e.Cell.Attributes.Add("onclick", e.SelectUrl);

                e.Cell.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Cell.Attributes.Add("onmouseout", "this.style.cursor='default'");

                e.Cell.Attributes.Add("class", "calPickupDropOff");
            }


      }


      private void MarkUnavailableDates(Calendar c)
      {

          RenderUnavailableDates(c);
         
        

      }

      

      protected void lnkSelectADate_Click(object sender, EventArgs e)
      {
          if (calStartDate.Visible)
          {
              calStartDate.Visible = false;


              calStartDate_SelectionChanged(this, null);

              return;

          }
          
          
          pnlEndDateHide.Visible = false;
          pnlStartDateCalendar.Visible = true;
          calStartDate.Visible = true;

          MarkUnavailableDates(calStartDate);


      }
      protected void lnkEndDate_Click(object sender, EventArgs e)
      {

          pnlEndDateHide.Visible = true;

          calEndDate.VisibleDate = calStartDate.SelectedDate;

          RenderUnavailableDates(calEndDate);

          calEndDate.Visible = true;


         
          pnlStartDateCalendar.Visible = false;
          pnlEndDateCalendar.Visible = true;

      }
      protected void ddRentOption_SelectedIndexChanged(object sender, EventArgs e)
      {

          Session[Util.Session_Selected_RentType] = ddRentOption.SelectedItem.Value;


          ddEndTime.SelectedIndex = 0;
          ddStartTime.SelectedIndex = 0;

          if (ddRentOption.SelectedIndex == 0)
          {
              pnlStartEndTimeHide.Visible = false;
              pnlContinueHide.Visible = false;
              pnlEndDateHide.Visible = false;

              pnlStartDateHide.Visible = false;
              calStartDate.Visible = false;
             

          }

          else if (ddRentOption.SelectedIndex > 0)
          {
              pnlStartDateHide.Visible = true;
              calStartDate.Visible = true;

              calStartDate.VisibleDate = DateTime.Now.AddDays(1 - DateTime.Now.Day);
              calStartDate.SelectedDate = DateTime.Now.AddDays(1 - DateTime.Now.Day);

              RenderUnavailableDates(calStartDate);

              pnlStartEndTimeHide.Visible = false;
              pnlContinueHide.Visible = false;
              pnlEndDateHide.Visible = false;

              pnlStartDateCalendar.Visible = true;


              divStartDateInfo.Visible = true;

              divStep1.Visible = false;

              divTimeInfo.Visible = false;

          }



            if (ddRentOption.SelectedIndex == 1 && !Page.IsPostBack)
            {
                divStep1.Visible = true;
                divStartDateInfo.Visible = false;

                //  pnlEndDateCalendar.Visible = false;
            }

            else if (ddRentOption.SelectedIndex == 1)
                divStartDateInfo.Visible = false;


      }


      public string LastStepNo = "3";
      protected void ddEndTime_SelectedIndexChanged(object sender, EventArgs e)
      {
          
          
          
          if (ddEndTime.SelectedIndex <= ddStartTime.SelectedIndex)
          {
              ddEndTime.SelectedIndex = 0;
              return;

          }

          else if (ddEndTime.SelectedIndex > 0)
          {
              pnlContinueHide.Visible = true;

          }
          else if (ddEndTime.SelectedIndex == 0)
              pnlContinueHide.Visible = false;

          RentTime rt = new RentTime();
          rt.Text = ddEndTime.SelectedItem.Text;
          rt.Value = ddEndTime.SelectedItem.Value;

          Session[Util.Session_Selected_DropOffTime] = rt;


            RentTime rt1 = new RentTime();
          rt1.Text = ddStartTime.SelectedItem.Text;
          rt1.Value = ddStartTime.SelectedItem.Value;

          Session[Util.Session_Selected_PickupTime] = rt1;

          divTimeInfo.Visible = false;

          LastStepNo = "4";
           

      }


      private RentTime getRentTime(DropDownList dd)
      {
          RentTime r = new RentTime();

          r.Text = dd.SelectedItem.Text;
          r.Value = dd.SelectedItem.Value;
          return r;

      }




      protected void lnkContinue_Click(object sender, EventArgs e)
      {
          lblMessageContinue.Text = "";


          if (int.Parse(Session[Util.Session_Selected_RentType].ToString())== 1)
          {
              if ((DateTime)Session[Util.Session_Selected_PickupDate] > (DateTime)Session[Util.Session_Selected_DropOffDate])
              {
                  lblMessageContinue.Text = "Inavlid Pickup or Drop Off Date";
                  return;

              }


          }
          else if (int.Parse(Session[Util.Session_Selected_RentType].ToString()) == 4) // hourly
          {
            if (ddEndTime.SelectedIndex < 1)
            {
                lblMessageContinue.Text = "Please select an Drop Off Time";
                return;


            }

 if (ddStartTime.SelectedIndex < 1)
            {
                lblMessageContinue.Text = "Please select an Pick Time";
                return;


            }


              Session[Util.Session_Selected_DropOffTime] = getRentTime(ddEndTime);

              Session[Util.Session_Selected_PickupTime] = getRentTime(ddStartTime);



              RentTime startTime = (RentTime)Session[Util.Session_Selected_PickupTime];

              RentTime endTime = (RentTime)Session[Util.Session_Selected_DropOffTime];


              if (int.Parse(startTime.Value) >=  int.Parse( endTime.Value))
              {
                  lblMessageContinue.Text = "Inavlid Pickup or Drop Off Time";
                  return;

              }


          }




          /////////////////////////////////////////////////////////////////////

          int renttype =int.Parse(Session[Util.Session_Selected_RentType].ToString()) ;

          if (renttype == 1)
          {
           bool available =    CheckIfFullDayAvailable();

          if (available)
          {
              AddToCartShowSummaryFullDay();
          }
          else
          {

              lnkSelectADate.Text = "SELECT A PICK UP DATE";
              lnkEndDate.Text = "SELECT A DROP OFF DATE";
              Session[Util.Session_Selected_PickupDate] = null;
              Session[Util.Session_Selected_DropOffDate] = null;

              pnlEndDateCalendar.Visible = false;

              calStartDate.Visible = true;
                    IsStartDateSelected = false;


              lblMessageContinue.Text = "Date Requested is not available.";
              return;
          }


          }
          else if (renttype == 2 || renttype == 3)
          {
              if (Session[Util.Session_Selected_PickupDate] ==  null )
              {

                  lnkSelectADate.Text = "SELECT A PICK UP DATE";
                  lnkEndDate.Text = "SELECT A DROP OFF DATE";
                  Session[Util.Session_Selected_PickupDate] = null;
                  Session[Util.Session_Selected_DropOffDate] = null;

                  pnlEndDateCalendar.Visible = false;

                  calStartDate.Visible = true;
                    IsStartDateSelected = false;

                    lblMessageContinue.Text = "Invalid Pick Up Date.";
                  return;
              }


              bool available = CheckIfHalfDayAvailable(renttype.ToString());

              if (available)
              {
                  AddToCartShowSummaryHalfDay(renttype.ToString());
              }
              else
              {


                    lnkSelectADate.Text = "SELECT A PICK UP DATE";
                    lnkEndDate.Text = "SELECT A DROP OFF DATE";
                    Session[Util.Session_Selected_PickupDate] = null;
                    Session[Util.Session_Selected_DropOffDate] = null;

                    pnlEndDateCalendar.Visible = false;

                    calStartDate.Visible = true;
                    IsStartDateSelected = false;


                    lblMessageContinue.Text = "Date Requested is not available.";
                  return;
              }




          }
          else if (renttype == 4)
          {



                if (Session[Util.Session_Selected_PickupDate] == null)
                {

                    lnkSelectADate.Text = "SELECT A PICK UP DATE";
                    lnkEndDate.Text = "SELECT A DROP OFF DATE";
                    Session[Util.Session_Selected_PickupDate] = null;
                    Session[Util.Session_Selected_DropOffDate] = null;

                    pnlEndDateCalendar.Visible = false;

                    calStartDate.Visible = true;
                    IsStartDateSelected = false;

                    lblMessageContinue.Text = "Invalid Pick Up Date.";
                    return;
                }


                // Hourly should be treated as Full day since the times in the database is not valid time.


                bool available = CheckIfFullDayAvailable();

                if (available)
                {
                    AddToCartShowSummaryHourly();
                }
                else
                {


                    lnkSelectADate.Text = "SELECT A PICK UP DATE";
                    lnkEndDate.Text = "SELECT A DROP OFF DATE";
                    Session[Util.Session_Selected_PickupDate] = null;
                    Session[Util.Session_Selected_DropOffDate] = null;

                    pnlEndDateCalendar.Visible = false;

                    calStartDate.Visible = true;
                    IsStartDateSelected = false;


                    lblMessageContinue.Text = "Date Requested is not available.";
                    return;
                }





             





          }

     














        //  Response.Redirect("OrderSummary.aspx");

      }


        void bindYearDropDown()
        {

            for (int i = DateTime.Now.Year; i < DateTime.Now.Year + 5; i++)
            {
                ddYearStartCalendar.Items.Add(new ListItem(i.ToString(), i.ToString()));
                ddYearEndCalendar.Items.Add(new ListItem(i.ToString(), i.ToString()));

            }
            ddYearStartCalendar.SelectedIndex = 0;

           
            ddMonthStartCalendar.ClearSelection();
            ddMonthStartCalendar.Items.FindByValue(DateTime.Now.Month.ToString()).Selected = true;



            ddYearEndCalendar.SelectedIndex = 0;


            ddMonthEndCalendar.ClearSelection();
            ddMonthEndCalendar.Items.FindByValue(DateTime.Now.Month.ToString()).Selected = true;

        }





        protected void ddMonthStartCalendar_SelectedIndexChanged(object sender, EventArgs e)
        {
            calStartDate.VisibleDate = new DateTime(int.Parse(ddYearStartCalendar.SelectedItem.Value), int.Parse(ddMonthStartCalendar.SelectedItem.Value), 1);
            RenderUnavailableDates(calStartDate);
        }

        protected void ddYearStartCalendar_SelectedIndexChanged(object sender, EventArgs e)
        {
            calStartDate.VisibleDate = new DateTime(int.Parse(ddYearStartCalendar.SelectedItem.Value), int.Parse(ddMonthStartCalendar.SelectedItem.Value), 1);
            RenderUnavailableDates(calStartDate);
        }




        protected void ddMonthEndCalendar_SelectedIndexChanged(object sender, EventArgs e)
        {
            calEndDate.VisibleDate = new DateTime(int.Parse(ddYearEndCalendar.SelectedItem.Value), int.Parse(ddMonthEndCalendar.SelectedItem.Value), 1);
            RenderUnavailableDates(calEndDate);
        }

        protected void ddYearEndCalendar_SelectedIndexChanged(object sender, EventArgs e)
        {
            calEndDate.VisibleDate = new DateTime(int.Parse(ddYearEndCalendar.SelectedItem.Value), int.Parse(ddMonthEndCalendar.SelectedItem.Value), 1);
            RenderUnavailableDates(calEndDate);
        }



        protected void btnPreviousMonthStartDate_Click(object sender, EventArgs e)
        {

          


            DateTime c = new DateTime(calStartDate.VisibleDate.Year, calStartDate.VisibleDate.Month, 1).AddMonths(-1);

            if (c.Year < DateTime.Now.Year)
                return;


            calStartDate.VisibleDate = c;
            RenderUnavailableDates(calStartDate);
            ddYearStartCalendar.ClearSelection();

            ddYearStartCalendar.Items.FindByValue(c.Year.ToString()).Selected = true;

            ddMonthStartCalendar.ClearSelection();
            ddMonthStartCalendar.Items.FindByValue(c.Month.ToString()).Selected = true;


        }

        protected void btnPreviousMonthEndDate_Click(object sender, EventArgs e)
        {




            DateTime c = new DateTime(calEndDate.VisibleDate.Year, calEndDate.VisibleDate.Month, 1).AddMonths(-1);

            if (c.Year < DateTime.Now.Year)
                return;


            calEndDate.VisibleDate = c;
            RenderUnavailableDates(calEndDate);
            ddYearEndCalendar.ClearSelection();

            ddYearEndCalendar.Items.FindByValue(c.Year.ToString()).Selected = true;

            ddMonthEndCalendar.ClearSelection();
            ddMonthEndCalendar.Items.FindByValue(c.Month.ToString()).Selected = true;


        }



        protected void btnNextMonthStartDate_Click(object sender, EventArgs e)
        {
            DateTime c = new DateTime(calStartDate.VisibleDate.Year, calStartDate.VisibleDate.Month, 1).AddMonths(1);

            if (c.Year > DateTime.Now.Year+4)
                return;



         
            calStartDate.VisibleDate = c;

            RenderUnavailableDates(calStartDate);

            ddYearStartCalendar.ClearSelection();

            ddYearStartCalendar.Items.FindByValue(c.Year.ToString()).Selected = true;

            ddMonthStartCalendar.ClearSelection();
            ddMonthStartCalendar.Items.FindByValue(c.Month.ToString()).Selected = true;
        }

        protected void btnNextMonthEndDate_Click(object sender, EventArgs e)
        {
            DateTime c = new DateTime(calEndDate.VisibleDate.Year, calEndDate.VisibleDate.Month, 1).AddMonths(1);

            if (c.Year > DateTime.Now.Year + 4)
                return;




            calEndDate.VisibleDate = c;

            RenderUnavailableDates(calEndDate);

            ddYearEndCalendar.ClearSelection();

            ddYearEndCalendar.Items.FindByValue(c.Year.ToString()).Selected = true;

            ddMonthEndCalendar.ClearSelection();
            ddMonthEndCalendar.Items.FindByValue(c.Month.ToString()).Selected = true;
        }




        protected void lnkClearSelection_Click(object sender, EventArgs e)
        {
         
            pnlEndDateHide.Visible = false;
            pnlStartEndTimeHide.Visible = false;
            pnlContinueHide.Visible = false;

            pnlStartDateHide.Visible = true;
            pnlStartDateCalendar.Visible = true;
            calStartDate.Visible = true;

            ddRentOption.SelectedIndex = 1;

            ddRentOption_SelectedIndexChanged(this, null);

            Session[Util.Session_Selected_RentType] = "1";
            Session[Util.Session_Selected_PickupDate] = null;
            IsStartDateSelected = false;

        }

        protected void lnkContinueWithOneDayRental_Click(object sender, EventArgs e)
        {
            int renttype = int.Parse(Session[Util.Session_Selected_RentType].ToString());

            Session[Util.Session_Selected_DropOffDate] = Session[Util.Session_Selected_PickupDate];

            if (renttype == 1)
            {
                bool available = CheckIfFullDayAvailable();

                if (available)
                {
                    AddToCartShowSummaryFullDay();
                }
                else
                {

                    lnkSelectADate.Text = "SELECT A PICK UP DATE";
                    lnkEndDate.Text = "SELECT A DROP OFF DATE";
                    Session[Util.Session_Selected_PickupDate] = null;
                    Session[Util.Session_Selected_DropOffDate] = null;

                    pnlEndDateCalendar.Visible = false;

                    calStartDate.Visible = true;


                    lblMessageOneDayRental.Text = "Date Requested is not available.";
                    return;
                }
            }

            }



        protected void lnkSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberSignIn.aspx");

        }




        }

} 
