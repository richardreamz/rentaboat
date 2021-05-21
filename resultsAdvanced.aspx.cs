using nce.adosql;
using nce.scripting;
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
using System.Collections.Generic;
using System.Data.SqlClient;
namespace BoatRenting {

  public partial class resultsAdvanced_aspx_cs : System.Web.UI.Page
  {

 


      public int PageNumber
      {

          get
          {
          
          if (ViewState["PageNumber"] !=null)
              return Convert.ToInt32(ViewState["PageNumber"]);
          else

              return 0;

          }

          set
          {
              ViewState["PageNumber"] = value;

          }
      }


      void LoadData()
      {
           DataTable dt = (DataTable) Session["advancedSearchResult"];
              PagedDataSource pgitems = new PagedDataSource();
              DataView dv = new DataView(dt);

              pgitems.DataSource = dv;
              pgitems.AllowPaging = true;
              pgitems.PageSize = 25;
              pgitems.CurrentPageIndex = PageNumber;

              if (pgitems.PageCount > 1)
              {
                  rptPager.Visible = true;
                  ArrayList pages = new ArrayList();
                  for (int i = 0; i < pgitems.PageCount; i++)
                      //pages.Add((i + 1).ToString());
                      pages.Add(new ListItem((i+1).ToString(), (i+1).ToString(), i != PageNumber));

               rptPagerBottom.DataSource=   rptPager.DataSource = pages;
                  rptPager.DataBind();

                  rptPagerBottom.DataBind();


              }
              else
            rptPagerBottom.Visible=      rptPager.Visible = false;

              rpBoatList.DataSource = pgitems;
              rpBoatList.DataBind();


      }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["Lat"] = txtLat.Value;
            Session["Lon"] = txtLon.Value;
            int zcode;
            if (txtLat.Value != "24.55573589999999" && txtLon.Value != "-81.78265369999997")
            {
                if (int.TryParse(txtSearch.Text.Trim(), out zcode))
                Session["zipcode"] = zcode;

            else
                Session["zipcode"] = txtZipCode.Value;

            Session["city"] = txtCityName.Value;

            Session["state"] = txtState.Value;
            Session["searchterm"] = txtSearch.Text;
        }

             else
            {
                Session["Lat"] = "";
                Session["Lon"] = "";
                Session["searchterm"] = "Florida Keys";

            }
            Response.Redirect("Results.aspx?t=2");





      }
      void rptPager_ItemCommand(object source, RepeaterCommandEventArgs e)
      {
          PageNumber = Convert.ToInt32(e.CommandArgument)-1;
          LoadData();
      }
        void rptPagerBottom_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            LoadData();
        }
        protected override void OnInit(EventArgs e)
{
 	 base.OnInit(e);

          rptPager.ItemCommand += new RepeaterCommandEventHandler(rptPager_ItemCommand);
            rptPagerBottom.ItemCommand += new RepeaterCommandEventHandler(rptPagerBottom_ItemCommand);
        }


        public string formattedAmount(decimal amount, string currency)
        {
            if (amount <= 0)
                return "";
            else
            {
                if (currency == "USD")
                    return "$" + amount;
                else
                    return "&euro;" + amount;

            }

        }

      protected void Page_Load(object sender, System.EventArgs e)
      {
          // Put user code to initialize the page here
          if (!Page.IsPostBack)
          {

              LoadData();


             
          }
          ScriptManager.RegisterStartupScript(this, this.GetType(), "PageLoad", "Javascript:initialize();", true);

      }
      private int PageSize = 20;



     


  
      //private void PopulatePager(int recordCount, int currentPage)
      //{
      //    double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
      //    int pageCount = (int)Math.Ceiling(dblPageCount);
      //    List<ListItem> pages = new List<ListItem>();
      //    if (pageCount > 0)
      //    {
      //        for (int i = 1; i <= pageCount; i++)
      //        {
      //            pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
      //        }
      //    }
      //    rptPager.DataSource = pages;
      //    rptPager.DataBind();
      //}
      //protected void Page_Changed(object sender, EventArgs e)
      //{
      //    int pageIndex = int.Parse((sender as LinkButton).CommandArgument);

      //    if ((int)Session["listType"] == 1)
      //        this.getResultPageWiseMarina(pageIndex, Session[Util.Session_Selected_MarinaID].ToString());
      //    else
      //    this.getResultPageWise(pageIndex, txtSearch.Text);
      //}

   
      protected void btnGoDetails_Click(object sender, EventArgs e)
      {
          Session[Util.Session_Selected_MarinaID] = txtSelectedMarinaId.Value;
          Session[Util.Session_Selected_BoatID] = txtSelectedBoatId.Value;

          Session[Util.Session_Selected_Rating] = txtSelectedRating.Value;

            try
            {

                Util.UpdatePayPerClick(txtSelectedMarinaId.Value, txtSelectedBoatId.Value, Util.GetIPAddress(System.Web.HttpContext.Current));

            }

            catch (Exception ex)
            {

            }
            Response.Redirect("Calendar.aspx");

         
      }
}


 

} 
