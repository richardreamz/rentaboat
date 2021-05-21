using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsClientDetails
/// </summary>
public class clsClientDetails
{
    public string ClientFirstName;
    public string ClientLastName;
    public string ClientContactPhone;
    public string ClientEmail;
    public string ClientAddress;
    public string ClientCity;

    public string ClientState;
    public string ClientCountry;
    public string ClientCellPhone;
    public string ClientID;


	public clsClientDetails(string ClientID)
	{
		//
		// TODO: Add constructor logic here
		//

        DataTable dtC = Util.getDataSet("execute [usp_get_client_details]  " + ClientID ).Tables[0];

        if (dtC.Rows.Count > 0)
        {

            this.ClientID = dtC.Rows[0]["in_ClientID"].ToString();
            this.ClientFirstName = dtC.Rows[0]["ClientFirstName"].ToString();

            this.ClientLastName= dtC.Rows[0]["ClientLastName"].ToString();
            this.ClientAddress = dtC.Rows[0]["ClientAddress"].ToString();
            this.ClientCity = dtC.Rows[0]["ClientCity"].ToString();
            this.ClientState = dtC.Rows[0]["ClientState"].ToString();

            this.ClientCountry = dtC.Rows[0]["ClientCountry"].ToString();

            this.ClientEmail = dtC.Rows[0]["ClientEmail"].ToString();

            this.ClientCellPhone = dtC.Rows[0]["ClientCellPhone"].ToString();

        }



	}


    
}