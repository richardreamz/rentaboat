using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;
using System.Net;


using System.Security.Authentication;

public partial class TestCreditCard : System.Web.UI.Page
{
    public List<ListItem> Months = new List<ListItem>() {
    new ListItem() { Text="(1)Jan", Value="01" },
    new ListItem() { Text="(2)Feb", Value="02" },
    new ListItem() { Text="(3)Mar", Value="03" },
    new ListItem() { Text="(4)Apr", Value="04" },
    new ListItem() { Text="(5)May", Value="05" },
    new ListItem() { Text="(6)Jun", Value="06" },
    new ListItem() { Text="(7)Jul", Value="07" },
    new ListItem() { Text="(8)Aug", Value="08" },
    new ListItem() { Text="(9)Sep", Value="09" },
    new ListItem() { Text="(10)Oct", Value="10" },
    new ListItem() { Text="(11)Nov", Value="11" },
    new ListItem() { Text="(12)Dec", Value="12" },
};
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddExpMonth.DataSource = Months;
            ddExpMonth.DataTextField = "Text";
            ddExpMonth.DataValueField = "Value";

            ddExpMonth.DataBind();
            ddExpMonth.Items.Insert(0, "");

            ddExpMonth.SelectedIndex = 0;


            for (int i = DateTime.Now.Year; i < DateTime.Now.Year + 15; i++)
                ddExpYear.Items.Add(i.ToString());


            txtCardNumber.Text = "4563310021788207";
            //txtCID.Text = "930";

             txtCID.Text = "140";
            ddExpMonth.SelectedIndex = 3;
            ddExpYear.ClearSelection();

