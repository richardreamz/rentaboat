using Microsoft.VisualBasic;
using nce.adosql;
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
using System.Xml;
namespace BoatRenting
{

    public partial class rental_tips : System.Web.UI.Page
    {
        public string con = "";
        public Connection oConn = null;
        //------Constantes----'
        //---- DataTypeEnum Values ----'
        public const int adEmpty = 0;
        public const int adTinyInt = 16;
        public const int adSmallInt = 2;
        public const int adInteger = 3;
        public const int adBigInt = 20;
        public const int adUnsignedTinyInt = 17;
        public const int adUnsignedSmallInt = 18;
        public const int adUnsignedInt = 19;
        public const int adUnsignedBigInt = 21;
        public const int adSingle = 4;
        public const int adDouble = 5;
        public const int adCurrency = 6;
        public const int adDecimal = 14;
        public const int adNumeric = 131;
        public const int adBoolean = 11;
        public const int adError = 10;
        public const int adUserDefined = 132;
        public const int adVariant = 12;
        public const int adIDispatch = 9;
        public const int adIUnknown = 13;
        public const int adGUID = 72;
        public const int adDate = 7;
        public const int adDBDate = 133;
        public const int adDBTime = 134;
        public const int adDBTimeStamp = 135;
        public const int adBSTR = 8;
        public const int adChar = 129;
        public const int adVarChar = 200;
        public const int adLongVarChar = 201;
        public const int adWChar = 130;
        public const int adVarWChar = 202;
        public const int adLongVarWChar = 203;
        public const int adBinary = 128;
        public const int adVarBinary = 204;
        public const int adLongVarBinary = 205;
        public const int adChapter = 136;
        public const int adFileTime = 64;
        public const int adPropVariant = 138;
        public const int adVarNumeric = 139;
        public const int adArray = 0x2000;
        //---- CommandTypeEnum Values ------------'
        public const int adCmdStoredProc = 0x0004;
        //---- ParameterDirectionEnum Values ----'
        public const int adParamInput = 0x0001;
        public const int adParamOutput = 0x0002;
        public string sMes = "";
        public string varSession = "";
        public int i = 0;
        public object countryID = null;
        public object facilityID = null;
        public object boatID = null;
        public object bodyID = null;
        public string cityVAL = "";
        public string zipVAL = "";
        public Command cmd = null;
        public Recordset rs = null;
        public object c12 = null;
        public object c8 = null;
        public object c10 = null;
        public object c9 = null;
        public object c1 = null;
        public object c13 = null;
        public object c7 = null;
        public object c4 = null;
        public object c11 = null;
        public object c2 = null;
        public object c6 = null;
        public object c5 = null;
        public int IntMostrados = 0;
        //*************
        public string debugTEST_Kart = "";
        public string debugTEST_clientID = "";
        //*************
        protected void Page_Load(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "PageLoad", "Javascript:initialize();", true);

        }

