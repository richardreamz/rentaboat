using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ctlAdminMenuSuper : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            if (Session["userLevelID"].ToString() == "2")
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideAdmin", "HideAdminMenu()", true);



        }


    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/index.aspx");

    }
}