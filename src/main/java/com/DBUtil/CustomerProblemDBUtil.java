package com.DBUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DBConnection.DBConnection;
import com.Java.Customer;

public class CustomerProblemDBUtil {
	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	private static PreparedStatement pstmt;
	private static boolean isSuccess;
	
	public static List<Customer> getCustomerProblems(){
		
		ArrayList<Customer> customerProblems = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from customer";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				int id = rs.getInt(1);
				String email = rs.getString(2);
				String name = rs.getString(3);
				String contact = rs.getString(4);
				Date problemDate = rs.getDate(5);
				String problem = rs.getString(6);
				Date answerDate = rs.getDate(7);
				String answer = rs.getString(8);
				
				Customer customerProblem = new Customer(id, email, name, contact, problemDate, problem, answerDate, answer);
				
				customerProblems.add(customerProblem);
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return customerProblems;
	}
	
public static boolean answerCustomer(String id, String answer) {
		
		try {
			
			con = DBConnection.getConnection();
			
			String sql = "UPDATE customer SET Technical_Officer_Answer=? WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, answer);
			pstmt.setString(2, id);
			
			int rowsAffected = pstmt.executeUpdate();
			
			isSuccess = (rowsAffected > 0);
			
		} catch (SQLException e) {

			e.printStackTrace(); 
			
		}finally {
	        try {
	            if (con != null) con.close(); 
	            
	        } catch (SQLException e) {
	        	
	            e.printStackTrace();
	        }
	    }
		
		return isSuccess;
	
	}

}