        private bool IsProfileComplete()
        {
            bool complete = true;

            DataTable dtC = Util.getDataSet("execute usp_is_profile_complete @marinaID=" + Session["MarinaID"].ToString()).Tables[0];

            if (dtC.Rows.Count == 0)
                complete = false;



            return complete;

        }
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];

            try
            {
                if (dt.Rows.Count > 0)
                {
                    String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
                    String dotNET = Strings.Right(currentPage, 1);
                    String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
                    if (dotNET == dotNETdb) { dotNET = ""; }
                    Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
                    Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
                    Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
                    Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
                    Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
                    Session.Add("userName", dt.Rows[0]["vc_username"].ToString());

                    // lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

                    //    lblLoginLogout.Text = "Sign out";

                    if (dt.Rows[0]["in_userLevelID"].ToString() == "4")
                    {

                        Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



                        Response.Redirect("UpdateClientInfo.aspx", true);

                    }

                    // else
                    // Response.Redirect(Convert.ToString(Session["defaultPage"]));
                    else if (Session["userLevelID"].ToString() == "1")
                        Response.Redirect("~/admin/facilities_list.aspx");

                    else if (Session["userLevelID"].ToString() == "2" || Session["userLevelID"].ToString() == "3")
                    {
                        //  Session["marinaID"].ToString()
                        if (IsProfileComplete())
                        {

                            //   Server.Transfer(ResolveUrl("~/admin/FacilityCalendarView.aspx"));
                            Page.Response.Redirect(ResolveUrl("~/admin/FacilityCalendarView.aspx"), false);
                            //  Context.ApplicationInstance.CompleteRequest();
                            Response.End();
                            //  Context.ApplicationInstance.CompleteRequest();


                            //  RegisterStartupScript(ResolveUrl("~/admin/FacilityCalendarView.aspx"));


                            return;

                        }
                        else
                        {
                            Response.Redirect("~/admin/Facilities_mant.aspx", false);
                            //     Context.ApplicationInstance.CompleteRequest();
                            //  Response.End();
                            return;
                        }

                    }




                }
            }
            catch (Exception ex)
            {

            }

        }

        public string NVL(object InputValue, string NullReplaceValue)
        {
            string NVL = "";
            if (Convert.IsDBNull(InputValue))
            {
                NVL = NullReplaceValue;
            }
            else
            {
                if ((Convert.ToString(InputValue).Trim()).Length == 0)
                {
                    NVL = NullReplaceValue;
                }
                else
                {
                    NVL = Convert.ToString(InputValue);
                }
            }
            return NVL;
        }

        public string ConvierteFecha(ref string sStartDate)
        {
            string ConvierteFecha = "";
            object sPaola = null;
            if (Convert.IsDBNull(sStartDate))
            {
                ConvierteFecha = "";
            }
            else
            {
                if (sStartDate == "")
                {
                    ConvierteFecha = "";
                }
                else
                {
                    if (sStartDate.Length != 11)
                    {
                        ConvierteFecha = "";
                    }
                    else
                    {
                        sStartDate = sStartDate.ToUpper();
                        sMes = sStartDate.Substring(4 - 1, 3);
                        if (sMes == "JAN")
                        {
                            sMes = "01";
                        }
                        if (sMes == "FEB")
                        {
                            sMes = "02";
                        }
                        if (sMes == "MAR")
                        {
                            sMes = "03";
                        }
                        if (sMes == "APR")
                        {
                            sMes = "04";
                        }
                        if (sMes == "MAY")
                        {
                            sMes = "05";
                        }
                        if (sMes == "JUN")
                        {
                            sMes = "06";
                        }
                        if (sMes == "JUL")
                        {
                            sMes = "07";
                        }
                        if (sMes == "AUG")
                        {
                            sMes = "08";
                        }
                        if (sMes == "SEP")
                        {
                            sMes = "09";
                        }
                        if (sMes == "OCT")
                        {
                            sMes = "10";
                        }
                        if (sMes == "NOV")
                        {
                            sMes = "11";
                        }
                        if (sMes == "DEC")
                        {
                            sMes = "12";
                        }
                        ConvierteFecha = sStartDate.Substring(1 - 1, 2) + "/" + sMes + "/" + sStartDate.Substring(8 - 1, 4);
                    }
                }
            }
            return ConvierteFecha;
        }

        public object Country()
        {
            Recordset rs = null;
            Command cmd = null;
            cmd = new Command();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_COUNTRY_LIST";
            rs = cmd.Execute();
            Response.Write("                 \r\n");
            Response.Write("	<select name=\"cmb_country\" class=\"water\" tabindex=\"1\" onchange=\"javascript:LoadStates()\">\r\n");
            Response.Write("	<option value=\"0\">- All Countries -</option>\r\n");
            while (!(rs.Eof))
            {
                Response.Write("	         <option value= \"");
                Response.Write(rs.Fields["in_countryID"].Value);
                Response.Write("\" >");
                Response.Write(rs.Fields["vc_name"].Value);
                Response.Write("</option>\r\n");
                rs.MoveNext();
            }
            Response.Write("  	</select>\r\n");
            Response.Write("	<script> document.frm_search.cmb_country.selectedIndex = ");
            Response.Write(countryID);
            Response.Write(" </script>\r\n");
            rs.Close();
            return null;
        }

        public object States()
        {
            Recordset rs = null;
            Command cmd = null;
            cmd = new Command();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_STATE_LIST";
            cmd.CommandType = adCmdStoredProc;
            cmd.Parameters.Refresh();
            //xxx        cmd.Parameters["@CountryID"].Value = countryID;
            cmd.Parameters["@CountryID"].Value = Convert.ToInt32(countryID);
            rs = cmd.Execute();
            Response.Write("	<select name=\"cmb_state\" class=\"state1\" tabindex=\"6\" style=\"width:113px\" onchange=\"javascript:Search()\">\r\n");
            Response.Write("	<option value=\"0\">State</option>\r\n");
            while (!(rs.Eof))
            {
                Response.Write("	         <option value=\"");
                Response.Write(rs.Fields["in_stateID"].Value);
                Response.Write("\">");
                Response.Write(rs.Fields["vc_name"].Value);
                Response.Write("</option>\r\n");
                rs.MoveNext();
            }
            Response.Write("  	</select>\r\n");
            rs.Close();
            return null;
        }

        public object Facility()
        {
            Recordset rs = null;
            Command cmd = null;
            cmd = new Command();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_MARINA_LIST";
            rs = cmd.Execute();
            Response.Write("	<select name=\"cmb_facility\" class=\"water\" tabindex=\"4\" onchange=\"javascript:ClearFileds(1)\">\r\n");
            Response.Write("	<option value=\"0\">- Optional -</option>\r\n");
            while (!(rs.Eof))
            {
                Response.Write("	         <option value=\"");
                Response.Write(rs.Fields["in_marinaID"].Value);
                Response.Write("\">");
                Response.Write(rs.Fields["vc_businessName"].Value);
                Response.Write("</option>\r\n");
                rs.MoveNext();
            }
            Response.Write("  	</select>\r\n");
            Response.Write("	<script> document.frm_search.cmb_facility.selectedIndex = ");
            Response.Write(facilityID);
            Response.Write(" </script>\r\n");
            rs.Close();
            return null;
        }

        public object BoatType()
        {
            Recordset rs = null;
            Command cmd = null;
            cmd = new Command();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_BOATTYPE_LIST";
            rs = cmd.Execute();
            Response.Write("	<select name=\"cmb_boat\" class=\"water\" tabindex=\"5\">\r\n");
            Response.Write("	<option value=\"0\">- Any Boat Types -</option>\r\n");
            while (!(rs.Eof))
            {
                Response.Write("	         <option value=\"");
                Response.Write(rs.Fields["in_boatTypeID"].Value);
                Response.Write("\">");
                Response.Write(rs.Fields["vc_description"].Value);
                Response.Write("</option>\r\n");
                rs.MoveNext();
            }
            Response.Write("  	</select>\r\n");
            Response.Write("	<script> document.frm_search.cmb_boat.selectedIndex = ");
            Response.Write(boatID);
            Response.Write(" </script>\r\n");
            rs.Close();
            return null;
        }

        public object BodyWater()
        {
            Recordset rs = null;
            Command cmd = null;
            cmd = new Command();
            cmd.ActiveConnection = oConn;
            cmd.CommandText = "SP_BR_BODYWATER_LIST";
            rs = cmd.Execute();
            Response.Write("	<select name=\"cmb_body\" class=\"water\" tabindex=\"3\" onchange=\"javascript:ClearFileds(2)\">\r\n");
            Response.Write("	<option value=\"0\"> - Optional - </option>\r\n");
            while (!(rs.Eof))
            {
                Response.Write("	         <option value=\"");
                Response.Write(rs.Fields["vc_bodywater"].Value);
                Response.Write("\" >");
                Response.Write(rs.Fields["vc_bodywater"].Value);
                Response.Write("</option>\r\n");
                rs.MoveNext();
            }
            Response.Write("  	</select>\r\n");
            Response.Write("	<script> document.frm_search.cmb_body.selectedIndex = ");
            Response.Write(bodyID);
            Response.Write(" </script>\r\n");
            rs.Close();
            return null;
        }
        public int GetRandomNumber(int maxNumber)
        {
            if (maxNumber < 1)
                throw new System.Exception("The maxNumber value should be greater than 1");
            byte[] b = new byte[4];
            new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
            int seed = (b[0] & 0x7f) << 24 | b[1] << 16 | b[2] << 8 | b[3];
            System.Random r = new System.Random(seed);
            return r.Next(1, maxNumber);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string resultsPage = "results.aspx";
            string where2go = Request.Form["s"];
            if (where2go != "")
            {
                string url = @"https://maps.googleapis.com/maps/api/geocode/xml?address=" + where2go;
                Double latDiff, lngDiff, avgDiff = 0;
                Int32 miles = 0;
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(url);
                XmlNode latNode = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/location/lat");
                resultsPage = resultsPage + "?lat=" + latNode.InnerText;
                XmlNode lngNode = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/location/lng");
                resultsPage = resultsPage + "&lng=" + lngNode.InnerText;
                XmlNode latNodeNE = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/viewport/northeast/lat");
                XmlNode lngNodeNE = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/viewport/northeast/lng");
                XmlNode latNodeSW = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/viewport/southwest/lat");
                XmlNode lngNodeSW = xmlDoc.SelectSingleNode("GeocodeResponse/result/geometry/viewport/southwest/lng");
                latDiff = Convert.ToDouble(latNodeNE.InnerText) - Convert.ToDouble(latNodeSW.InnerText);
                lngDiff = Convert.ToDouble(lngNodeNE.InnerText) - Convert.ToDouble(lngNodeSW.InnerText);
                avgDiff = (Math.Abs(latDiff * 69.44) + Math.Abs(lngDiff * 69.44)) / 2;
                miles = Convert.ToInt32(Math.Ceiling(avgDiff) / 2);
                resultsPage = resultsPage + "&miles=" + miles.ToString();
            }
            Response.Redirect(resultsPage);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["Lat"] = txtLat.Value;
            Session["Lon"] = txtLon.Value;

            Session["country"] = txtCountry.Value;

            int zcode;

            if (txtLat.Value != "24.55573589999999" && txtLon.Value != "-81.78265369999997")
            {
                if (int.TryParse(txtSearch.Value.ToString(), out zcode))
                    Session["zipcode"] = zcode;

                else
                    Session["zipcode"] = txtZipCode.Value;

                Session["city"] = txtCityName.Value;

                Session["state"] = txtState.Value;


                Session["searchterm"] = txtSearch.Value.ToString();
                // Session["searchterm"] = txtSearch.Text;
            }
            else
            {
                Session["Lat"] = "";
                Session["Lon"] = "";
                Session["zipcode"] = "";

                Session["city"] = "";

                Session["state"] = "";
                Session["searchterm"] = "Florida Keys";

            }
            Response.Redirect("Results.aspx?t=2");






        }


    }

}
