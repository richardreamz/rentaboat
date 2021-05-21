using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (inputEmail.Text == "")
        {
            lblMessage.Text = "Please provide the email.";
            return;


        }

        DataTable dtPass = Util.getDataSet("execute usp_get_password_from_username @vc_username='" + inputEmail.Text + "'").Tables[0];

        if (dtPass.Rows.Count > 0)
        {


            // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Forgot Password - " + txtEmailForgotPassword.Text, "User name/Email Address :" + txtEmailForgotPassword.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());

            Util.LogEMail("password@rentaboat.com", inputEmail.Text + ",password@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Forgot Password - " + inputEmail.Text, "User name/Email Address :" + inputEmail.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString(),"Forgot Password");


            Util.SendEMail("password@rentaboat.com", inputEmail.Text + ",password@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Forgot Password - " + inputEmail.Text, "User name/Email Address :" + inputEmail.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());

            lblMessage.Text = "Please check the email for the password. Email sent to " + dtPass.Rows[0]["vc_email"].ToString();
            lblMessage.ForeColor = System.Drawing.Color.Green;

           


        }
        else
        {
            lblMessage.Text = "Email provided does not exists. Please try again. ";
            lblMessage.ForeColor = System.Drawing.Color.Red;

            

        }


    }
}