#define PROD

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web;



using Google.Apis.YouTube.v3;
using Google.Apis.YouTube.v3.Data;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using System.IO;
using Google.Apis.Upload;
using System.Xml;
using System.Net.Mime;
//using Twilio;


/// <summary>
/// Summary description for Util
/// </summary>
/// 

public struct RentTime
{
  public  string Text;
   public  string Value;

}





public static class Util
{

    public static String ConnString = ConfigurationManager.AppSettings["connectionstring"];

    public static String Session_Selected_MarinaID = "s_MarinaID";
    public static String Session_Selected_BoatID = "s_BoatID";

    public static String Session_Selected_Rating = "s_Rating";

    public static String Session_Cart_Id = "s_Cart_Id";
    public static String Session_Client_Id = "s_Client_Id";


    //public static int EmailPort = 25;
    //public static string EMailServer="209.139.124.12";


#if PROD

    //public static int EmailPort = 25;
    //public static string EMailServer = "localhost";
    //public static string EmailUserName = "";
    //public static string EmailUserPassword = "";



    //public static string EMailServer = "smtp.boatrenting.com";
    //public static int EmailPort = 587;
    //public static string EmailUserName = "Welcome@rentaboat.com";
    //public static string EmailUserPassword = "197669Rj$!!!";

    public static string EMailServer = "relay-hosting.secureserver.net";
    public static int EmailPort = 25;
    public static string EmailUserName = "";
    public static string EmailUserPassword = "";

#else
   
  
     public static string EMailServer = "smtp.gmail.com";
    public static int EmailPort = 587;
      public static string EmailUserName = "boatkennyinfo@gmail.com";
    public static string EmailUserPassword = "passwordboat";
    
#endif




    public static string Session_Selected_RentType = "s_Selected_RentType";
    public static string Session_Selected_PickupDate = "s_Selected_PickupDate";
    public static string Session_Selected_DropOffDate = "s_Selected_DropOffDate";
    public static string Session_Selected_PickupTime = "s_SelectedPickupTime";
    public static string Session_Selected_DropOffTime = "s_SelectedDropOffTime";


    public static string Session_Selected_CalendarView_Index = "s_CV_SelectedCalendarView";
    public static string Session_Selected_CV_Boat_Index = "s_CV_SelectedCalendarViewBoatID";


    public static string Session_Original_Currency_Id = "s_Original_Currency_Id";





#if PROD
    public static bool IsProduction = true;
#else
    public static bool IsProduction = false;

#endif

   /* public static void SendSMSMessage(string phonenumber)
    {

        try
        {
            var accountSid = "ACf740d32e6e38c4a9250c5a0fc8ca1a69"; // Your Account SID from www.twilio.com/console
            var authToken = "7aa3d3b341b35852f7f3791f184b7a92";  // Your Auth Token from www.twilio.com/console

            var twilio = new TwilioRestClient(accountSid, authToken);
            var message = twilio.SendMessage(
                "+16319047292", // From (Replace with your Twilio number)
                "+15162169596", // To (Replace with your phone number)+15162169596
                "Hello from C#"
                );
        }
        catch (Exception)
        {

        }



    }*/

    public static string getBoatOwnerEmail(string boatid, string marinaid)
    {
        DataTable dt = getDataSet("execute usp_get_boat_owner_email " +marinaid).Tables[0];
        string email = "";

        if (dt.Rows.Count > 0)
        {

            email = dt.Rows[0][0].ToString();
        }

        return email;


    }
    public static string formattedAmount(string amount, string currency)
    {
        if (amount == "")
            return "";
        else
        {
            if (currency == "USD")
                return "$" + amount;
            else
                return "&euro;" + amount;

        }

    }
    public static string getRentalType(string captain)
    {
        return (captain == "No" ? "Self Drive / Not Captained " : "Captain");

    }
    public static decimal getExchangeRate(string original)
    {
        decimal multiplier = 0;

        DataTable dt = getDataSet("select  Exchange_Rate , Exchange_Rate_Inverse from TBL_Currency_Exchange").Tables[0];


        if (original == "1" || original =="")
            multiplier = decimal.Parse(dt.Rows[0]["Exchange_Rate"].ToString());
        else
            multiplier = decimal.Parse(dt.Rows[0]["Exchange_Rate_Inverse"].ToString());

        return multiplier;


    }

