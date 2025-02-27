package com.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.SummaryDBUtil;

@WebServlet("/AddSummaryServlet")
public class AddSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			//String date = request.getParameter("date");
			String type = request.getParameter("type");
			int solved = Integer.parseInt(request.getParameter("solved"));
			int tobe = Integer.parseInt(request.getParameter("tobe"));
			String note = request.getParameter("note");
			
			boolean isTrue = SummaryDBUtil.addSummary(type, solved, tobe, note);
			
			RequestDispatcher dispatcher;
			
			if(isTrue == true) {
				
				request.setAttribute("successMessage", "Report submitted successfully!");
			    System.out.println("Success message set: " + "Report submitted successfully!");
			    
				response.sendRedirect("Add_Summary.jsp");
			}
			else {
				
				dispatcher = request.getRequestDispatcher("unSuccess.jsp");
				dispatcher.forward(request, response);
			}
			
			
			
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
			response.sendRedirect("error.jsp");
			
		}
		
	}

}
