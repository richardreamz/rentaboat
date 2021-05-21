using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for GetZipLookup
/// </summary>
[WebService(Namespace = "http://boatrenting.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class GetZipLookup : System.Web.Services.WebService
{

    public GetZipLookup()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
   
    public  List<AddressLookup> getAddressFromZip(string zipcode)
    {
        List<AddressLookup> lst= new List<AddressLookup>();

        DataTable dt = Util.getDataSet("select zip, in_StateID as state, city from TBL_BR_ZIP Z left outer join TBL_BR_STATE S on Z.State=S.ch_ShortName where zip='"+ zipcode + "' and LL='L'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            lst.Add(new AddressLookup { City=dt.Rows[0]["City"].ToString(), State= dt.Rows[0]["State"].ToString(), ZipCode= dt.Rows[0]["ZIP"].ToString() });
        }
        return lst;

    }

}


public class AddressLookup
{

    public string ZipCode;
    public string State;
    public string Country;
    public string City;


}
