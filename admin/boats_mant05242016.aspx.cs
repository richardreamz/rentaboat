using AjaxControlToolkit;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace BoatRenting
{ 
public partial class boats_mant : System.Web.UI.Page
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



    void bindDropDownHours(DropDownList dd)
    {


        for (double i = 0.0; i <= 11.00; i += 1.0)
        {
            dd.Items.Add(new ListItem(i.ToString() + ":00 AM", getMilitary(i).ToString()));
            //   dd.Items.Add(new ListItem(i.ToString() + ":30 AM", getMilitaryHalf(i).ToString()));




        }

        dd.Items.Add(new ListItem("12:00 PM", "1200"));
        //ddStartTime.Items.Add(new ListItem( "12:30 PM", "1230"));

        //dd.Items.Add(new ListItem("12:00 PM", "1200"));
        //ddEndTime.Items.Add(new ListItem("12:30 PM", "1230"));

        for (double i = 13.0; i <= 24.00; i += 1.0)
        {
            dd.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
            // ddStartTime.Items.Add(new ListItem((i-12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

            //  dd.Items.Add(new ListItem((i - 12).ToString() + ":00 PM", getMilitary(i).ToString()));
            //ddEndTime.Items.Add(new ListItem((i - 12).ToString() + ":30 PM", getMilitaryHalf(i).ToString()));

        }

        dd.Items.Insert(0,  new ListItem( "Select Hours","-1"));


    }

    void bindHoursFromTo()
    {



        bindDropDownHours(ddAMHoursFrom);

        bindDropDownHours(ddAMHoursTo);

        bindDropDownHours(ddFullHoursFrom);

        bindDropDownHours(ddFullHoursTo);
        bindDropDownHours(ddPMHoursFrom);
        bindDropDownHours(ddPMHoursTo);

        bindDropDownHours(ddHourHoursFrom);

        bindDropDownHours(ddHourHoursTo);







    }


    void bindMainCategory()
    {
        DataTable dt = Util.getDataSet("execute SP_BR_BOATTYPE_LIST").Tables[0];
        ddMainCategory.DataTextField = "vc_description";
        ddMainCategory.DataValueField = "in_BoatTypeID";
        ddMainCategory.DataSource = dt;
        ddMainCategory.DataBind();

        ddMainCategory.Items.Insert(0, "Select a Category");


    }

    void bindSubCategory()
    {
        //if (ddMainCategory.SelectedItem == null || ddMainCategory.SelectedIndex < 1)
        //{
        //    ddSubCategory.Items.Clear();

        //    return;
        //}

        //DataTable dt = Util.getDataSet("execute  SP_BR_SUBBOATTYPE_LIST @p_in_BoatTypeID=" + ddMainCategory.SelectedItem.Value).Tables[0];
        //ddSubCategory.DataTextField = "vc_description";
        //ddSubCategory.DataValueField = "in_SubBoatTypeID";
        //ddSubCategory.DataSource = dt;
        //ddSubCategory.DataBind();

        //ddSubCategory.Items.Insert(0, "Select a Category");


    }


    private byte[] ReadFile(HttpPostedFile file)
    {
        byte[] data = new Byte[file.ContentLength];
        file.InputStream.Read(data, 0, file.ContentLength);
        return data;
    }


   void  UpdateImageAndVideoTexts()
    {
        UpdateTextsOnly(txtNamePic.Text, txtDescPic.Text,  "0");

        UpdateTextsOnly(txtNamePic1.Text, txtDescPic1.Text, "1");
        UpdateTextsOnly(txtNamePic2.Text, txtDescPic2.Text, "2");

        UpdateTextsOnly(txtNamePic3.Text, txtDescPic3.Text, "3");

        UpdateTextsOnly(txtNamePic4.Text, txtDescPic4.Text, "4");

        SaveVideoTextsOnly();


    }

    void SaveVideoTextsOnly()
    {

        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_update_boat_video_texts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());

                    cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());

                 
                    cmd.Parameters.AddWithValue("@Ordering_No", "1");

                    cmd.Parameters.AddWithValue("@YoutubeLink", txtYoutubeLink.Text);

                    cmd.Parameters.AddWithValue("@Video_Name", txtVideoName.Text);


                    cmd.Parameters.AddWithValue("@Video_Description", txtVideoDescription.Text);

                    cmd.Parameters.AddWithValue("@Created_By", Session["userID"].ToString());
                    cmd.Parameters.AddWithValue("@Modified_By", Session["userID"].ToString());

                    cmd.ExecuteNonQuery();

                }

            }
        }
        catch (Exception ex)
        {

            lblMessageImageUpload.Text = "Error uploading file " + ex.Message;



        }



    }

    private void UpdateTextsOnly(string vc_nombre, string vc_description,  string ti_mainPic)
    {
        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_update_boat_image_texts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());

                    cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());

                    cmd.Parameters.AddWithValue("@vc_nombre", vc_nombre);

                    cmd.Parameters.AddWithValue("@vc_description", vc_description);

               

                    cmd.Parameters.AddWithValue("@ti_mainPic", ti_mainPic);


                    cmd.Parameters.AddWithValue("@in_createdBy", Session["userID"].ToString());
                  
                    cmd.ExecuteNonQuery();


                }

            }
        }
        catch (Exception ex)
        {

            lblMessageImageUpload.Text = "Error uploading file " + ex.Message;



        }



    }

    private void InsertOrUpdate(string vc_nombre, string vc_description, string vc_filename, string ti_mainPic)
    {

            // If boat not saved do a initial save

            if (Session["boatID"] == null || Session["boatID"].ToString() == "0")
                InitialSaveBoat();



        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_save_boat_images", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());
                     
                    cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());

                    cmd.Parameters.AddWithValue("@vc_nombre", vc_nombre);

                    cmd.Parameters.AddWithValue("@vc_description", vc_description);

                    cmd.Parameters.AddWithValue("@vc_filename", vc_filename);

                    cmd.Parameters.AddWithValue("@ti_mainPic", ti_mainPic);


                    cmd.Parameters.AddWithValue("@in_createdBy", Session["userID"].ToString());
                    cmd.Parameters.AddWithValue("@in_changedBy", Session["userID"].ToString());

                    cmd.ExecuteNonQuery();


                }

            }
        }
        catch (Exception ex)
        {

            lblMessageImageUpload.Text = "Error uploading file " + ex.Message;



        }



    }

    private void PopulatePhotoInfo()
    {

            //divMainPicPreview.Visible = false;
            //divPic1Preview.Visible = false;
            //divPic2Preview.Visible = false;

            //divPic3Preview.Visible = false;

            //divPic4Preview.Visible = false;


            DataTable dtP = Util.getDataSet("execute usp_get_Boat_Images @in_BoatID=" + Session["boatID"].ToString() + ",@in_MarinaID=" + Session["MArinaID"].ToString()).Tables[0];

            Random mRnd = new Random();
            // int mRandomNumber = mRnd.Next(0, 99999);

            imgPreviewMainPic.Src = @"../boats/NoImagePic.png?" + mRnd.Next(0, 99999).ToString();
            imgPreviewPic1.Src = @"../boats/NoImagePic1.png?" + mRnd.Next(0, 99999).ToString();
            imgPreviewPic2.Src = @"../boats/NoImagePic2.png?" + mRnd.Next(0, 99999).ToString();
            imgPreviewPic3.Src = @"../boats/NoImagePic3.png?" + mRnd.Next(0, 99999).ToString();
            imgPreviewPic4.Src = @"../boats/NoImagePic4.png?" + mRnd.Next(0, 99999).ToString();


            if (dtP.Rows.Count > 0)
        {

            for (int i = 0; i < dtP.Rows.Count; i++)
            {
                switch (dtP.Rows[i]["ti_mainPic"].ToString())
                {
                    case "0":
                        txtNamePic.Text = dtP.Rows[i]["vc_nombre"].ToString();
                        txtDescPic.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divMainPicPreview.Visible = true;
                           
                            imgPreviewMainPic.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString()+"?"+ mRnd.Next(0, 99999).ToString();



                            break;

                    case "1":
                        txtNamePic1.Text = dtP.Rows[i]["vc_nombre"].ToString();
                        txtDescPic1.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divPic1Preview.Visible = true;
                            imgPreviewPic1.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;

                    case "2":
                        txtNamePic2.Text = dtP.Rows[i]["vc_nombre"].ToString();
                        txtDescPic2.Text = dtP.Rows[i]["vc_description"].ToString();
                            //divPic2Preview.Visible = true;
                            imgPreviewPic2.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;


                    case "3":
                        txtNamePic3.Text = dtP.Rows[i]["vc_nombre"].ToString();
                        txtDescPic3.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divPic3Preview.Visible = true;
                            imgPreviewPic3.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;


                    case "4":
                        txtNamePic4.Text = dtP.Rows[i]["vc_nombre"].ToString();
                        txtDescPic4.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divPic4Preview.Visible = true;
                            imgPreviewPic4.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;

                }





            }


        }
    }

    void PopulateVideoInfo()
    {

        DataTable dtV = Util.getDataSet("execute usp_get_video_info @in_BoatID=" + Session["boatID"].ToString() + ",@in_MarinaID=" + Session["MArinaID"].ToString()).Tables[0];

        if (dtV.Rows.Count > 0)
        {
            txtVideoDescription.Text = dtV.Rows[0]["Video_Description"].ToString();
            txtVideoName.Text = dtV.Rows[0]["Video_Name"].ToString();
            txtYoutubeLink.Text = dtV.Rows[0]["YoutubeLink"].ToString();

            fileupVideo.ToolTip = dtV.Rows[0]["Video_Filename"].ToString();
        }

    }


        void UpdateYoutubeLink(string vid)
        {

            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_update_boat_video_texts", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                            cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());

                        cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());


                        cmd.Parameters.AddWithValue("@Ordering_No", "1");

                        cmd.Parameters.AddWithValue("@YoutubeLink", vid);

                        cmd.Parameters.AddWithValue("@Video_Name", txtVideoName.Text);


                        cmd.Parameters.AddWithValue("@Video_Description", txtVideoDescription.Text);

                        cmd.Parameters.AddWithValue("@Created_By", Session["userID"].ToString());
                        cmd.Parameters.AddWithValue("@Modified_By", Session["userID"].ToString());

                        cmd.ExecuteNonQuery();

                    }

                }
            }
            catch (Exception ex)
            {

                lblMessageImageUpload.Text = "Error uploading file " + ex.Message;



            }



        }


        void SaveVideo (string filename)
    {

            if (Session["boatID"] == null || Session["boatID"].ToString() == "0")
                InitialSaveBoat();


            try
            {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_add_edit_boat_video", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());

                    cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());

                    cmd.Parameters.AddWithValue("@Video_filename", filename);

                    cmd.Parameters.AddWithValue("@Ordering_No", "1");

                    cmd.Parameters.AddWithValue("@YoutubeLink", txtYoutubeLink.Text);

                    cmd.Parameters.AddWithValue("@Video_Name", txtVideoName.Text);


                    cmd.Parameters.AddWithValue("@Video_Description", txtVideoDescription.Text);

                    cmd.Parameters.AddWithValue("@Created_By", Session["userID"].ToString());
                    cmd.Parameters.AddWithValue("@Modified_By", Session["userID"].ToString());

                    cmd.ExecuteNonQuery();

                }

            }
        }
        catch (Exception ex)
        {

            lblMessageImageUpload.Text = "Error uploading file " + ex.Message;



        }



    }


    protected void OnAsyncFileUploadComplete(object sender, AsyncFileUploadEventArgs e)
    {

        AsyncFileUpload fup = (AsyncFileUpload)sender;

            Random mRnd = new Random();
            int mRandomNumber = mRnd.Next(0, 99999);


            if (fup.PostedFile != null)
        {
            HttpPostedFile file = fup.PostedFile;

            //    byte[] data = ReadFile(file);

            switch (fup.ID)
            {
                case "fileup":

                    //   Session["fileup1"] = data;
                    string filename = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_0.jpg";

                    fup.SaveAs(Server.MapPath("~/Boats/" + filename));

                    InsertOrUpdate(txtNamePic.Text, txtDescPic.Text, filename, "0");

                      //  divMainPicPreview.Visible = true;
                        //imgPreviewMainPic.Src = @"./boats/" + filename;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img0",
 "top.document.getElementById('imgPreviewMainPic').src='../boats/" + filename + "?" + mRandomNumber.ToString()+ "';",
 true);


                        break;

                case "fileup1":

                    string filename1 = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_1.jpg";

                    fup.SaveAs(Server.MapPath("~/Boats/" + filename1));

                    InsertOrUpdate(txtNamePic1.Text, txtDescPic1.Text, filename1, "1");
                        //divPic1Preview.Visible = true;
                      //  imgPreviewPic1.Src = @"./boats/" + filename1;

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img0",
"top.document.getElementById('imgPreviewPic1').src='../boats/" + filename1 + "?" + mRandomNumber.ToString() + "';",
true);

                        break;

                case "fileup2":

                    string filename2 = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_2.jpg";

                    fup.SaveAs(Server.MapPath("~/Boats/" + filename2));

                    InsertOrUpdate(txtNamePic2.Text, txtDescPic2.Text, filename2, "2");

                       // divPic2Preview.Visible = true;
                        //imgPreviewPic2.Src = @"./boats/" + filename2;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img0",
"top.document.getElementById('imgPreviewPic2').src='../boats/" + filename2 + "?" + mRandomNumber.ToString() + "';",
true);
                        break;

                case "fileup3":

                    string filename3 = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_3.jpg";

                    fup.SaveAs(Server.MapPath("~/Boats/" + filename3));

                    InsertOrUpdate(txtNamePic3.Text, txtDescPic3.Text, filename3, "3");
                       // divPic3Preview.Visible = true;
                        //imgPreviewPic3.Src = @"./boats/" + filename3;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img0",
