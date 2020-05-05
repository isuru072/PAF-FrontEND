package com.config;


import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnector {
	
	public static  Connection connecter()
	{
		Connection con = null;
		
		String url = "jdbc:mysql://localhost/hcdb";
		String username = "root";
		String password = "";
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Connection Top");
			con =  (Connection) DriverManager.getConnection(url,username,password);
			if (con != null) {
                System.out.println("Connected to the done");
            }
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	} 
}