    public static string getClientIDFromUserID(string userid)
    {

        string clientid = "";

        DataTable dtU = getDataSet("select in_ClientID from tbl_br_user where in_UserID=" + userid).Tables[0];
        if (dtU.Rows.Count > 0)
        {

            clientid = dtU.Rows[0][0].ToString();


        }

        return clientid;




    }


  public    static string  getBoatMainCategoryName(string bcatid)
    {
        string bc = "";

        DataTable dtC = getDataSet("select vc_description from TBL_BR_BOATTYPE where in_boatTypeID=" + bcatid).Tables[0];
        if (dtC.Rows.Count > 0)
        {
            bc = dtC.Rows[0][0].ToString();

        }
        return bc;


    }


    public static string getMarinaName(string marinaid)
    {
        DataTable dtM = getDataSet("select vc_businessName from tbl_br_marina where in_marinaID=" + marinaid).Tables[0];
        if (dtM.Rows.Count > 0)
        {
            return dtM.Rows[0][0].ToString();



        }
        return "";



    }

    public static string GetIPAddress(System.Web.HttpContext context)
    {

        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];


    }


  

    public static void UpdatePayPerClick(string marinaID, string boatid, string ipaddress)
    {
        try
        {

            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_update_pay_per_click]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@in_MarinaID", marinaID);
                    cmd.Parameters.AddWithValue("@in_BoatID", boatid);
                    cmd.Parameters.AddWithValue("@Source_Ip_Address", ipaddress);

                    cmd.ExecuteNonQuery();

                }
            }

                }
        catch(Exception ex)
        {


        }


    }


    public static void LogEMail(string from, string to, string subject, string body, string type)
    {


        try
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_log_email_sent]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email_From", from);
                    cmd.Parameters.AddWithValue("@Email_To", to);
                    cmd.Parameters.AddWithValue("@Email_Subject", subject);
                    cmd.Parameters.AddWithValue("@Email_Body", body);
                    cmd.Parameters.AddWithValue("@Email_Type", type);

                    cmd.ExecuteNonQuery();

                }


            }






        }

        catch(Exception ex)
        {
            Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Exception Occured .. Saving Email Log", "<br/> Exception:" + ex.Message);

        }

    }

    /*
    public static void SendEMailSMTP2Go(string from, string to, string subject, string body)
    {


        string EMailAuthUserName = "manojmathai";
        string EmailAuthPasword = "bXNramxrZmd2MWIw";
        SmtpClient smtp = new SmtpClient();

        smtp.Host = "mail.smtp2go.com";

        smtp.Port = 2525;

        smtp.EnableSsl = true;

        smtp.UseDefaultCredentials = false;

        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

        smtp.Credentials = new NetworkCredential(EMailAuthUserName, EmailAuthPasword);


        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, subject, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;


        smtp.Send(mail);





    }

    */

    public static void SendEMailGoogle(string from, string to, string subject, string body)
    {


          string EMailServer1 = "smtp.gmail.com";
     int EmailPort1 = 587;
     string EmailUserName1 = "boatkennyinfo@gmail.com";
     string EmailUserPassword1 = "passwordboat";


    MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, subject, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;


        SmtpClient smtp = new SmtpClient();
        smtp.Host = EMailServer1;

        //if (!Util.IsProduction)
        //{ 
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential(EmailUserName1, EmailUserPassword1);
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = NetworkCred;
        smtp.Port = EmailPort1;
        // }


        //Sending using Credentials
        smtp.Send(mail);





    }


    public static void SendEmailUsingSMTP2Go(string from, string to, string subject, string body)
    {
        string EMailAuthUserName = "rentaboat";
        string EmailAuthPasword = "Z3g4N2VnaHJ2amsw";
        SmtpClient smtp = new SmtpClient();

        smtp.Host = "mail.smtp2go.com";

        smtp.Port = 2525;

        smtp.EnableSsl = true;

        smtp.UseDefaultCredentials = false;

        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

        smtp.Credentials = new NetworkCredential(EMailAuthUserName, EmailAuthPasword);



        //System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
        ////   message.From = new MailAddress("manoj@leelasoftware.com");
        //message.From = new MailAddress(from);
        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, from, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;





        //Sending using Credentials
        smtp.Send(mail);

    }


    public static void SendEMail(string from, string to, string subject, string body)
    {

        /*
       // SendEMailGoogle("boatkennyinfo@gmail.com", to,subject,body);

    
        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, subject, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;


        SmtpClient smtp = new SmtpClient();
        smtp.Host = EMailServer;

        //if (!Util.IsProduction)
        //{ 
      //  smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential(EmailUserName, EmailUserPassword);
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = NetworkCred;
        smtp.Port = EmailPort;
       // }


        //Sending using Credentials
        smtp.Send(mail);
    
        */

        string EMailAuthUserName = "rentaboat";
        string EmailAuthPasword = "Z3g4N2VnaHJ2amsw";
        SmtpClient smtp = new SmtpClient();

        smtp.Host = "mail.smtp2go.com";

        smtp.Port = 2525;

        smtp.EnableSsl = true;

        smtp.UseDefaultCredentials = false;

        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

        smtp.Credentials = new NetworkCredential(EMailAuthUserName, EmailAuthPasword);



        //System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
        ////   message.From = new MailAddress("manoj@leelasoftware.com");
        //message.From = new MailAddress(from);
        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, from, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;





        //Sending using Credentials
        smtp.Send(mail);

    }

    public static void SendEMail(string from, string to, string subject, string body,  AlternateView htmlView)
    {

        /*
        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, subject, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
       // mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;


      

      //  AlternateView av1 = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
       // av1.LinkedResources.Add(bi);


        mail.AlternateViews.Add(htmlView);

        SmtpClient smtp = new SmtpClient();
        smtp.Host = EMailServer;

        if (!Util.IsProduction)
        {
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential(EmailUserName, EmailUserPassword);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = EmailPort;
        }

        smtp.Send(mail);

        */

        string EMailAuthUserName = "rentaboat";
        string EmailAuthPasword = "Z3g4N2VnaHJ2amsw";
        SmtpClient smtp = new SmtpClient();

        smtp.Host = "mail.smtp2go.com";

        smtp.Port = 2525;

        smtp.EnableSsl = true;

        smtp.UseDefaultCredentials = false;

        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

        smtp.Credentials = new NetworkCredential(EMailAuthUserName, EmailAuthPasword);



        //System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
        ////   message.From = new MailAddress("manoj@leelasoftware.com");
        //message.From = new MailAddress(from);
        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, from, System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;
        mail.AlternateViews.Add(htmlView);




        //Sending using Credentials
        smtp.Send(mail);
    }


    //public static int IsSameDayRentalAllowed(string marinaid)
     public static int IsSameDayRentalAllowed(string boatid)
    {

        DataTable dt = getDataSet("select AllowSameDayRental from TBL_BR_Boat where in_BoatID=" + boatid).Tables[0];
        if (dt.Rows.Count > 0)
        {

            if (dt.Rows[0][0].ToString() == "0")
                return 0;


        }


        return 1;

    }



    public static void DeleteAllStaticHTMLPages(string marinaID,string path)
    {
        try
        {
            var dir = new DirectoryInfo(path);

            foreach (var file in dir.EnumerateFiles("Facility_" + marinaID + "_Boat_*.htm"))
            {
                file.Delete();
            }

        }
        catch (Exception ex)
        {

        }

    }


    public static void DeleteSiteMapElements(string facilityid, string rootpath)
    {

        //try
        //{
            XmlDocument doc = new XmlDocument();

            doc.Load(@rootpath + "/sitemap.xml");

          //  XmlNode findNode;

            XmlElement root = doc.DocumentElement;

            XmlNamespaceManager nsmgr = new XmlNamespaceManager(doc.NameTable);
            nsmgr.AddNamespace("ns", "http://www.sitemaps.org/schemas/sitemap/0.9");
           // string nodestring = "/ns:urlset/ns:url[contains(ns:loc,'mid=" + facilityid + "')]";

        string nodestring = "/ns:urlset/ns:url[contains(ns:loc,'Facility_" + facilityid + "_Boat_')]";

     

          //.Replace("&", "&amp;") 
          //string nodestring ="//urlset/url[.='"+ url.Replace("&", "&amp;") + "']";

          XmlNodeList  findNode = doc.SelectNodes(nodestring, nsmgr);

            //       < loc > http://www.boatrenting.com/client/facilities_faqs.asp</loc>
            //< priority > 0.5 </ priority >
            //< changefreq > daily </ changefreq >
            XmlNode node;
            

            for (int i=0; i < findNode.Count; i++ )
            {

                node = findNode[i];

                node.ParentNode.RemoveChild(node);


            }

         
            if (findNode.Count > 0)
                doc.Save(@rootpath + "/sitemap.xml");

         


        //}
        //catch (Exception ex)
        //{

        //}

    }


    public static void UpdateSiteMap(string url, string rootpath)
    {


        //try
        //{
            XmlDocument doc = new XmlDocument();

            doc.Load(@rootpath + "/sitemap.xml");

            XmlNode findNode;

            XmlElement root = doc.DocumentElement;

            XmlNamespaceManager nsmgr = new XmlNamespaceManager(doc.NameTable);
            nsmgr.AddNamespace("ns", "http://www.sitemaps.org/schemas/sitemap/0.9");
            string nodestring = "/ns:urlset/ns:url[ns:loc='" + url + "']";

            //.Replace("&", "&amp;") 
            //string nodestring ="//urlset/url[.='"+ url.Replace("&", "&amp;") + "']";

            findNode = doc.SelectSingleNode(nodestring, nsmgr);

            //       < loc > http://www.boatrenting.com/client/facilities_faqs.asp</loc>
            //< priority > 0.5 </ priority >
            //< changefreq > daily </ changefreq >

            if (findNode == null)
            {

                XmlElement urlNode = doc.CreateElement("url", "http://www.sitemaps.org/schemas/sitemap/0.9");

                XmlElement locElement = doc.CreateElement("loc", "http://www.sitemaps.org/schemas/sitemap/0.9");
                locElement.InnerText = url;

                urlNode.AppendChild(locElement);


                XmlElement priorityElement = doc.CreateElement("priority", "http://www.sitemaps.org/schemas/sitemap/0.9");
                priorityElement.InnerText = "0.5";
                urlNode.AppendChild(priorityElement);


                XmlElement changeFreqElement = doc.CreateElement("changefreq", "http://www.sitemaps.org/schemas/sitemap/0.9");
                changeFreqElement.InnerText = "daily";

                urlNode.AppendChild(changeFreqElement);

                doc.DocumentElement.AppendChild(urlNode);

                doc.Save(@rootpath + "/sitemap.xml");

            }


        //}
        //catch(Exception ex)
        //{

        //}




    }


    public static string[] getMarinaOpenAndCloseTime(string marinaID, string typerentid, string boatid)
    {

        DataTable dt = getDataSet("select Hours_From,Hours_To, Hours_Military_From, Hours_Military_To  from TBL_BR_PRICExBOATxTYPERENT where in_marinaID=" + marinaID + " and in_boatID=" + boatid + " and in_TypeRentID=" + typerentid).Tables[0];

        string[] marinaTime = new string[] { "9:00 AM", "4:00 PM","0900","1600" };


        if (typerentid == "2")
        {
            marinaTime[0] = "9:00 AM";
            marinaTime[1] = "12:00 PM";
            marinaTime[2] = "0900";
            marinaTime[3] = "1200";


        }
        else if (typerentid == "3")
        {

            marinaTime[0] = "01:00 PM";
            marinaTime[1] = "4:00 PM";
            marinaTime[2] = "1300";
            marinaTime[3] = "1600";
        }

        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["Hours_From"].ToString() != "")
            marinaTime[0] = dt.Rows[0]["Hours_From"].ToString();

            if (dt.Rows[0]["Hours_To"].ToString() != "")
                marinaTime[1] = dt.Rows[0]["Hours_To"].ToString();

            if (dt.Rows[0]["Hours_Military_From"].ToString() != "")
                marinaTime[2] = dt.Rows[0]["Hours_Military_From"].ToString();
            if (dt.Rows[0]["Hours_Military_To"].ToString() != "")
                marinaTime[3] = dt.Rows[0]["Hours_Military_To"].ToString();

        }




        return marinaTime; 



    }


    public static SqlConnection getConnection()
    {


        SqlConnection conn = new SqlConnection(ConnString);



        conn.Open();



        return conn;



    }


