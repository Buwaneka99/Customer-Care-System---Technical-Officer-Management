package com.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static String url = "jdbc:mysql://localhost:3306/customer_care_system";
	private static String username = "****";
	private static String password = "****";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
//			System.out.println("Database connection is successfully completed.");
			
		} catch (ClassNotFoundException | SQLException e) {
			
			System.out.println("Database connection is unsuccessfully !!");
			e.printStackTrace();
		}
		return con;
	}
}