            ddExpYear.Items.FindByValue("2019").Selected = true;
            txtNameOnCard.Text = "Ken hilderbrandt";

        }

    }
    private string ChargeCreditCard(CreditCardDetails cd)

    {
        //  Console.WriteLine("Charge Credit Card Sample");

        ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;

        // define the merchant information (authentication / transaction id)
        ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
        {
            name = "67LD74ev6vSj",
            ItemElementName = ItemChoiceType.transactionKey,
            Item = "6j74c8p3VL5E7jf4",
        };

        var creditCard = new creditCardType
        {
            cardNumber = cd.CreditCardNumber,
            expirationDate = cd.ExpirationDate,
            cardCode = cd.CID

        };

        //standard api call to retrieve response
        var paymentType = new paymentType { Item = creditCard };

        // var customerType = new customerDataType {  };

        orderType ord = new orderType { description = "Boating Renting Website Purchase", invoiceNumber = cd.InvoiceNumber };

        customerAddressType addType = new customerAddressType { firstName = cd.BillingFirstName, lastName = cd.BillingLastName, address = cd.BillingAddress, city = cd.BillingCity, state = cd.BillingState, zip = cd.BillingZip, country = cd.BillingCountry };


        var transactionRequest = new transactionRequestType
        {
            transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card
                                                                                        // Change the Amount
            amount = cd.AmountToCharge,
            //   amount = 1.00m,
            payment = paymentType,
            order = ord,
            billTo = addType

        };


        ServicePointManager.Expect100Continue = true;
        ServicePointManager.DefaultConnectionLimit = 9999;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12 | SecurityProtocolType.Ssl3;

        var request = new createTransactionRequest { transactionRequest = transactionRequest };



        // instantiate the contoller that will call the service
        var controller = new createTransactionController(request);
        controller.Execute();

        // get the response from the service (errors contained if any)
        var response = controller.GetApiResponse();

        string returnResponse = "Failed to Charge Credit Card: Unknown Error";


        if (response == null)
            return returnResponse;



        //else if (response != null)
        //{
        //    Console.WriteLine("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
        //    if (response.transactionResponse != null)
        //    {
        //        Console.WriteLine("Transaction Error : " + response.transactionResponse.errors[0].errorCode + " " + response.transactionResponse.errors[0].errorText);
        //    }
        //}

        //&&  response.messages.resultCode == messageTypeEnum.Ok

        if (response !=null && response.transactionResponse != null && response.transactionResponse.errors != null)
        {
           

            //if (response.transactionResponse != null && response.transactionResponse.errors.Length > 0)
            //{
                return "Failed to Charge the Credit Card: " + response.transactionResponse.errors[0].errorText;
                // Console.WriteLine("Transaction Error : " + response.transactionResponse.errors[0].errorCode + " " + response.transactionResponse.errors[0].errorText);
            //}
        }
        else if (response !=null && response.messages.resultCode == messageTypeEnum.Ok )
        {
            //Console.WriteLine("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
            if (response.transactionResponse != null)
            {
                // Console.WriteLine("Success, Auth Code : " + response.transactionResponse.authCode);

                string res = response.transactionResponse.authCode;

                returnResponse = "OK";

            }

        }


        return returnResponse;

    }


    protected void lnkPurchase_Click(object sender, EventArgs e)
    {

        if (txtNameOnCard.Text == "")
        {
            lblMessage.Text = "Missing Name on the Card <br/>";


        }



        if (txtCardNumber.Text == "")
        {
            lblMessage.Text += "Missing Credit Card Number <br/>";

        }

        if (txtCID.Text == "")
        {
            lblMessage.Text += "Missing CID # <br/>";

        }


        if (ddExpMonth.SelectedIndex == 0 || ddExpMonth.SelectedItem == null)
        {


            lblMessage.Text += "Missing Expiration Month <br/>";

        }


        if (ddExpYear.SelectedIndex == 0 || ddExpYear.SelectedItem == null)
        {


            lblMessage.Text += "Missing Expiration Year <br/>";

        }


        if (lblMessage.Text != "")
        {

            lblMessage.ForeColor = System.Drawing.Color.Red;

            return;

        }








        //string bAdd = txtAddress1NewUser.Text;
        //string bCity = txtCityNewUser.Text;
        //string bState = ddState.SelectedItem.Text;
        //string bCountry = ddCountry.SelectedItem.Text;
        //if (chkBillingAddressDifferent.Checked)
        //{

        //    if (ddBillingState.SelectedIndex == 0 || ddBillingState.SelectedItem == null)
        //    {
        //        lblMessage.Text = "Missing Billing State ";

        //        lblMessage.ForeColor = System.Drawing.Color.Red;

        //        return;
        //    }

        //    if (ddBillingCountry.SelectedIndex == 0 || ddBillingCountry.SelectedItem == null)
        //    {
        //        lblMessage.Text = "Missing Billing Country ";

        //        lblMessage.ForeColor = System.Drawing.Color.Red;

        //        return;
        //    }


        //    bAdd = txtBilingStreetAddress.Text;

        //    bCity = txtBillingCity.Text;
        //    bState = ddBillingState.SelectedItem.Value;
        //    bCountry = ddBillingCountry.SelectedItem.Value;



        //}


        string expDate = "";

        expDate = ddExpMonth.SelectedItem.Value + ddExpYear.SelectedItem.Text.Substring(2, 2);


        string[] name = txtNameOnCard.Text.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);

        string fname = "";
        string lname = "";

        if (name.Length > 1)
        {
            fname = name[0];
            lname = name[1];

        }
        else
        {
            fname = txtNameOnCard.Text;


        }


        CreditCardDetails creditCard = new CreditCardDetails
        {
            AmountToCharge = 0.01m,
            BillingAddress = "320 South Country Road",

            BillingCity = "Brookhaven",
            BillingState = "NY",
            BillingCountry = "USA",
            CreditCardNumber = txtCardNumber.Text.Trim(),
            CID = txtCID.Text,
            ExpirationDate = expDate,
            BillingFirstName = fname,
            BillingLastName = fname

        };


        string resp = "OK";
        //  if (Util.IsProduction)
        resp = ChargeCreditCard(creditCard);

        //  string resp = "OK";

        if (resp != "OK")
        {


            lblMessage.Text = resp;
            lblMessage.ForeColor = System.Drawing.Color.Red;


            return;
        }

        else
        {

              lblMessage.Text = "Successfully Charged from the Credit Card.";
        }
        }
    }

public class CreditCardDetails
{

    public string CreditCardNumber;
    public string CID;
    public string ExpirationDate; //MMYY

    public string InvoiceNumber;
    public string BillingAddress;
    public string BillingFirstName;
    public string BillingLastName;
    public string BillingCity;
    public string BillingState;
    public string BillingCountry;
    public string BillingZip;
    public decimal AmountToCharge;




}