public static bool IsUserExists(string username)
    {


        DataTable dtU = getDataSet("select in_userID from TBL_BR_USER where vc_username='" + username +"'" ).Tables[0];

        if (dtU.Rows.Count > 0)
            return true;


        return false;
    }

    

    public static bool IsCurrentPasswordCorrect(string currentpassword, string userid)
    {

        DataTable dt = getDataSet("select in_userid from tbl_br_user where in_userid=" + userid + " and vc_password='" + currentpassword +"'").Tables[0];

        if (dt.Rows.Count > 0)
            return true;
        else
            return false;


    }

    public static bool IsBoatForRenting(string marinaID)
    {
        // ch_feeType = 0 Pay Per Click
        //              =1  Percentage
          //              =2  Flat Rate
          //               = 3 Display Ad

        DataTable dt = getDataSet("select ch_FeeType from TBL_BR_MARINA where in_MarinaID=" + marinaID).Tables[0];

        if (dt.Rows.Count > 0)
        {

            if (dt.Rows[0][0].ToString() == "0" || dt.Rows[0][0].ToString() == "3")
                return false;



        }


        return true;

    }

    public static void Execute(String sql)
    {

        SqlConnection conn = Util.getConnection();

        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();

        conn.Close();




    }


    public static string getCartSessionID(string in_bookDateID)

    {
        string sid = "";

        DataTable dtB = getDataSet("select vc_sessionID from TBL_BR_BOOKDATExBOAT B left outer join TBL_BR_KART K on B.in_kartID =K.in_KartID where B.in_bookDateID=" + in_bookDateID ).Tables[0];

        if (dtB.Rows.Count > 0)
            sid = dtB.Rows[0][0].ToString();


        return sid;
    }



    public static DataSet getDataSet(String sql)
    {

        DataSet dst = new DataSet();

        SqlConnection con = getConnection();
        SqlDataAdapter da = new SqlDataAdapter(sql, con);

        da.SelectCommand.CommandTimeout = 1200;


       da.Fill(dst, "Table");

        con.Close();

        return dst;




    }







}




