using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ctlBoatQuestions : System.Web.UI.UserControl
{
    void bindDataGrid()
    {
        gvQuestions.DataSource = Util.getDataSet("execute usp_get_questions_answers @in_MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() +",@in_BoatID="+ Session[Util.Session_Selected_BoatID].ToString()).Tables[0];
        gvQuestions.DataBind();



    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bindDataGrid();

        }

    }

    protected void btnSignInAskQuestion_Click(object sender, EventArgs e)
    {
        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];


        if (dt.Rows.Count > 0)
        {
            String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
           // String dotNET = Strings.Right(currentPage, 1);
          //  String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
          //  if (dotNET == dotNETdb) { dotNET = ""; }
            Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
            Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
            Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
            Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
           // Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
            Session.Add("userName", dt.Rows[0]["vc_username"].ToString());

           // lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

            //lblLoginLogout.Text = "Sign out";

            //if (dt.Rows[0]["in_userLevelID"].ToString() == "4")
            //{

            //    Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



            //    Response.Redirect("UpdateClientInfo.aspx");
            //}

            //else
            //    Response.Redirect(Convert.ToString(Session["defaultPage"]));


            Response.Redirect("Calendar.aspx?scroll=1");


        }


    }


    protected void btnAskQuestion_Click(object sender, EventArgs e)
    {
        if (Session["userLevelID"] == null )
        {
             Response.Redirect("MemberSignInRq.aspx?askq=1");

           

            return;
        }

        Response.Redirect("AskQuestionBoat.aspx");
    }

    bool DisplayAnswerButton()
    {
        bool d = false;

        if (Session["userLevelId"] != null && Session["userLevelID"].ToString() == "1")
            d = true;
        else if (Session["userLevelId"] != null && Session["MarinaID"] !=null)
        {
            if (Session["MarinaID"].ToString() == Session[Util.Session_Selected_MarinaID].ToString())
                d = true;


        }

            return d;

    }


    protected void gvQuestions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
           if (DisplayAnswerButton())
            { 
            string qid = gvQuestions.DataKeys[e.Row.RowIndex].Values[0].ToString();

            HyperLink h =(HyperLink)  e.Row.FindControl("lnkAnswer");
            h.NavigateUrl = "./AnswerQuestionBoat.aspx?qid=" + qid;
            }
           else
            {
                HyperLink h = (HyperLink)e.Row.FindControl("lnkAnswer");
                if (h != null)
                    h.Visible = false;

            }
        }

    }

    protected void btnBoatOwnerLogin_Click(object sender, EventArgs e)
    {
         ScriptManager.RegisterStartupScript(this, this.GetType(), "showloginask", "showLoginBoxAskQuestion();", true);

       // Response.Redirect("");

    }
}