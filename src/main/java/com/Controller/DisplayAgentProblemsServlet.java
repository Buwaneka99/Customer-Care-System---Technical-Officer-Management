package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.AgentProblemDBUtil;
import com.Java.Agent;

/**
 * Servlet implementation class DisplayAgentProblemsServlet
 */
@WebServlet("/DisplayAgentProblemsServlet")
public class DisplayAgentProblemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			List<Agent> agentProblems = AgentProblemDBUtil.getAgentProblems();
			request.setAttribute("agentProblems", agentProblems);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Agent_Problems.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
