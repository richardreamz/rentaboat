using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientSignup : System.Web.UI.Page
{




    private bool UpdateRecord()
    {

        lblMessageNewUserSave.Text = "";

        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_update_client]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());
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

                    //  ------ This is need to updated once the Cleint login
                    //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());


                    cmd.ExecuteNonQuery();

                    lblMessageNewUserSave.Text = "Successfully saved";
                    lblMessageNewUserSave.ForeColor = System.Drawing.Color.Green;



                }
            }

            
        }

        catch (Exception ex)
        {

            lblMessageNewUserSave.Text = "Error while adding to Cart " + ex.Message;

            lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;
            return false;

        }

        return true;


    }

    private bool InsertNewRecord()
    {


        txtNewUserPasswordConfirm.BorderColor = System.Drawing.ColorTranslator.FromHtml("#ccc");


        txtNewUserPasswordConfirm.Attributes.Remove("placeholder");

        //txtUsernameNew.Attributes.Remove("placeholder");

        // Session[Util.Session_Client_Id] =

        //Check if the username exists

        lblMessageNewUserSave.Text = "";
        DataTable dtUSerExists = Util.getDataSet("execute usp_check_if_user_exists @vc_username='" + txtEmailNewUser.Text.Trim() + "'").Tables[0];

        if (dtUSerExists.Rows.Count > 0)
        {


            txtEmailNewUser.BorderColor = System.Drawing.Color.Red;
            txtEmailNewUser.Attributes.Add("placeholder", "Email already exists");


            lblMessageNewUserSave.Text = "Email  exists.";

            lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;
            return false;

        }


        if (txtEmailNewUser.Text.Trim() != txtComfirmEmailNewUser.Text.Trim())
        {

            lblMessageNewUserSave.Text = "Email does not match.";

            lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

            return false;

        }


        if (txtNewUserPassword.Text.Trim() != txtNewUserPasswordConfirm.Text.Trim())
        {

            txtNewUserPasswordConfirm.BorderColor = System.Drawing.Color.Red;
            txtNewUserPasswordConfirm.Attributes.Add("placeholder", "password does not match");


            lblMessageNewUserSave.Text = "Password does not match.";

            lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

            return false;

        }


        //if (ddState.SelectedItem == null || ddState.SelectedIndex < 1)
        //{

        //    lblMessageNewUserSave.Text = "Please select a State.";

        //    lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

        //    return false;

        //}

        //if (ddCountry.SelectedItem == null || ddCountry.SelectedIndex < 1)
        //{

        //    lblMessageNewUserSave.Text = "Please select a Country.";

        //    lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

        //    return false;

        //}



        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_insert_client]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@vc_firstName", txtFirstNameNewUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@vc_lastName", txtLastNameNewUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@vc_address", txtAddress1NewUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@vc_address2", txtAddress2NewUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@vc_city", txtCityNewUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@ch_Zip", txtZipcodeNewUser.Text.Trim());


                    if (ddState.SelectedIndex > 0)
                    cmd.Parameters.AddWithValue("@in_stateID", ddState.SelectedItem.Value);

                    if (ddCountry.SelectedIndex > 0)
                    cmd.Parameters.AddWithValue("@in_countryID", ddCountry.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@vc_contactPhone", txtContactPhoneNewUser.Text.Trim());

                    cmd.Parameters.AddWithValue("@vc_email", txtEmailNewUser.Text.Trim());

                    cmd.Parameters.AddWithValue("@vc_username", txtEmailNewUser.Text.Trim());



                    cmd.Parameters.AddWithValue("@Password", txtNewUserPassword.Text.Trim());


                    //  ------ This is need to updated once the Cleint login
                    //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());


                    SqlDataReader rd = cmd.ExecuteReader();

                    if (rd.Read())
                        Session[Util.Session_Client_Id] = rd[0].ToString();



                    lblMessageNewUserSave.Text = "Successfully Saved. Proceed to Step 5 for Payment.";
                    lblMessageNewUserSave.ForeColor = System.Drawing.Color.Green;

                    rd.Close();


                    DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtEmailNewUser.Text + "' , @p_vc_password='" + txtNewUserPassword.Text + "'").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        String currentPage = HttpContext.Current.Request.Url.AbsolutePath;

                        Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
                        Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
                        Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
                        Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
                       // Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
                        Session.Add("userName", dt.Rows[0]["vc_username"].ToString());

                        Response.Redirect("AskQuestionBoat.aspx");


                    }


                        // Response.Redirect("MemberSignIn.aspx?askq=1");


                        // lnkPurchase.Visible = true;

                    }
            }


        }

        catch (Exception ex)
        {

            lblMessageNewUserSave.Text = "Error while adding to Cart " + ex.Message;

            lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

            return false;
        }



        return true;


    }


    bool UpdateOrInsertClientRecord()
    {


        if (Session[Util.Session_Client_Id] != null)
        {

            return UpdateRecord();

        }

        else
        {

            return InsertNewRecord();


        }


    }

    protected void lnkCreateNewUser_Click(object sender, EventArgs e)
    {




        if (Session[Util.Session_Client_Id] != null)
        {

            UpdateRecord();

        }

        else
        {

            InsertNewRecord();


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
    void BindCountryList()
    {


        DataTable dtC = Util.getDataSet("execute [SP_BR_COUNTRY_LIST] ").Tables[0];

       ddCountry.DataSource = dtC;


        ddCountry.DataTextField = "vc_name";
        ddCountry.DataValueField = "in_countryID";

        ddCountry.DataBind();

      


        ddCountry.Items.Insert(0, "Select a Country");

        if (ddCountry.Items.FindByValue("1") != null)
            ddCountry.Items.FindByValue("1").Selected = true;


        //   ddCountry.SelectedIndex = 1;



        bindStateList();
      


        //ddState.Items.Clear();

        //ddBillingState.Items.Clear();



    }

    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindStateList();
        
    }
  
    [WebMethod]
    public static string ValidateLogin(string username, string password)
    {

        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];
        if (dt.Rows.Count > 0)
            return "Success";
        else
            return "Failed";




    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindCountryList();

        }
        
    }
}