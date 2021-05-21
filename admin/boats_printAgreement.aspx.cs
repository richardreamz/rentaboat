using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_boats_printAgreement : System.Web.UI.Page
{
    public clsOrderSummary orderSummary;



    protected void Page_Init(object sender, EventArgs e)
    {

        orderSummary = clsOrderSummary.getOrderSummary(Session[Util.Session_Cart_Id].ToString());


    }

    protected void Page_Load(object sender, EventArgs e)
    {

     


        if (!Page.IsPostBack)
        {

             



        }


    }
}