public class YouTubeUtilities
{

    private String CLIENT_ID { get; set; }
    private String CLIENT_SECRET { get; set; }
    private String REFRESH_TOKEN { get; set; }

    private String UploadedVideoId { get; set; }

    private YouTubeService youtube;

    public YouTubeUtilities(String refresh_token, String client_secret, String client_id)
    {
        CLIENT_ID = client_id;
        CLIENT_SECRET = client_secret;
        REFRESH_TOKEN = refresh_token;

        youtube = BuildService();
    }

    private YouTubeService BuildService()
    {
        ClientSecrets secrets = new ClientSecrets()
        {
            ClientId = CLIENT_ID,
            ClientSecret = CLIENT_SECRET
        };

        var token = new TokenResponse { RefreshToken = REFRESH_TOKEN };
        var credentials = new UserCredential(new GoogleAuthorizationCodeFlow(
            new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = secrets
            }),
            "user",
            token);

        var service = new YouTubeService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credentials,
            ApplicationName = "UploadVideo"
        });

        //service.HttpClient.Timeout = TimeSpan.FromSeconds(360); // Choose a timeout to your liking
        return service;
    }

    public String UploadVideo(Stream stream, String title, String desc, String[] tags, String categoryId, Boolean isPublic)
    {
        //Travel & Events


        var video = new Video();
        video.Snippet = new VideoSnippet();
        video.Snippet.Title = title;
        video.Snippet.Description = desc;
        video.Snippet.Tags = tags;
        video.Snippet.CategoryId = categoryId; // See https://developers.google.com/youtube/v3/docs/videoCategories/list
        video.Status = new VideoStatus();
        video.Status.PrivacyStatus = isPublic ? "public" : "private"; // "private" or "public" or unlisted

        //var videosInsertRequest = youtube.Videos.Insert(video, "snippet,status", stream, "video/*");
        var videosInsertRequest = youtube.Videos.Insert(video, "snippet,status", stream, "video/*");

        // videosInsertRequest.ProgressChanged += insertRequest_ProgressChanged;
        videosInsertRequest.ResponseReceived += insertRequest_ResponseReceived;

        videosInsertRequest.Upload();

        return UploadedVideoId;
    }

    public void DeleteVideo(String videoId)
    {
        var videoDeleteRequest = youtube.Videos.Delete(videoId);
        videoDeleteRequest.Execute();
    }

    void insertRequest_ResponseReceived(Video video)
    {
        UploadedVideoId = video.Id;
        // video.ID gives you the ID of the Youtube video.
        // you can access the video from
        // http://www.youtube.com/watch?v={video.ID}
    }

    void insertRequest_ProgressChanged(Google.Apis.Upload.IUploadProgress progress)
    {
        // You can handle several status messages here.
        switch (progress.Status)
        {
            case UploadStatus.Failed:
                UploadedVideoId = "FAILED";
                break;
            case UploadStatus.Completed:
                break;
            default:
                break;
        }
    }
}


