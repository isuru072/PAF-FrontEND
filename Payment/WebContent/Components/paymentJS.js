$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 

	// Form validation-------------------  
	var status = validateCardForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
	return;  
	} 

	// If valid------------------------  
	var t = ($("#hidAppIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "PaymentAPI",
		type : t,
		data : $("#paymentForm").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onCardSaveComplete(response.responseText, status);
		}
	});
}); 

function onCardSaveComplete(response, status){
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Saved.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Saving.");
		$("#slertError").show();
	}else{
		$("#alertError").text("Unknown Error while Saving.");
		$("#alertError").show();
	}
	$("#hidAppIDSave").val("");
	$("#paymentForm")[0].reset();
}
  
//$(document).ready(function () {
//    $("#alertSuccess").hide();  
//    $("#alertError").hide();
//    
//            $("#btnSave").click(
//              function (e) {
//                    
//                    $("#alertSuccess").text("");  
//                    $("#alertSuccess").hide();  
//                    $("#alertError").text("");  
//                    $("#alertError").hide(); 
//                    
//                    var status = validateCardForm();  
//                    if (status != true)  
//                    {   
//                        $("#alertError").text(status);   
//                        $("#alertError").show();   
//                        return;  
//                    }          
//                    
//                e.preventDefault();
//                
//                var cardNo = $('#cardNo').val();
//                var cvv = $('#cvv').val();
//                var ccHolderName = $('#ccHolderName').val();
//                var ccExpDate = $('#ccExpDate').val();
//                  
//
//
//                $.ajax({
//                  type: "POST",
//                  url: "PaymentAPI",
//                  data:"cardNo=" + cardNo + "&cvv=" + cvv  + "&ccHolderName=" + ccHolderName + "&ccExpDate=" + ccExpDate,  
//                  success: function (msg) {                    
//                      
//                        $("#alertSuccess").text("Successfully saved.");    
//                        $("#alertSuccess").show(); 
//                        $("#alertError").hide();   
//       
//                     $("#hidItemIDSave").val("");    
//                    $("#paymentForm")[0].reset(); 
//                  },
//                  
//                  error: function (en) {
//                      $("#alertError").text("Error while detecting.");   
//                      $("#alertError").show();  
//                      $("#alertSuccess").hide(); 
//                  }
//                });
//              });            
//});







//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hidAppIDSave").val($(this).closest("tr").find('#hidAppIDUpdate').val());     
	$("#cardNo").val($(this).closest("tr").find('td:eq(0)').text());    
	$("#cvv").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#ccHolderName").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#ccExpDate").val($(this).closest("tr").find('td:eq(3)').text()); 
	

});


//Remove Operation
$(document).on("click", ".btnRemove", function(event){
	$.ajax(
	{
		url : "PaymentAPI",
		type : "DELETE",
		data : "id=" + $(this).data("id"),
		dataType : "text",
		complete : function(response, status)
		{
			onCardDeletedComplete(response.responseText, status);
		}
	});
});

function onCardDeletedComplete(response, status)
{
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Deleting.");
		$("#alertError").show();
	}else{
		$("#alertError").text("Unknown Error While Deleting.");
		$("#alertError").show();
	}
}


function validateCardForm() {  

	if ($("#cardNo").val().trim() == "")  {   
		return "Insert card No.";  
		
	} 
	

	if ($("#cvv").val().trim() == "")  {   
		return "Insert cvv.";  
		
	} 
	 
	 

	if ($("#ccHolderName").val().trim() == "")  {   
		return "Insert ccHolderName.";  
		
	} 
	

	if ($("#ccExpDate").val().trim() == "")  {   
		return "Insert ccExpDate.";  
		
	} 
	  
	 
	 return true; 
	 
}
