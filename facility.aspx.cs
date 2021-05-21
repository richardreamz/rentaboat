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

    public partial class facility_aspx_cs : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["id"] == null || Request.QueryString["id"] == "")
                {
                    Response.Redirect("index.aspx");
                    return;

                }
                else
                {
                    int fid;
                    string fids = Request.QueryString["id"];

                    

                    if (!int.TryParse(fids, out fid))
                    {
                        Response.Redirect("index.aspx");
                        return;
                    }


                  



                    using (SqlConnection con = Util.getConnection())
                    {
                        using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.AddWithValue("@p_in_marinaID",fids);
                            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                            DataSet dst = new DataSet();
                            adapter.Fill(dst);

                            DataTable dt = dst.Tables[0];

                            // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

                            Session["advancedSearchResult"] = dt;

                            Response.Redirect("resultsAdvanced.aspx");


                        }
                    }


                }



            }





        }

    }
}
