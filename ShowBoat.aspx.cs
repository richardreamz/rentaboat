using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowBoat : System.Web.UI.Page
{

  private  bool IsInactiveBoat(string facilityid, string boatid )
    {
        bool IsInactive = true;

        DataSet dst = Util.getDataSet("usp_get_Status_boat_facility @in_boatID=" + boatid + ",@in_marinaId=" + facilityid);

        if (dst.Tables.Count > 0)
              

       
            IsInactive = false;




        return IsInactive;



    }

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {

            if (Request.QueryString["bid"] != null && Request.QueryString["mid"] != null)
            {

                if (IsInactiveBoat(Request.QueryString["mid"], Request.QueryString["bid"]))
                {
                    Response.Redirect("RemovedBoat.aspx");

                }
                else
                {

                    Session[Util.Session_Selected_MarinaID] = Request.QueryString["mid"];
                    Session[Util.Session_Selected_BoatID] = Request.QueryString["bid"];
                    //   Response.Redirect("CalendarLand.aspx");

                    Response.Redirect("Calendar.aspx");
                }

            }


        }
    }
}