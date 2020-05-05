package com.controllers;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.services.paymentService;



@Path("Payments")
public class paymentController {
	paymentService payObj = new paymentService();

	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public String readPayments() {
		return payObj.readPayments();
	}


	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertPayment(@FormParam("patientID") int patientID,
								@FormParam("hospitalID") int hospitalID,
								@FormParam("docID") int docID,
								@FormParam("amount") String amount,
								@FormParam("appointmentID") String appointmentID,
								@FormParam("paymentStatus") String paymentStatus)
	{

		String output = payObj.insertPayment(patientID, hospitalID, docID, amount, appointmentID, paymentStatus);
		return output;
	}

	
	@GET
	@Path("/{patientID}")
	@Produces(MediaType.APPLICATION_JSON)
	public String readPaymentAccordingToPatientID(@PathParam("patientID") String patientID) {
		return payObj.readPaymentAccordingToPatientID(patientID);
	}

	
	@GET
	@Path("/CreditCardInfo/")
	@Produces(MediaType.TEXT_PLAIN)
	public String readCreditCardInfo() {
		return payObj.readCreditCardInfo();
	}
	
	@GET
	@Path("/CreditCardInfo/{paymentID}")
	@Produces(MediaType.APPLICATION_JSON)
	public String readCCInfoAccordingToPaymentID(@PathParam("paymentID") String paymentID) {
		return payObj.readCCInfoAccordingToPaymentID(paymentID);
	}
	
	
	@POST
	@Path("/CreditCardInfo/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertCreditCardInfo(@FormParam("cardNo") String cardNo,
								       @FormParam("cvv") String cvv,
								       @FormParam("ccHolderName") String patientID,
								       @FormParam("ccExpDate") String ccExpDate,
								       @FormParam("paymentID") String paymentID)
	
	{

		String output = payObj.insertCreditCardInfo(cardNo, cvv, patientID, ccExpDate, paymentID);
		return output;
	}

	@PUT
	@Path("/CreditCardInfo/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateCreditCardInfo(String CreditCardData) {

		JsonObject payObject = new JsonParser().parse(CreditCardData).getAsJsonObject();

		
		int CCID = payObject.get("CCID").getAsInt();
		String cardNo = payObject.get("cardNo").getAsString();
		String cvv = payObject.get("cvv").getAsString();
		String ccHolderName = payObject.get("ccHolderName").getAsString();
		String ccExpDate = payObject.get("ccExpDate").getAsString();
		String paymentID = payObject.get("paymentID").getAsString();
		
		String output = payObj.updateCreditCardInfo(CCID, cardNo, cvv, ccHolderName, ccExpDate, paymentID);
		return output;

	}



	@PUT
	@Path("/refund/{paymentID}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_XML)
	public String refund(@PathParam("paymentID")int paymentID, String paymentStatusData) {
		
		JsonObject payObject = new JsonParser().parse(paymentStatusData).getAsJsonObject();
		String paymentStatus = payObject.get("paymentStatus").getAsString();
		
		String output = payObj.refund(paymentID, paymentStatus);
		return output;
	}
	
		
}
