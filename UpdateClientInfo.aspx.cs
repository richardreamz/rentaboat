using AjaxControlToolkit;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateClientInfo : System.Web.UI.Page
{

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
      


        //ddState.Items.Clear();

        //ddBillingState.Items.Clear();



    }



    void PopulateBoatPhotos()
    {

        DataTable dtP = Util.getDataSet("execute [usp_get_client_boat_photos] " + Session["ClientID"].ToString()).Tables[0];

        for (int i=0; i < dtP.Rows.Count; i++)
        {
            switch (dtP.Rows[i]["Ordering_No"].ToString())
            {
                case "1":

                    txtDescPic.Text = dtP.Rows[i]["Photo_Description"].ToString();
                    txtNamePic.Text = dtP.Rows[i]["Photo_Name"].ToString();
                    if ( dtP.Rows[i]["Photo_Filename"].ToString() != "")
                    {
                        divMainPicPreview.Visible = true;
                        imgPreviewMainPic.Src = "./clientboatphotos/" + dtP.Rows[i]["Photo_Filename"].ToString();

                    }
                    else
                        divMainPicPreview.Visible = false;
                    break;

                case "2":

                    txtDescPic1.Text = dtP.Rows[i]["Photo_Description"].ToString();
                    txtNamePic1.Text = dtP.Rows[i]["Photo_Name"].ToString();
                    if (dtP.Rows[i]["Photo_Filename"].ToString() != "")
                    {
                        divPic1Preview.Visible = true;
                        imgPreviewPic1.Src = "./clientboatphotos/" + dtP.Rows[i]["Photo_Filename"].ToString();

                    }
                    else
                        divPic1Preview.Visible = false;

                    break;

                case "3":

                    txtDescPic2.Text = dtP.Rows[i]["Photo_Description"].ToString();
                    txtNamePic2.Text = dtP.Rows[i]["Photo_Name"].ToString();
                    if (dtP.Rows[i]["Photo_Filename"].ToString() != "")
                    {
                        divPic2Preview.Visible = true;
                        imgPreviewPic2.Src = "./clientboatphotos/" + dtP.Rows[i]["Photo_Filename"].ToString();

                    }
                    else
                        divPic2Preview.Visible = false;

                    break;

                case "4":

                    txtDescPic3.Text = dtP.Rows[i]["Photo_Description"].ToString();
                    txtNamePic3.Text = dtP.Rows[i]["Photo_Name"].ToString();
                    if (dtP.Rows[i]["Photo_Filename"].ToString() != "")
                    {
                        divPic3Preview.Visible = true;
                        imgPreviewPic3.Src = "./clientboatphotos/" + dtP.Rows[i]["Photo_Filename"].ToString();

                    }
                    else
                        divPic3Preview.Visible = false;

                    break;


            }



        }



    }

    
    void bindPastRentals()
    {
        DataTable dtR = Util.getDataSet("execute usp_get_past_rentals " + Session["ClientID"].ToString() ).Tables[0];

        gvPastRentals.DataSource = dtR;
        gvPastRentals.DataBind();


    }

    void bindUpcomingRentals()
    {
        DataTable dtR = Util.getDataSet("execute usp_get_upcoming_rentals " + Session["ClientID"].ToString()).Tables[0];

        gvUpcomingBoatRentals.DataSource = dtR;
        gvUpcomingBoatRentals.DataBind();


    }


    void PopulateClientInfo()
    {


        DataTable dtC = Util.getDataSet("execute usp_get_client_info " + Session["ClientID"] ).Tables[0];

        if (dtC.Rows.Count > 0)
        {

            txtFirstNameNewUser.Text = dtC.Rows[0]["vc_firstName"].ToString();

            txtLastNameNewUser.Text = dtC.Rows[0]["vc_lastName"].ToString();

            txtAddress1NewUser.Text = dtC.Rows[0]["vc_address"].ToString();

            txtAddress2NewUser.Text = dtC.Rows[0]["vc_address2"].ToString();

            txtZipcodeNewUser.Text = dtC.Rows[0]["ch_Zip"].ToString();

            txtCityNewUser.Text = dtC.Rows[0]["vc_city"].ToString();

            if (dtC.Rows[0]["in_CountryID"].ToString() != "")

            {
                ddCountry.ClearSelection();
                if (ddCountry.Items.FindByValue(dtC.Rows[0]["in_CountryID"].ToString()) !=null)
                {
                    ddCountry.Items.FindByValue(dtC.Rows[0]["in_CountryID"].ToString()).Selected = true;
                    ddState.Items.Clear();

                    bindStateList();

                }


            }

            if (dtC.Rows[0]["in_StateID"].ToString() != "")

            {
                ddState.ClearSelection();

                if (ddState.Items.FindByValue(dtC.Rows[0]["in_StateID"].ToString()) != null)
                {
                    ddState.Items.FindByValue(dtC.Rows[0]["in_StateID"].ToString()).Selected = true;
               

                   

                }

            }





                txtContactPhoneNewUser.Text = dtC.Rows[0]["vc_contactPhone"].ToString();
            txtEmailNewUser.Text = dtC.Rows[0]["vc_Email"].ToString();
            txtEmailNewUser.Enabled = false;


            
            txtYearsOfExperience.Text = dtC.Rows[0]["YearsOfBoatExperience"].ToString();

            if (dtC.Rows[0]["Photo_Filename"].ToString() != "")
                personalPhotoPreview.Src = "./clientphotos/" + dtC.Rows[0]["Photo_Filename"].ToString();



            if (dtC.Rows[0]["BoatingLicense"].ToString() == "True")
            {

                ddBoatinLicense.SelectedIndex = 1;

               

            }
            else
                ddBoatinLicense.SelectedIndex = 0;

            txtBoatingExperience.Text = dtC.Rows[0]["Boating_Experience"].ToString();



            if (dtC.Rows[0]["BoatInsurance"].ToString() == "True")
            {

                ddInsuranceCoverage.SelectedIndex = 1;

                txtInsuranceCompany.Text = dtC.Rows[0]["BoatInsurance_Company_Name"].ToString();

                txtInsuranceCompany.Visible = true;
            }
            else
            {
                ddInsuranceCoverage.SelectedIndex = 0;
                txtInsuranceCompany.Visible = false;
            }



            if (dtC.Rows[0]["IsBoatOwner"].ToString() == "True")
            {

                ddBoatOwner.SelectedIndex = 1;

              

            }
            else
                ddBoatOwner.SelectedIndex = 0;




        }





    }



   protected void SavePersonalInfo()
    {

        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_update_client]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@in_ClientID", Session["ClientID"].ToString());
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

                   // cmd.Parameters.AddWithValue("@in_changedBy", Session["userID"].ToString());


                    //cmd.Parameters.AddWithValue("@YearsOfBoatExperience", txtYearsOfExperience.Text);




                    cmd.ExecuteNonQuery();


                //    cmd.Parameters.AddWithValue("@Password", txtNewUserPassword.Text.Trim());


                    //  ------ This is need to updated once the Cleint login
                    //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());


                    //SqlDataReader rd = cmd.ExecuteReader();

                    //if (rd.Read())
                    //    Session[Util.Session_Client_Id] = rd[0].ToString();



                    lblMessagePersonalInfo.Text = "Successfully Saved. ";
                  
                    //rd.Close();

                 

                    // lnkPurchase.Visible = true;

                }
            }


          
        }

        catch (Exception ex)
        {

            lblMessagePersonalInfo.Text = "Error Updating Personnel Information " + ex.Message;

            lblMessagePersonalInfo.ForeColor = System.Drawing.Color.Red;

            //return false;
        }



    }



    void InsertOrUpdateBoatPhotos(string name, string description, string filename, string order)
    {


        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_insert_update_client_boat_pic", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@in_ClientID", Session["ClientID"].ToString());
                    cmd.Parameters.AddWithValue("@Photo_Filename", filename);
                    cmd.Parameters.AddWithValue("@Ordering_No", order);
                    cmd.Parameters.AddWithValue("@Photo_Name", name);
                    cmd.Parameters.AddWithValue("@Photo_Description", description);
                    cmd.Parameters.AddWithValue("@Created_By", Session["UserID"].ToString());
                    cmd.ExecuteNonQuery();





                }
            }
        }
        catch (Exception ex)
        {
            lblMessageBoatInfo.Text = "Error updating database :" + ex.Message;


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
                case "fileupPersonalPhoto":

                    //   Session["fileup1"] = data;
                    string filenamePersonalPhoto = Session["ClientID"].ToString() + "_photo.jpg";

                    fup.SaveAs(Server.MapPath("~/clientphotos/" + filenamePersonalPhoto));

                    //   InsertOrUpdate(txtNamePic.Text, txtDescPic.Text, filename, "0");
                
                    
                    personalPhotoPreview.Visible = true;
                   // personalPhotoPreview.Src = @"./clientphotos/" + filenamePersonalPhoto+"?"+mRandomNumber.ToString();

                    Util.Execute("usp_update_client_photo @in_ClientID=" + Session["ClientID"].ToString() +",@Photo_Filename='" + filenamePersonalPhoto+"'");

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img",
    "top.document.getElementById('personalPhotoPreview').src='./clientphotos/" + filenamePersonalPhoto+"';",
    true);




                    break;

                case "fileup":

                    //   Session["fileup1"] = data;
                    string filename = Session["ClientID"].ToString() + "_Boat_1.jpg";

                    fup.SaveAs(Server.MapPath("~/clientboatphotos/" + filename));

                 InsertOrUpdateBoatPhotos(txtNamePic.Text, txtDescPic.Text, filename, "1");

                    divMainPicPreview.Visible = true;
                   // imgPreviewMainPic.Src = @"./clientboatphotos/" + filename;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img1",
  "top.document.getElementById('imgPreviewMainPic').src='./clientboatphotos/" + filename + "';",
  true);

                    break;

                case "fileup1":

                    string filename1 = Session["ClientID"].ToString() + "_Boat_2.jpg"; 

                    fup.SaveAs(Server.MapPath("~/clientboatphotos/" + filename1));
                    InsertOrUpdateBoatPhotos(txtNamePic1.Text, txtDescPic1.Text, filename1, "2");

                    //  InsertOrUpdate(txtNamePic1.Text, txtDescPic1.Text, filename1, "1");
                    divPic1Preview.Visible = true;
                    //  imgPreviewPic1.Src = @"./clientboatphotos/" + filename1;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img2",
  "top.document.getElementById('imgPreviewPic1').src='./clientboatphotos/" + filename1 + "?" + mRandomNumber.ToString() +"';",
  true);
                    break;

                case "fileup2":

                    string filename2 = Session["ClientID"].ToString() + "_Boat_3.jpg";

                    fup.SaveAs(Server.MapPath("~/clientboatphotos/" + filename2));

                    //InsertOrUpdate(txtNamePic2.Text, txtDescPic2.Text, filename2, "2");
                    InsertOrUpdateBoatPhotos(txtNamePic2.Text, txtDescPic2.Text, filename2, "3");

                    divPic2Preview.Visible = true;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img3",
  "top.document.getElementById('imgPreviewPic2').src='./clientboatphotos/" + filename2 + "';",
  true);
                    break;

                case "fileup3":

                    string filename3 = Session["ClientID"].ToString() + "_Boat_4.jpg";

                    fup.SaveAs(Server.MapPath("~/clientboatphotos/" + filename3));
                    InsertOrUpdateBoatPhotos(txtNamePic3.Text, txtDescPic3.Text, filename3, "4");

                    //  InsertOrUpdate(txtNamePic3.Text, txtDescPic3.Text, filename3, "3");
                    divPic3Preview.Visible = true;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "img4",
   "top.document.getElementById('imgPreviewPic3').src='./clientboatphotos/" + filename3 + "';",
   true);

                    break;

             
            }




         

        }




    }

    protected string UploadFolderPath = "~/clientphotos/";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindCountryList();

            if (Session["ClientID"] !=null)
            {
                divMainPicPreview.Visible = false;
                divPic1Preview.Visible = false;
                divPic2Preview.Visible = false;
                divPic3Preview.Visible = false;


                PopulateClientInfo();

                PopulateBoatPhotos();
                bindPastRentals();

                bindUpcomingRentals();



            }



        }

       

    }

    protected void btnSavePersonalInfo_Click(object sender, EventArgs e)
    {
        SavePersonalInfo();

    }

    protected void btnSaveBoatOwnerInfo_Click(object sender, EventArgs e)
    {

        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_update_client_boat_info]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@in_ClientID", Session["ClientID"].ToString());
                    if (txtYearsOfExperience.Text.Trim() !="")
                    cmd.Parameters.AddWithValue("@YearsOfBoatExperience", txtYearsOfExperience.Text);

                    if (ddBoatOwner.SelectedIndex == 1)
                    cmd.Parameters.AddWithValue("@IsBoatOwner", "1");
                    else
                        cmd.Parameters.AddWithValue("@IsBoatOwner", "0");

                    if (ddInsuranceCoverage.SelectedIndex == 1)
                    { 
                    cmd.Parameters.AddWithValue("@BoatInsurance", "1");
                        cmd.Parameters.AddWithValue("@BoatInsurance_Company_Name", txtInsuranceCompany.Text.Trim());
                    }
                    else
                        cmd.Parameters.AddWithValue("@BoatInsurance", "0");



                    if (ddBoatinLicense.SelectedIndex == 1)
                    {
                        cmd.Parameters.AddWithValue("@BoatingLicense", "1");
                      
                    }
                    else
                        cmd.Parameters.AddWithValue("@BoatingLicense", "0");

                  
                    if (txtBoatingExperience.Text.Trim() !="")
                        cmd.Parameters.AddWithValue("@Boating_Experience", txtBoatingExperience.Text);

                    cmd.Parameters.AddWithValue("@in_changedBy", Session["UserID"].ToString());
                    cmd.ExecuteNonQuery();

                    lblMessageBoatInfo.Text = "Successfully Updated Records.";




                }
            }
        }
        catch (Exception ex)
        {
            lblMessageBoatInfo.Text = "Error updating database :" + ex.Message;


        }


    }

   

    protected void password_modal_save_Click(object sender, EventArgs e)
    {

        lblMessageChangePassword.Text = "";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        if (!Util.IsCurrentPasswordCorrect(current_password.Text, Session["userID"].ToString()))
        {
            lblMessageChangePassword.Text = "Current Password does not match.";
            lblMessageChangePassword.CssClass = "alert alert-warning";
            return;
        }

        if (confirm_password.Text != new_password.Text)
        {

            lblMessageChangePassword.Text = "New Password does not match.";
            lblMessageChangePassword.CssClass = "alert alert-warning";
            return;
        }


        try
        {
            Util.Execute("update tbl_br_user set vc_password='" + confirm_password.Text +"' where in_UserID=" + Session["UserID"].ToString());
            lblMessageChangePassword.Text = "Successfully Changed Password";
            lblMessageChangePassword.CssClass = "alert alert-success";


        }
        catch(Exception ex)
        {
            lblMessageChangePassword.Text = "Failed to update password. " + ex.Message;
            lblMessageChangePassword.CssClass = "alert alert-warning";


        }



    }

    protected void ddInsuranceCoverage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddInsuranceCoverage.SelectedIndex == 1)
            txtInsuranceCompany.Visible = true;
        else
            txtInsuranceCompany.Visible = false;

        ScriptManager.RegisterStartupScript(this, this.GetType(), "adddollar", "CollapseBoatingInfo();", true);


    }
}