public class HomePagePhotos
{

    private string boatname;
    private string bodyOfWater;
    private string state;
    private string city;
    private string year;
    private string make;
    private string model;
    private string category;
    private string boatSize;
    private string amount;

    private string filename;

    private string filenameDescription;

    private string boatId;
    private string marinaId;

    private string rating;

    private string currencySymbol;



    public HomePagePhotos(string boatname, string BodyOfWater, string state, string city, string year, string make, string model,
        string category, string boatSize, string amount, string filename, string filenameDescription, string boatId, string marinaId, string rating, string currencysymbol)
    {
        this.boatname = boatname;
        this.BodyOfWater = BodyOfWater;
        this.state = state;
        this.city = city;
        this.year = year;
        this.make = make;
        this.model = model;
        this.category = category;
        this.boatSize = boatSize;


        this.amount = amount;
        this.filename = filename;
        this.filenameDescription = filenameDescription;

        this.boatId = boatId;
        this.marinaId = marinaId;
        this.currencySymbol = currencysymbol;


    }

    public string CurrencySymbol
    {
        get
        {
            return currencySymbol;
        }

        set
        {
            currencySymbol = value;
        }

    }
    public string BoatId
    {
        get
        {
            return boatId;
        }
        set
        {
            boatId = value;

        }

    }

