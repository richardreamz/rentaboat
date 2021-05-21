using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsOrderSummary
/// </summary>
public class clsOrderSummary
{
	public clsOrderSummary()
	{
		//
		// TODO: Add constructor logic here
		//

	}

    public decimal KartID;

    public decimal KartDetailsID;

    public string BoatName;

    public string BoatDescription;

    public string RentTypeDescription;

    public string RentStartDate;

    public string RentEndDate;

  //  public int NumberOfDays;


    public int  RentHours;

    public string ImageFileName;

    public string ImageFileNameDescription;

    public decimal TotalRentAmount;

    public int BoatID;

    public int MarinaID;

    public decimal DailyRentAmount;

    public int NumberOfDays;

    public string BoatSize;

    public int MaximumPassengers;

    public string BoatMake;

    public string BoatModel;

    public string BoatYear;

    public string BoatRequirements;

    public string BoatType;


    public string CountryName;

    public string StateName;

    public string City;

    public string Zipcode;


    public string BodyOfWater;

    public string ContactName;

    public string MarinaName;

    public string AddressLine1;

    public string AddressLine2;

    public string MarinaPhone;

    public string MarinaFax;

    public string FacilityWebsite;
    public string FacilityName;

    public string FacilityDirection;

    public string FacilityArea;

    public string FacilityCancellationPolicy;

   
    public string FacilityOpenTime;
    public string FacilityCloseTime;

    public string FacilitySecurityDeposit;


    public string MarinaStartHour;

    public string MarinaEndHour;

    public string MarinaEMail;

    public decimal MarinaOnlineReservationFee;

    public string OnlineFeeType; // 1 = Percentage Fee else Flat Fee

    public int ClientID;

    public string ClientFirstName;
    public string ClientLastName;
    public string ClientAddress;
    public string ClientCity, ClientState, ClientCountry, ClientEmail, ClientContactPhone, ClientMobile;

    public string RentingTimeFromTo;

    public int NumberOfHoursRented ;

    public decimal DailyOrHourlyPrice;

    public string TaxRate;

    public string RentTypeId;


    public string rentStartHour;

    public string rentEndHour;

    public int RequestedCurrencyId;

    public int PriceCurrencyId;

    public string CurrencySymbolRequested;

    public string CurrencySymbol;

    public string ReservationDeposit;



