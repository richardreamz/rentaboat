using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for LoginAuth
/// </summary>
[WebService(Namespace = "http://rentaboat.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class LoginAuth : System.Web.Services.WebService
{

    public LoginAuth()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
   
    public  string ValidateLogin(string username, string password)
    {

        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];
        if (dt.Rows.Count > 0)
            return "Success";
        else
            return "Failed";




    }


   
}
