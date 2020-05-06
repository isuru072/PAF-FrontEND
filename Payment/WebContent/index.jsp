<%@page import="model.payment"%>
<%@page import="com.PaymentApi"%>
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
<script src="components/jquery-3.2.1.min.js"></script>
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

			<form class="form-content" id="paymentForm" name="paymentForm" method="post" action="index.jsp">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							Card No: <br/><input type="text" class="form-control" id="cardNo"/>
						</div>
						<div class="form-group">
							Cvv: <br/><input type="text" class="form-control" id="cvv" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							Card Holder Name: <br/><input type="text" class="form-control" id="ccHolderName" />
						</div>
						<div class="form-group">
							ExpDate: <br/><input type="text" class="form-control" id="ccExpDate" />
						</div>
					</div>				
				</div>
					<div id="alertSuccess" class="alert alert-success">
						<%
							out.print(session.getAttribute("statusMsg"));
						%>
					</div>
					<div id="alertError" class="alert alert-danger"></div>
					
				<button id="btnSave" type="button" class="btnSubmit">Submit</button>
				<input type="hidden" id="hidAppIDSave" name="hidItemIDSave" value=""> 
			</form>
		</div>
	

		<div id ="divItemsGrid" class="container register-form">
		<%
			payment payObj = new payment();
			out.print(payObj.readPayment());
		%>
	</div>
	</div>


</body>