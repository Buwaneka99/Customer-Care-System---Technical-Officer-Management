<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
   	<%
		HttpSession sessionCheck = request.getSession(false);
	    if (sessionCheck == null || sessionCheck.getAttribute("t_officer_Details") == null) {
	        response.sendRedirect("Login.jsp?message=please_login");
	        return;
	    }
	%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Agent Problems</title>
		
		<link rel="stylesheet"  type="text/css" href="./Styles/Agent_Problems.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
		
	</head>
	<body>
	
		<jsp:include page="Nev_Bar.jsp" />
		
		<h1 class="h1-name" >Agent Problems</h1>
		
		<table>
		    <tr>
		        <th>ID</th>
		        <th>Agent Email</th>
		        <th>Agent Name</th>
		        <th>Agent Contact</th>
		        <th>problem arose day</th>
		        <th>Problem</th>
		        <th>Answer Date</th>
		        <th>Answer</th>
		        <th>Action</th>
		    </tr>
		    <c:forEach var="agent" items="${agentProblems}">
		        <tr>
		            <td>${agent.id}</td>
		            <td>${agent.email}</td> 
		            <td>${agent.name}</td>
		            <td>${agent.contact}</td>
		            <td>${agent.problemDate}</td>
		            <td>${agent.problem}</td> 
		            <td>${agent.answerDate}</td> 
		            <td>${agent.answer}</td> 
		            <td><button class="giveanswer" type="submit">Give answer</button></td>
		        </tr>
		    </c:forEach>
		</table>
		
		<div class="main-content" style="display: none;">
			<div class="second-content">
				<span class="close">&times;</span>
				<h2 class="h2-name" >Answer the agent problem</h2>
				
				<form action="Answer_Agent" method="post">
					
					<input type="hidden" id="agentId" name="id" style="display: none;">
					
					<label>Agent name:</label>
					<input type="text" id="name" name="name" readonly>
					
					<label>Agent Email:</label>
					<input type="email" id="email" name="email" readonly>
					
					<label>Agent Contact:</label>
					<input type="number" id="number" name="number" readonly>
					
					<label>Date Of Problem Arose:</label>
					<input type="text" id="date" name="date" readonly>
					
					<label>Agent Problem:</label>
					<textarea id="problem" name="problem" rows="4" readonly></textarea>
					
					<label>Technical Officer Solution:</label>
					<textarea id="solution" name="solution" rows="5" required></textarea>		
					
					<button class="answer" type="submit">Give answer</button>
					
				</form>
			</div>
		</div>
		
		<script>
			
			// Get the modal and elements inside it
			const modal = document.querySelector('.main-content');
			const closeModal = document.querySelector('.close');
			const answerButton = document.querySelectorAll('.giveanswer');
	
			// Get form fields inside the modal
			const modalId = document.getElementById('agentId');
			const modalName = document.getElementById('name');
			const modalEmail = document.getElementById('email');
			const modalNumber = document.getElementById('number');
			const modalDate = document.getElementById('date');
			const modalProblem = document.getElementById('problem');
			const modalSolution = document.getElementById('solution');
	
			// Open modal and populate data
			answerButton.forEach(button => {
			    button.addEventListener('click', function () {
			        const row = this.closest('tr'); // Get the parent row of the clicked button
	
			        // Fill modal fields with data from the selected row
			        modalId.value = row.cells[0].innerText;       // ID
			        modalEmail.value = row.cells[1].innerText; // Agent Email
			        modalName.value = row.cells[2].innerText;  // Agent Name			        
			        modalNumber.value = row.cells[3].innerText; // Agent Contact
			        modalDate.value = row.cells[4].innerText; // Problem Date
			        modalProblem.value = row.cells[5].innerText; // Problem Description
	
			        // Open modal
			        modal.style.display = 'block';
			    });
			});
	
			// Close modal
			closeModal.addEventListener('click', function () {
			    modal.style.display = 'none';
			});
	
			// Close modal if clicked outside
			window.addEventListener('click', function (event) {
			    if (event.target === modal) {
			        modal.style.display = 'none';
			    }
			});
		
			
			
		</script>
		
	</body>
</html>