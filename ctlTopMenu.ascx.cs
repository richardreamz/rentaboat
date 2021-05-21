using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


public partial class ctlTopMenu : System.Web.UI.UserControl
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

    private void RegisterStartupScript(string url)
    {
      //  String csname1 = "PopupScript";
        String csname2 = "ButtonClickScript";
        Type cstype = this.GetType();
        StringBuilder cstext2 = new StringBuilder();
        cstext2.Append("<script type=\"text/javascript\">  {");
        cstext2.Append("window.location =" + url+ " } </");
        cstext2.Append("script>");
        Page.ClientScript.RegisterClientScriptBlock(cstype, csname2, cstext2.ToString(), false);
    }


    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];

        try
        {
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
                Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
                Session.Add("userName", dt.Rows[0]["vc_username"].ToString());

                lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

                lblLoginLogout.Text = "Sign out";

                if (dt.Rows[0]["in_userLevelID"].ToString() == "4")
                {

                    Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



                    Response.Redirect("UpdateClientInfo.aspx", true);

                }

                // else
                // Response.Redirect(Convert.ToString(Session["defaultPage"]));
                else if (Session["userLevelID"].ToString() == "1")
                    Response.Redirect("~/admin/facilities_list.aspx");

                else if (Session["userLevelID"].ToString() == "2" || Session["userLevelID"].ToString() == "3")
                {
                    //  Session["marinaID"].ToString()
                    if (IsProfileComplete())
                    {

                     //   Server.Transfer(ResolveUrl("~/admin/FacilityCalendarView.aspx"));
                        Page.Response.Redirect( ResolveUrl("~/admin/FacilityCalendarView.aspx"), false);
                         //  Context.ApplicationInstance.CompleteRequest();
                           Response.End();
                        //  Context.ApplicationInstance.CompleteRequest();
                      

                      //  RegisterStartupScript(ResolveUrl("~/admin/FacilityCalendarView.aspx"));


                        return;

                    }
                    else
                    {
                        Response.Redirect("~/admin/Facilities_mant.aspx", false);
                   //     Context.ApplicationInstance.CompleteRequest();
                      //  Response.End();
                        return;
                    }

                }




            }
        }
        catch(Exception ex)
        {

        }

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
        if (!Page.IsPostBack)
        {

            if (Session["userID"] != null && Session["userID"].ToString() != "")
            {
                lblLoginLogout.Text = "Sign out";
                if (Session["userName"] != null)
                    lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

            }
            else
            {
                lblLoginLogout.Text = "Sign in";

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
                    Response.Redirect("index.aspx");




                }

            }

        }
        //else
        //{

        //    if (Session["loginRequested"] != null)

        else
        { 
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
                Response.Redirect("index.aspx");




            }

        }
    
         }
        if (Session["userName"] !=null)
        {
                lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";
                lblLoginLogout.Text = "Sign out";
                Session["loginRequested"] = null;

        }




    //    }



      




    }


    public void checkLogin()
    {

        if (Session["userName"] != null)
        {
            lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";
            lblLoginLogout.Text = "Sign out";
            Session["loginRequested"] = null;

        }

       // uplLogin.Update();

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
        {
          //  Session["marinaID"].ToString()
          if (IsProfileComplete())
            Response.Redirect("~/admin/FacilityCalendarView.aspx");
          else
                Response.Redirect("~/admin/Facilities_mant.aspx");

        }
    }
}