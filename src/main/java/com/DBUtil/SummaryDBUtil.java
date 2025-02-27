package com.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.DBConnection.DBConnection;
import com.Java.Summary;

public class SummaryDBUtil {
	
	private static boolean isSuccess;
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	private static PreparedStatement pstmt;

	public static boolean addSummary(String type, int solved, int tobe, String note) {
		
		boolean isSuccess = false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			 String sql = "INSERT INTO summary (Type, Solved, Tobe, Note) " +
                     "VALUES ('" + type + "', '" + solved + "', '" + tobe + "', '" + note + "')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		return isSuccess;
	}

	public static List<Summary> getSummaries(){
		
		ArrayList<Summary> summaries = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM summary";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				Date addedDate = rs.getDate(2);
				String type = rs.getString(3);
				int  solved = rs.getInt(4);
				int tobe = rs.getInt(5);
				Date updatedDate = rs.getDate(6);
				String note = rs.getString(7);
				
				Summary summary = new Summary(id, addedDate, type, solved, tobe, updatedDate, note);
				
				summaries.add(summary);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return summaries;
		
	}
	
	public static boolean editNote(String id, String solved, String tobe, String note) {
		
		try {
			
			con = DBConnection.getConnection();
			
			String sql = "UPDATE summary SET Solved=?, Tobe=?, Note=? WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, solved);
			pstmt.setString(2, tobe);
			pstmt.setString(3, note);
			pstmt.setString(4, id);
			
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
		
	
	
	
	public static boolean deleteSummary(String id) {
		
		try {
			
			con = DBConnection.getConnection();
			
			String sql = "DELETE FROM summary WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
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
