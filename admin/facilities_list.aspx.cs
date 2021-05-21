using nce.adosql;

using System;

using System.Data;

using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoatRenting {

  public partial class facilities_list_aspx_cs : System.Web.UI.Page
  {

        void BindGrid()
        {

            DataTable dt;

            if (txtFacilityID.Text.Trim() != "")
            {
                int f;
                if (!int.TryParse(txtFacilityID.Text.Trim(), out f))
                {
                    lblMessage.Text = "Invalid Facility ID";

                    return;
                }


                dt = Util.getDataSet("execute [SP_BR_MARINA_FILTER_LIST_NEW] @in_MarinaID=" + txtFacilityID.Text ).Tables[0];



            }
            else
           dt = Util.getDataSet("execute [SP_BR_MARINA_FILTER_LIST_NEW] @PSearchText='" + txtSearchText.Text + "'").Tables[0];

            gvFacilitiesList.DataSource = dt;
            ViewState["rowcount"] = dt.Rows.Count;
            gvFacilitiesList.DataBind();

          


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
            gvFacilitiesList.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            gvFacilitiesList.PageIndex = 0;

            BindGrid();






        }

        protected void gvFacilitiesList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
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
            /* else if (e.Row.RowType == DataControlRowType.Footer)
             {
                 for (int i=1; i < 7; i++)
                 e.Row.Cells.RemoveAt(i);


                 e.Row.Cells[0].ColumnSpan = 7;

                 if (gvFacilitiesList.PageCount-1 == gvFacilitiesList.PageIndex)
                     e.Row.Cells[0].Text = "Displaying :" + (gvFacilitiesList.PageIndex * gvFacilitiesList.PageSize + 1).ToString() + "-" + ViewState["rowcount"].ToString() + " Of " + ViewState["rowcount"].ToString();

                 else
                     e.Row.Cells[0].Text = "Displaying :"+ (gvFacilitiesList.PageIndex*gvFacilitiesList.PageSize+1).ToString() +"-" + (gvFacilitiesList.PageIndex * gvFacilitiesList.PageSize + gvFacilitiesList.PageSize).ToString() + " Of " + ViewState["rowcount"].ToString();



             }*/

            else if ( e.Row.RowType == DataControlRowType.Pager)
            {

               // int currentPage = (int)gvFacilitiesList.PageIndex + 1;

                TableCell newCell = new TableCell();
                newCell.Attributes.Add("style", "width:99%;text-align:right;");
                if (gvFacilitiesList.PageCount - 1 == gvFacilitiesList.PageIndex)
                    newCell.Text  = "Displaying :" + (gvFacilitiesList.PageIndex * gvFacilitiesList.PageSize + 1).ToString() + "-" + ViewState["rowcount"].ToString() + " Of " + ViewState["rowcount"].ToString();

                else
                    newCell.Text = "Displaying :" + (gvFacilitiesList.PageIndex * gvFacilitiesList.PageSize + 1).ToString() + "-" + (gvFacilitiesList.PageIndex * gvFacilitiesList.PageSize + gvFacilitiesList.PageSize).ToString() + " Of " + ViewState["rowcount"].ToString();


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
                string marinaID = gvFacilitiesList.DataKeys[index].Value.ToString();

                Response.Redirect("facilities_mant.aspx?MarinaID=" + marinaID);
            }
            else if (e.CommandName == "Activate")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                //GridViewRow row = gvFacilitiesList.Rows[index];
                string marinaID = gvFacilitiesList.DataKeys[index].Value.ToString();

                Button btnActivateE = (Button)gvFacilitiesList.Rows[index].Cells[11].Controls[1];
                if (btnActivateE.Text == "Off")
                {
                    Response.Redirect("facilities_activate.aspx?MarinaID=" + marinaID);
                }
                else
                {
                    Response.Redirect("facilities_inactivate.aspx?MarinaID=" + marinaID);

                }
            }
            else if (e.CommandName == "Notes")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                //GridViewRow row = gvFacilitiesList.Rows[index];
                string marinaID = gvFacilitiesList.DataKeys[index].Value.ToString();

                Response.Redirect("notes_mant.aspx?MarinaID=" + marinaID);
            }


           

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvFacilitiesList.Rows)
            {
                CheckBox chk = row.Cells[0].Controls[1] as CheckBox;
                if (chk != null && chk.Checked)
                {

                    Util.Execute("[SP_BR_MARINA_DEL] @P_IN_MarinaID=" + gvFacilitiesList.DataKeys[row.RowIndex].Values[0].ToString());

                }
            }

            lblDeleteMessage.Text = "Successfully deleted selected facilities";
            BindGrid();


        }
    }




}