    public static clsOrderSummary getOrderSummary(string sessionid)
    {

        clsOrderSummary os = new clsOrderSummary();

        DataTable dt = Util.getDataSet("execute usp_get_cart_details '" + sessionid + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["in_clientID"].ToString() !="")
            os.ClientID = (int)dt.Rows[0]["in_clientID"];

            os.AddressLine1 = dt.Rows[0]["FacilityAddressLine1"].ToString();
            os.AddressLine2 = dt.Rows[0]["FacilityAddressLine2"].ToString();
            os.BoatDescription = dt.Rows[0]["BoatDescription"].ToString();

            os.BoatID = (int)dt.Rows[0]["in_BoatID"];
            os.BoatMake = dt.Rows[0]["BoatMake"].ToString();
            os.BoatModel = dt.Rows[0]["BoatModel"].ToString();
            os.BoatName = dt.Rows[0]["BoatName"].ToString();
            os.BoatSize = dt.Rows[0]["BoatSize"].ToString();
            os.BoatRequirements = dt.Rows[0]["BoatRequirements"].ToString();

            os.BoatYear = dt.Rows[0]["BoatYear"].ToString();

            os.BoatType = dt.Rows[0]["BoatType"].ToString();

            os.BodyOfWater = dt.Rows[0]["BodyOfWater"].ToString();
            os.City = dt.Rows[0]["FacilityCity"].ToString();
            os.ContactName = dt.Rows[0]["FacilityContactName"].ToString();
            os.CountryName = dt.Rows[0]["FacilityCountryName"].ToString();
            os.Zipcode = dt.Rows[0]["FacilityZip"].ToString();
            os.FacilityWebsite = dt.Rows[0]["facilityWebSite"].ToString();

            os.rentStartHour = dt.Rows[0]["ch_beginHour"].ToString();

            os.rentEndHour = dt.Rows[0]["ch_endHour"].ToString();

            // This can not be used since the range of date may include holidy, week day  or week end price

            os.DailyRentAmount = (decimal)dt.Rows[0]["DailyOrHourlyPrice"];


            os.FacilityArea = dt.Rows[0]["FacilityAreaAttractions"].ToString();
            os.FacilityDirection = dt.Rows[0]["DirectionToFacility"].ToString();
            os.ImageFileName = dt.Rows[0]["BoatImageFileName"].ToString();
            os.ImageFileNameDescription = dt.Rows[0]["BoatImageFileNameDescription"].ToString();
            os.KartDetailsID = (decimal)dt.Rows[0]["in_kartDetailID"];
            os.KartID = (decimal)dt.Rows[0]["in_KartID"];
            os.MarinaEMail = dt.Rows[0]["MarinaEMail"].ToString();
            os.FacilityName = dt.Rows[0]["FacilityName"].ToString();
            os.FacilityCancellationPolicy = dt.Rows[0]["FacilityCancellationPolicy"].ToString();
            os.FacilityDirection = dt.Rows[0]["DirectionToFacility"].ToString();

            os.MarinaStartHour = dt.Rows[0]["FacilityOpenTime"].ToString();
            os.MarinaEndHour = dt.Rows[0]["FacilityCloseTime"].ToString();
            os.MarinaFax = dt.Rows[0]["FacilityFax"].ToString();
            os.OnlineFeeType = dt.Rows[0]["OnlineFeeType"].ToString();
            os.MarinaID = (int)dt.Rows[0]["in_MarinaID"];
            os.MarinaName = dt.Rows[0]["MarinaName"].ToString();


            os.FacilitySecurityDeposit = dt.Rows[0]["FacilitySecurityDeposit"].ToString();

          os.ReservationDeposit = dt.Rows[0]["ReservationDeposit"].ToString();




            os.MarinaPhone = dt.Rows[0]["FacilityPhone"].ToString();

            if (dt.Rows[0]["BoatMaxPassengers"].ToString() != "")
                os.MaximumPassengers = (int)dt.Rows[0]["BoatMaxPassengers"];
            else
                os.MaximumPassengers = 0;

            if (dt.Rows[0]["NumberOfDaysRented"].ToString() !="")
            os.NumberOfDays = (int)dt.Rows[0]["NumberOfDaysRented"];

            if (dt.Rows[0]["NumberOfHoursRented"].ToString() !="")
            os.NumberOfHoursRented = (int)dt.Rows[0]["NumberOfHoursRented"];



           



            os.RentStartDate = dt.Rows[0]["PickupDate"].ToString();
            os.RentEndDate = dt.Rows[0]["DropOffDate"].ToString();
         
       
            os.RentTypeId = dt.Rows[0]["RentTypeId"].ToString();

            os.RentingTimeFromTo = dt.Rows[0]["RentingTimeFromTo"].ToString();
           
            os.RentTypeDescription = dt.Rows[0]["TypeOfRent"].ToString();
            os.StateName = dt.Rows[0]["FacilityStateName"].ToString();

            if (dt.Rows[0]["Requested_Currency_Id"].ToString() != "")
                os.RequestedCurrencyId = (int)dt.Rows[0]["Requested_Currency_Id"];

            if (dt.Rows[0]["Price_Currency_Id"].ToString() != "")
                os.PriceCurrencyId = (int)dt.Rows[0]["Price_Currency_Id"];

            if (dt.Rows[0]["Requested_Currency_Id"].ToString() != dt.Rows[0]["Price_Currency_Id"].ToString())
            {
                if (dt.Rows[0]["Requested_Currency_Id"].ToString() == "1")
                {
                    os.TotalRentAmount = (decimal)dt.Rows[0]["TotalPriceRented"] * Util.getExchangeRate("2");
                    if (dt.Rows[0]["DailyOrHourlyPrice"].ToString() != "")
                        os.DailyOrHourlyPrice = (decimal)dt.Rows[0]["DailyOrHourlyPrice"] * Util.getExchangeRate("2");
                    os.TaxRate = dt.Rows[0]["TaxRate"].ToString();

                    os.CurrencySymbolRequested = "&euro;";
                    os.CurrencySymbol = "$";


                    if (os.OnlineFeeType == "1") // Percentage  2 = Flat Rate

                        os.MarinaOnlineReservationFee = ((decimal)dt.Rows[0]["OnlineFee"] / 100.0m) * (decimal)dt.Rows[0]["TotalPriceRented"] * Util.getExchangeRate("2");
                    else
                        os.MarinaOnlineReservationFee = (decimal)dt.Rows[0]["OnlineFee"] * Util.getExchangeRate("2");



                }
                else
                {
                    os.TotalRentAmount = (decimal)dt.Rows[0]["TotalPriceRented"] * Util.getExchangeRate("1");
                    if (dt.Rows[0]["DailyOrHourlyPrice"].ToString() != "")
                        os.DailyOrHourlyPrice = (decimal)dt.Rows[0]["DailyOrHourlyPrice"] * Util.getExchangeRate("1");
                    os.TaxRate = dt.Rows[0]["TaxRate"].ToString();

                    if (os.OnlineFeeType == "1") // Percentage  2 = Flat Rate

                        os.MarinaOnlineReservationFee = ((decimal)dt.Rows[0]["OnlineFee"] / 100.0m) * (decimal)dt.Rows[0]["TotalPriceRented"] * Util.getExchangeRate("1");
                    else
                        os.MarinaOnlineReservationFee = (decimal)dt.Rows[0]["OnlineFee"] * Util.getExchangeRate("1");

                    os.CurrencySymbol= "&euro;";
                    os.CurrencySymbolRequested  = "$";
                }


            }

            else
            {


                os.TotalRentAmount = (decimal)dt.Rows[0]["TotalPriceRented"] ;
                if (dt.Rows[0]["DailyOrHourlyPrice"].ToString() != "")
                    os.DailyOrHourlyPrice = (decimal)dt.Rows[0]["DailyOrHourlyPrice"] ;
                os.TaxRate = dt.Rows[0]["TaxRate"].ToString();

                if (os.OnlineFeeType == "1") // Percentage  2 = Flat Rate

                    os.MarinaOnlineReservationFee = ((decimal)dt.Rows[0]["OnlineFee"] / 100.0m) * os.TotalRentAmount ;
                else
                    os.MarinaOnlineReservationFee = (decimal)dt.Rows[0]["OnlineFee"] ;

                if (dt.Rows[0]["Requested_Currency_Id"].ToString() == "1")

                {
                    os.CurrencySymbol = "$";
                    os.CurrencySymbolRequested = "$";
                }
                else
                {
                    os.CurrencySymbol = "&euro;";
                    os.CurrencySymbolRequested = "&euro;";
                }

            }


        }

