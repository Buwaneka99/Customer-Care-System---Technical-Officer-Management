package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBUtil.TechnicalOfficerDBUtil;
import com.Java.TechnicalOfficer;

@WebServlet("/UpdateTOfficerServlet")
public class UpdateTOfficerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); 
		
		String id = String.valueOf(session.getAttribute("userId"));			
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		try {
			
			boolean isUpdated = TechnicalOfficerDBUtil.updateTOfficer(id, name, contact, address, email,username);
			
			if (isUpdated) {
				List<TechnicalOfficer> t_officer_Details = TechnicalOfficerDBUtil.getTechnicalOfficer(email);
				session.setAttribute("t_officer_Details", t_officer_Details);
				
				response.sendRedirect("Technical_Officer.jsp?success=1");
			}
			else {
				
				response.sendRedirect("Technical_Officer.jsp?update=failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			response.sendRedirect("Technical_Officer.jsp?update=error");
		}
	}
}
