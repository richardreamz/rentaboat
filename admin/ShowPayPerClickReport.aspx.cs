using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ShowPayPerClickReport : System.Web.UI.Page
{



    void bindDataGrid()
    {

        gvPayperclick.DataSource = Util.getDataSet("execute usp_get_summary_pay_per_click @month=" + ddMonth.SelectedItem.Value + ",@year=" + ddYear.SelectedItem.Text).Tables[0];
        gvPayperclick.DataBind();




    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userLevelID"] == null || Session["userLevelID"].ToString() != "1")
            Response.Redirect("~/MembersignIn.aspx");



        if (!Page.IsPostBack)
        {
            bindYears();


            if (Session["pay_Month"] != null)
            {
                ddMonth.ClearSelection();

                ddMonth.Items.FindByValue(Session["pay_Month"].ToString()).Selected = true;

                ddYear.ClearSelection();

                ddYear.Items.FindByValue(Session["pay_Year"].ToString()).Selected = true;

                
            }

            bindDataGrid();


        }
    }


    void bindYears()
    {
        int currentYear = DateTime.Now.Year;

        for (int i = 0; i < 5; i++)
            ddYear.Items.Add((currentYear - (5 - i)).ToString());



        for (int i = 0; i < 5; i++)
            ddYear.Items.Add((currentYear + i).ToString());



        ddYear.ClearSelection();
        ddYear.Items.FindByValue(currentYear.ToString()).Selected = true;

        ddMonth.ClearSelection();

        string currentMonth = DateTime.Now.Month.ToString("00");

        ddMonth.Items.FindByValue(currentMonth).Selected = true;


    }


    protected void gvPayperclick_SelectedIndexChanged(object sender, EventArgs e)
    {


        Session["pay_Month"] = ddMonth.SelectedItem.Value;
        Session["pay_Year"] = ddYear.SelectedItem.Text;
        Session["pay_marinaID"] = gvPayperclick.SelectedDataKey.Value.ToString();

        LinkButton lnk = (LinkButton)gvPayperclick.SelectedRow.Cells[0].FindControl("lnkFacilityName");

        Session["pay_facility"] = lnk.Text;

        Response.Redirect("PayPerClickDetails.aspx");


    }

    protected void ddMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDataGrid();
    }

    protected void ddYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDataGrid();

    }


    int TotalNoOfClicks = 0;
    decimal RateTotal = 0.0M;
    decimal TotalAmountDue = 0.0M;

    protected void gvPayperclick_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TotalNoOfClicks += int.Parse(e.Row.Cells[1].Text);
            RateTotal += decimal.Parse(e.Row.Cells[2].Text);

            TotalAmountDue += decimal.Parse(e.Row.Cells[3].Text);


        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {

            e.Row.Cells[1].Text = "Total Clicks: "+ TotalNoOfClicks.ToString();
            e.Row.Cells[2].Text = "Total Rate: " + RateTotal.ToString("c");
            e.Row.Cells[3].Text = "Total Amount Due:" + TotalAmountDue.ToString("c");



        }

    }
}