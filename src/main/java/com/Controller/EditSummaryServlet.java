package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.SummaryDBUtil;

@WebServlet("/EditSummaryServlet")
public class EditSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String solved = request.getParameter("solved");
		String tobe = request.getParameter("tobe");
		String note = request.getParameter("note");
		
		try {
			
			boolean isEdited = SummaryDBUtil.editNote(id, solved, tobe, note);
			
			if (isEdited) {
				
				response.sendRedirect("SummaryServlet?editSuccess=true");
			}
			else {
				response.sendRedirect("SummaryServlet?editError=true");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		    request.setAttribute("errorMessage", "An error occurred while editing the summary.");
		    request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
