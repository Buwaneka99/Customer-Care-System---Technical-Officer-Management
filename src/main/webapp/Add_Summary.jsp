<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<link rel="stylesheet" href="./Styles/Add_Summary.css">
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">		
			
			
			<title>Add My Summary</title>
			
			<script>
				function validateForm() {
					
					document.getElementById("summaryError").innerText = "";
			        
			        var type = document.getElementById("type").value;
			        var solved = document.getElementById("solved").value;
			        var tobe = document.getElementById("tobe").value;
			        var note = document.getElementById("note").value;

			        if (type === "Choose Type") {
			        	document.getElementById("summaryError").innerText = "Please select a type.";
			            return false;
			        }
			        
			        if (solved === "" || isNaN(solved) || solved < 0 || solved > 100 || 
			            tobe === "" || isNaN(tobe) || tobe < 0 || tobe > 100) {
			        	document.getElementById("summaryError").innerText = "Solved and to be solve problems must be numbers between 0 and 100.";
			            return false;
			        }
			
			        if (note === "") {
			        	document.getElementById("summaryError").innerText = "Please provide a note.";
			            return false;
			        }
			
			        return true;
			    }
				
			</script>
	</head>
	
	<body>
		
		<jsp:include page="Nev_Bar.jsp" />
	
		<div>
			<h1 class="h1-name">Add My Problem Summary Today</h1>
		</div>
		
		<% 
	        String successMessage = (String) request.getAttribute("successMessage");
	        if (successMessage != null) { 
	    %>
	        <script>
	            window.onload = function() {
	                alert("<%= successMessage %>");
	            };
	        </script>
	    <% } %>
	
		<div class="main-content">
			<div class="second-content">
				<form action="add_summary" method="post" onsubmit="return validateForm()">
					
					<label for="name" class="date" >Date of Today: (MM/DD/YYYY)</label>
					<input type="text" id="date" name="date" readonly>
					
					<label for="type">Type:</label>
					<select id="type" name="type" required>
						<option>Choose Type</option>
						<option>Customer</option>
						<option>Agent</option>
					</select>		
					
					<label for="solved">Solved Problems:</label>
					<input type="number" id="solved" name="solved" min="0" required>					
					
					<label for="to_be">Problems to be solved:</label>
					<input type="number" id="tobe" name="tobe" min="0" required>					
					
					<label for="note">Summary of problems:</label>
					<textarea id="note" rows="4" name="note" required></textarea>					
					
					<span class="error" id="summaryError" style="color: red;"></span>
					
					<button type="submit">Create Report</button>
					
				</form>
			</div>
		</div>
		
		<script>
    // Get today's date
    const today = new Date();

    // Format date to MM/DD/YYYY
    const formattedDate = ((today.getMonth() + 1)).toString().padStart(2, '0') + '/' + 
                          today.getDate().toString().padStart(2, '0') + '/' + 
                          today.getFullYear(); 

    // Set the formatted date in the input field
    document.getElementById('date').value = formattedDate;
</script>
		
	</body>
</html>