    public string MarinaId
    {
        get
        {
            return marinaId;
        }
        set
        {
            marinaId = value;

        }

    }

    public string Rating
    {
        get
        {
            return rating;
        }
        set
        {
            rating = value;

        }

    }

    public string FilenameDescription
    {
        get
        {
            return filenameDescription;
        }
        set
        {
            filenameDescription = value;

        }

    }

    public string BoatName
    {
        get
        {
            return boatname;
        }
        set
        {
            boatname = value;

        }

    }
    public string FileName
    {
        get
        {
            return filename;
        }
        set
        {
            filename = value;

        }

    }


    public string BodyOfWater
    {
        get
        {
            return bodyOfWater;
        }
        set
        {
            bodyOfWater = value;

        }

    }

    public string State
    {
        get
        {
            return state;
        }
        set
        {
            state = value;

        }

    }

    public string City
    {
        get
        {
            return city;
        }
        set
        {
            city = value;

        }

    }

    public string Year
    {
        get
        {
            return year;
        }
        set
        {
            year = value;

        }

    }


    public string Make
    {
        get
        {
            return make;
        }
        set
        {
            make = value;

        }

    }


    public string Model
    {
        get
        {
            return model;
        }
        set
        {
            model = value;

        }

    }


    public string Category
    {
        get
        {
            return category;
        }
        set
        {
            category = value;

        }

    }


    public string BoatSize
    {
        get
        {
            return boatSize;
        }
        set
        {
            boatSize = value;

        }

    }

    public string Amount
    {
        get
        {
            return amount;
        }
        set
        {
            amount = value;

        }

    }


}