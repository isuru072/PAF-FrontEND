<%@page import="model.payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/paymentJS.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
							Card No: <br/><input type="text" class="form-control" name="cardNo" id="cardNo"/>
						</div>
						<div class="form-group">
							Cvv: <br/><input type="text" class="form-control" name="cvv" id="cvv" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							Card Holder Name: <br/><input type="text" class="form-control" name="ccHolderName" id="ccHolderName" />
						</div>
						<div class="form-group">
							ExpDate: <br/><input type="text" class="form-control" name="ccExpDate" id="ccExpDate" />
						</div>
					</div>				
				</div>
				
					<div id="alertSuccess" class="alert alert-success"></div>  
					<div id="alertError" class="alert alert-danger"></div> 

					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					 <input type="hidden" id="hidAppIDSave" name="hidAppIDSave" value=""> 
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