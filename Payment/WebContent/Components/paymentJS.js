$(document).ready(function () {
	$("#alertSuccess").hide();  
	$("#alertError").hide();
	
            $("#save").click(
              function (e) {
            		
            		$("#alertSuccess").text("");  
            		$("#alertSuccess").hide();  
            		$("#alertError").text("");  
            		$("#alertError").hide(); 
            		
            		var status = validateItemForm();  
            		if (status != true)  
            		{   
            			$("#alertError").text(status);   
            			$("#alertError").show();   
            			return;  
            		}    	  
            	    
                e.preventDefault();
                
                var patientID = $('#patientID').val();
                var hospitalID = $('#hospitalID').val();
                var docID = $('#docID').val();
                var amount = $('#amount').val();
                var appointmentID = $('#appointmentID').val();
                var paymentStatus = $('#paymentStatus').val();          

                $.ajax({
                  type: "POST",
                  url: "http://localhost:8090/Payment/paymentAPI/Payments",
                  data: "patientID=" + patientID + "&hospitalID=" + hospitalID + "&docID=" + docID + "&amount=" + amount + "&appointmentID=" + appointmentID + "&paymentStatus=" + paymentStatus,
                  success: function (msg) {                	
                	  
                		$("#alertSuccess").text("Successfully saved.");    
            			$("#alertSuccess").show(); 
            			$("#alertError").hide();   
       
                	 $("#hidItemIDSave").val("");    
                    $("#paymetnForm")[0].reset(); 
                  },
                  
                  error: function (en) {
                	  $("#alertError").text("Error while detecting.");   
              		$("#alertError").show();  
              		$("#alertSuccess").hide(); 
                  }
                });
              });
          });


//CLIENT-MODEL========================================================================= 
function validateItemForm() 
{  
	
	if ($("#patientID").val().trim() == "")  
	{   
		return "Insert Patient ID.";  
	} 


	if ($("#hospitalID").val().trim() == "")  
	{   
		return "Insert hospital ID.";  
	} 
	
	if ($("#docID").val().trim() == "")  
	{   
		return "Insert doc ID.";  
	} 
	
	if ($("#amount").val().trim() == "")  
	{   
		return "Insert amount.";  
	} 
	
	if ($("#appointmentID").val().trim() == "")  
	{   
		return "Insert appointment ID.";  
	} 
	
	if ($("#paymentStatus").val().trim() == "")  
	{   
		return "Insert payment Status.";  
	} 
	return true; 

}

