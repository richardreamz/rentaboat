using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BoatRenting
{
    public partial class admin_setHomePagePhotos : System.Web.UI.Page
    {
        protected void ddMarina1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;

            if (dd.ID == "ddMarina1")
                populateBoats(ddBoat1, dd.SelectedItem.Value);

            else if (dd.ID == "ddMarina2")
                populateBoats(ddBoat2, dd.SelectedItem.Value);
            else if (dd.ID == "ddMarina3")
                populateBoats(ddBoat3, dd.SelectedItem.Value);
            else if (dd.ID == "ddMarina4")
                populateBoats(ddBoat4, dd.SelectedItem.Value);



        }
        private void SaveHomeBoat(string boatid, string marinaid, string order)
        {
            try
            {
                Util.Execute("execute [usp_save_home_page_photo] @in_MarinaID=" + marinaid + ", @in_BoatID=" + boatid + ",@Ordering_No=" + order);
                lblMessage.Text = "Successfully updated.";

            }
            catch (Exception ex)
            {

                lblMessage.Text = "Failed update. " + ex.Message;


            }
        }

        void populateCurrentValues()
        {
            DataTable dt = Util.getDataSet("select * from Home_Page_Boats").Tables[0];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["Ordering_No"].ToString() == "1")
                    {
                        ddMarina1.ClearSelection();

                        if (ddMarina1.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()) != null)
                            ddMarina1.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()).Selected = true;

                        populateBoats(ddBoat1, dt.Rows[i]["in_MarinaID"].ToString());

                        ddBoat1.ClearSelection();

                        if (ddBoat1.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()) != null)
                            ddBoat1.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()).Selected = true;



                    }
                    else if (dt.Rows[i]["Ordering_No"].ToString() == "2")
                    {
                        ddMarina2.ClearSelection();


                        if (ddMarina2.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()) != null)
                            ddMarina2.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()).Selected = true;

                        populateBoats(ddBoat2, dt.Rows[i]["in_MarinaID"].ToString());

                        ddBoat2.ClearSelection();

                        if (ddBoat2.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()) != null)
                            ddBoat2.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()).Selected = true;





                    }
                    else if (dt.Rows[i]["Ordering_No"].ToString() == "3")
                    {

                        ddMarina3.ClearSelection();

                        if (ddMarina3.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()) != null)
                            ddMarina3.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()).Selected = true;

                        populateBoats(ddBoat3, dt.Rows[i]["in_MarinaID"].ToString());

                        ddBoat3.ClearSelection();

                        if (ddBoat3.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()) != null)
                            ddBoat3.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()).Selected = true;



                    }
                    else if (dt.Rows[i]["Ordering_No"].ToString() == "4")
                    {
                        ddMarina4.ClearSelection();

                        if (ddMarina4.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()) != null)
                            ddMarina4.Items.FindByValue(dt.Rows[i]["in_MarinaID"].ToString()).Selected = true;
                        populateBoats(ddBoat4, dt.Rows[i]["in_MarinaID"].ToString());

                        ddBoat4.ClearSelection();

                        if (ddBoat4.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()) != null)
                            ddBoat4.Items.FindByValue(dt.Rows[i]["in_BoatID"].ToString()).Selected = true;



                    }

                }


            }

        }

        private void populateHomePhotoDropdowns()
        {


            ddMarina2.DataSource = ddMarina3.DataSource = ddMarina4.DataSource = ddMarina1.DataSource = Util.getDataSet("execute usp_get_all_active_marina").Tables[0];
            ddMarina4.DataTextField = ddMarina3.DataTextField = ddMarina2.DataTextField = ddMarina1.DataTextField = "vc_businessName";
            ddMarina2.DataValueField = ddMarina3.DataValueField = ddMarina4.DataValueField = ddMarina1.DataValueField = "in_marinaID";
            ddMarina1.DataBind();
            ddMarina2.DataBind();
            ddMarina3.DataBind();
            ddMarina4.DataBind();

            ddMarina1.Items.Insert(0, "");
            ddMarina2.Items.Insert(0, "");
            ddMarina3.Items.Insert(0, "");
            ddMarina4.Items.Insert(0, "");

        }


        private void populateBoats(DropDownList dd, string marinaid)
        {
            dd.DataSource = Util.getDataSet("execute usp_get_all_boats_marina @in_marinaID=" + marinaid).Tables[0];
            dd.DataTextField = "vc_name";
            dd.DataValueField = "in_boatID";
            dd.DataBind();

            dd.Items.Insert(0, "");


        }
        private void DeleteHomePagePhoto(string ordering_no)
        {
            try
            {
                Util.Execute("execute us_delete_home_page @Ordering_no=" + ordering_no);

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Failed to remove. Exception : " + ex.Message;

            }
        }

        protected void btnSaveHomePhotos_Click(object sender, EventArgs e)
        {
            if (ddBoat1.SelectedIndex > 0 && ddMarina1.SelectedIndex > 0)
            {
                SaveHomeBoat(ddBoat1.SelectedItem.Value, ddMarina1.SelectedItem.Value, "1");

            }
            else
                DeleteHomePagePhoto("1");

            if (ddBoat2.SelectedIndex > 0 && ddMarina2.SelectedIndex > 0)
            {
                SaveHomeBoat(ddBoat2.SelectedItem.Value, ddMarina2.SelectedItem.Value, "2");

            }
            else
                DeleteHomePagePhoto("2");

            if (ddBoat3.SelectedIndex > 0 && ddMarina3.SelectedIndex > 0)
            {
                SaveHomeBoat(ddBoat3.SelectedItem.Value, ddMarina3.SelectedItem.Value, "3");

            }
            else
                DeleteHomePagePhoto("3");


            if (ddBoat4.SelectedIndex > 0 && ddMarina4.SelectedIndex > 0)
            {
                SaveHomeBoat(ddBoat4.SelectedItem.Value, ddMarina4.SelectedItem.Value, "4");

            }
            else
                DeleteHomePagePhoto("4");







        }


        private void PopulateExchangeRate()
        {
            DataTable dt = Util.getDataSet("select * from TBL_Currency_Exchange where Exchange_Rate_Id=1").Tables[0];
            if (dt.Rows.Count > 0)
            {
                txtConversion.Text = dt.Rows[0]["Exchange_Rate"].ToString();
                lblReverseRate.Text = dt.Rows[0]["Exchange_Rate_Inverse"].ToString();
            }


        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userLevelID"] == null || Session["userLevelID"].ToString() != "1")
                Response.Redirect("~/MembersignIn.aspx");

            if (!Page.IsPostBack)
            {
                populateHomePhotoDropdowns();
                populateCurrentValues();


                PopulateExchangeRate();
            }
        }

        protected void btnSaveExchange_Click(object sender, EventArgs e)
        {
            lblMessageExchangeRate.Text = "";


            try
            {
                if (txtConversion.Text == "")
                {

                    lblMessageExchangeRate.Text = "Can not be empty";
                    return;

                }

                decimal exchange;
                if (!decimal.TryParse(txtConversion.Text.Trim(), out exchange))
                {
                    lblMessageExchangeRate.Text = "Invalid Exchange Rate";
                    return;
                }

                decimal reverseExchange = 1.0M / exchange;
                reverseExchange = Math.Round(reverseExchange, 2);


                Util.Execute("execute usp_update_currency_exchange @Exchange_Rate=" + txtConversion.Text.Trim() + ",@Exchange_Rate_Inverse=" + reverseExchange.ToString());

                PopulateExchangeRate();

            }
            catch(Exception ex)

            {

                lblMessageExchangeRate.Text = "Failed to update : " + ex.Message;

            }


        }
    }

}