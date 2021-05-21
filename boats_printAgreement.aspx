<%@ Page Language="C#" AutoEventWireup="true" CodeFile="boats_printAgreement.aspx.cs" Inherits="admin_boats_printAgreement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PRINT AGREEMENT</title>
</head>
<body>
    <form id="frmPrintAgreement" runat="server">
 
      
      <table border="1" width="95%" >

          <tr>
              <td>


          

<p align="justify"><a valign="middle"  href="javascript:window.print();"class="verd10Rollazu">
<img border="0" src="images/printer.gif" WIDTH="15" HEIGHT="20" valign="middle">
&nbsp;Print
</a></p>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<center><h1><%=orderSummary.FacilityName%></h1></center>
		 
			<center><%= orderSummary.AddressLine1 %>,&nbsp;  <%= orderSummary.AddressLine2 %> &nbsp; <%= orderSummary.City %>, <%= orderSummary.StateName %> - <%= orderSummary.Zipcode %></center><br>	
				<center><%= orderSummary.MarinaPhone %><br/>
				<center><%= orderSummary.MarinaEMail %><br/>
				<center><h1>BAREBOAT CHARTER AGREEMENT</h1></center>
	
			
				
<p align="justify">	THIS AGREEMENT is made and entered into this <%= DateTime.Now.Day.ToString("##")   %> day of <%=  DateTime.Now.ToString("MMM")  %> , <%=DateTime.Now.Year.ToString()%>, by and between <%= orderSummary.FacilityName  %> Boat Owner of <%= orderSummary.AddressLine1 %>, <%= orderSummary.AddressLine2 %> <%= orderSummary.City %>, <%= orderSummary.StateName %> - <%= orderSummary.Zipcode %>, hereinafter called "Owner", and <%= orderSummary.ClientFirstName %> &nbsp;  <%=orderSummary.ClientLastName%>, of <%=orderSummary.ClientAddress %>, hereinafter called "Renter".</p>
			
<p align="justify">	<u>THE BOAT</u>:  the Owner agrees to rent is: Name: <u><%= orderSummary.BoatName%></u>  Make: <u><%=orderSummary.BoatMake%></u> Model : <u><%=orderSummary.BoatModel%></u>  Size:  <u><%=orderSummary.BoatSize%></u>   Max Passengers: <u><%=orderSummary.MaximumPassengers.ToString()%></u></p>
			
				
Boat Description <u><%=orderSummary.BoatDescription%></u>:


<p align="justify">Owner represents that to the best of his knowledge and belief that said boat (and motor, if any) is free from any known faults or deficiencies, which would affect safe and reliable operation under normal and prudent usage. </p>

<p align="justify">Owner further represents that all required lifesaving and safety equipment are aboard the boat and in good order and condition at the time of delivery to the Renter. </p>
				
<p><u>RENTAL PERIOD</u></p>

<p align="justify">Owner agrees to rent the above-described boat (and motor) for  <%= orderSummary.CurrencySymbolRequested%> <%= orderSummary.TotalRentAmount%>,   <%= orderSummary.RentTypeDescription %> to Renter beginning at <%= orderSummary.rentStartHour%>  on <%=orderSummary.RentStartDate%> and ending at <%=orderSummary.rentEndHour%>, on  <%=orderSummary.RentEndDate%>.</p>

			
<center><h1>USE OF BOAT</h1></center>			
				
<p align="justify">Renter further agrees (a) that the rented boat shall not be used to carry passengers or property for hire; (b) that the rented boat shall not be used to carry passengers or property in excess of the rated capacity of the boat; (c) not to use the boat to tow or propel any other boat, barge or thing without the owner's written permission; (d) not to use the boat (or motor) in any race or competition; (e) not to use the boat (or motor) for any illegal purpose; (f) not to operate the boat (or motor) in a negligent matter; (g) not to operate the boat (or motor) outside the area of use designated in this Agreement; (h) not to permit the boat (or motor) to be operated by any other person without written permission of the Owner; and (i) not to remove the motor from the boat for any use what so ever, (j)that he/she has been properly instructed and is confident to operate said boat (k) that the security deposit of <u><%=orderSummary.FacilitySecurityDeposit%>%</u> may be employed by owner on account of  any claims that he may have against the renter.</p>

<p align="justify">Renter hereby agrees that he shall fully indemnify & release Owner from claims, demands, losses, damages, actions and expense related to the use of boat. </p>
				
				<center><h1>RETURN OF BOAT, MOTOR AND EQUIPMENT TO </h1></center>
			
			<center><h1><u><%=orderSummary.FacilityName%></u></h1></center>
	
<p align="justify">Renter hereby agrees to return the boat, motor and equipment to Owner at his address stated above or such other address that the Owner shall so state at the end date and time listed above.</p>
 	
<p>TRAILER: Yes  No</p>

</p align="justify">This Agreement may include rental of Owner's boat trailer for transportation of the rented boat/motor/equipment during the term of this Agreement, and such use shall be subject to the general conditions and limitations of this Agreement. </p>

<center><h1>CANCELLATION POLICY</h1></center>

<p><u><%=orderSummary.FacilityCancellationPolicy%></u></p>


____________________________ Renters Signature         Date: <u><%=DateTime.Now.ToShortDateString()%></u>

<br>
    </td>

          </tr>
</table>


    </form>
</body>
</html>
