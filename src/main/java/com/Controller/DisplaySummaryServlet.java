package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.SummaryDBUtil;
import com.Java.Summary;


@WebServlet("/DisplaySummaryServlet")
public class DisplaySummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List<Summary> summary_Details = SummaryDBUtil.getSummaries();
			request.setAttribute("summary_Details", summary_Details);
			
			String targetPage = request.getParameter("targetPage");

	        // Set default page if no parameter provided
	        String page = "Manage_Summary.jsp"; // Default page
	        if ("allSummary".equals(targetPage)) {
	            page = "All_Problem_Summary.jsp";
	        }

	        // Forward the request to the selected page
	        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
	        dispatcher.forward(request, response);
			
		}
		catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
