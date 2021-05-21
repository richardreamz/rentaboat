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
namespace BoatRenting {

  public partial class logout_aspx_cs : System.Web.UI.Page
  {
    public void Page_Load(object _sender, EventArgs _e) 
    {
        Session.Abandon();
        Response.Redirect("../index.aspx");
    }


  }

} 
