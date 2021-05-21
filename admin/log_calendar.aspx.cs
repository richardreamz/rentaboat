using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_log_calendar : System.Web.UI.Page
{
    void bindDataGrid()
    {

        lblShowingRecords.Text = "Displaying Rented Boats for " + ((DateTime)Session["log_Date"]).ToShortDateString();


        DataTable dtGrid = Util.getDataSet("execute usp_get_booked_boats @booked_Date='" + ((DateTime)Session["log_Date"]).ToShortDateString() + "',@BoatID=" + Session["log_BoatID"].ToString() + ",@MarinaID=" + Session["MarinaID"].ToString()).Tables[0];

        gvBookedBoats.DataSource = dtGrid;

        gvBookedBoats.DataBind();

        if (dtGrid.Rows.Count == 0)
            btnDeleteReservation.Visible = false;
        else
            btnDeleteReservation.Visible = true;


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

        Session[Util.Session_Cart_Id] = Util.getCartSessionID(id);


        string url = "boats_printAgreement.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=600,height=600,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);



    }

    protected void btnDeleteReservation_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";

     
        foreach (GridViewRow row in gvBookedBoats.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkDelete") as CheckBox);
                if (chkRow.Checked)
                {
                    string id = gvBookedBoats.DataKeys[row.RowIndex].Value.ToString();

                    try
                    { 
                    Util.Execute("execute usp_delete_booking @in_BookDateID=" + id);
                        lblMessage.Text = "Successfully deleted the reservation.";

                    }

                    catch(Exception ex)
                    {

                        lblMessage.Text = "Error deleting the reservations . " + ex.Message;

                    }


                }
            }
        }

        bindDataGrid();


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