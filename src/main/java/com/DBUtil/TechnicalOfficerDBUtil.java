package com.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DBConnection.DBConnection;
import com.Java.TechnicalOfficer;

public class TechnicalOfficerDBUtil {
	
	private static boolean isSuccess;
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	private static PreparedStatement pstmt;

	public static boolean validate(String email, String password) {
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM technical_officer WHERE Email = '" +email+ "' and Password = '"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		} catch (SQLException e) { 
			
			e.printStackTrace();
		}
		
		return isSuccess;	
	}
	
	public static List<TechnicalOfficer> getTechnicalOfficer(String email){
		
		ArrayList<TechnicalOfficer> technicalOfficer = new ArrayList<>();
		
		try {
	        
	        con = DBConnection.getConnection();
	        //stmt = con.createStatement();
	        
	        String sql = "SELECT * FROM technical_officer WHERE Email = ?";
	        pstmt = con.prepareStatement(sql);
	        
	        pstmt.setString(1, email);
	        
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            int id = rs.getInt("ID");
	            String name = rs.getString("Name");	            
	            String contact = rs.getString("Contact");
	            String address = rs.getString("Address");
	            String email_out = rs.getString("Email");
	            String username = rs.getString("Username");
	            String password = rs.getString("Password");

	            TechnicalOfficer t_Officer = new TechnicalOfficer(id, name, contact, address, email_out, username, password);

	            technicalOfficer.add(t_Officer);
	        }

	    } catch (SQLException e) {
	    	
	        e.printStackTrace(); 
	        
	    }finally {			
	        try {	        	
	            if (con != null) con.close();
	            
	        } catch (SQLException e) {
	        	
	            e.printStackTrace();
	        }
	    }
		
		return technicalOfficer;
	}
	
	public static boolean updateTOfficer(String id, String name, String contact, String address, String email, String username) {
		
		try {
	        con = DBConnection.getConnection();
	        
	        String sql = "UPDATE technical_officer SET Name=?, Contact=?, Address=?, Email=?, Username=? WHERE ID=?";
	        pstmt = con.prepareStatement(sql);
	        
	        pstmt.setString(1, name);
	        pstmt.setString(2, contact);
	        pstmt.setString(3, address);
	        pstmt.setString(4, email);
	        pstmt.setString(5, username);
	        pstmt.setString(6, id);
	        
	        int rowsAffected = pstmt.executeUpdate();
	        
	        isSuccess = (rowsAffected > 0);
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        
	    } finally {
	        try {
	            if (con != null) con.close(); 
	            
	        } catch (SQLException e) {
	        	
	            e.printStackTrace();
	        }
	    }
		
		return isSuccess;
		
	}
	
	public static boolean updatePassword(String id, String oldPassword, String newPassword) {
		
		boolean isSuccess = false;
		
		try {
		    con = DBConnection.getConnection();

		    String checkSql = "SELECT * FROM technical_officer WHERE ID=? AND Password=?";
		    pstmt = con.prepareStatement(checkSql);

		    pstmt.setString(1, id);
		    pstmt.setString(2, oldPassword);

		    rs = pstmt.executeQuery();

		    if (rs.next()) {

		        String updateSql = "UPDATE technical_officer SET Password=? WHERE ID=?";
		        PreparedStatement updateStmt = con.prepareStatement(updateSql);

		        updateStmt.setString(1, newPassword);
		        updateStmt.setString(2, id);

		        int rowsAffected = updateStmt.executeUpdate();
		        isSuccess = (rowsAffected > 0); 
		        
		        updateStmt.close();
		    }
		}
		catch (SQLException e) {
			
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
