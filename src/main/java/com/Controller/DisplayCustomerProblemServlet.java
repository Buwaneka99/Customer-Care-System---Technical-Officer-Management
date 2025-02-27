package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.CustomerProblemDBUtil;
import com.Java.Customer;

@WebServlet("/DisplayCustomerProblemServlet")
public class DisplayCustomerProblemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List<Customer> customer_Problems = CustomerProblemDBUtil.getCustomerProblems();
			request.setAttribute("customer_Problems", customer_Problems);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Customer_Problems.jsp");
			dispatcher.forward(request, response);
			
		}
		catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}


}
