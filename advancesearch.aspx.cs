
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
namespace BoatRenting
{

    public partial class advancesearch_aspx_cs : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindBoatType();
                bindCountries();
                bindBodyOfWater();
                bindMake();



            }

        }


        void bindState()
        {
            if (ddCountry.SelectedIndex > 0)
            {
                ddState.DataSource = Util.getDataSet("execute [SP_BR_STATE_LIST] @CountryID=" + ddCountry.SelectedItem.Value).Tables[0];
                ddState.DataTextField = "vc_name";
                ddState.DataValueField = "in_stateID";
                ddState.DataBind();

                ddState.Items.Insert(0, "-All States-");

            }

        }

        void bindCountries()
        {
            ddCountry.DataSource = Util.getDataSet("execute [SP_BR_COUNTRY_LIST]").Tables[0];
            ddCountry.DataTextField = "vc_name";
            ddCountry.DataValueField = "in_countryID";
            ddCountry.DataBind();

            ddCountry.Items.Insert(0, "-All Countries-");

            if (ddCountry.Items.FindByValue("1") != null)
                ddCountry.Items.FindByValue("1").Selected = true;

            //ddCountry.SelectedIndex = 1;


            bindState();



        }


        void bindBodyOfWater()
        {
            ddBodyOfWater.DataSource = Util.getDataSet("execute [SP_BR_BODYWATER_LIST]").Tables[0];
            ddBodyOfWater.DataTextField = "vc_bodywater";
            ddBodyOfWater.DataValueField = "vc_bodywater";
            ddBodyOfWater.DataBind();

            ddBodyOfWater.Items.Insert(0, "-Any-");



        }


        void bindBoatType()
        {
            ddBoatType.DataSource = Util.getDataSet("execute [SP_BR_BOATTYPE_LIST]").Tables[0];
            ddBoatType.DataTextField = "vc_description";
            ddBoatType.DataValueField = "in_boatTypeID";
            ddBoatType.DataBind();

            ddBoatType.Items.Insert(0, "-Any-");



        }

        void bindMake()
        {
            ddMake.DataSource = Util.getDataSet("execute [SP_BR_BOAT_MAKE] @in_marinaID=0").Tables[0];
            ddMake.DataTextField = "vc_make";
            ddMake.DataValueField = "vc_make";
            ddMake.DataBind();

            ddMake.Items.Insert(0, "-Any-");



        }


        protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddCountry.SelectedIndex > 0)
                bindState();
            else
                ddState.Items.Clear();

        }
        protected void lnkSearch1_Click(object sender, EventArgs e)
        {
            lblMessageBoatLocation.Text = "";



            if (txtMiles.Text.Trim() != "")
            {
                if (txtZip.Text.Trim() == "")
                {

                    lblMessageBoatLocation.Text = "Please provide a Zip code for Radius Search";
                    return;


                }


            }




            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (txtMiles.Text.Trim() == "")
                        if (ddCountry.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_in_countryID", ddCountry.SelectedItem.Value);

                    if (txtMiles.Text.Trim() == "")
                        if (ddState.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_in_stateID", ddState.SelectedItem.Value);


                    if (txtMiles.Text.Trim() == "")
                        if (txtCity.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_vc_city", txtCity.Text.Trim());

                    if (txtZip.Text.Trim() != "")
                    {
                        int zip;

                        if (!int.TryParse(txtZip.Text.Trim(), out zip))
                        {
                            lblMessageBoatLocation.Text = "Invalid Zip code";
                            return;

                        }

                        cmd.Parameters.AddWithValue("@p_ch_zip", txtZip.Text.Trim());

                    }

                    if (txtMiles.Text.Trim() != "")
                    {
                        int miles;

                        if (!int.TryParse(txtMiles.Text.Trim(), out miles))
                        {
                            lblMessageBoatLocation.Text = "Invalid Miles";
                            return;

                        }

                        cmd.Parameters.AddWithValue("@p_in_miles", txtMiles.Text.Trim());

                    }

                  if (txtMiles.Text.Trim() == "")
                    if (ddBodyOfWater.SelectedIndex > 0)
                    {

                        cmd.Parameters.AddWithValue("@p_vc_bodywater", ddBodyOfWater.SelectedItem.Text);

                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dst = new DataSet();
                    adapter.Fill(dst);

                    DataTable dt = dst.Tables[0];

                    // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

                    Session["advancedSearchResult"] = dt;

                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("resultsAdvanced.aspx");
                    }
                    else
                    {
                        lblMessageBoatLocation.Text = "No Records found.";

                    }

                }
            }



        }
        protected void lnkBoatType_Click(object sender, EventArgs e)
        {

            lblMessageBoatType.Text = "";

            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (ddBoatType.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_in_boatTypeID", ddBoatType.SelectedItem.Value);


                    if (txtStartPrice.Text.Trim() != "")
                    {
                        int p1;

                        if (!int.TryParse(txtStartPrice.Text.Trim(), out p1))
                        {
                            lblMessageBoatType.Text = "Invalid Price (Lowest)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_rental_price_from", txtStartPrice.Text.Trim());
                    }
                    if (txtEndPrice.Text.Trim() != "")
                    {
                        int p2;

                        if (!int.TryParse(txtEndPrice.Text.Trim(), out p2))
                        {
                            lblMessageBoatType.Text = "Invalid Price (Highest)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_rental_price_to", txtEndPrice.Text.Trim());
                    }


                    if (txtBoatID.Text.Trim() != "")
                    {
                        int bid;

                        if (!int.TryParse(txtBoatID.Text.Trim(), out bid))
                        {
                            lblMessageBoatType.Text = "Invalid Boat ID (only numbers allowed)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_in_boatid", txtBoatID.Text.Trim());


                    }


                    if (txtFacilityID.Text.Trim() != "")
                    {
                        int fid;

                        if (!int.TryParse(txtFacilityID.Text.Trim(), out fid))
                        {
                            lblMessageBoatType.Text = "Invalid Facility ID (only numbers allowed)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_in_marinaID", txtFacilityID.Text.Trim());


                    }





                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dst = new DataSet();
                    adapter.Fill(dst);

                    DataTable dt = dst.Tables[0];

                    // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

                    Session["advancedSearchResult"] = dt;

                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("resultsAdvanced.aspx");
                    }
                    else
                    {
                        lblMessageBoatType.Text = "No Records found.";

                    }

                }
            }


        }
        protected void lnkByManufacturer_Click(object sender, EventArgs e)
        {

            lblMessageBoatType.Text = "";

            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (ddMake.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_vc_make", ddMake.SelectedItem.Value);

                    if (txtModel.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_vc_model", txtModel.Text.Trim());



                    if (txtYearFrom.Text.Trim() != "")
                    {
                        int p1;

                        if (!int.TryParse(txtYearFrom.Text.Trim(), out p1))
                        {
                            lblMessageBoatType.Text = "Invalid Year (From)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_vc_year_from", txtYearFrom.Text.Trim());
                    }
                    if (txtYearFrom.Text.Trim() != "")
                    {
                        int p2;

                        if (!int.TryParse(txtYearFrom.Text.Trim(), out p2))
                        {
                            lblMessageBoatType.Text = "Invalid Year (To)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_vc_year_to", txtYearTo.Text.Trim());
                    }




                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dst = new DataSet();
                    adapter.Fill(dst);

                    DataTable dt = dst.Tables[0];

                    // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

                    Session["advancedSearchResult"] = dt;

                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("resultsAdvanced.aspx");
                    }
                    else
                    {
                        lblMessageBoatLocation.Text = "No Records found.";

                    }
                }

            }

        }

        protected void lnkSearchAll_Click(object sender, EventArgs e)
        {


            lblMessageBoatLocation.Text = "";
            lblMessageBoatType.Text = "";
            lblMessageByManufacturer.Text = "";
            lblMessage.Text = "";


            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (ddCountry.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_in_countryID", ddCountry.SelectedItem.Value);


                    if (ddState.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_in_stateID", ddState.SelectedItem.Value);

                    if (txtCity.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_vc_city", txtCity.Text.Trim());

                    if (txtZip.Text.Trim() != "")
                    {
                        int zip;

                        if (!int.TryParse(txtZip.Text.Trim(), out zip))
                        {
                            lblMessageBoatLocation.Text = "Invalid Zip code";
                            return;

                        }

                        cmd.Parameters.AddWithValue("@p_ch_zip", txtZip.Text.Trim());

                    }

                    if (txtMiles.Text.Trim() != "")
                    {
                        int miles;

                        if (!int.TryParse(txtMiles.Text.Trim(), out miles))
                        {
                            lblMessageBoatLocation.Text = "Invalid Miles";
                            return;

                        }

                        cmd.Parameters.AddWithValue("@p_in_miles", txtMiles.Text.Trim());

                    }


                    if (ddBodyOfWater.SelectedIndex > 0)
                    {

                        cmd.Parameters.AddWithValue("@p_vc_bodywater", ddBodyOfWater.SelectedItem.Text);

                    }

                    if (ddBoatType.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_in_boatTypeID", ddBoatType.SelectedItem.Value);


                    if (txtStartPrice.Text.Trim() != "")
                    {
                        int p1;

                        if (!int.TryParse(txtStartPrice.Text.Trim(), out p1))
                        {
                            lblMessageBoatType.Text = "Invalid Price (Lowest)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_rental_price_from", txtStartPrice.Text.Trim());
                    }
                    if (txtEndPrice.Text.Trim() != "")
                    {
                        int p2;

                        if (!int.TryParse(txtEndPrice.Text.Trim(), out p2))
                        {
                            lblMessageBoatType.Text = "Invalid Price (Highest)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_rental_price_to", txtEndPrice.Text.Trim());
                    }


                    if (ddMake.SelectedIndex > 0)
                        cmd.Parameters.AddWithValue("@p_vc_make", ddMake.SelectedItem.Value);

                    if (txtModel.Text.Trim() != "")
                        cmd.Parameters.AddWithValue("@p_vc_model", txtModel.Text.Trim());



                    if (txtYearFrom.Text.Trim() != "")
                    {
                        int p1;

                        if (!int.TryParse(txtYearFrom.Text.Trim(), out p1))
                        {
                            lblMessageBoatType.Text = "Invalid Year (From)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_vc_year_from", txtYearFrom.Text.Trim());
                    }
                    if (txtYearFrom.Text.Trim() != "")
                    {
                        int p2;

                        if (!int.TryParse(txtYearFrom.Text.Trim(), out p2))
                        {
                            lblMessageBoatType.Text = "Invalid Year (To)";

                            return;
                        }


                        cmd.Parameters.AddWithValue("@p_vc_year_to", txtYearTo.Text.Trim());
                    }


                    if (txtBoatID.Text.Trim() != "")
                    {
                       


                        int bid;

                        if (!int.TryParse(txtBoatID.Text.Trim(), out bid))
                        {
                            lblMessageBoatType.Text = "Invalid Boat ID (only numbers allowed)";

                            return;
                        }
                        cmd.Parameters.Clear();

                        cmd.Parameters.AddWithValue("@p_in_boatid", txtBoatID.Text.Trim());


                    }


                    if (txtFacilityID.Text.Trim() != "")
                    {
                        int fid;

                        if (!int.TryParse(txtFacilityID.Text.Trim(), out fid))
                        {
                            lblMessageBoatType.Text = "Invalid Facility ID (only numbers allowed)";

                            return;
                        }

                        cmd.Parameters.Clear();

                        cmd.Parameters.AddWithValue("@p_in_marinaID", txtFacilityID.Text.Trim());


                    }



                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dst = new DataSet();
                    adapter.Fill(dst);

                    DataTable dt = dst.Tables[0];

                    // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

                    Session["advancedSearchResult"] = dt;

                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("resultsAdvanced.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "No Records found.";

                    }

                }
            }

        }


        protected void lnkClearAll_Click(object sender, EventArgs e)
        {
            txtZip.Text = "";
            ddCountry.ClearSelection();

            if (ddCountry.Items.FindByValue("1") != null)
                ddCountry.Items.FindByValue("1").Selected = true;
            bindState();
            txtCity.Text = "";
            txtMiles.Text = "";
            ddBodyOfWater.SelectedIndex = 0;
            lblMessageBoatLocation.Text = "";
            ddBoatType.SelectedIndex = 0;
            txtStartPrice.Text = "";
            txtEndPrice.Text = "";
            txtBoatID.Text = "";
            txtFacilityID.Text = "";
            lblMessageBoatType.Text = "";
            ddMake.SelectedIndex = 0;
            txtModel.Text = "";
            txtYearFrom.Text = "";
            txtYearTo.Text = "";
            lblMessageByManufacturer.Text = "";




        }
    }
}
