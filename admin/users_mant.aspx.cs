using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_users_mant : System.Web.UI.Page
{

    private void bindUserLevel()
    {
        ddUserLevel.DataTextField = "vc_description";
        ddUserLevel.DataValueField = "in_userLevelID";
        ddUserLevel.DataSource = Util.getDataSet("execute [SP_BR_USERLEVEL_LIST]").Tables[0];
        ddUserLevel.DataBind();

        ddUserLevel.Items.Insert(0, "-Select-");


    }



    private void PopulateUser()
    {

        DataTable dt = Util.getDataSet("execute SP_BR_USER_GET " + ViewState["UserID"].ToString() ).Tables[0];
        if (dt.Rows.Count > 0)
        {
            txtUsername.Text = dt.Rows[0]["vc_username"].ToString();
            txtPassword.Text = dt.Rows[0]["vc_password"].ToString();
            if (ddUserLevel.Items.FindByValue(dt.Rows[0]["in_userLevelID"].ToString()) !=null)
            {
                ddUserLevel.ClearSelection();

                ddUserLevel.Items.FindByValue(dt.Rows[0]["in_userLevelID"].ToString()).Selected = true;

            }

            txtUsername.ReadOnly = true;



        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            bindUserLevel();

            if (Request.QueryString["UserID"] !=null )
            {
                ViewState["UserID"] = Request.QueryString["UserID"];

                PopulateUser();


            }

        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        lblMessage.Text = "";
        if (txtUsername.Text.Trim() == "" )
        {

            lblMessage.Text = "Enter User Name";

            return;
        }

        if (txtPassword.Text.Trim() == "")
        {

            lblMessage.Text = "Enter Password";

            return;
        }

        if (ddUserLevel.SelectedIndex == 0)
        {

            lblMessage.Text = "Select User Level";
            return;

        }



        if (ViewState["UserID"] == null) // Check if User name already exists
        {

            DataTable dtU = Util.getDataSet("execute [SP_BR_CLIENT_USERNAME_EXISTS] '" + txtUsername.Text.Trim() +"'").Tables[0];
            if (dtU.Rows[0][0].ToString() == "1")
            {
                lblMessage.Text = "User Name already exists. ";

                return;
            }

            
        }



        // Insert a new user
        if (ViewState["UserID"] == null) // Check if User name already exists
        {

            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("[SP_BR_USER_SAVE]", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@P_Action", "N");
                        cmd.Parameters.AddWithValue("@P_IN_MarinaID", Session["MarinaID"].ToString());
                        cmd.Parameters.AddWithValue("@P_IN_UserID", "0");
                        cmd.Parameters.AddWithValue("@P_VC_UserName",txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@P_VC_Password",txtPassword.Text);
                        cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                        cmd.Parameters.AddWithValue("@P_IN_UserLevelID", ddUserLevel.SelectedItem.Value);

                        cmd.ExecuteNonQuery();

                        lblMessage.Text = "Successfully Created User.";

                        Response.Redirect("users_list.aspx");



                    }
                }
            }
            catch(Exception ex)
            {


                lblMessage.Text = "Could not create the user name :" + ex.Message;



            }



                    }

        else // Update user 
        {



            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("[SP_BR_USER_SAVE]", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@P_Action", "E");
                        cmd.Parameters.AddWithValue("@P_IN_MarinaID", Session["MarinaID"].ToString());
                        cmd.Parameters.AddWithValue("@P_IN_UserID", ViewState["UserID"].ToString());
                        cmd.Parameters.AddWithValue("@P_VC_UserName", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@P_VC_Password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                        cmd.Parameters.AddWithValue("@P_IN_UserLevelID", ddUserLevel.SelectedItem.Value);

                        cmd.ExecuteNonQuery();

                        lblMessage.Text = "Successfully Updated User.";

                      



                    }
                }
            }
            catch (Exception ex)
            {


                lblMessage.Text = "Could not update user name :" + ex.Message;



            }



        }






                }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("users_list.aspx");
    }
}