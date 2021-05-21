using nce.adosql;

using System;

using System.Data;

using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoatRenting {

  public partial class Client_list_aspx_cs : System.Web.UI.Page
  {

        void BindGrid()
        {

            DataTable dt;

            if (txtSearchText.Text.Trim() != "")
            {
                //int f;
                //if (!int.TryParse(txtSearchText.Text.Trim(), out f))
                //{
                //    lblMessage.Text = "Invalid Facility ID";

                //    return;
                //}


                dt = Util.getDataSet("execute [usp_list_all_clients] @PSearchText='" + txtSearchText.Text +"'").Tables[0];



            }
            else
           dt = Util.getDataSet("execute [usp_list_all_clients] ").Tables[0];

            gvClientList.DataSource = dt;
            ViewState["rowcount"] = dt.Rows.Count;
            gvClientList.DataBind();

          


        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();



            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClientList.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            gvClientList.PageIndex = 0;

            BindGrid();






        }

        protected void gvFacilitiesList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           /* if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnActivateE = (Button)e.Row.Cells[11].Controls[1];

                if (DataBinder.Eval(e.Row.DataItem, "ti_Actived") != DBNull.Value)
                {
                    int activated = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "ti_Actived"));

                    if (activated == 1)
                    {
                        btnActivateE.Text = "On";
                    }
                    else
                    {
                        btnActivateE.Text = "Off";
                    }
                }
                else
                {
                    btnActivateE.Text = "Off";
                }

                Button btnNotes = (Button)e.Row.Cells[12].Controls[1];
                btnNotes.Attributes.Add("title", DataBinder.Eval(e.Row.DataItem, "vc_notes").ToString());



            }
           

            else 
            */
            
            if ( e.Row.RowType == DataControlRowType.Pager)
            {

               // int currentPage = (int)gvFacilitiesList.PageIndex + 1;

                TableCell newCell = new TableCell();
                newCell.Attributes.Add("style", "width:99%;text-align:right;");
                if (gvClientList.PageCount - 1 == gvClientList.PageIndex)
                    newCell.Text  = "Displaying :" + (gvClientList.PageIndex * gvClientList.PageSize + 1).ToString() + "-" + ViewState["rowcount"].ToString() + " Of " + ViewState["rowcount"].ToString();

                else
                    newCell.Text = "Displaying :" + (gvClientList.PageIndex * gvClientList.PageSize + 1).ToString() + "-" + (gvClientList.PageIndex * gvClientList.PageSize + gvClientList.PageSize).ToString() + " Of " + ViewState["rowcount"].ToString();


                //newCell.Text = "<span class='pageCount'>Page " + currentPage + " of " + dataGridView.PageCount
                //            + "&nbsp;&nbsp;</span>&nbsp;&nbsp;Go to Page: ";
                Table tbl = (Table)e.Row.Cells[0].Controls[0];
                tbl.Rows[0].Attributes.Add("style", "width:100%;");
                tbl.Attributes.Add("style", "width:100%;");
                tbl.Rows[0].Cells.AddAt(tbl.Rows[0].Cells.Count, newCell);


            }
           
        }

        protected void gvFacilitiesList_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Edit")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                //GridViewRow row = gvFacilitiesList.Rows[index];
                string clientid = gvClientList.DataKeys[index].Value.ToString();

                Session["ClientID"] = clientid;

                Response.Redirect(@"~\UpdateClientInfo.aspx?Cid=" + clientid);
            }
            //else if (e.CommandName == "Activate")
            //{

            //    int index = Convert.ToInt32(e.CommandArgument);

            //    // Retrieve the row that contains the button 
            //    // from the Rows collection.
            //    //GridViewRow row = gvFacilitiesList.Rows[index];
            //    string marinaID = gvClientList.DataKeys[index].Value.ToString();

            //    Button btnActivateE = (Button)gvClientList.Rows[index].Cells[11].Controls[1];
            //    if (btnActivateE.Text == "Off")
            //    {
            //        Response.Redirect("facilities_activate.aspx?MarinaID=" + marinaID);
            //    }
            //    else
            //    {
            //        Response.Redirect("facilities_inactivate.aspx?MarinaID=" + marinaID);

            //    }
            //}
            //else if (e.CommandName == "Notes")
            //{

            //    int index = Convert.ToInt32(e.CommandArgument);

            //    // Retrieve the row that contains the button 
            //    // from the Rows collection.
            //    //GridViewRow row = gvFacilitiesList.Rows[index];
            //    string marinaID = gvClientList.DataKeys[index].Value.ToString();

            //    Response.Redirect("notes_mant.aspx?MarinaID=" + marinaID);
            //}


           

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvClientList.Rows)
            {
                CheckBox chk = row.Cells[0].Controls[1] as CheckBox;
                if (chk != null && chk.Checked)
                {

                    Util.Execute("[SP_BR_MARINA_DEL] @P_IN_MarinaID=" + gvClientList.DataKeys[row.RowIndex].Values[0].ToString());

                }
            }

            lblDeleteMessage.Text = "Successfully deleted selected facilities";
            BindGrid();


        }
    }




}
