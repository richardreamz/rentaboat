using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ctlBoatQuestionsAdmin : System.Web.UI.UserControl
{
    void showAllQuestions()
    {
        DataTable dt = Util.getDataSet("execute usp_get_questions_answers @in_MarinaID=" + Session[Util.Session_Selected_MarinaID].ToString() + ",@in_BoatID=" + Session[Util.Session_Selected_BoatID].ToString()).Tables[0];

        if (dt.Rows.Count == 0)
        {
            TableRow row = new TableRow();
            TableCell c1 = new TableCell();
            c1.Text = "No Questions asked about this boat";
            row.Cells.Add(c1);
            tblQuestion.Rows.Add(row);


        }
        else
        {
            for (int i=0; i < dt.Rows.Count; i++)
            {
                Label lblQuestion = new Label();
                lblQuestion.Text = dt.Rows[i]["Question"].ToString() + "<br/>" + dt.Rows[i]["Created_Date"].ToString();
                TextBox txtAnswer = new TextBox();
                txtAnswer.TextMode = TextBoxMode.MultiLine;
                txtAnswer.Rows = 4;
                txtAnswer.Width = 700;

                txtAnswer.ID = "txt" + dt.Rows[i]["question_id"].ToString();

                // txtAnswer.Attributes.Add("onfocus", "WaterMarkFocus(this, 'Type your answer here.')");
                // txtAnswer.Attributes.Add("onblur", "WaterMarkBlur(this, 'Type your answer here.')");

                txtAnswer.Attributes.Add("placeholder","Type your answer here.");

                txtAnswer.Text = dt.Rows[i]["Answer"].ToString().Replace("Answer: ","");

                Button btn = new Button();
                btn.Text = "Send and Post";
                btn.ID ="btn"+ dt.Rows[i]["question_id"].ToString();
                btn.Click += Btn_Click;

                TableRow row = new TableRow();
                TableCell c1 = new TableCell();
                c1.Controls.Add(lblQuestion);
                c1.Controls.Add(new LiteralControl("<br />"));
                c1.Controls.Add(txtAnswer);
                c1.Controls.Add(new LiteralControl("<br />"));
                c1.Controls.Add(btn);
                row.Cells.Add(c1);
                tblQuestion.Rows.Add(row);



            }

        }
    }

    private string ValidateInput(string value, string fieldname)
    {
        string valid = "";

        string regPhone = @"\W*?(\([0-9]{3}\)|[0-9]{3}-)*([0-9]{3}-|[0-9]{3})[0-9]{4}\W*";
        string regWebAddres = @"\W*(\.com|\.COM|\.net|\.NET|\.org|\.ORG)\W*";



        if (Regex.IsMatch(value, regPhone))
        {

            if (!value.Contains("631-286-7816"))
                valid = fieldname + " contains Phone Number. <br/>";

        }
        if (Regex.IsMatch(value, regWebAddres))
        {
            if (!value.Contains("www.rentaboat.com"))
                valid = fieldname + " contains Web Address. <br/>";

        }
        return valid;

    }



    private void Btn_Click(object sender, EventArgs e)
    {
      Button btn=  (Button)sender;
        if (btn  !=null)
        {
            string qid = btn.ID.Replace("btn", "");

            TextBox txtAnswer =(TextBox) tblQuestion.FindControl("txt"+qid);

            string errormessage = "";


            errormessage += ValidateInput(txtAnswer.Text, "Answer  ");

            if (errormessage != "")
            {
              //  lblMessage.Text = errormessage;

                lblpopupHeader.Text = "Failed";
                lblPopupContent.Text = errormessage;

                lblPopupContent.ForeColor = System.Drawing.Color.Red;

                divHeader.Attributes.Add("style", "background-color: red; color: white; font-size: medium;");
               // lblMessage.Text = "Could not Send Question due to technical difficulties. Reason: " + ex.Message;
                mdlSuccess.Show();

                return;
            }


            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_answer_question", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Question_Id", qid);
                        cmd.Parameters.AddWithValue("@Answer", txtAnswer.Text);
                        cmd.Parameters.AddWithValue("@Answered_By", Session["userID"].ToString());
                        cmd.ExecuteNonQuery();
                        //  lblMessage.Text = "Successfully saved ";

                        lblpopupHeader.Text = "Success";
                        lblPopupContent.Text = "Succsessfully Send answer to the question and posted answer to the site.";

                        divHeader.Attributes.Add("style", "background-color: green; color: white; font-size: medium;");
                        lblPopupContent.ForeColor = System.Drawing.Color.Green;

                        SendEmailToClient(qid);


                        mdlSuccess.Show();


                       


                    }
                }
            }
            catch (Exception ex)
            {
                lblpopupHeader.Text = "Failed";
                lblPopupContent.Text = "Could not send question due to technical difficulties. Reason: " + ex.Message;

                lblPopupContent.ForeColor = System.Drawing.Color.Red;

                divHeader.Attributes.Add("style", "background-color: red; color: white; font-size: medium;");
              //  lblMessage.Text = "Could not Send Question due to technical difficulties. Reason: "+ ex.Message ;
                mdlSuccess.Show();

            }

        }
    }
    void SendEmailToClient(string qid)
    {

        //string emailowner = Util.getBoatOwnerEmail(Session[Util.Session_Selected_BoatID].ToString(), Session[Util.Session_Selected_MarinaID].ToString());

        DataTable tblc = Util.getDataSet("execute usp_get_question_details " + qid).Tables[0];



       
        string clientname = "";
        string clientemail = "";

        if (tblc.Rows.Count > 0)
        {
            clientname = tblc.Rows[0]["vc_firstname"].ToString();
            clientemail = tblc.Rows[0]["vc_email"].ToString();
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/BoatOwnerAnswerEmail.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{ClientName}", clientname);

            body = body.Replace("{BoatID}", tblc.Rows[0]["in_boatID"].ToString());
            body = body.Replace("{BoatName}", tblc.Rows[0]["vc_name"].ToString());
            body = body.Replace("{BoatMake}", tblc.Rows[0]["vc_make"].ToString());

            body = body.Replace("{BoatModel}", tblc.Rows[0]["vc_model"].ToString());

            body = body.Replace("{BoatYear}", tblc.Rows[0]["vc_year"].ToString());

            body = body.Replace("{BoatSize}", tblc.Rows[0]["vc_size"].ToString());

            body = body.Replace("{Question}", tblc.Rows[0]["Question"].ToString());

            body = body.Replace("{Answer}", tblc.Rows[0]["Answer"].ToString());

            body = body.Replace("{boatUrlCalendar}", "https://www.rentaboat.com/ShowBoat.aspx?mid=" + tblc.Rows[0]["in_MarinaID"].ToString() + "&bid=" + tblc.Rows[0]["in_BoatID"].ToString());


            string boatImagePath = Server.MapPath("").Replace("\\admin","") +"\\boats\\" + tblc.Rows[0]["vc_filename"].ToString();




            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(body, null, "text/html");


            LinkedResource bi = new LinkedResource(boatImagePath);
            bi.ContentId = "BoatImage";

            htmlView.LinkedResources.Add(bi);

        
            if (Util.IsProduction)
                Util.SendEMail("Question@rentaboat.com", clientemail + ",Question@rentaboat.com,enngines@aol.com", "A Question is asked about your Boat!", body, htmlView);
            else

                Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Got answer to your Question ", body, htmlView);



        }






    }

    protected void Page_Load(object sender, EventArgs e)
    {

        showAllQuestions();
    }
}