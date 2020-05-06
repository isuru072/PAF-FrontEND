package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class payment {
	//DB Connector
private Connection connect() {
	Connection con = null;
	
	try {
		 Class.forName("com.mysql.jdbc.Driver");
	
		 con= DriverManager.getConnection("jdbc:mysql://localhost/hcdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

	     
		 System.out.print("Successfully connected");
		 
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return con; 
}
//Read Payment
public String readPayment() {  
	String output = "";  
	
	try {  
		Connection con = connect();  
		if (con == null)  {   
			return "Error while connecting to the database for reading.";  
		} 


		output = "<table border='1'><tr>"
				+ "<th>Card No</th>"
				+ "<th>Cvv</th>"
				+ "<th>Card Holder Name</th>"
				+ "<th>ExpDate</th>"
				+ "<th>Update</th><th>Remove</th></tr>";


		  String query = "select * from creditcardetails";   
		  Statement stmt = con.createStatement();   
		  ResultSet rs = stmt.executeQuery(query); 

		
		  while (rs.next())   {  
			  	String id = Integer.toString(rs.getInt("id"));
			  	String cardNo = Integer.toString(rs.getInt("cardNo"));
				String cvv = Integer.toString(rs.getInt("cvv"));
				String ccHolderName = rs.getString("ccHolderName");
				String ccExpDate = rs.getString("ccExpDate");
				
				
			
	

			  output += "<tr><td><input id='hidAppIDUpdate' name='hidAppIDUpdate' type='hidden' value='" + id + "'>" + cardNo + "</td>"; 
			  output += "<td>" + cvv + "</td>";
			  output += "<td>" + ccHolderName + "</td>";
			  output += "<td>" + ccExpDate + "</td>";

			   
			  output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
			  		+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-id='"+ id +"'>"+"</td></tr>";

			} 
		  
		  con.close(); 

		
		  output += "</table>"; 
		}
		catch (Exception e) {  
			output = "Error while reading the creditcardetails.";  
			System.err.println(e.getMessage()); 
		}

		return output;
	}

//Insert appointment
public String insertCCDetails(String cardNo, String cvv, String ccHolderName, String ccExpDate) {
	String output = "";

	try {
		Connection con = connect();  

		if (con == null) {
			return "Error while connecting to the database";
		}

		// create a prepared statement   
		String query = " insert into creditcardetails (id,`cardNo`,`cvv`,`ccHolderName`,`ccExpDate`)"+" values (?, ?, ?, ?,?)";

		PreparedStatement preparedStmt = con.prepareStatement(query);

		// binding values 
		preparedStmt.setInt(1, 0);
		preparedStmt.setString(2, cardNo);
		preparedStmt.setString(3, cvv);
		preparedStmt.setString(4, ccHolderName);
		preparedStmt.setString(5, ccExpDate);
		
		
		//execute the statement   
		preparedStmt.execute();   
		con.close(); 

		//Create JSON Object to show successful msg.
		String newCCdetails = readPayment();
		output = "{\"status\":\"success\", \"data\": \"" + newCCdetails + "\"}";
	}
	catch (Exception e) {  
		//Create JSON Object to show Error msg.
		output = "{\"status\":\"error\", \"data\": \"Error while Inserting Payment.\"}";   
		System.err.println(e.getMessage());  
	} 

	 return output; 
}

//Update appointment
public String updatecreditcardetails( String id, String cardNo, String cvv, String ccHolderName, String ccExpDate)  {   
	String output = ""; 
 
  try   {   
	  Connection con = connect();
 
	  if (con == null)    {
		  return "Error while connecting to the database for updating."; 
	  } 
 
   // create a prepared statement    
	   String query = "UPDATE creditcardetails SET cardNo=?,cvv=?,ccHolderName=?,ccExpDate=? WHERE id=?";
		 
   PreparedStatement preparedStmt = con.prepareStatement(query); 
 
   // binding values    
   	preparedStmt.setInt(1, Integer.parseInt(cardNo));
	preparedStmt.setInt(2, Integer.parseInt(cvv));
	preparedStmt.setString(3, ccHolderName);
	preparedStmt.setString(4, ccExpDate);
	preparedStmt.setInt(5, Integer.parseInt(id));
   
 
   // execute the statement    
   preparedStmt.execute();    
   con.close(); 
 
   //create JSON object to show successful msg
   String newPayment = readPayment();
   output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
   }   catch (Exception e)   {    
	   output = "{\"status\":\"error\", \"data\": \"Error while Updating Card Details.\"}";      
	   System.err.println(e.getMessage());   
   } 
 
  return output;  
  }

public String deleteCC(String id) {  
	String output = ""; 
 
 try  {   
	 Connection con = connect();
 
  if (con == null)   {    
	  return "Error while connecting to the database for deleting.";   
  } 
 

  String query = "DELETE FROM creditcardetails WHERE id=?"; 
 
  PreparedStatement preparedStmt = con.prepareStatement(query); 
 

  preparedStmt.setInt(1, Integer.parseInt(id));       
  preparedStmt.execute();   
  con.close(); 
 
  
  String newPayment = readPayment();
  output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
  }  catch (Exception e)  {  
	 
	  output = "{\"status\":\"error\", \"data\": \"Error while Deleting Card.\"}";
	  System.err.println(e.getMessage());  
	  
 } 
 
 return output; 
 }
}