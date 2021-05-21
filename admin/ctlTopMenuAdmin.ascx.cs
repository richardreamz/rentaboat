using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ctlTopMenuAdmin : System.Web.UI.UserControl
{
    [WebMethod]
    public static string ValidateLogin(string username, string password)
    {

        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];
        if (dt.Rows.Count > 0)
            return "Success";
        else
            return "Failed";




    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];


        if (dt.Rows.Count > 0)
        {
            String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
            String dotNET = Strings.Right(currentPage, 1);
            String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
            if (dotNET == dotNETdb) { dotNET = ""; }
            Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
            Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
            Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
            Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
            Session.Add("defaultPage",  Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
            Session.Add("userName", dt.Rows[0]["vc_username"].ToString());


            lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

            lblLoginLogout.Text = "Sign out";

            if (dt.Rows[0]["in_userLevelID"].ToString() == "4") // If it is Client
            {

                Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



                Response.Redirect("~/UpdateClientInfo.aspx");
            }

            else
                Response.Redirect(Convert.ToString(Session["defaultPage"]));





        }


    }

    protected void lnkUsername_Click(object sender, EventArgs e)
    {
        if (Session["userLevelID"].ToString() == "4")
        {
            Response.Redirect("~/UpdateClientInfo.aspx");



           /// Response.Redirect("UpdateClientInfo.aspx");
        }

        else if (Session["userLevelID"].ToString() == "1")
            Response.Redirect("~/admin/facilities_list.aspx");

        else if (Session["userLevelID"].ToString() == "2" || Session["userLevelID"].ToString() == "3")
            Response.Redirect("~/admin/FacilityCalendarView.aspx");

        //Response.Redirect("FacilityCalendarView.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!Page.IsPostBack)
        {

            if (Session["userID"] != null && Session["userID"].ToString() != "")
            {
                lblLoginLogout.Text = "Sign out";
                lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

            }
            else
            {
                lblLoginLogout.Text = "Sign in";

            }
        }

        string CtrlID = Request.Form["__EVENTTARGET"];


        if (CtrlID != null && CtrlID.Contains("btnSignIn"))
        {

            if (lblLoginLogout.Text == "Sign in")
                btnSignIn_Click(this, null);
            else
            {
                //Sign out 

                Session.Clear();
                lblLoginLogout.Text = "Sign in";
                Response.Redirect("../index.aspx");




            }

        }

    }
}