<script type="text/javascript">

    var chk=false;

	//Initialise variables
	var errorMsg = "";
var s="Phone numbers or web address Characters Sequence are not allowed in text form.Please remove any Phone numbers or web address Character Sequences";



	//Check for a Name
	if (document.getElementById("txt_Name").value == ""){
		errorMsg += "\n\t Name \t\t                  - Enter your Name";
	}

	//Check for a Name
	if (document.getElementById("txt_Description").value == ""){
		errorMsg += "\n\t Description \t\t                  - Enter your Description";
	}


if ( IsFieldContainsEmail(document.getElementById("txt_Description").value))
{
			errorMsg += "\n\t Description \t\t   "+s;
		
 
}


if ( IsFieldContainsPhone(document.getElementById("txt_Description").value))
{
			errorMsg += "\n\t Description \t\t   "+s;
 
}

if ( IsFieldContainsWeb(document.getElementById("txt_Description").value))
{
			errorMsg += "\n\t Description \t\t   "+s;
 
}


if ( IsFieldContainsEmail(document.getElementById("txt_requirements").value))
{
			errorMsg += "\n\t Requirements \t\t   "+s;
		
 
}


if ( IsFieldContainsPhone(document.getElementById("txt_requirements").value))
{
			errorMsg += "\n\t Requirements \t\t   "+s;
 
}

if ( IsFieldContainsWeb(document.getElementById("txt_requirements").value))
{
			errorMsg += "\n\t Requirements \t\t   "+s;
 
}





	if (document.getElementById("txt_Make").value == ""){
		errorMsg += "\n\t Make \t\t                  - Enter Make";
	}

	if (document.getElementById("txt_Model").value == ""){
		errorMsg += "\n\t Model \t\t                  - Enter your Model";
	}


		
	if (document.getElementById("txt_Year").value != "")
	{
	 if (isNaN(parseInt(document.getElementById("txt_Year").value)))
		  errorMsg += "\n\t Year \t\t                  - Enter a Numeric value in Year";
	}

	

	if (document.getElementById("txt_size").value == ""){
		errorMsg += "\n\t Size \t\t                  - Enter Size";
	}


//(document.forms[0].cbo_BoatType.options[document.forms[0].cbo_BoatType.selectedIndex].value == "0") 

if (document.forms[0].cbo_BoatType.options[document.forms[0].cbo_BoatType.selectedIndex].value == "0") 
{
		errorMsg += "\n\t Boat Type \t\t                  - Enter Boat Type";
	}



	if (document.getElementById("txt_MaxPassengers").value == ""){
		errorMsg += "\n\t MaxPassengers \t\t                  - Enter MaxPassengers";
	}
	else
	{  if (isNaN(parseInt(document.getElementById("txt_MaxPassengers").value)))
		  errorMsg += "\n\t MaxPassengers \t\t                  - Enter a Numeric value in MaxPassengers field";
	}


	if (document.getElementById("txt_reservation").value == ""){
		errorMsg += "\n\t Reservation \t\t                  - Enter Reservation";
	}
	//else
	//{  if (isNaN(parseFloat(document.getElementById("txt_reservation").value)))
	//	  errorMsg += "\n\t Reservation \t\t                  - Enter a Numeric value in //Reservation field";
	//}

	if (document.getElementById("txt_deposit").value == ""){
		errorMsg += "\n\t Security Deposit \t\t                  - Enter Security Deposit";
	}
	
	
	if (document.getElementById("chk_Is_boat_sale").checked)
	{

	  if (document.getElementById("txt_boat_sale_amount").value == "")
	    errorMsg += "\n\t Boat Sale Amount \t\t                  - Enter Boat Sale Amount";
	  	else   if (isNaN(parseFloat(document.getElementById("txt_boat_sale_amount").value)))
		  errorMsg += "\n\t Boat Sale Amount \t\t                  - Enter a Numeric value in Boat Sale Amount";
	}
	    
	  

//alert("test");


	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "______________________________________________________________\n\n";
		msg += "Your enquiry has not been sent because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "______________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected:\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
	}
        else {
        alert(document.getElementById("txt_MaxPassengers").value);
        }


</script>