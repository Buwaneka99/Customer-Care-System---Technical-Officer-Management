package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBUtil.TechnicalOfficerDBUtil;
import com.Java.TechnicalOfficer;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean isTrue = TechnicalOfficerDBUtil.validate(email, password);
		
		if(isTrue) {
			
			HttpSession session = request.getSession();
			
			List<TechnicalOfficer> t_officer_Details = TechnicalOfficerDBUtil.getTechnicalOfficer(email);
			session.setAttribute("t_officer_Details", t_officer_Details);
			
			if (!t_officer_Details.isEmpty()) {
			    TechnicalOfficer officer = t_officer_Details.get(0); // Assuming the first record contains the logged-in user details
			    session.setAttribute("userId", officer.getId()); // Store ID in session
			}
			
			response.sendRedirect("Technical_Officer.jsp");
		}
		else {
																					
			request.setAttribute("errorMessage", "Your username or password is incorrect !!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            dispatcher.forward(request, response);
			
		}
		
	}

}
