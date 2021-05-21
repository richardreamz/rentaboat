using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BoatRenting
{ 
public partial class admin_OrderSummaryAdmin : System.Web.UI.Page
{

      public  clsOrderSummary orderSummary
        {
            set
            {
                Session["orderSummaryFacility"] = value;
            }

            get
            {
                if (Session["orderSummaryFacility"] == null)
                    return new clsOrderSummary();
                else
                    return (clsOrderSummary)Session["orderSummaryFacility"];

            }

        }

        private bool InsertNewRecord()
        {


            //txtNewUserPasswordConfirm.BorderColor = System.Drawing.ColorTranslator.FromHtml("#ccc");


            //txtNewUserPasswordConfirm.Attributes.Remove("placeholder");


            Page.Validate("saveRecord");

            // Session[Util.Session_Client_Id] =

            //Check if the username exists

            lblMessageNewUserSave.Text = "";


            if (txtEmailNewUser.Text.Trim() != "")
            {
                DataTable dtUSerExists = Util.getDataSet("execute usp_check_if_user_exists @vc_username='" + txtEmailNewUser.Text.Trim() + "'").Tables[0];

                if (dtUSerExists.Rows.Count > 0)
                {

                    lblMessage.Text = "User Name / Email already exists. Please use another email or use forgot password for existing user.";

                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    return false;


                }
            }


            if (ddState.SelectedItem == null || ddState.SelectedIndex < 1)
            {

                lblMessage.Text = "Please select a State.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }

            if (ddCountry.SelectedItem == null || ddCountry.SelectedIndex < 1)
            {

                lblMessage.Text = "Please select a Country.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (txtAddress1NewUser.Text.Trim() == "")
            {


                lblMessage.Text = "Please provide Address.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (txtFirstNameNewUser.Text.Trim() == "")
            {


                lblMessage.Text = "Please provide First Name.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (txtLastNameNewUser.Text.Trim() == "")
            {


                lblMessage.Text = "Please provide Last Name.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (txtCityNewUser.Text.Trim() == "")
            {


                lblMessage.Text = "Please provide City.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }

            if (txtZipcodeNewUser.Text.Trim() == "")
            {


                lblMessage.Text = "Please provide Zip code.";

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("[usp_insert_client_only]", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@vc_firstName", txtFirstNameNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_lastName", txtLastNameNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_address", txtAddress1NewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_address2", txtAddress2NewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_city", txtCityNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@ch_Zip", txtZipcodeNewUser.Text.Trim());



                        cmd.Parameters.AddWithValue("@in_stateID", ddState.SelectedItem.Value);

                        cmd.Parameters.AddWithValue("@in_countryID", ddCountry.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@vc_contactPhone", txtContactPhoneNewUser.Text.Trim());

                        cmd.Parameters.AddWithValue("@vc_email", txtEmailNewUser.Text.Trim());

                        //cmd.Parameters.AddWithValue("@Password", txtNewUserPassword.Text.Trim());


                        //  ------ This is need to updated once the Cleint login
                        //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());


                        SqlDataReader rd = cmd.ExecuteReader();

                        if (rd.Read())
                            Session[Util.Session_Client_Id] = rd[0].ToString();



                        //lblMessageNewUserSave.Text = "Successfully Saved. Proceed to Step 5 for Payment.";
                        //lblMessageNewUserSave.ForeColor = System.Drawing.Color.Green;

                        rd.Close();

                       

                        // lnkPurchase.Visible = true;

                    }
                }


                clsOrderSummary.LoadClientDetails(orderSummary, Session[Util.Session_Client_Id].ToString());
            }

            catch (Exception ex)
            {

                lblMessage.Text = "Error while adding to Cart " + ex.Message;

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return false;
            }



            return true;


        }


        protected void Page_Load(object sender, EventArgs e)
    {


            if (!Page.IsPostBack)
            {

                orderSummary = clsOrderSummary.getOrderSummary(Session[Util.Session_Cart_Id].ToString());

                BindCountryList();

                lnkSearchClientList.Visible = false;

                //mdlPopupMessage.Show();
                mainboatpic.Src = @"../boats/" + orderSummary.ImageFileName;
                mainboatpic.Alt = orderSummary.ImageFileNameDescription;

               
            }


    }
        protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindStateList();

        }


        void ClearAllFields()
        {

            txtFirstNameNewUser.Text = "";
            txtLastNameNewUser.Text = "";
            txtAddress1NewUser.Text = "";
            txtAddress2NewUser.Text = "";
            ddCountry.SelectedIndex = 0;
            ddState.Items.Clear();
            txtZipcodeNewUser.Text = "";
            txtContactPhoneNewUser.Text = "";
            txtEmailNewUser.Text = "";




        }

        bool CheckAvailablity()
        {
            bool available = true;
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[SP_BR_KART_ADDITION_AVAILABILITY]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                    cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());


                   // if (Session[Util.Session_Selected_RentType].ToString() == "4") // Hourly , check full day availability
                      //  cmd.Parameters.AddWithValue("@p_in_typerentID", "4");
                  //  else
                        cmd.Parameters.AddWithValue("@p_in_typerentID", Session[Util.Session_Selected_RentType].ToString());


                    cmd.Parameters.AddWithValue("@p_begindate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());

                    if (Session[Util.Session_Selected_DropOffDate] == null)
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


        void BindCountryList()
        {


            DataTable dtC = Util.getDataSet("execute [SP_BR_COUNTRY_LIST] ").Tables[0];

           ddCountry.DataSource = dtC;


           ddCountry.DataTextField = "vc_name";
             ddCountry.DataValueField = "in_countryID";

            ddCountry.DataBind();

      

  
            ddCountry.Items.Insert(0, "Select a Country");



            ddCountry.ClearSelection();
            if (ddCountry.Items.FindByValue("1") != null)
                ddCountry.Items.FindByValue("1").Selected = true;

           

            bindStateList();
            //  ddCountry.SelectedIndex = 1;





            //   ddState.Items.Clear();





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


        protected void btnBack_Click(object sender, EventArgs e)
        {

            DateTime dt = (DateTime)Session[Util.Session_Selected_PickupDate];
            //string month = Request.QueryString["mm"];
            //string day = Request.QueryString["dd"];
            //string year = Request.QueryString["aaaa"];
            //Response.Redirect("boats_list_reservation.aspx");
            Response.Redirect("CalendarAdmin.aspx?BoatID=" + Session[Util.Session_Selected_BoatID].ToString() +"&mm="+dt.Month.ToString() +"&dd=" + dt.Day.ToString() + "&aaaa=" + dt.Year.ToString() );
        }


        bool PrintAgreement = false;

        protected void btnReserve_Click(object sender, EventArgs e)
        {

            PrintAgreement = true;

            Reserve();




        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            lblMessageSelectClient.Text = "";

            if (txtFirstName.Text.Trim() == "" && txtLastName.Text.Trim() == "")

            {

                lblMessageSelectClient.Text = "Please provide last name or first name.";
                mdlPopupClientSearch.Show();

                return;

            }

            DataTable dt = Util.getDataSet("execute usp_search_client @p_vc_firstname='" + txtFirstName.Text + "' , @p_vc_lastname='" + txtLastName.Text + "'").Tables[0];
            gvClient.DataSource =dt ;

            gvClient.DataBind();


            if (dt.Rows.Count == 0)
            {
                lblMessageSelectClient.Text = "No Records found.";
               

              }

            mdlPopupClientSearch.Show();


        }

        protected void ddTypeOfClient_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session[Util.Session_Client_Id] = null;

            // FInd existing client
            if (ddTypeOfClient.SelectedIndex == 1)
            {

                pnlClientInfo.Visible = false;

                mdlPopupClientSearch.Show();
                lnkSearchClientList.Visible = true;


               



            }
            // New Client
            else if (ddTypeOfClient.SelectedIndex == 2)
            {


                ClearAllFields();


                pnlClientInfo.Visible = true;

                lnkSearchClientList.Visible = false;

                pnlClientInfo.Enabled = true;
                BindCountryList();


                bindStateList();



            }
            else if (ddTypeOfClient.SelectedIndex == 3)
            {

                ClearAllFields();

                pnlClientInfo.Visible = false;

                lnkSearchClientList.Visible = false;



            }
        }

        protected void gvClient_SelectedIndexChanged(object sender, EventArgs e)
        {

            string id = gvClient.SelectedDataKey.Value.ToString();
            pnlClientInfo.Visible = true;

            DataTable dtC = Util.getDataSet("usp_get_client_details @Client_ID=" + id).Tables[0];

            Session[Util.Session_Client_Id] = id;

            clsOrderSummary.LoadClientDetails(orderSummary, id);


            if (dtC.Rows.Count > 0)
            {

                txtLastNameNewUser.Text = dtC.Rows[0]["ClientLastName"].ToString();

                txtFirstNameNewUser.Text = dtC.Rows[0]["ClientFirstName"].ToString();

                txtEmailNewUser.Text = dtC.Rows[0]["ClientEMail"].ToString();

                txtContactPhoneNewUser.Text = dtC.Rows[0]["ClientContactPhone"].ToString();

                txtCityNewUser.Text = dtC.Rows[0]["ClientCity"].ToString();

                txtAddress1NewUser.Text = dtC.Rows[0]["ClientAddress"].ToString();

                txtAddress2NewUser.Text = dtC.Rows[0]["ClientAddress2"].ToString();





                ddCountry.ClearSelection();
                if (ddCountry.Items.FindByValue(dtC.Rows[0]["in_countryID"].ToString()) != null)
                    ddCountry.Items.FindByValue(dtC.Rows[0]["in_countryID"].ToString()).Selected = true;

                bindStateList();
                ddState.ClearSelection();

                if (ddState.Items.FindByValue(dtC.Rows[0]["in_stateID"].ToString()) != null)
                    ddState.Items.FindByValue(dtC.Rows[0]["in_stateID"].ToString()).Selected = true;

              
                txtZipcodeNewUser.Text = dtC.Rows[0]["ClientEmail"].ToString();


                



            }


            pnlClientInfo.Enabled = false;




        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

            /*

            Session[Util.Session_Selected_BoatID] = Request.QueryString["BoatID"];
            Session[Util.Session_Selected_MarinaID] = Session["marinaID"].ToString();

            string month = Request.QueryString["mm"];
            string day = Request.QueryString["dd"];
            string year = Request.QueryString["aaaa"];
            string boatID = Request.QueryString["BoatID"];

            */
            if (lblModelHeader.Text.Contains("SELECTED DATES ARE UNAVAILABLE"))
            //    Response.Redirect("CalendarAdmin.aspx?bid=" + Session[Util.Session_Selected_BoatID].ToString() + "&BoatID=" + + "&marinaID=" + + "&mm=" + + "&dd=" + +"&aaa=" +);
            {
                DateTime dt = (DateTime)Session[Util.Session_Selected_PickupDate];
                //string month = Request.QueryString["mm"];
                //string day = Request.QueryString["dd"];
                //string year = Request.QueryString["aaaa"];
                //Response.Redirect("boats_list_reservation.aspx");
                Response.Redirect("CalendarAdmin.aspx?BoatID=" + Session[Util.Session_Selected_BoatID].ToString() + "&mm=" + dt.Month.ToString() + "&dd=" + dt.Day.ToString() + "&aaaa=" + dt.Year.ToString());
            }

            else
            {
                //if (PrintAgreement)
                //    ClientScript.RegisterStartupScript(Page.GetType(), "openPopup", "javascript:PrintAgreement();");

                Response.Redirect("FacilityCalendarView.aspx");
            }
        }



        bool CreateOrGetClientFromMarinaID()
        {


            try
            {

                string clientid = "";

              DataTable dtClientID=  Util.getDataSet("execute usp_create_retrieve_clientid @in_MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@UserID=" + Session["userID"].ToString()).Tables[0];

                if (dtClientID.Rows.Count > 0)
                    clientid = dtClientID.Rows[0][0].ToString();


                if (clientid == "0")
                {

                    lblMessage.Text = "Could not create or retrieve client for the Facility";

                    return false;
                }


                Session[Util.Session_Client_Id] = clientid;


                return true;


            }

            catch (Exception ex)
            {

                lblMessage.Text = "Failed to Retrieve or Create Client for the Facility. " + ex.Message;
                return false;

            }

         


        }


        bool Reserve()
        {


            lblMessage.Text = "";





            if (!CheckAvailablity())

            {

                lblModelBody.Text = "One or more Dates Requested is not available. Please try another date(s).";
                lblModelHeader.Text = "SELECTED DATES ARE UNAVAILABLE";


                //mdlPopupClientSearch.Show();

                mdlPopupMessage.Show();

                return false;


            }


            if (ddTypeOfClient.SelectedIndex == 0)
            {

                lblMessage.Text = "Please select Type of Client for the Booking";


                return false;
            }

            if (ddTypeOfClient.SelectedIndex == 1)
            {
                if (Session[Util.Session_Client_Id] == null)
                { 
                    lblMessage.Text = "Please select a Client.";


                return false;
                }
            }


            if (ddTypeOfClient.SelectedIndex == 2)
            {


                if (!InsertNewRecord())
                    return false;


            }

            if (ddTypeOfClient.SelectedIndex == 3)
            {

               
                if (!CreateOrGetClientFromMarinaID())
                {


                    return false;

                }


            }



            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("[SP_BR_BOOKDATEXBOAT_SAVE]", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                        cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());

                        cmd.Parameters.AddWithValue("@p_in_kartid", orderSummary.KartID);
                        cmd.Parameters.AddWithValue("@UserID", Session[Util.Session_Client_Id].ToString());
                        cmd.ExecuteNonQuery();


                        // Response.Redirect("OrderSummaryConfirm.aspx", false);

                        lblModelBody.Text = "Successfully Processed your Reservation.";
                        lblModelHeader.Text = "!!! Successful !!!";

                        if (PrintAgreement)
                           btnOK.Attributes.Add("onclick", "return PrintAgreement();");

                        mdlPopupMessage.Show();


                    }
                }

            }
            catch (Exception ex)
            {


                lblMessage.Text = "Please contact BoatRenting.com. Could not process the request.";

                Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com,info@boatrenting.com,enngines@aol.com", "Exception Occured ..", "Exception occured while try to save the booking. The credit card was charged. Contact System Administrator. Kart_ID=" + orderSummary.KartID.ToString() + "<br/> Exception:" + ex.Message);
                return false;


            }

            return true;

        }

       

        protected void lnkSearchClientList_Click(object sender, EventArgs e)
        {
            mdlPopupClientSearch.Show();
            pnlClientInfo.Visible = false;

        }

        protected void btnReserveOnly_Click(object sender, EventArgs e)
        {

            Reserve();





        }

        protected void lnkCalendarPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calendar.aspx");
        }
    }



}