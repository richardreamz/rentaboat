using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ctlNoRentingInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }



    public void setAddress(string address)
    {
        lblAddressMarina.Text = address;



    }

    public void setName(string name)
    {

        lblMarinaName.Text = name;

    }


    public void setPhonenumber(string phone)
    {

        lblMarinaNUmber.Text = phone;



    }


    public void setWebsitePage(string landingpage, string website)
    {

        if (landingpage == "" && website == "")
        {
            lnkMoreInfo.Visible = false;
        }
        else if (landingpage == "")
        {
            // lnkMoreInfo.PostBackUrl = website;

            if (!website.StartsWith("http"))
                website = "http://" + website;

            lnkMoreInfo.Attributes.Add("href", website);
            lnkMoreInfo.Attributes.Add("target", "_blank");
        }
        else
        {
            if (!landingpage.StartsWith("http"))
                landingpage = "http://" + landingpage;

            //lnkMoreInfo.PostBackUrl = landingpage;
            lnkMoreInfo.Attributes.Add("href", landingpage);
            lnkMoreInfo.Attributes.Add("target", "_blank");
        }


    }
    public void PopulateFields()
    {




    }
}