using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ExecuteSQLQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRun_Click(object sender, EventArgs e)
    {

        try
        {

            Util.Execute(txtSQLQuery.Text);

            lblMessage.Text = "Successfully executed";



        }

        catch(Exception ex)
        {

            lblMessage.Text = "Failed to execute :" + ex.Message;

        }

    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        gvList.DataSource = Util.getDataSet(txtSQLQuery.Text);
        gvList.DataBind();

    }
}