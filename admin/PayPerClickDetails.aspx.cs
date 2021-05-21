using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_PayPerClickDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {


            lblHeader.Text = "PAY PER CLICK DETAILS FOR <u>" + Session["pay_facility"].ToString().ToUpper() + "</u> FOR THE MONTH OF " + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(int.Parse(Session["pay_Month"].ToString())).ToUpper() + " " + Session["pay_Year"].ToString();


            gvPayperclick.DataSource = Util.getDataSet("execute usp_get_details_pay_per_click @month="+ Session["pay_Month"].ToString() + ",@year=" + Session["pay_Year"].ToString() + ",@in_MarinaID=" + Session["pay_marinaID"].ToString()).Tables[0];


            gvPayperclick.DataBind();


        }


    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowPayPerClickReport.aspx");

    }
}