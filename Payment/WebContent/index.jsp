<%@page import="com.controllers.paymentController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="Components/jquery-3.4.1.min.js"></script> 
	<script src="Components/items.js"></script> 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="style/style.css">
<title>HC-System_Payment</title>
</head>
<body>
	<div class="container register-form">
		<div class="form">
			<div class="note">
				<p style="text-transform: uppercase;">Online hospital Payment
					Section</p>
			</div>

			<form class="form-content" id="paymetnForm">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" id="patientID" placeholder="Patient ID"
								value="" />
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="hospitalID" value="" id="hospitalID"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="docID" value="" id="docID" />
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="amount" value="" id="amount"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="appointmentID" value="" id="appointmentID" />
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="paymentStatus" value="" id="paymentStatus"/>
						</div>
					</div>
				</div>
				<button id="save" type="button" class="btnSubmit">Submit</button>
			</form>
		</div>
	</div>
	<div class="container register-form">
		<%
			paymentController payObj = new paymentController();
			out.print(payObj.readPayments());
		%>
	</div>
	
	
</body>

   <script type="text/javascript">

          $(document).ready(function () {
            $("#save").click(
              function (e) {
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

                    $('#succerssMsg').css({ "display": "block" });
                    $('#errorMsg').css({ "display": "none" });
                    document.getElementById("paymetnForm").reset();
                  },
                  error: function (en) {

                  }
                });
              });
          });
        </script>
</html>