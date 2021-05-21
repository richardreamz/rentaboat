using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListEmailLog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            refreshdata();

        }

    }

    public void refreshdata()
    {


        DataTable dt = Util.getDataSet("execute usp_get_email_log").Tables[0];

       
        gvEmailSent.DataSource = dt;
        gvEmailSent.DataBind();
        ViewState["dirState"] = dt;
        ViewState["sortdr"] = "Asc";


    }



    protected void gvEmailSent_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dtrslt = (DataTable)ViewState["dirState"];
        if (dtrslt.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            gvEmailSent.DataSource = dtrslt;
            gvEmailSent.DataBind();


        }
    }

    protected void gvEmailSent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //  Button lnkBtn = (Button)e.CommandSource;    // the button
        // GridViewRow myRow = (GridViewRow)lnkBtn.Parent.Parent;  // the row


        

       

        if (e.CommandName == "Resend")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            string id = gvEmailSent.DataKeys[rowIndex].Value.ToString();
            DataTable dt = Util.getDataSet("execute usp_get_email_log_id " + id).Tables[0];
            if (dt.Rows.Count > 0)
            {

                Util.SendEMail(dt.Rows[0]["Email_From"].ToString(), dt.Rows[0]["Email_To"].ToString(), dt.Rows[0]["Email_Subject"].ToString(), dt.Rows[0]["Email_Body"].ToString());


                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Successfully Send Email'); ", true);

            }
                


        }




    }
}