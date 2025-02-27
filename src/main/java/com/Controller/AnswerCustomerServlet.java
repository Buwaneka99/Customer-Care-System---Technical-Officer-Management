package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.CustomerProblemDBUtil;

@WebServlet("/AnswerCustomerServlet")
public class AnswerCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String answer = request.getParameter("solution");
		
		try {
			
			boolean isUpadte = CustomerProblemDBUtil.answerCustomer(id, answer);
			
			if (isUpadte) {
				
				response.sendRedirect("CustomerProblems");
				
			}else {
				response.sendRedirect("error");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
