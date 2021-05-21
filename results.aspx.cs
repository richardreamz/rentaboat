using nce.adosql;
using nce.scripting;
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
using System.Collections.Generic;
using System.Data.SqlClient;
namespace BoatRenting {

  public partial class results_aspx_cs : System.Web.UI.Page
  {

      private void getResultPageWiseMarina(int pageIndex, string marinaID)
      {
          using (SqlConnection con = Util.getConnection())
          {
              using (SqlCommand cmd = new SqlCommand("usp_get_boat_listing_marina", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;

                      cmd.Parameters.AddWithValue("@in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());

                  cmd.Parameters.AddWithValue("@PageIndex", pageIndex);


                  cmd.Parameters.AddWithValue("@PageSize", PageSize);
                  cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                  cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                  //   con.Open();
                  IDataReader idr = cmd.ExecuteReader();

                  ArrayList values = new ArrayList();

                  //SearchResult r = new SearchResult(dt.Rows[i]["BName"].ToString(),"",
                  //   dt.Rows[i]["StateName"].ToString(),
                  //   dt.Rows[i]["vc_city"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_make"].ToString(),
                  //   dt.Rows[i]["vc_model"].ToString(), dt.Rows[i]["BoatCategory"].ToString(), 
                  //   dt.Rows[i]["Captain"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_filename"].ToString());

                  int BNameIndex = idr.GetOrdinal("BName");
                  int StateNameIndex = idr.GetOrdinal("StateName");
                  int CityIndex = idr.GetOrdinal("vc_city");
                  int YearIndex = idr.GetOrdinal("vc_year");
                  int MakeIndex = idr.GetOrdinal("vc_make");
                  int ModelIndex = idr.GetOrdinal("vc_model");

                  int BoatCategoryIndex = idr.GetOrdinal("BoatCategory");
                  int CaptainIndex = idr.GetOrdinal("Captain");

                    int ZipIndex = idr.GetOrdinal("ch_zip");

                    int BodyOfWaterIndex = idr.GetOrdinal("vc_bodywater");
                  // This need to be changed

                  int AmountIndex = idr.GetOrdinal("RentAmount");
                  int FileNameIndex = idr.GetOrdinal("vc_filename");

                  int FilenameDescriptionIndex = idr.GetOrdinal("vc_nombre");
                  //idr.GetString(BNameIndex), "", idr.GetString(StateNameIndex),
                  //         idr.GetString(CityIndex), idr.IsDBNull(YearIndex) idr.GetString(YearIndex), idr.GetString(MakeIndex),
                  //         idr.GetString(ModelIndex), idr.GetString(BoatCategoryIndex), idr.GetString(CaptainIndex),
                  //         idr.GetString(AmountIndex), idr.GetString(FileNameIndex)


                  int BoatIdIndex = idr.GetOrdinal("in_boatID");
                  int MarinaIdIndex = idr.GetOrdinal("in_MarinaID");

                  int ratingIndex = idr.GetOrdinal("in_rating");

                    int currencyIndex = idr.GetOrdinal("Currency");

                     int mpassengersIndex = idr.GetOrdinal("in_maxPassengers");

                    while (idr.Read())
                  {
                      SearchResult rec = new SearchResult(getSafeString(idr, BNameIndex), "", getSafeString(idr, StateNameIndex),
                           getSafeString(idr, CityIndex), getSafeInt(idr, YearIndex), getSafeString(idr, MakeIndex),
                           getSafeString(idr, ModelIndex), getSafeString(idr, BoatCategoryIndex), getSafeString(idr, CaptainIndex),
                           getSafeDecimal(idr, AmountIndex), getSafeString(idr, FileNameIndex), getSafeString(idr, FilenameDescriptionIndex), getSafeInt(idr, BoatIdIndex), getSafeInt(idr, MarinaIdIndex), getSafeInt(idr, ratingIndex), getSafeString(idr, ZipIndex), getSafeString(idr, BodyOfWaterIndex), getSafeString(idr, currencyIndex), getSafeInt(idr, mpassengersIndex));



                      values.Add(rec);


                  }

                  rpBoatList.DataSource = values;
                  rpBoatList.DataBind();



                  idr.Close();
                  con.Close();
                  int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                  this.PopulatePager(recordCount, pageIndex);

                  if (pageIndex == 1 && recordCount == 0)
                  {



                      Response.Redirect("NoResult.aspx");
                  }

              }
          }
      }

      public int RadiusMiles
      {
          get
          {
              if (Session["RadiusMiles"] != null)
                  return Convert.ToInt32(Session["RadiusMiles"]);
              else
                  return 20;

          }

          set
          {
              Session["RadiusMiles"] = value;

          }
      }

        string querytype = "0";

      protected void Page_Load(object sender, System.EventArgs e)
      {
          // Put user code to initialize the page here
          if (!Page.IsPostBack)
          {
                GetStateName();
                //

                querytype = Request.QueryString["t"];

                if (Request.QueryString["t"] != null && Request.QueryString["t"] == "1")
              {
                  Session["RadiusMiles"] = null;
                  getResultPageWiseMarina(1, Session[Util.Session_Selected_MarinaID].ToString());

                  Session["listType"] = 1;

                  Session["state"] = "";
                   Session["countryid"] = null;
              }
              else if (Request.QueryString["t"] != null && Request.QueryString["t"] == "2")
              {
                  // Comes from Calendar
                
                  Session["listType"] = 0;

                  txtSearch.Value = Session["searchterm"].ToString();

                  txtLat.Value = Session["Lat"].ToString();
                  txtLon.Value = Session["Lon"].ToString();


                  txtZipCode.Value = Session["zipcode"].ToString();
                  txtCityName.Value = Session["city"].ToString();
                  txtState.Value = Session["state"].ToString();

                    txtCountry.Value = Session["country"].ToString();


                    Session["RadiusMiles"] = null;
                  getResultPageWise(1, txtSearch.Value);
                   Session["countryid"] = null;

              }

                  // Indea page State link click
              else if (Request.QueryString["t"] != null && Request.QueryString["t"] == "3")
              {
                  // Comes from Index page 

                  Session["listType"] = 0;
                  Session["state"] = Request.QueryString["s"];

                  txtSearch.Value = Request.QueryString["s"];

                  txtLat.Value = "";
                  txtLon.Value = "";
                  txtZipCode.Value = "";
                  txtCityName.Value = "";
                  txtState.Value = Session["state"].ToString();

                  Session["RadiusMiles"] = null;

                  getResultPageWise(1, txtSearch.Value);

                  Session["countryid"] = null;
              }

              else if (Request.QueryString["t"] != null && Request.QueryString["t"] == "4")
              {
                  // Comes from Button click in home page

                  Session["listType"] = 0;
                  Session["state"] = "";

                  if (Request.QueryString["c"] != null)
                      Session["countryid"] = Request.QueryString["c"];
                  else
                      Session["countryid"] = null;


                  txtSearch.Value = Request.QueryString["s"];

                  txtLat.Value = Request.QueryString["lat"];
                  txtLon.Value = Request.QueryString["lng"];
                  RadiusMiles =int.Parse( Request.QueryString["miles"]);
                  txtZipCode.Value = "";
                  txtCityName.Value = "";
                  txtState.Value = "";

                  getResultPageWise(1, txtSearch.Value);


              }
              else
              {
                  Session["RadiusMiles"] = null;
                  Session["listType"] = 0;
                  Session["state"] = "";
              }

          }

          ScriptManager.RegisterStartupScript(this, this.GetType(), "PageLoad", "Javascript:initialize();", true);

           

            //Add Description Meta Tag
      
        }


        private string getStateFullName (string shname)
        {
            DataTable dtState = Util.getDataSet("execute usp_get_full_name_state @ch_ShortName='" + shname +"'").Tables[0];
            if (dtState.Rows.Count > 0)
                return dtState.Rows[0][0].ToString();

            return "";

        }

        public void  GetStateName()
        {
            if (Request.QueryString["s"] != null && Request.QueryString["s"].ToString() !="")
            {
                string s = Request.QueryString["s"].ToString();

             
                   SetMetaDescription( getStateFullName(s));
                
            }

            SetMetaDescription("");
        }


        bool calledmeta = false;

        private void SetMetaDescription(string state)
        {
            //HtmlMeta description = new HtmlMeta();
            //description.HttpEquiv = "description";
            //description.Name = "description";
            if (calledmeta)
                return;

            string desc = String.Format("<meta name=\"description\" content=\" Rentaboat, Boat Rentals in {0}. Boat Rentals, Pontoon Boat rentals, Sailboat charters, jet ski rentals and more! Reserve and book a boat online today. Boat Rentals Worldwide. Rated #1.\" />", state);
            //this.Page.Header.Controls.Add(description);

            phMetaDesc.Controls.Add(new LiteralControl(@desc));
            calledmeta = true;


            string title = String.Format("<title>Boat Rentals near me {0} Boat Rentals | Rentaboat</title>", state);

            phTitle.Controls.Add(new LiteralControl(@title));
           

        }


        private int PageSize = 20;



      private string getSafeString(IDataReader idr, int index)
      {

          return (idr.IsDBNull(index) ? "": idr.GetString(index));


      }
      private string getSafeInt(IDataReader idr, int index)
      {

          return (idr.IsDBNull(index) ? "" : idr.GetInt32(index).ToString());


      }

      private string getSafeDecimal(IDataReader idr, int index)
      {

          return (idr.IsDBNull(index) ? "" : idr.GetDecimal(index).ToString());


      }

        public string getRentalType(string captain)
        {
            return (captain == "No" ? "Self Drive / Not Captained " : "Captain");

        }

        public string formattedAmount(string amount, string currency)
        {
            if (amount == "")
                return "";
            else
            {
                if (currency == "USD")
                    return "$" + amount;
                else
                    return "&euro;" + amount;

            }

        }



        private void getResultPageWise(int pageIndex, string searchterm)
      {


          // Only Perform State Search rather than radius search
          if (txtState.Value != "" && txtCityName.Value == "")
          {
              txtLat.Value = "";
              txtLon.Value = "";
          }

            // When All of them are empty means country , clear long & lat
            if (txtZipCode.Value == "" && txtCityName.Value == "" && txtState.Value == "" && querytype != "4")
            {
                txtLat.Value = "";
                txtLon.Value = "";

            }

           // Do not do Radius search when country <> 'United States'

            if (txtCountry.Value != "United States" && querytype != "4")
            {
                txtLat.Value = "";
                txtLon.Value = "";
                txtZipCode.Value = "";


            }

            using (SqlConnection con = Util.getConnection())
          {
              using (SqlCommand cmd = new SqlCommand("usp_universal_search", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;

                  if (txtLat.Value.Trim() != "")
                  cmd.Parameters.AddWithValue("@p_lat", txtLat.Value);

                  if (txtLon.Value.Trim() != "")
                  cmd.Parameters.AddWithValue("@p_lng", txtLon.Value);

                  int zcode;

                  if (int.TryParse(txtSearch.Value.Trim(),out zcode))
                      cmd.Parameters.AddWithValue("@zipcode", zcode.ToString());
                

                  if (txtCityName.Value.Trim() != "")
                  cmd.Parameters.AddWithValue("@city", txtCityName.Value);


                  if (txtState.Value.Trim() != "")
                  cmd.Parameters.AddWithValue("@state", txtState.Value);


                  cmd.Parameters.AddWithValue("@PageIndex", pageIndex);

                  
                  cmd.Parameters.AddWithValue("@SearchTerm", searchterm);

                  cmd.Parameters.AddWithValue("@p_in_miles", RadiusMiles);

                  if (Session["countryid"] != null)
                      cmd.Parameters.AddWithValue("@in_countryID", Session["countryid"].ToString());



                  cmd.Parameters.AddWithValue("@PageSize", PageSize);
                  cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                  cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
               //   con.Open();
                  IDataReader idr = cmd.ExecuteReader();

                  ArrayList values = new ArrayList();

                   //SearchResult r = new SearchResult(dt.Rows[i]["BName"].ToString(),"",
                   //   dt.Rows[i]["StateName"].ToString(),
                   //   dt.Rows[i]["vc_city"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_make"].ToString(),
                   //   dt.Rows[i]["vc_model"].ToString(), dt.Rows[i]["BoatCategory"].ToString(), 
                   //   dt.Rows[i]["Captain"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_filename"].ToString());

                  int BNameIndex = idr.GetOrdinal("BName");
                  int StateNameIndex =idr.GetOrdinal("StateName");
                    int CityIndex =idr.GetOrdinal("vc_city");
                    int YearIndex =idr.GetOrdinal("vc_year");
                     int MakeIndex =idr.GetOrdinal("vc_make");
                     int ModelIndex =idr.GetOrdinal("vc_model");

                     int BoatCategoryIndex =idr.GetOrdinal("BoatCategory");
                     int CaptainIndex =idr.GetOrdinal("Captain");


                    int ZipIndex = idr.GetOrdinal("ch_zip");
                    int BodyOfWaterIndex = idr.GetOrdinal("vc_bodywater");


                    // This need to be changed

                    int AmountIndex =idr.GetOrdinal("RentAmount");
                     int FileNameIndex =idr.GetOrdinal("vc_filename");

                     int FilenameDescriptionIndex = idr.GetOrdinal("vc_nombre");
                  //idr.GetString(BNameIndex), "", idr.GetString(StateNameIndex),
                  //         idr.GetString(CityIndex), idr.IsDBNull(YearIndex) idr.GetString(YearIndex), idr.GetString(MakeIndex),
                  //         idr.GetString(ModelIndex), idr.GetString(BoatCategoryIndex), idr.GetString(CaptainIndex),
                  //         idr.GetString(AmountIndex), idr.GetString(FileNameIndex)


                     int BoatIdIndex = idr.GetOrdinal("in_boatID");
                     int MarinaIdIndex = idr.GetOrdinal("in_MarinaID");

                     int ratingIndex = idr.GetOrdinal("in_rating");

                    int currencyIndex = idr.GetOrdinal("Currency");
                    int mpassengersIndex = idr.GetOrdinal("in_maxPassengers");

                    while (idr.Read())
                  {
                      SearchResult rec = new SearchResult(getSafeString(idr,BNameIndex), "", getSafeString(idr,StateNameIndex),
                           getSafeString(idr,CityIndex), getSafeInt(idr,YearIndex), getSafeString(idr,MakeIndex),
                           getSafeString(idr,ModelIndex), getSafeString(idr,BoatCategoryIndex), getSafeString(idr,CaptainIndex),
                           getSafeDecimal(idr,AmountIndex), getSafeString(idr,FileNameIndex),getSafeString(idr,FilenameDescriptionIndex),getSafeInt(idr,BoatIdIndex),getSafeInt(idr,MarinaIdIndex),getSafeInt(idr,ratingIndex), getSafeString(idr, ZipIndex), getSafeString(idr, BodyOfWaterIndex), getSafeString(idr, currencyIndex), getSafeInt(idr, mpassengersIndex));



                      values.Add(rec);


                  }

                  rpBoatList.DataSource = values;
                  rpBoatList.DataBind();



                  idr.Close();
                  con.Close();
                  int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                  this.PopulatePager(recordCount, pageIndex);

                  if (pageIndex == 1 && recordCount == 0)
                  {
                        if (txtLat.Value.Trim() != "")
                            Session["p_lat"] = txtLat.Value;
                        else
                            Session["p_lat"] = null;

                        if (txtLon.Value.Trim() != "")
                            Session["p_lng"] = txtLon.Value;
                        else
                            Session["p_lng"] = null;


                        int zcode1;

                        if (int.TryParse(txtSearch.Value.Trim(), out zcode1))
                            Session["zipcode"] = zcode1.ToString();
                        else
                            Session["zipcode"] = null;




                        if (txtCityName.Value.Trim() != "")
                           Session["city"] = txtCityName.Value;
                        else
                            Session["city"] = null;


                        if (txtState.Value.Trim() != "")
                            Session["state"] = txtState.Value;
                        else
                            Session["state"] = null;



                   

                        Session["SearchTerm"] = searchterm;

                     

                        if (Session["countryid"] != null)
                           Session["in_countryID"]= Session["countryid"].ToString();



                        Response.Redirect("NoResult.aspx");
                  }
                  //else
                  //  {

                  //      SetMetaDescription(((SearchResult)values[0]).City, ((SearchResult)values[0]).State);
                  //  }
              }
          }
      }

      private void PopulatePager(int recordCount, int currentPage)
      {
          double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
          int pageCount = (int)Math.Ceiling(dblPageCount);
          List<ListItem> pages = new List<ListItem>();
          if (pageCount > 0)
          {
              for (int i = 1; i <= pageCount; i++)
              {
                  pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
              }
          }

            //rptPagerBottom.DataSource = rptPager.DataSource = pages;
            rptPagerBottom.DataSource=    pages;


        //  rptPager.DataBind();
          rptPagerBottom.DataBind();


      }
      protected void Page_Changed(object sender, EventArgs e)
      {
          int pageIndex = int.Parse((sender as LinkButton).CommandArgument);

          if ((int)Session["listType"] == 1)
              this.getResultPageWiseMarina(pageIndex, Session[Util.Session_Selected_MarinaID].ToString());
          else
          this.getResultPageWise(pageIndex, txtSearch.Value);
      }

      protected void btnSearch_Click(object sender, EventArgs e)
      {
          Session["listType"] = 0;

         lblMessage.Text = "Street : " + txtStreetName.Value + " City: "+ txtCityName.Value + "State:" + txtState.Value + " Zip : " + txtZipCode.Value + " Lat: " + txtLat.Value + "Lon: " + txtLon.Value;

         //txtSearch.Text = "New York";


          getResultPageWise(1, txtSearch.Value);


          /* DataTable dt = Util.getDataSet("execute usp_universal_search @SearchTerm='" + txtSearch.Text +"'").Tables[0];
          if (dt.Rows.Count > 0)
          {


              ltrShowing.Text = "Showing items : 1-20 of " + dt.Rows.Count.ToString();

              ltrItemsPerPage.Text = "items per page: <a href='' >50 </a> | <a href=''> 100 </a>";
 
             
             

              ArrayList values = new ArrayList();
              for (int i=0; i < dt.Rows.Count; i++)
              {
//               

                  // dt.Rows[i]["BoatDescription"].ToString()

                  SearchResult r = new SearchResult(dt.Rows[i]["BName"].ToString(),"",
                      dt.Rows[i]["StateName"].ToString(),
                      dt.Rows[i]["vc_city"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_make"].ToString(),
                      dt.Rows[i]["vc_model"].ToString(), dt.Rows[i]["BoatCategory"].ToString(), 
                      dt.Rows[i]["Captain"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_filename"].ToString());


                  values.Add(r);

     



              }

              rpBoatList.DataSource = values;
              rpBoatList.DataBind();
              

          }*/

      }


        
      protected void btnGoDetails_Click(object sender, EventArgs e)
      {
          Session[Util.Session_Selected_MarinaID] = txtSelectedMarinaId.Value;
          Session[Util.Session_Selected_BoatID] = txtSelectedBoatId.Value;

          Session[Util.Session_Selected_Rating] = txtSelectedRating.Value;


            try
            {

                Util.UpdatePayPerClick(txtSelectedMarinaId.Value, txtSelectedBoatId.Value, Util.GetIPAddress(System.Web.HttpContext.Current));

            }

            catch(Exception)
            {

            }

          Response.Redirect("Calendar.aspx");

         
      }



}


  public class SearchResult
  {

      private string boatname;
      private string description;
      private string state;
      private string city;
      private string year;
      private string make;
      private string model;
      private string category;
      private string captain;
      private string amount;

      private string filename;

      private string filenameDescription;

      private string boatId;
      private string marinaId;

      private string rating;


        private string zipcode;
        private string bodyofwater;
        private string currency;
        private string maxpassenegrs;


      public SearchResult(string boatname,string description, string state,string city, string year,string make, string model, 
          string category, string captain, string amount, string filename, string filenameDescription, string boatId, string marinaId, string rating,string zipcode,string bodyofwater, string currency, string mpassengers )
      {
          this.boatname = boatname;
          this.description = description;
          this.state = state;
          this.city = city;
          this.year = year;
          this.make = make;
          this.model = model;
          this.category = category;
          this.captain = captain;
          this.amount = amount;
          this.filename = filename;
          this.filenameDescription = filenameDescription;

          this.boatId = boatId;
          this.marinaId = marinaId;

            this.zipcode = zipcode;
            this.bodyofwater = bodyofwater;
            this.currency = currency;
            this.maxpassenegrs = mpassengers;

      }


      public string BoatId
      {
          get
          {
              return boatId;
          }
          set
          {
              boatId = value;

          }

      }

      public string MarinaId
      {
          get
          {
              return marinaId;
          }
          set
          {
              marinaId = value;

          }

      }

      public string Rating
      {
          get
          {
              return rating;
          }
          set
          {
              rating = value;

          }

      }

      public string FilenameDescription
      {
          get
          {
              return filenameDescription;
          }
          set
          {
              filenameDescription = value;

          }

      }

      public string BoatName
      {
          get
          {
              return boatname;
          }
          set
          {
              boatname = value;

          }

      }
      public string FileName
      {
          get
          {
              return filename;
          }
          set
          {
              filename = value;

          }

      }


      public string Description
      {
          get
          {
              return description;
          }
          set
          {
              description = value;

          }

      }

      public string State
      {
          get
          {
              return state;
          }
          set
          {
              state = value;

          }

      }

      public string City
      {
          get
          {
              return city;
          }
          set
          {
              city = value;

          }

      }

      public string Year
      {
          get
          {
              return year;
          }
          set
          {
              year = value;

          }

      }


      public string Make
      {
          get
          {
              return make;
          }
          set
          {
              make = value;

          }

      }


      public string Model
      {
          get
          {
              return model;
          }
          set
          {
              model = value;

          }

      }


      public string Category
      {
          get
          {
              return category;
          }
          set
          {
              category = value;

          }

      }


      public string Captain
      {
          get
          {
              return captain;
          }
          set
          {
              captain = value;

          }

      }

      public string Amount
      {
          get
          {
                if (amount == "0.00")
                    return "";
                else
                    return amount;
          }
          set
          {
              amount = value;

          }

      }

        public string Zip
        {
            get
            {
                return zipcode;
            }
            set
            {
                zipcode = value;

            }

        }

        public string BodyOfWater
        {
            get
            {
                return bodyofwater;
            }
            set
            {
                bodyofwater = value;

            }

        }

        public string Currency
        {
            get
            {
                return currency;
            }
            set
            {
                currency = value;

            }

        }

        public string MaximumPassengers
        {

            get
            {
                return maxpassenegrs;

            }
            set
            {
                MaximumPassengers = value;
            }

        }


    }

} 
