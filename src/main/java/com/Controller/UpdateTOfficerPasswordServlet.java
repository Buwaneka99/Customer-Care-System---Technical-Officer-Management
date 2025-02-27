package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBUtil.TechnicalOfficerDBUtil;

@WebServlet("/UpdateTOfficerPasswordServlet")
public class UpdateTOfficerPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); // Get existing session	    
		String id = String.valueOf(session.getAttribute("userId")); // Retrieve ID from session
		
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		
		try {
			
			boolean isUpdate = TechnicalOfficerDBUtil.updatePassword(id, oldPassword, newPassword);
			
			if (isUpdate) {
				
				if (session != null) {			
					session.invalidate();
					
					response.sendRedirect("Login.jsp?message=password-change");
				}				
			}
			else{
				response.sendRedirect("Technical_Officer.jsp?password_update=failed");
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			response.sendRedirect("echnical_Officer.jsp?password_update=error");
		}
		
	}

}
