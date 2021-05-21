using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_log_calendar_available : System.Web.UI.Page
{
    void bindDataGrid()
    {

        lblShowingRecords.Text = "Displaying Available Boats for " + ((DateTime)Session["log_Date"]).ToShortDateString();


        DataTable dtGrid = Util.getDataSet("execute [SP_BR_KART_FILTER_AVAILABLE_LIST_ADMIN]  @Date1='" + ((DateTime)Session["log_Date"]).ToShortDateString() + "', @To='" + ((DateTime)Session["log_Date"]).ToShortDateString() + "',@BoatID=" + Session["log_BoatID"].ToString() + ",@MarinaID=" + Session["MarinaID"].ToString()).Tables[0];

        gvBookedBoats.DataSource = dtGrid;

        gvBookedBoats.DataBind();

       


    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {


            string month = Request.QueryString["mm"];
            string day = Request.QueryString["dd"];
            string year = Request.QueryString["aaaa"];
            string boatID = Request.QueryString["BoatID"];
            DateTime dt = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
            
         Session["log_Date"] = dt;
            Session["log_BoatID"] = boatID;


                bindDataGrid();

        }



    }

    protected void gvBookedBoats_SelectedIndexChanged(object sender, EventArgs e)
    {

        string id = gvBookedBoats.SelectedDataKey.Value.ToString();

        Response.Redirect("calendarAdmin.aspx?bid=" + id);





    }

  

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calendar.aspx");
    }

    protected void btnPreviousDay_Click(object sender, EventArgs e)
    {
        Session["log_Date"] =((DateTime)Session["log_Date"]).AddDays(-1);
        bindDataGrid();

    }

    protected void btnNextDay_Click(object sender, EventArgs e)
    {

        Session["log_Date"] = ((DateTime)Session["log_Date"]).AddDays(1);
        bindDataGrid();

    }
}