"top.document.getElementById('imgPreviewPic3').src='../boats/" + filename3 + "?" + mRandomNumber.ToString() + "';",
true);
                        break;

                case "fileup4":

                    string filename4 = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_4.jpg";

                    fup.SaveAs(Server.MapPath("~/Boats/" + filename4));

                    InsertOrUpdate(txtNamePic4.Text, txtDescPic4.Text, filename4, "4");
                       // divPic4Preview.Visible = true;
                        //imgPreviewPic4.Src = @"./boats/" + filename4;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img0",
"top.document.getElementById('imgPreviewPic4').src='../boats/" + filename4 + "?" + mRandomNumber.ToString() + "';",
true);
                        break;


                case "fileupVideo":
                    var ext = fup.PostedFile.FileName.Substring(fup.PostedFile.FileName.LastIndexOf(".") + 1);

                    string filename10 = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_1."+ ext;

                    fup.SaveAs(Server.MapPath("~/BoatVideos/" + filename10));
                    
                    

                    SaveVideo(filename10);

                       
                        var fileStream = new FileStream(Server.MapPath("~/BoatVideos/" + filename10), FileMode.Open);


                     
                        break;
            }




            //Session[Util.STORED_REPORT] = data;
            //Session[Util.STORED_REPORT_FILENAME] = e.FileName;
            //Session[Util.STORED_REPORT_CONTENT_TYPE] = file.ContentType;

            //   pnlUpload.Visible = false;
            // pnlConfirm.Visible = true;

        }




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

        protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindStateList();

        }

        void populateBoatInfo(string boatid)
    {


        DataTable dt = Util.getDataSet("execute usp_get_boat_info @in_boatID=" + boatid).Tables[0];


        if (dt.Rows.Count > 0)
        {

            txtName.Text = dt.Rows[0]["vc_name"].ToString();
            txtBoatDescription.Text = dt.Rows[0]["vc_description"].ToString();

            txtMake.Text = dt.Rows[0]["vc_make"].ToString();
            txtModel.Text = dt.Rows[0]["vc_model"].ToString();
            txtYear.Text = dt.Rows[0]["vc_year"].ToString();
            txtSize.Text = dt.Rows[0]["vc_size"].ToString();
            
            txtMarinaName.Text = dt.Rows[0]["vc_marinaName"].ToString();
            txtAddress1.Text = dt.Rows[0]["vc_addressline1"].ToString();

            txtAddress2.Text = dt.Rows[0]["vc_addressline2"].ToString();
                txtPhone.Text = dt.Rows[0]["vc_phone"].ToString();

                txtCity.Text = dt.Rows[0]["vc_city"].ToString();
                txtZipCode.Text = dt.Rows[0]["ch_zip"].ToString();

                ddCountry.ClearSelection();

                if (ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()) != null)
                    ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()).Selected = true;
                else
                    ddCountry.SelectedIndex = 1;



                bindStateList();
                ddState.ClearSelection();
                if (ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()) != null)
                    ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()).Selected = true;



                txtBodyOfWater.Text = dt.Rows[0]["vc_bodywater"].ToString();

                if (dt.Rows[0]["vc_same_as_facility_addr"].ToString() == "1")
                    chkSameAsFacilityAddress.Checked = true;
                else
                    chkSameAsFacilityAddress.Checked = false;


                if (dt.Rows[0]["AllowSameDayRental"].ToString() == "0")
                    chkNoSameDay.Checked = true;

                else if (dt.Rows[0]["AllowSameDayRental"].ToString() == "1")
                    chkNoSameDay.Checked = false;
                else
                    chkNoSameDay.Checked = false;



                if (dt.Rows[0]["in_boatTypeID"].ToString() != "")
            {
                ddMainCategory.ClearSelection();

                if (ddMainCategory.Items.FindByValue(dt.Rows[0]["in_boatTypeID"].ToString()) != null)
                    ddMainCategory.Items.FindByValue(dt.Rows[0]["in_boatTypeID"].ToString()).Selected = true;

            }

                //if (dt.Rows[0]["in_subboatTypeID"].ToString() != "")
                //{
                //    ddSubCategory.ClearSelection();

                //    if (ddSubCategory.Items.FindByValue(dt.Rows[0]["in_subboatTypeID"].ToString()) != null)
                //        ddSubCategory.Items.FindByValue(dt.Rows[0]["in_subboatTypeID"].ToString()).Selected = true;

                //}


           

                txtMaximumPassengers.Text = dt.Rows[0]["in_MaxPassengers"].ToString();

            txtSecurityDeposit.Text = dt.Rows[0]["nu_deposit"].ToString();
            txtReservationDeposit.Text = dt.Rows[0]["nu_reservation"].ToString();


                if (dt.Rows[0]["nu_tax"].ToString() != "")
                    txtTaxRate.Text = ((decimal)dt.Rows[0]["nu_tax"]).ToString() ;
                //else
                //    txtTaxRate.Text = " %";


                txtRequirement.Text = dt.Rows[0]["vc_requirements"].ToString();

                txtFacilityCancellationPolicy.Text = dt.Rows[0]["vc_cancellation_policy"].ToString();


                txtFacilityAreaAttractions.Text = dt.Rows[0]["vc_facilityArea"].ToString();


                if (dt.Rows[0]["ti_Captain"].ToString() == "1")
                chkCaptainAvailable.Checked = true;
            else
                chkCaptainAvailable.Checked = false;


                if (dt.Rows[0]["Is_boat_Sale"].ToString() == "1")
                {
                    chkBoatSale.Checked = true;
                    txtBoatSaleAmount.Visible = true;

                    txtBoatSaleAmount.Text ="$"+ dt.Rows[0]["boat_sale_amount"].ToString();



                }
                else
                {
                    chkBoatSale.Checked = false;
                    txtBoatSaleAmount.Visible = false;

                }




                txtWebSiteAddress.Text = "https://www.RentABoat.com/ShowBoat.aspx?mid=" + Session["marinaID"].ToString() + "&bid=" + boatid;

        }


    }
        void BindCountryList()
        {


            DataTable dtC = Util.getDataSet("execute [SP_BR_COUNTRY_LIST] ").Tables[0];

            ddCountry.DataSource = dtC;


            ddCountry.DataTextField = "vc_name";
            ddCountry.DataValueField = "in_countryID";

            ddCountry.DataBind();




            ddCountry.Items.Insert(0, "Select a Country");




            ddCountry.SelectedIndex = 1;


            bindStateList();


            //  ddState.Items.Clear();





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

                BindCountryList();

                Random mRnd = new Random();
                imgPreviewMainPic.Src = @"../boats/NoImagePic.png?" + mRnd.Next(0, 99999).ToString();
                imgPreviewPic1.Src = @"../boats/NoImagePic1.png?" + mRnd.Next(0, 99999).ToString();
                imgPreviewPic2.Src = @"../boats/NoImagePic2.png?" + mRnd.Next(0, 99999).ToString();
                imgPreviewPic3.Src = @"../boats/NoImagePic3.png?" + mRnd.Next(0, 99999).ToString();
                imgPreviewPic4.Src = @"../boats/NoImagePic4.png?" + mRnd.Next(0, 99999).ToString();

                //divMainPicPreview.Visible = false;
                // divPic1Preview.Visible = false;
                // divPic2Preview.Visible = false;
                // divPic3Preview.Visible = false;
                // divPic4Preview.Visible = false;



                txtBoatSaleAmount.Visible = false;


            bindMainCategory();

            bindHoursFromTo();

                if (Request.QueryString["boatID"] == null)
                {
                    Session["boatID"] = "0";
                    boatLink.Visible = false;



                 //   setSelectedMenu("liBoatListing");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "addnewboat",  "setSelectedMenu('liAddNewBoat');" ,  true);

                    // "liAddNewBoat"


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "editboat", "setSelectedMenu('liBoatListing');", true);

                    Session["boatID"] = Request.QueryString["BoatID"];

                    populateBoatInfo(Request.QueryString["BoatID"]);
                    ShowBoatPrices();
                    PopulateVideoInfo();
                    PopulatePhotoInfo();

                    boatLink.Visible = true;

                }




              //  calHoliday.EnableViewState = false;



        }


    }


    void ShowBoatPrices()
    {


        DataTable dtF = Util.getDataSet("execute usp_get_boat_price @in_BoatID="+ Session["boatID"].ToString() + ", @in_MarinaID=" + Session["marinaID"].ToString() + ",@in_TypeRentID=1"  ).Tables[0];
        if (dtF.Rows.Count > 0)
        {

            txtFullWeekDay.Text = dtF.Rows[0]["nu_precioDayWeek"].ToString();

            txtFullWeekend.Text = dtF.Rows[0]["nu_precioDayWeekend"].ToString();

            txtFullHoliday.Text = dtF.Rows[0]["nu_precioHolyDay"].ToString();

            if (ddFullHoursFrom.Items.FindByValue(dtF.Rows[0]["hours_military_from"].ToString()) != null)
            {
                ddFullHoursFrom.ClearSelection();
                ddFullHoursFrom.Items.FindByValue(dtF.Rows[0]["hours_military_from"].ToString()).Selected = true;

            }

            if (ddFullHoursTo.Items.FindByValue(dtF.Rows[0]["hours_military_to"].ToString()) != null)
            {
                ddFullHoursTo.ClearSelection();
                ddFullHoursTo.Items.FindByValue(dtF.Rows[0]["hours_military_to"].ToString()).Selected = true;

            }
        }

            DataTable dtAM = Util.getDataSet("execute usp_get_boat_price @in_BoatID=" + Session["boatID"].ToString() + ", @in_MarinaID=" + Session["marinaID"].ToString() + ",@in_TypeRentID=2").Tables[0];
            if (dtAM.Rows.Count > 0)
            {

                txtAMWeekDay.Text = dtAM.Rows[0]["nu_precioDayWeek"].ToString();

                txtAMWeekend.Text = dtAM.Rows[0]["nu_precioDayWeekend"].ToString();

                txtAMHoliday.Text = dtAM.Rows[0]["nu_precioHolyDay"].ToString();

                if (ddAMHoursFrom.Items.FindByValue(dtAM.Rows[0]["hours_military_from"].ToString()) != null)
                {
                    ddAMHoursFrom.ClearSelection();
                    ddAMHoursFrom.Items.FindByValue(dtAM.Rows[0]["hours_military_from"].ToString()).Selected = true;

                }

                if (ddAMHoursTo.Items.FindByValue(dtAM.Rows[0]["hours_military_to"].ToString()) != null)
                {
                    ddAMHoursTo.ClearSelection();
                    ddAMHoursTo.Items.FindByValue(dtAM.Rows[0]["hours_military_to"].ToString()).Selected = true;

                }

                
            }


        DataTable dtPM = Util.getDataSet("execute usp_get_boat_price @in_BoatID=" + Session["boatID"].ToString() + ", @in_MarinaID=" + Session["marinaID"].ToString() + ",@in_TypeRentID=3").Tables[0];
        if (dtPM.Rows.Count > 0)
        {

            txtPMWeekDay.Text = dtPM.Rows[0]["nu_precioDayWeek"].ToString();

            txtPMWeekend.Text = dtPM.Rows[0]["nu_precioDayWeekend"].ToString();

            txtPMHoliday.Text = dtPM.Rows[0]["nu_precioHolyDay"].ToString();

            if (ddPMHoursFrom.Items.FindByValue(dtPM.Rows[0]["hours_military_from"].ToString()) != null)
            {
                ddPMHoursFrom.ClearSelection();
                ddPMHoursFrom.Items.FindByValue(dtPM.Rows[0]["hours_military_from"].ToString()).Selected = true;

            }

            if (ddPMHoursTo.Items.FindByValue(dtPM.Rows[0]["hours_military_to"].ToString()) != null)
            {
                ddPMHoursTo.ClearSelection();
                ddPMHoursTo.Items.FindByValue(dtPM.Rows[0]["hours_military_to"].ToString()).Selected = true;

            }


        }


        DataTable dtH = Util.getDataSet("execute usp_get_boat_price @in_BoatID=" + Session["boatID"].ToString() + ", @in_MarinaID=" + Session["marinaID"].ToString() + ",@in_TypeRentID=4").Tables[0];
        if (dtH.Rows.Count > 0)
        {

            txtHourWeekDay.Text = dtH.Rows[0]["nu_precioDayWeek"].ToString();

            txtHourWeekend.Text = dtH.Rows[0]["nu_precioDayWeekend"].ToString();

            txtHourHoliday.Text = dtH.Rows[0]["nu_precioHolyDay"].ToString();

            if (ddHourHoursFrom.Items.FindByValue(dtH.Rows[0]["hours_military_from"].ToString()) != null)
            {
                ddHourHoursFrom.ClearSelection();
                ddHourHoursFrom.Items.FindByValue(dtH.Rows[0]["hours_military_from"].ToString()).Selected = true;

            }

            if (ddHourHoursTo.Items.FindByValue(dtH.Rows[0]["hours_military_to"].ToString()) != null)
            {
                    ddHourHoursTo.ClearSelection();
                    ddHourHoursTo.Items.FindByValue(dtH.Rows[0]["hours_military_to"].ToString()).Selected = true;

            }


        }






    }



    protected void ddMainCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
      //  bindSubCategory();

    }



   void DeleteBoatPrice (string typerentid)
        {

            string cmd = "delete from TBL_BR_PRICExBOATxTYPERENT  where IN_BoatID =" + Session["boatID"].ToString() + "  AND  IN_marinaID =" + Session["marinaID"].ToString() + "  AND  IN_typeRentID =" + typerentid;

            Util.Execute(cmd);

        }
       
    bool InsertORUpdateBoatPrice()
    {
            lblMessagePricing.Text = "";

        if (txtFullWeekDay.Text.Trim() != "" || txtFullWeekend.Text.Trim() != "" || txtFullHoliday.Text.Trim() != "")
        {

            if (ddFullHoursFrom.SelectedItem == null || ddFullHoursFrom.SelectedIndex < 1 || ddFullHoursTo.SelectedItem == null || ddFullHoursTo.SelectedIndex  < 1)
            {

                lblMessagePricing.Text += "Please select a valid time for Full day.";

               
            }
            else
            {

                SavePricing("1", txtFullWeekDay.Text.Trim(), txtFullWeekend.Text.Trim(), txtFullHoliday.Text.Trim(), ddFullHoursFrom.SelectedItem.Text, ddFullHoursTo.SelectedItem.Text, ddFullHoursFrom.SelectedItem.Value, ddFullHoursTo.SelectedItem.Value);

            }



        }
        else
            {

                DeleteBoatPrice("1");
                ddFullHoursFrom.SelectedIndex = 0;
                ddFullHoursTo.SelectedIndex = 0;


            }


            int amstart = -1;
            int amend = -1;



        if (txtAMWeekDay.Text.Trim() != "" || txtAMWeekend.Text.Trim() != "" || txtAMHoliday.Text.Trim() != "")
        {

            if (ddAMHoursFrom.SelectedItem == null || ddAMHoursFrom.SelectedIndex < 1 || ddAMHoursTo.SelectedItem == null || ddAMHoursTo.SelectedIndex < 1)
            {

                lblMessagePricing.Text += "Please select a valid time for Half day AM.";


            }
            else
            {
                    amstart = int.Parse(ddAMHoursFrom.SelectedItem.Value);
                    amend = int.Parse(ddAMHoursTo.SelectedItem.Value);
                    SavePricing("2", txtAMWeekDay.Text.Trim(), txtAMWeekend.Text.Trim(), txtAMHoliday.Text.Trim(), ddAMHoursFrom.SelectedItem.Text, ddAMHoursTo.SelectedItem.Text, ddAMHoursFrom.SelectedItem.Value, ddAMHoursTo.SelectedItem.Value);


            }



        }
            else
            {

                DeleteBoatPrice("2");
                ddAMHoursFrom.SelectedIndex = 0;
                ddAMHoursTo.SelectedIndex = 0;


            }


            if (txtPMWeekDay.Text.Trim() != "" || txtPMWeekend.Text.Trim() != "" || txtPMHoliday.Text.Trim() != "")
        {




            if (ddPMHoursFrom.SelectedItem == null || ddPMHoursFrom.SelectedIndex < 1 || ddPMHoursTo.SelectedItem == null || ddPMHoursTo.SelectedIndex < 1)
            {

                lblMessagePricing.Text += "Please select a valid time for Half day PM.";


            }
            else
            {
                    int pmstart = int.Parse(ddPMHoursFrom.SelectedItem.Value);
                    int pmstartend = int.Parse(ddPMHoursTo.SelectedItem.Value);

                    if (amend != -1 && amstart != -1 && (pmstart < amend || pmstartend < amend))
                    {
                        ddPMHoursFrom.SelectedIndex = 0;
                        ddPMHoursTo.SelectedIndex = 0;
                            lblMessagePricing.Text += "Time Conflict AM & PM time";
                        

                    }
                    else
                    SavePricing("3", txtPMWeekDay.Text.Trim(), txtPMWeekend.Text.Trim(), txtPMHoliday.Text.Trim(), ddPMHoursFrom.SelectedItem.Text, ddPMHoursTo.SelectedItem.Text, ddPMHoursFrom.SelectedItem.Value, ddPMHoursTo.SelectedItem.Value);

            }



        }
            else
            {

                DeleteBoatPrice("3");
                ddPMHoursFrom.SelectedIndex = 0;
                ddPMHoursTo.SelectedIndex = 0;


            }


            if (txtHourWeekDay.Text.Trim() != "" || txtHourWeekend.Text.Trim() != "" || txtHourHoliday.Text.Trim() != "")
        {

            if (ddHourHoursFrom.SelectedItem == null || ddHourHoursFrom.SelectedIndex < 1 || ddHourHoursTo.SelectedItem == null || ddHourHoursTo.SelectedIndex < 1)
            {

                lblMessagePricing.Text += "Please select a valid time for Hourly.";


            }
            else
            {

                SavePricing("4", txtHourWeekDay.Text.Trim(), txtHourWeekend.Text.Trim(), txtHourHoliday.Text.Trim(), ddHourHoursFrom.SelectedItem.Text, ddHourHoursTo.SelectedItem.Text, ddHourHoursFrom.SelectedItem.Value, ddHourHoursTo.SelectedItem.Value);

            }



        }
            else
            {

                DeleteBoatPrice("4");
                ddHourHoursFrom.SelectedIndex = 0;
                ddHourHoursTo.SelectedIndex = 0;


            }


            ShowBoatPrices();

        return true;

    }




    


    private void SavePricing(string typerentid, string weekdayprice, string weekendprice, string holidayprice, string timefrom, string timeto, string timefrommilitary, string timetomilitary)
    {



        try
        {


            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_save_boat_rent_prices", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@P_IN_BoatID", Session["boatID"].ToString());

                    cmd.Parameters.AddWithValue("@P_IN_MarinaID", Session["MarinaID"].ToString());

                    cmd.Parameters.AddWithValue("@P_IN_TypeRentID",typerentid );

                    if (weekdayprice != "")
                    cmd.Parameters.AddWithValue("@P_NU_PriceWeekDay", weekdayprice);

                    if (weekendprice !="")
                    cmd.Parameters.AddWithValue("@P_NU_PriceWeekEnd", weekendprice);

                    if (holidayprice != "")
                    cmd.Parameters.AddWithValue("@P_NU_PriceHoliday", holidayprice);

                    cmd.Parameters.AddWithValue("@P_Hours_From", timefrom);

                    cmd.Parameters.AddWithValue("@P_Hours_To", timeto);

                    cmd.Parameters.AddWithValue("@Hours_Military_From", timefrommilitary);

                    cmd.Parameters.AddWithValue("@Hours_Military_To", timetomilitary);

                    cmd.Parameters.AddWithValue("@UserID", Session["userID"].ToString());


                    cmd.ExecuteNonQuery();




                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlertF", "Failed to Update Rent Price " + ex.Message, true);

        }






    }



        private void InitialSaveBoat()
        {

            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_add_edit_boat", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());

                    cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());

                    if (txtName.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_name", txtName.Text.Trim());

                    if (txtBoatDescription.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_description", txtBoatDescription.Text.Trim());


                    if (txtMake.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_make", txtMake.Text.Trim());

                    if (txtModel.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_model", txtModel.Text.Trim());


                    if (txtYear.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_year", txtYear.Text.Trim());

                    if (txtSize.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_size", txtSize.Text.Trim().Replace("Feet",""));

                    if (ddMainCategory.SelectedItem != null && ddMainCategory.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@in_boatTypeID", ddMainCategory.SelectedItem.Value);


                    //if (ddSubCategory.SelectedItem != null && ddSubCategory.SelectedIndex > 0)
                    //    cmd.Parameters.AddWithValue("@in_subboatTypeID", ddSubCategory.SelectedItem.Value);



                    cmd.Parameters.AddWithValue("@in_CreatedBy", Session["userID"].ToString());


                    if (txtMaximumPassengers.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@in_maxPassengers", txtMaximumPassengers.Text);


                    // Security Deposit

                    if (txtSecurityDeposit.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@nu_deposit", txtSecurityDeposit.Text);

                    if (txtRequirement.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@vc_requirements", txtRequirement.Text);


                    // Reservation

                    if (txtReservationDeposit.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@nu_reservation", txtReservationDeposit.Text);

                    if (chkCaptainAvailable.Checked)
                        cmd.Parameters.AddWithValue("@ti_captain", "1");
                    else
                        cmd.Parameters.AddWithValue("@ti_captain", "0");

                    if (chkBoatSale.Checked)
                    {
                        cmd.Parameters.AddWithValue("@Is_boat_sale", "1");

                        string saleamount = txtBoatSaleAmount.Text.Replace("$", "").Trim();

                        saleamount = saleamount.Replace(",", "");


                        if (txtBoatSaleAmount.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@boat_sale_amount", saleamount);

                    }
                    else
                        cmd.Parameters.AddWithValue("@Is_boat_sale", "0");


                    cmd.Parameters.AddWithValue("@in_changedBy", Session["userID"].ToString());

                    SqlParameter outputParam = cmd.Parameters.Add("@in_boatID_output", SqlDbType.Int);
                    outputParam.Direction = ParameterDirection.Output;



                    cmd.ExecuteNonQuery();

                    if (Session["boatID"] == null || Session["boatID"].ToString() == "0")
                        Session["boatID"] = outputParam.Value.ToString();
                }
            }

        }


        private string ValidateInput(string value, string fieldname)
        {
            string valid = "";

            string regPhone = @"\W*?(\([0-9]{3}\)|[0-9]{3}-)*([0-9]{3}-|[0-9]{3})[0-9]{4}\W*";
            string regWebAddres = @"\W*(\.com|\.COM|\.net|\.NET|\.org|\.ORG)\W*";



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

            if (fieldname == "[Boat is for Sale]")
            {
                string saleamount = txtBoatSaleAmount.Text.Replace("$", "").Trim();

                saleamount = saleamount.Replace(",", "");
                Double d;

                bool isDecimal = Double.TryParse(saleamount, out d);
                if (!isDecimal)
                    valid = fieldname + " field can only contain numbers";


            }

            return valid;

        }



    protected void btnSave_Click(object sender, EventArgs e)
    {

        try
        {
                lblMessage.Text = "";

                string errormessage = "";

                lblMessagePricing.Text = "";

                errormessage += ValidateInput(txtName.Text, "Name");

                errormessage += ValidateInput(txtMake.Text, "Make");

                errormessage += ValidateInput(txtModel.Text, "Model");

                errormessage += ValidateInput(txtSize.Text, "Size");
                errormessage += ValidateInput(txtBoatDescription.Text, "Boat Description");

                errormessage += ValidateInput(txtRequirement.Text, "Requirement");

                errormessage += ValidateInput(txtReservationDeposit.Text, "Reservation");

                if (chkBoatSale.Checked)
                    errormessage += ValidateInput(txtBoatSaleAmount.Text, "[Boat is for Sale]");

                


                if (errormessage != "")
                {
                    // string alertMessageP = "alert('Failed to Save due to " + errormessage + "');";

                    string al = "alert('Failed to Update. \\n" + errormessage +"');";
                ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlertFailed", al, true);
                    return;

                }

                using (SqlConnection con = Util.getConnection())
            {
                    using (SqlCommand cmd = new SqlCommand("usp_add_edit_boat", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                            cmd.Parameters.AddWithValue("@in_boatID", Session["boatID"].ToString());

                        cmd.Parameters.AddWithValue("@in_MarinaId", Session["MarinaID"].ToString());

                        if (txtName.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_name", txtName.Text.Trim());

                        if (txtBoatDescription.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_description", txtBoatDescription.Text.Trim());


                        if (txtMake.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_make", txtMake.Text.Trim());

                        if (txtModel.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_model", txtModel.Text.Trim());


                        if (txtYear.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_year", txtYear.Text.Trim());

                        if (txtSize.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_size", txtSize.Text.Trim());

                        if (ddMainCategory.SelectedItem !=null && ddMainCategory.SelectedIndex > 0)
                            cmd.Parameters.AddWithValue("@in_boatTypeID", ddMainCategory.SelectedItem.Value);


                        //if (ddSubCategory.SelectedItem != null && ddSubCategory.SelectedIndex > 0)
                        //    cmd.Parameters.AddWithValue("@in_subboatTypeID", ddSubCategory.SelectedItem.Value);

                        if (chkNoSameDay.Checked)
                            cmd.Parameters.AddWithValue("@AllowSameDayRental", "0");
                        else
                            cmd.Parameters.AddWithValue("@AllowSameDayRental", "1");


                        cmd.Parameters.AddWithValue("@in_CreatedBy", Session["userID"].ToString());


                        if (txtMaximumPassengers.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@in_maxPassengers", txtMaximumPassengers.Text);


                        // Security Deposit

                        if (txtSecurityDeposit.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@nu_deposit", txtSecurityDeposit.Text);

                        if (txtRequirement.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_requirements", txtRequirement.Text);


                        // Reservation

                        if (txtReservationDeposit.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@nu_reservation", txtReservationDeposit.Text);


                        if (txtTaxRate.Text.Replace("%","").Trim() != "")
                            cmd.Parameters.AddWithValue("@nu_tax", txtTaxRate.Text.Replace("%",""));



                        if (chkCaptainAvailable.Checked)
                            cmd.Parameters.AddWithValue("@ti_captain", "1");
                        else
                            cmd.Parameters.AddWithValue("@ti_captain", "0");

                        if (chkBoatSale.Checked)
                        {
                            cmd.Parameters.AddWithValue("@Is_boat_sale", "1");
                            string saleamount = txtBoatSaleAmount.Text.Replace("$", "").Trim();
                           
                            saleamount = saleamount.Replace(",", "");

                            if (txtBoatSaleAmount.Text.Trim() != "")
                                       cmd.Parameters.AddWithValue("@boat_sale_amount", saleamount);

                        }
                        else
                            cmd.Parameters.AddWithValue("@Is_boat_sale", "0");


                        cmd.Parameters.AddWithValue("@in_changedBy", Session["userID"].ToString());



                        if (txtMarinaName.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@VC_marinaName", txtMarinaName.Text.Trim());

                        if (txtAddress1.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@VC_AddressLine1", txtAddress1.Text.Trim());
                        if (txtAddress2.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@VC_AddressLine2", txtAddress2.Text.Trim());

                        if (txtCity.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@VC_city", txtCity.Text.Trim());

                        if (ddState.SelectedItem != null && ddState.SelectedIndex > 0)
                            cmd.Parameters.AddWithValue("@IN_StateID", ddState.SelectedItem.Value);

                        if (txtZipCode.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@Ch_zip", txtZipCode.Text.Trim());

                        if (ddCountry.SelectedItem != null && ddCountry.SelectedIndex > 0)
                            cmd.Parameters.AddWithValue("@IN_CountryID", ddCountry.SelectedItem.Value);

                        if (txtBodyOfWater.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@VC_BodyWater", txtBodyOfWater.Text);

                        if (txtPhone.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@VC_Phone", txtPhone.Text);




                        if (txtFacilityCancellationPolicy.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_cancellation_Policy", txtFacilityCancellationPolicy.Text.Trim());
                        if (txtFacilityAreaAttractions.Text.Trim() != "")
                            cmd.Parameters.AddWithValue("@vc_facilityArea", txtFacilityAreaAttractions.Text.Trim());


                        SqlParameter outputParam = cmd.Parameters.Add("@in_boatID_output", SqlDbType.Int);
                        outputParam.Direction = ParameterDirection.Output;



                        cmd.ExecuteNonQuery();

                        if (Session["boatID"] == null || Session["boatID"].ToString() == "0")
                            Session["boatID"] = outputParam.Value.ToString();



                            String alertMessage = "alert('Successfully Updated Record');";

                    ///  ClientScript.RegisterStartupScript(this.GetType(),"popupAlert", alertMessage,true);


                    InsertORUpdateBoatPrice();
                    UpdateImageAndVideoTexts();

                    if (lblMessagePricing.Text != "")
                        {

                            ClientScript.RegisterStartupScript(this.GetType(), "popupAlert", alertMessage, true);
                            return;
                        }

                   // ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlert", alertMessage, true);


                        try
                        {
                            // Create HTML Page.

                            string body = string.Empty;
                            using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/BoatStaticPageTemplate.html")))
                            {
                                body = reader.ReadToEnd();
                            }


                        
                            body = body.Replace("{BoatName}", txtName.Text.Trim());

                            body = body.Replace("{BoatYear}", txtYear.Text.Trim());
                            body = body.Replace("{BoatMake}", txtMake.Text.Trim());
                            body = body.Replace("{BoatModel}", txtModel.Text.Trim());
                            body = body.Replace("{BoatLength}", txtSize.Text.Trim());

                            body = body.Replace("{BoatPassengers}", txtMaximumPassengers.Text.Trim());

                            if (chkCaptainAvailable.Checked)
                                body = body.Replace("{BoatCaptain}", "Yes");
                            else
                                body = body.Replace("{BoatCaptain}", "No");

                            body = body.Replace("{BoatDescription}", txtBoatDescription.Text.Trim());

                            //< Title > “City” “State” Boat Rentals | Learn how to rent our boat “size” “make” “Main Category” on “Body of Water” </ title >



                            DataTable dtFacility = Util.getDataSet("execute [usp_get_facility_details] " + Session["marinaID"].ToString()).Tables[0];

                            string fcity = "";
                            string fstate = "";
                            string bodyofwater = "";
                            string bcategory = "";

                            if (ddMainCategory.SelectedItem != null)
                                bcategory = ddMainCategory.SelectedItem.Text;


                            if (dtFacility.Rows.Count > 0)
                            {
                                fcity = dtFacility.Rows[0]["vc_city"].ToString();
                                fstate = dtFacility.Rows[0]["state"].ToString();
                                bodyofwater= dtFacility.Rows[0]["vc_bodywater"].ToString();
                            }

  //                          < title > CITY STATE Boat Rentals | Rent MAKE BODY of WATER CATEGORY </ title >
  
  //< meta name = "description" content = "Rentaboat.com: Easily find A Boat Rental, Sailboat Charters, Yacht Reservations and Jet Ski Rentals world wide. Reserve a Boat and Book your boat online. Rent your boat as peer to peer.  Rated #1 in customer satisfaction.  View boat photos, Video, Availability and Reserve and book online." >


                                 string pageTitle = String.Format("{0} &nbsp; {1} &nbsp; Boat Rentals | Rent {2}&nbsp; {3}&nbsp; {4} &nbsp;on &nbsp;{5}", fcity, fstate, txtSize.Text, txtMake.Text, bcategory,bodyofwater);


                                body = body.Replace("{PageTitle}", pageTitle);





                            DataTable dtImages = Util.getDataSet("execute [usp_get_Boat_Images] @in_BoatID=" + Session["boatID"].ToString() +", @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];

                            string imgMore = "";


                            for (int i=0; i < dtImages.Rows.Count; i++)
                            {

                                if (dtImages.Rows[i]["ti_mainPic"].ToString() == "0")
                                {
                                    body = body.Replace("{BoatImageTag}", "<img src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "' id='mainboatPic'  width='400' height='246' alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' />   ");

                                }
                                else
                                {
                                    imgMore += "<a  id = 'pop' onclick = 'showImagePopup(this)' > <img class='cover-item' src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "'   width='400' height='246' alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' /> </a>  ";


                                }

                            }

                            body = body.Replace("{BoatImageMore}", imgMore );




                            //body = body.Replace("{BoatRequirements}", txtRequirement.Text.Trim());


                       
                           



                            body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString()+"&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary btn-lg active' role='button'>BOOK NOW</a>");

        

                           File.WriteAllText(Server.MapPath("~/BoatHtml/" + "Facility_" + Session["MarinaID"].ToString() + "_Boat_" + Session["boatID"].ToString() + ".htm"), body);

                            //  string url = @"http://www.boatrenting.com/ShowBoat.aspx?bid=" + Session["boatID"].ToString().Trim() + "&mid=" + Session["MarinaID"].ToString().Trim();

                            string url = @"https://www.rentaboat.com/BoatHtml/" + "Facility_" + Session["MarinaID"].ToString() + "_Boat_" + Session["boatID"].ToString() + ".htm";

                           Util.UpdateSiteMap(url, Server.MapPath("~"));


                            mdlSuccess.Show();


                        }

                        catch (Exception ex1)
                        {
                            lblMessage.Text = "Failed to update record: " + ex1.Message;

                            ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlertFailed", "Failed to Update " + ex1.Message, true);

                        }


                }



            }
        }
        catch (Exception ex)
        {
                lblMessage.Text = "Failed to update record: " + ex.Message;

            ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlertFailed1", "Failed to Update " + ex.Message, true);

        }



    }





    protected void chkBoatSale_CheckedChanged(object sender, EventArgs e)
    {
            if (chkBoatSale.Checked)
            {
                txtBoatSaleAmount.Text = "$";
                txtBoatSaleAmount.Visible = true;
            }
            else
                txtBoatSaleAmount.Visible = false;

    }

    protected void btnHolidyList_Click(object sender, EventArgs e)
    {

            PopulateHoliday();

            mdlPopupHolidayCalendar.Show();




    }

    protected void calHoliday_SelectionChanged(object sender, EventArgs e)
    {
            if (Session["boatID"] == null || Session["boatID"].ToString() == "0")
                InitialSaveBoat();


            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[SP_Update_Holiday]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    if (Session["boatID"] != null && Session["boatID"].ToString() != "0")
                        cmd.Parameters.AddWithValue("@P_IN_BoatID", Session["boatID"].ToString());

                    cmd.Parameters.AddWithValue("@P_IN_MarinaID", Session["MarinaID"].ToString());

                    cmd.Parameters.AddWithValue("@p_month", calHoliday.SelectedDate.Month.ToString());
                    cmd.Parameters.AddWithValue("@p_year", calHoliday.SelectedDate.Year.ToString());
                    cmd.Parameters.AddWithValue("@p_day", calHoliday.SelectedDate.Day.ToString());

                    cmd.ExecuteNonQuery();



                }
            }

                    PopulateHoliday();



            calHoliday.SelectedDate = DateTime.Now.AddYears(-1);

            mdlPopupHolidayCalendar.Show();

            
    }




    protected void calHoliday_DayRender(object sender, DayRenderEventArgs e)
    {


            if (holidayList.Contains(e.Day.Date))
            {

                e.Cell.ToolTip = "This day is marked as holiday. To remove the holiday click again";

                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#f7df57");
                e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
             


              //  e.Cell.Attributes.Add("onclick", e.SelectUrl);
                //e.Cell.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                //e.Cell.Attributes.Add("onmouseout", "this.style.cursor='default'");

               // e.Cell.Attributes.Add("class", "calPickupDropOff");

            }

            else
            {
                //e.Cell.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                //e.Cell.Attributes.Add("onmouseout", "this.style.cursor='default'");

                //e.Cell.Attributes.Add("class", "calPickupDropOff");
              //  e.Cell.Attributes.Add("onclick", e.SelectUrl);



            }


    }

        List<DateTime> holidayList
        {

            get
            {
                if (Session["holidaylist"] == null)
                    return new List<DateTime>();
                else
                    return (List<DateTime>)Session["holidaylist"];


            }

            set
            {

                Session["holidaylist"] = value;

            }

        }
            
            
         

        private void PopulateHoliday()
        {

            DataTable dt = Util.getDataSet("select  Holiday_Date from TBL_HolidayList where boat_ID=" + Session["boatID"] + " and Marina_ID=" + Session["marinaID"].ToString() +" and year(Holiday_date) >= " + DateTime.Now.Year.ToString() ).Tables[0];

            List<DateTime> holiday = new List<DateTime>();

            for (int i=0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() != "")
                    holiday.Add((DateTime)dt.Rows[i][0]);

            }


            holidayList = holiday;


        }

        protected void calHoliday_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {

            mdlPopupHolidayCalendar.Show();

         



        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("boats_list.aspx");
        }

        protected void chkSameAsFacilityAddress_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSameAsFacilityAddress.Checked)
            {
                DataTable dt = Util.getDataSet("execute usp_get_marina_address " + Session["marinaID"].ToString()).Tables[0];
                if (dt.Rows.Count > 0)
                {

                    txtMarinaName.Text = dt.Rows[0]["vc_marinaName"].ToString();
                    txtAddress1.Text = dt.Rows[0]["vc_addressline1"].ToString();
                    txtAddress2.Text = dt.Rows[0]["vc_addressline2"].ToString();

                    ddCountry.ClearSelection();

                    if (ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()) != null)
                        ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()).Selected = true;
                    else
                        ddCountry.SelectedIndex = 1;



                    bindStateList();
                    ddState.ClearSelection();
                    if (ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()) != null)
                        ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()).Selected = true;





                    txtCity.Text = dt.Rows[0]["vc_city"].ToString();
                    txtZipCode.Text = dt.Rows[0]["ch_Zip"].ToString();
                    txtBodyOfWater.Text = dt.Rows[0]["vc_bodywater"].ToString();


                }


            }




        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("BoatList.aspx");
        }
    }





}