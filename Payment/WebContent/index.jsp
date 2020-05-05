<%@page import="com.controllers.paymentController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/paymentJS.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
							Patient ID: <br/><input type="text" class="form-control" id="patientID"/>
						</div>
						<div class="form-group">
							Hospital ID: <br/><input type="text" class="form-control" id="hospitalID" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							doc ID: <br/><input type="text" class="form-control" id="docID" />
						</div>
						<div class="form-group">
							amount; <br/><input type="text" class="form-control" id="amount" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							appointmentID : <br/><input type="text" class="form-control" id="appointmentID" />
						</div>
						<div class="form-group">
							paymentStatus: <br/><input type="text" class="form-control" id="paymentStatus" />
						</div>
					</div>
				
				</div>
					<div id="alertSuccess" class="alert alert-success">
						<%
							out.print(session.getAttribute("statusMsg"));
						%>
					</div>
					<div id="alertError" class="alert alert-danger"></div>
					
				<button id="save" type="button" class="btnSubmit">Submit</button>
				<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value=""> 
			</form>
		</div>
	

		<div id ="divItemsGrid" class="container register-form">
		<%
			paymentController payObj = new paymentController();
			out.print(payObj.readPayments());
		%>
	</div>


</body>