        DataTable dtClient = Util.getDataSet("execute sp_br_client_get @p_in_clientid="+ os.ClientID.ToString()).Tables[0];

        if (dtClient.Rows.Count > 0)
        {
            os.ClientLastName = dtClient.Rows[0]["vc_lastName"].ToString();

            os.ClientFirstName = dtClient.Rows[0]["vc_firstName"].ToString();

            os.ClientAddress = dtClient.Rows[0]["vc_address"].ToString();
            os.ClientCity = dtClient.Rows[0]["vc_city"].ToString();
            os.ClientState = dtClient.Rows[0]["vc_state"].ToString();
            os.ClientCountry = dtClient.Rows[0]["vc_country"].ToString();
            os.ClientContactPhone = dtClient.Rows[0]["vc_contactPhone"].ToString();

            os.ClientMobile = dtClient.Rows[0]["vc_mobile"].ToString();

            os.ClientEmail = dtClient.Rows[0]["vc_email"].ToString();
           
            
        }



        return os;

    }




    public static void LoadClientDetails(clsOrderSummary os, string clientid)
    {


        DataTable dtClient = Util.getDataSet("execute sp_br_client_get @p_in_clientid=" + clientid).Tables[0];

        if (dtClient.Rows.Count > 0)
        {
            os.ClientLastName = dtClient.Rows[0]["vc_lastName"].ToString();

            os.ClientFirstName = dtClient.Rows[0]["vc_firstName"].ToString();

            os.ClientAddress = dtClient.Rows[0]["vc_address"].ToString();
            os.ClientCity = dtClient.Rows[0]["vc_city"].ToString();
            os.ClientState = dtClient.Rows[0]["vc_state"].ToString();
            os.ClientCountry = dtClient.Rows[0]["vc_country"].ToString();
            os.ClientContactPhone = dtClient.Rows[0]["vc_contactPhone"].ToString();

            os.ClientMobile = dtClient.Rows[0]["vc_mobile"].ToString();

            os.ClientEmail = dtClient.Rows[0]["vc_email"].ToString();


        }


    }




}