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


                   //     if (txtYoutubeLink.Text != "")
                   // cmd.Parameters.AddWithValue("@YoutubeLink", txtYoutubeLink.Text);

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
                        txtNamePic.Text = dtP.Rows[i]["ImageDesc"].ToString();
                        txtDescPic.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divMainPicPreview.Visible = true;
                           
                            imgPreviewMainPic.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString()+"?"+ mRnd.Next(0, 99999).ToString();



                            break;

                    case "1":
                        txtNamePic1.Text = dtP.Rows[i]["ImageDesc"].ToString();
                        txtDescPic1.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divPic1Preview.Visible = true;
                            imgPreviewPic1.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;

                    case "2":
                        txtNamePic2.Text = dtP.Rows[i]["ImageDesc"].ToString();
                        txtDescPic2.Text = dtP.Rows[i]["vc_description"].ToString();
                            //divPic2Preview.Visible = true;
                            imgPreviewPic2.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;


                    case "3":
                        txtNamePic3.Text = dtP.Rows[i]["ImageDesc"].ToString();
                        txtDescPic3.Text = dtP.Rows[i]["vc_description"].ToString();
                           // divPic3Preview.Visible = true;
                            imgPreviewPic3.Src = @"../boats/" + dtP.Rows[i]["vc_filename"].ToString() + "?" + mRnd.Next(0, 99999).ToString();

                            break;


                    case "4":
                        txtNamePic4.Text = dtP.Rows[i]["ImageDesc"].ToString();
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


                if (txtYoutubeLink.Text.Trim() != "")
                {

                    string id = txtYoutubeLink.Text.Substring(txtYoutubeLink.Text.LastIndexOf("/") + 1);

                  
                    iframeVideo.Attributes.Add("src", "https://www.youtube.com/embed/" + id);

                }
                else
                {
                    // iframeVideo.Attributes.Add("style", "visibility:none");
                    iframeVideo.Visible = false;

                }
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


                        if (txtYoutubeLink.Text !="")
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
            if (!fup.IsUploading) return;


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

                    string filename10 = Session["MarinaID"].ToString() + "_" + Session["BoatID"].ToString() + "_1_" +DateTime.Now.Millisecond +"."+ ext;

                    fup.SaveAs(Server.MapPath("~/BoatVideos/" + filename10));

                      

                        SaveVideo(filename10);

                       
                        var fileStream = new FileStream(Server.MapPath("~/BoatVideos/" + filename10), FileMode.Open);

                        //   YouTubeUtilities u = new YouTubeUtilities("1/fFY92O2I0XgWgrmTnXR5KvqL3B2MvrLgKZ2E30NDSUJIgOrJDtdun6zK6XiATCKT", "9yWW1yyZ8EWZzeXXH0qHXOW8", "618374193828-bfcof3l7p8inaotiocjagpthrfkqfon8.apps.googleusercontent.com");


                        //  YouTubeUtilities u = new YouTubeUtilities("1/J9Wxh5tnqKK3_bbVSzuBr_a84nrJpA-O9krGA5uiZ4Y", "Hm2rozNiXZkmCA8i6PMq3eGR", "271667197343-055hq8dc5cpbcdbonk28fcf3fubhp2v1.apps.googleusercontent.com");

                        YouTubeUtilities u = new YouTubeUtilities("1//0d4YTckGnkxY6CgYIARAAGA0SNwF-L9Irj4C-2bQoeJifUQ6e48a2QH-tUZhwvQADUm3om0rJWExsA9JIQH3sYGLeLG6DgYhs9B8", "Q3filw1Dowhem0IbO6FbfZQP", "480769755846-cvol9fketvpdkb08tq98eophcudu5vg5.apps.googleusercontent.com");



                        string videoid = u.UploadVideo(fileStream, txtVideoName.Text, txtVideoDescription.Text, new string[] { "Boat Renting", "Renting", "Travel" }, "1", true);

                        string youtubelink = @"https://youtu.be/" + videoid;

                        txtYoutubeLink.Text = youtubelink;




                        string srclink = "https://www.youtube.com/embed/" + videoid;
                        UpdateYoutubeLink(srclink);

                    
                    //    iframeVideo.Attributes.Add("src", srclink);


    //                    ScriptManager.RegisterClientScriptBlock(upVideo, upVideo.GetType(), "img",
    //"top.document.getElementById('iframeVideo').src='"+srclink + "';",
    //true);



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

            if (dt.Rows[0]["vc_size_unit"].ToString() == "Meters")
                {

                    ddvcSizeUnit.SelectedIndex = 1;

                }
            else
                {
                    ddvcSizeUnit.SelectedIndex = 0;

                }
            
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
                    //  ddCountry.SelectedIndex = 1;
                    ddCountry.Items.FindByValue("1").Selected = true;


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
                    ddBoatSaleCurrency.Visible = true;


                    txtBoatSaleAmount.Text = dt.Rows[0]["boat_sale_amount"].ToString();

                    if (dt.Rows[0]["boat_sale_amount_currency_id"].ToString() == "2")
                        ddBoatSaleCurrency.SelectedIndex = 1;
                    else
                        ddBoatSaleCurrency.SelectedIndex = 0;


                }
                else
                {
                    chkBoatSale.Checked = false;
                    txtBoatSaleAmount.Visible = false;
                    ddBoatSaleCurrency.Visible = false;


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




            //  ddCountry.SelectedIndex = 1;
            if (ddCountry.Items.FindByValue("1") != null)
                ddCountry.Items.FindByValue("1").Selected = true;


            bindStateList();


            //  ddState.Items.Clear();





        }


        private void bindCurrency()
        {



            ddBoatSaleCurrency.DataTextField=   ddCurrency.DataTextField = "Currency_Short_Name";
            ddBoatSaleCurrency.DataValueField=   ddCurrency.DataValueField = "Currency_Id";
            ddBoatSaleCurrency.DataSource=   ddCurrency.DataSource = Util.getDataSet("execute usp_get_currency_list").Tables[0];
            ddCurrency.DataBind();
            ddCurrency.SelectedIndex = 0;
            ddBoatSaleCurrency.DataBind();
            ddBoatSaleCurrency.SelectedIndex = 0;


        }

        private bool IsProfileComplete()
        {
            bool complete = true;

            DataTable dtC = Util.getDataSet("execute usp_is_profile_complete @marinaID=" + Session["MarinaID"].ToString()).Tables[0];

            if (dtC.Rows.Count == 0)
                complete = false;



            return complete;

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


                if (!IsProfileComplete())
                {

                    mdlPopupProfile.Show();

                    return;
                }



                bindCurrency();

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
                ddBoatSaleCurrency.Visible = false;


            bindMainCategory();

            bindHoursFromTo();

                if (Request.QueryString["boatID"] == null)
                {
                    Session["boatID"] = "0";
                    boatLink.Visible = false;



                 //   setSelectedMenu("liBoatListing");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "addnewboat",  "setSelectedMenu('liAddNewBoat');" ,  true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "adddollar", "AddNewBoatDollarSign();", true);

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

            lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "$";

            DataTable dtF = Util.getDataSet("execute usp_get_boat_price @in_BoatID="+ Session["boatID"].ToString() + ", @in_MarinaID=" + Session["marinaID"].ToString() + ",@in_TypeRentID=1"  ).Tables[0];


            if (dtF.Rows.Count > 0)
            {


                if (dtF.Rows[0]["Currency_Id"].ToString() == "" || dtF.Rows[0]["Currency_Id"].ToString() == "1")
                {
                    ddCurrency.SelectedIndex = 0;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "$";
                    //  $('.input-symbol-euro').toggleClass("input-symbol-euro").toggleClass('input-symbol-dollar');

                    sReservation.Attributes.Add("class", "input-symbol-dollar");
                    sSecurity.Attributes.Add("class", "input-symbol-dollar");

                    //$('.csymbol').text("€");
                }
                else
                { 
                    ddCurrency.SelectedIndex = 1;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "&euro;";
                    sReservation.Attributes.Add("class", "input-symbol-euro");
                    sSecurity.Attributes.Add("class", "input-symbol-euro");
                }


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
                if (dtAM.Rows[0]["Currency_Id"].ToString() == "" || dtAM.Rows[0]["Currency_Id"].ToString() == "1")
                {
                    ddCurrency.SelectedIndex = 0;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "$";
                    //  $('.input-symbol-euro').toggleClass("input-symbol-euro").toggleClass('input-symbol-dollar');

                    sReservation.Attributes.Add("class", "input-symbol-dollar");
                    sSecurity.Attributes.Add("class", "input-symbol-dollar");


                }
                else
                {
                    ddCurrency.SelectedIndex = 1;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "&euro;";
                    sReservation.Attributes.Add("class", "input-symbol-euro");
                    sSecurity.Attributes.Add("class", "input-symbol-euro");
                }



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


                if (dtPM.Rows[0]["Currency_Id"].ToString() == "" || dtPM.Rows[0]["Currency_Id"].ToString() == "1")
                {
                    ddCurrency.SelectedIndex = 0;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "$";
                    //  $('.input-symbol-euro').toggleClass("input-symbol-euro").toggleClass('input-symbol-dollar');

                    sReservation.Attributes.Add("class", "input-symbol-dollar");
                    sSecurity.Attributes.Add("class", "input-symbol-dollar");


                }
                else
                {
                    ddCurrency.SelectedIndex = 1;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "&euro;";
                    sReservation.Attributes.Add("class", "input-symbol-euro");
                    sSecurity.Attributes.Add("class", "input-symbol-euro");
                }


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

                if (dtH.Rows[0]["Currency_Id"].ToString() == "" || dtH.Rows[0]["Currency_Id"].ToString() == "1")
                {
                    ddCurrency.SelectedIndex = 0;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "$";
                    //  $('.input-symbol-euro').toggleClass("input-symbol-euro").toggleClass('input-symbol-dollar');

                    sReservation.Attributes.Add("class", "input-symbol-dollar");
                    sSecurity.Attributes.Add("class", "input-symbol-dollar");


                }
                else
                {
                    ddCurrency.SelectedIndex = 1;
                    lblCurrencySymbol1.Text = lblCurrencySymbol10.Text = lblCurrencySymbol11.Text = lblCurrencySymbol12.Text = lblCurrencySymbol2.Text = lblCurrencySymbol3.Text = lblCurrencySymbol4.Text = lblCurrencySymbol5.Text = lblCurrencySymbol6.Text = lblCurrencySymbol7.Text = lblCurrencySymbol8.Text = lblCurrencySymbol9.Text = "&euro;";
                    sReservation.Attributes.Add("class", "input-symbol-euro");
                    sSecurity.Attributes.Add("class", "input-symbol-euro");
                }


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

                        cmd.Parameters.AddWithValue("@Currency_Id", ddCurrency.SelectedItem.Value);



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


            if (fieldname != "[Boat is for Sale]")
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


                //Find & book affordable boat rentals in {headDescriptionCity} with or without a captain. Rent sailboats, jet skis, yachts charters & other watercrafts anywhere in the world. Rated #1 in customer satisfaction."


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

                // <title>Boat Rentals In <city>, <state>, <Body of water>. Rent A Boat</title>
                //  For example: < title > Boat Rentals In Brookhave

                string pageTitle = String.Format("Boat Rentals In {0},  {1}, {2}, {3}. Rent A Boat", fcity, fstate, dtBoat.Rows[0]["country"].ToString(), bodyofwater);


                body = body.Replace("{PageTitle}", pageTitle);

                //Find & book affordable boat rentals in {headDescriptionCity} with or without a captain. Rent sailboats, jet skis, yachts charters & other watercrafts anywhere in the world. Rated #1 in customer satisfaction."
                // body = body.Replace("{headDescriptionCity}", fcity);

                //boat rental {descSize} {descType} {descLocation}. Starting at {descLowestPrice} {descBoatDescription}!



                body = body.Replace("{descSize}", dtBoat.Rows[0]["vc_size"].ToString() + " " + dtBoat.Rows[0]["vc_size_unit"].ToString());
                body = body.Replace("{descType}", bcategory);
                body = body.Replace("{descLocation}", bodyofwater);

                DataTable dtLowestPrice = Util.getDataSet("execute usp_get_lowest_price @in_BoatID=" + bid +", @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];

                if (dtLowestPrice.Rows.Count > 0)
                {
                    string currencySymbol = "$";

                    if (dtLowestPrice.Rows[0]["Currency"].ToString() == "EURO")
                        currencySymbol = "&euro;";


                    body = body.Replace("{descLowestPrice}", currencySymbol + " " + dtLowestPrice.Rows[0]["RentAmount"].ToString());
                }
                else
                {
                    body = body.Replace("{descLowestPrice}", "");
                }


                string descBoatDescription = dtBoat.Rows[0]["vc_description"].ToString();

                if (descBoatDescription.Length > 120 )

                body = body.Replace("{descBoatDescription}", descBoatDescription.Substring(0,120));
                else
                body = body.Replace("{descBoatDescription}", descBoatDescription);




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

               // string boatAltDesc = " boat rentals " + dtBoat.Rows[0]["state"].ToString().Trim() + " " + dtBoat.Rows[0]["vc_city"].ToString().Trim() + " " + bodyofwater + " " +
                  //  dtBoat.Rows[0]["vc_make"].ToString() + " " + dtBoat.Rows[0]["vc_model"].ToString() + " " + dtBoat.Rows[0]["vc_year"].ToString() + " " +
                 //   dtBoat.Rows[0]["vc_size"].ToString() + " " + dtBoat.Rows[0]["vc_size_unit"].ToString();






                for (int i = 0; i < dtImages.Rows.Count; i++)
                {

                    if (dtImages.Rows[i]["ti_mainPic"].ToString() == "0")
                    {
                        body = body.Replace("{BoatImageTag}", "<img src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "' id='mainboatPic'   alt='" + dtImages.Rows[i]["vc_nombre"].ToString()  + "' />   ");

                    }
                    else
                    {
                        imgMore += "<a  id = 'pop' onclick = 'showImagePopup(this)' > <img class='cover-item' src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "'   width='400'  alt='" + dtImages.Rows[i]["vc_nombre"].ToString()  + "' /> </a>  ";


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

                //  body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>More Info</a>");


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


                // string pageTitle = String.Format("{0} &nbsp; {1} &nbsp; Boat Rentals | Rent {2}&nbsp; {3}&nbsp; {4} &nbsp;on &nbsp;{5}", fcity, fstate, dtBoat.Rows[0]["vc_size"].ToString(), dtBoat.Rows[0]["vc_make"].ToString(), bcategory, bodyofwater);
                string pageTitle = String.Format("Boat Rentals In {0},  {1}, {2}, {3}. Rent A Boat", fcity, fstate, dtBoat.Rows[0]["country"].ToString(), bodyofwater);


                body = body.Replace("{PageTitle}", pageTitle);

                //    body = body.Replace("{headDescriptionCity}", fcity);


                body = body.Replace("{descSize}", dtBoat.Rows[0]["vc_size"].ToString() + " " + dtBoat.Rows[0]["vc_size_unit"].ToString());
                body = body.Replace("{descType}", bcategory);
                body = body.Replace("{descLocation}", bodyofwater);

                DataTable dtLowestPrice = Util.getDataSet("execute usp_get_lowest_price @in_BoatID=" + bid + ", @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];

                if (dtLowestPrice.Rows.Count > 0)
                {
                    string currencySymbol = "$";

                    if (dtLowestPrice.Rows[0]["Currency"].ToString() == "EURO")
                        currencySymbol = "&euro;";


                    body = body.Replace("{descLowestPrice}", currencySymbol + " " + dtLowestPrice.Rows[0]["RentAmount"].ToString());
                }
                else
                {
                    body = body.Replace("{descLowestPrice}", "");
                }


                string descBoatDescription = dtBoat.Rows[0]["vc_description"].ToString();

                if (descBoatDescription.Length > 120)

                    body = body.Replace("{descBoatDescription}", descBoatDescription.Substring(0, 120));
                else
                    body = body.Replace("{descBoatDescription}", descBoatDescription);



                body = body.Replace("{keywordCity}", fcity);
                body = body.Replace("{keywordState}", fstate);

                body = body.Replace("{keywordBodyOfWater}", bodyofwater);

                body = body.Replace("{keywordBoatName}", dtBoat.Rows[0]["vc_name"].ToString());




                DataTable dtImages = Util.getDataSet("execute [usp_get_Boat_Images] @in_BoatID=" + bid + ", @in_MarinaID=" + Session["marinaID"].ToString()).Tables[0];



                //string boatAltDesc = " boat rentals " + dtBoat.Rows[0]["state"].ToString().Trim() + " " + dtBoat.Rows[0]["vc_city"].ToString().Trim() + " " + bodyofwater + " " +
                // dtBoat.Rows[0]["vc_make"].ToString() + " " + dtBoat.Rows[0]["vc_model"].ToString() + " " + dtBoat.Rows[0]["vc_year"].ToString() + " " +
                // dtBoat.Rows[0]["vc_size"].ToString() + " " + dtBoat.Rows[0]["vc_size_unit"].ToString();



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

                body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + bid + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>MORE INFO</a>");


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

                errormessage += ValidateInput(txtMarinaName.Text, "Marina Name");


                errormessage += ValidateInput(txtAddress1.Text, "Boat Address1");
                errormessage += ValidateInput(txtAddress2.Text, "Boat Address2");

                errormessage += ValidateInput(txtCity.Text, "City/Region");



                errormessage += ValidateInput(txtBodyOfWater.Text, "Body of Water");

                errormessage += ValidateInput(txtFacilityAreaAttractions.Text, "Area and Attractions");

                errormessage += ValidateInput(txtFacilityCancellationPolicy.Text, "Cancellation Policy");






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

                        string vcsizeunit = "Feet";

                        if (ddvcSizeUnit.SelectedIndex == 0)
                            vcsizeunit = "Feet";
                        else
                            vcsizeunit = "Meters";


                        cmd.Parameters.AddWithValue("@vc_size_unit", vcsizeunit);


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

                            if (ddCurrency.SelectedIndex >= 0)
                                cmd.Parameters.AddWithValue("@vboat_sale_amount_currency_id", ddBoatSaleCurrency.SelectedItem.Value);


                            
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


                        if (ddCurrency.SelectedIndex >= 0)
                            cmd.Parameters.AddWithValue("@vCurrency_Id", ddCurrency.SelectedItem.Value);




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

                        try
                        {
                            if (Util.IsBoatForRenting(Session["marinaID"].ToString()))
                            {
                                CreateHtmlBoat(Session["boatID"].ToString());
                            }
                            else
                            {
                                CreateHtmlBoatNoRent(Session["boatID"].ToString());

                            }

                            string url = @"https://www.rentaboat.com/BoatHtml/" + "Facility_" + Session["MarinaID"].ToString() + "_Boat_" + Session["boatID"].ToString() + ".htm";

                            Util.UpdateSiteMap(url, Server.MapPath("~"));


                            mdlSuccess.Show();


                        }

                        catch (Exception ex1)
                        {
                            lblMessage.Text = "Failed to update record: " + ex1.Message;

                            ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlertFailed", "Failed to Update " + ex1.Message, true);

                        }
                        // ScriptManager.RegisterStartupScript(upPanel, upPanel.GetType(), "popAlert", alertMessage, true);

                        /*
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
                            body = body.Replace("{BoatLength}", txtSize.Text.Trim() + " " + vcsizeunit );

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
                                    body = body.Replace("{BoatImageTag}", "<img src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "' id='mainboatPic'   alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' />   ");

                                }
                                else
                                {
                                    imgMore += "<a  id = 'pop' onclick = 'showImagePopup(this)' > <img class='cover-item' src='../boats/" + dtImages.Rows[i]["vc_filename"].ToString() + "'   width='400'  alt='" + dtImages.Rows[i]["vc_nombre"].ToString() + "' /> </a>  ";


                                }

                            }

                            body = body.Replace("{BoatImageMore}", imgMore );




                            //body = body.Replace("{BoatRequirements}", txtRequirement.Text.Trim());


                            string pricetable = "<table class='boatPriceTable'><thead><tr><th class='boatPriceTable'></th><th class='boatPriceTable'>Weekday</th><th class='boatPriceTable'>Weekend</th><th class='boatPriceTable'>Holiday</th><th class='boatPriceTable'>Hours</th></tr></thead><tbody>";


                            DataTable dtPricing = Util.getDataSet("execute SP_BR_PRICExBOATxTYPERENT_LIST @p_in_BoatID=" + Session["boatID"].ToString() + ",@p_in_marinaID=" + Session["marinaID"].ToString()).Tables[0];



                            for (int i = 0; i < dtPricing.Rows.Count; i++)
                            {

                                pricetable += "<tr><td>" + dtPricing.Rows[i]["vc_description"].ToString() + " price:" + "</td>";
                                pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeek"].ToString() + "</td>";
                                pricetable += "<td>" + dtPricing.Rows[i]["nu_precioDayWeekend"].ToString() + "</td>";
                                pricetable += "<td>" + dtPricing.Rows[i]["nu_precioHolyday"].ToString() + "</td>";

                                pricetable += "<td>" + dtPricing.Rows[i]["hours_from"].ToString() + "&nbsp;TO&nbsp;" + dtPricing.Rows[i]["hours_to"].ToString() + "</td> </tr>";






                            }

                            pricetable += "</tbody></table>";


                            DataTable dtboat = Util.getDataSet("execute usp_get_boat_details @in_boatID=" + Session["BoatID"].ToString() + ",@in_marinaID=" + Session["marinaID"].ToString()).Tables[0];


                            body = body.Replace("{Country}","<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["country"].ToString().Trim()+"</span>");
                            body = body.Replace("{State}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["state"].ToString().Trim() + "</span>");

                            body = body.Replace("{City}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["vc_city"].ToString().Trim() + "</span>");
                            body = body.Replace("{BodyOfWater}", "<span style='color:#4CAEB8;'>" + dtboat.Rows[0]["vc_bodywater"].ToString().Trim() + "</span>");


                            body = body.Replace("{BoatNo}", Session["boatID"].ToString());


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

                            body = body.Replace("{ContactBoatOwnerLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary ' role='button'>Contact Boat Owner</a>");


                            body = body.Replace("{AskBoatQuestionsLink}", "<a href='../MemberSignInR.aspx?askq=1&bid=" + Session["boatID"].ToString() + "&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>Ask this boat owner a question</a>");



                            DataTable tYoutube = Util.getDataSet("execute usp_get_boat_video @in_BoatID="+ Session["boatID"].ToString() +",@in_MarinaID=" + Session["MarinaID"].ToString()).Tables[0];


                            if (tYoutube.Rows.Count > 0 && tYoutube.Rows[0]["YouTubeLink"].ToString() !="")
                            {
                                body = body.Replace("{BoatVideo}", " <iframe width = \"400\" height = \"400\"  id = \"iframeVideo\" style = \"height:400px!important;\" src = \"" + tYoutube.Rows[0]["YouTubeLink"].ToString() + "\"  frameborder = \"0\" allowfullscreen ></iframe>");

                            }
                            else
                            {
                                body = body.Replace("{BoatVideo}", "");

                            }







                            body = body.Replace("{BoatPriceTable}", pricetable);

                            body = body.Replace("{BookNowLink}", "<a href='../ShowBoat.aspx?bid=" + Session["boatID"].ToString()+"&mid=" + Session["MarinaID"].ToString() + "'  class='btn btn-primary' role='button'>MORE INFO</a>");


                            body = body.Replace("{BoatOwner}", dtFacility.Rows[0]["vc_contactname"].ToString());

                            body = body.Replace("{BoatTaxRate}", txtTaxRate.Text +"%");

                            body = body.Replace("{ReservationDeposit}", "$"+txtReservationDeposit.Text);

                            body = body.Replace("{SecurityDeposit}", "$" + txtSecurityDeposit.Text);


                            body = body.Replace("{CancellationPolicy}", txtFacilityCancellationPolicy.Text);

                            body = body.Replace("{AreaAttractions}", txtFacilityAreaAttractions.Text);

                            body = body.Replace("{BoatRequirements}", txtRequirement.Text);




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
                        */




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
                //txtBoatSaleAmount.Text = "$";
                txtBoatSaleAmount.Visible = true;
                ddBoatSaleCurrency.Visible = true;

            }
            else
            {
                txtBoatSaleAmount.Visible = false;
                ddBoatSaleCurrency.Visible = false;

            }

        }

    protected void btnHolidyList_Click(object sender, EventArgs e)
    {

            PopulateHoliday();

            PopulatePhotoInfo();
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



           // pnlNoAvailability.Attributes.Add("style", "z-index:9990001!important;");
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

                   // txtMarinaName.Text = dt.Rows[0]["vc_marinaName"].ToString();
                    txtAddress1.Text = dt.Rows[0]["vc_addressline1"].ToString();
                    txtAddress2.Text = dt.Rows[0]["vc_addressline2"].ToString();

                    ddCountry.ClearSelection();

                    if (ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()) != null)
                        ddCountry.Items.FindByValue(dt.Rows[0]["in_CountryID"].ToString()).Selected = true;
                    else
                        // ddCountry.SelectedIndex = 1;
                        ddCountry.Items.FindByValue("1").Selected = true;


                    bindStateList();
                    ddState.ClearSelection();
                    if (ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()) != null)
                        ddState.Items.FindByValue(dt.Rows[0]["in_StateID"].ToString()).Selected = true;





                    txtCity.Text = dt.Rows[0]["vc_city"].ToString();
                    txtZipCode.Text = dt.Rows[0]["ch_Zip"].ToString();
                //    txtBodyOfWater.Text = dt.Rows[0]["vc_bodywater"].ToString();
                    txtPhone.Text = dt.Rows[0]["vc_phone"].ToString();

                }


            }

            else
            {


                txtAddress1.Text = "";
                ddCountry.ClearSelection();
                // ddCountry.SelectedIndex = 1;
                ddCountry.Items.FindByValue("1").Selected = true;
                ddState.ClearSelection();
                txtCity.Text = "";
                txtZipCode.Text = "";
                txtPhone.Text = "";




            }


        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("BoatList.aspx");
        }

        protected void btnGoProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("facilities_mant.aspx");
        }
    }





}