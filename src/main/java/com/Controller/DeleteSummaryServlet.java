package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.SummaryDBUtil;

@WebServlet("/DeleteSummaryServlet")
public class DeleteSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("summaryId");
		
		try {
			
			boolean isDeleted = SummaryDBUtil.deleteSummary(id);
			
			if (isDeleted) {
				
				response.sendRedirect("SummaryServlet?deleteSuccess=true");
			}
			else {
				response.sendRedirect("SummaryServlet?deleteError=true");

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		    request.setAttribute("errorMessage", "An error occurred while deleting the summary.");
		    request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
