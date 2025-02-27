<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<%
    HttpSession sessionCheck = request.getSession(false);
    if (sessionCheck == null || sessionCheck.getAttribute("t_officer_Details") == null) {
        response.sendRedirect("Login.jsp?message=please_login");
        return;
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./Styles/Technical_Officer.css">  
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>Technical_Officer_Home</title>
    
    <style>
.p_modal-content label:after { 
    content: " *";  
    color: red; 
}

    .h1-name{
	font-size:45px;
}
.h2-name{
	margin-top: -10px;
	font-size:32px;
}
.p_image{
margin-left:10%;
margin-top:5%;
}
.d_table{
margin-left:45%;
margin-top:-30%;
}
.information{

	margin-left: 28%;
	width:800px;
	background:#4869b5;
	border-radius:8px;
	padding: 20px;
}
    
.edit{
	margin-left: 400px;
	margin-top: 70px;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	color: white;
	background-color: rgb(255, 45, 45);
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
.p_change{
	margin-left: 50px;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	color: white;
	background-color: rgb(255, 45, 45);
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
.h2-model {
    text-align: center;
    margin-bottom: 20px;
    font-size: 28px;
    color: #05046f;
}
.p_close:hover,
.p_close:focus {
    color: #ff0000;
    text-decoration: none;
}
.edit:hover,
.edit:focus{
	background-color: rgb(156 15 15);
}
.p_change:hover,
.p_change:focus{
	background-color: rgb(156 15 15);
}
    </style>
</head>
<body>
	<%																		
	    String passwordUpdate = request.getParameter("password_update");
	    if ("failed".equals(passwordUpdate)) {
	%>
	        <script>
	            document.addEventListener('DOMContentLoaded', function () {
	                document.getElementById("passwordError").innerText = "Old password is incorrect!";
	                document.getElementById("passwordModal").style.display = "block";
	            });
	        </script>
	<%
	    }
	%>
	
	<jsp:include page="Nev_Bar.jsp" />

    <h1 class="h1-name">Customer Care System</h1>
    <h2 class="h2-name">Welcome</h2>

	

    <div class="information">
    
    <img src="Images/profile3.png" class="p_image"width="13%" height="20%">
    
        <c:forEach var="to" items="${t_officer_Details}">
            <h2>${to.name}</h2>
            <p>${to.email}</p>
            
        </c:forEach>
        <table class="d_table">
		   <c:forEach var="to" items="${t_officer_Details}">
		        <tr style="visibility: hidden;">
		            <td><strong>My ID</strong></td>
		            <td>${to.id}</td>
		        </tr>
		        <tr>
		            <td><strong>Name  :</strong></td>
		            <td>${to.name}</td>
		        </tr>
		        <tr>
		            <td><strong>Username  :</strong></td>
		            <td>${to.username}</td>
		        </tr>
		        <tr>
		            <td><strong>Email :</strong></td>
		            <td>${to.email}</td>
		        </tr>
		        <tr>
		            <td><strong>Contact :</strong></td>
		            <td>${to.contact}</td>
		        </tr>
		        <tr>
		            <td><strong>Address                      :</strong></td>
		            <td>${to.address}</td>
		        </tr>
		    </c:forEach>
		</table>
		
		
		
		<button class="edit" type="submit">Edit My Details</button>
    	<button class="p_change" type="submit">Change password</button>
		
    </div>   

    <!-- Modal (Hidden by default) -->
    <div id="editModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 class="h2-model">Edit My Details</h2>
            
            <form id="editForm" action="Update-Details" method="post" onsubmit="return validateForm()">
                <input type="hidden" id="id" name="id">
                
                <label>Name:</label>
                <input type="text" id="name" name="name" required><br>               
                
                <label>Username:</label>
                <input type="text" id="username" name="username" required><br>
                
                <label>Email:</label>
                <input type="email" id="email" name="email" readonly><br>
                
                <label>Contact:</label>
                <input type="number" id="contact" name="contact"  required><br>
                
                <label>Address:</label>
                <input type="text" id="address" name="address" required><br>
                
                <span class="error" id="modalError" style="color: red;"></span>
                
                <button type="submit">Save Changes</button>
            </form>
        </div>
    </div>
    
    <div id="passwordModal" class="p_modal" style="display: none;">
	    <div class="p_modal-content">
	        <span class="p_close" id="closePasswordModal">&times;</span>
	        <h2 class="p_h2">Update Password</h2>
	        <form id="passwordForm" action="UpdatePassword" method="post" onsubmit="return validatePassword()"> 
	            
	            <label>Old Password:</label>
	            <input type="password" id="oldPassword" name="oldPassword" required>
	            
	            <label>New Password:</label>
	            <input type="password" id="newPassword" name="newPassword" required>
	            
	            <label>Confirm New Password:</label>
	            <input type="password" id="confirmPassword" name="confirmPassword" required>
	           
	            <span class="error" id="passwordError" style="color: red;"></span>
	            
	            <button type="submit">Change Password</button>
	        </form>
	    </div>
	</div>

    <script>
        // Get modal elements
        var editModal = document.getElementById("editModal");
        var editbtn = document.querySelector(".edit");
        var editspan = document.getElementsByClassName("close")[0];
        var passwordModal = document.getElementById("passwordModal");
	    var passwordBtn = document.querySelector(".p_change");
	    var closePasswordModal = document.getElementById("closePasswordModal");

        // Show details modal when edit button is clicked
        editbtn.onclick = function () {
        	editModal.style.display = "block";

            // Get data from the table and populate modal fields
            var id = document.querySelector("table tr:nth-child(1) td:nth-child(2)").innerText;
		    var name = document.querySelector("table tr:nth-child(2) td:nth-child(2)").innerText;
		    var username = document.querySelector("table tr:nth-child(3) td:nth-child(2)").innerText;
		    var email = document.querySelector("table tr:nth-child(4) td:nth-child(2)").innerText;
		    var contact = document.querySelector("table tr:nth-child(5) td:nth-child(2)").innerText;
		    var address = document.querySelector("table tr:nth-child(6) td:nth-child(2)").innerText;

            document.getElementById('id').value = id;
            document.getElementById('name').value = name;
            document.getElementById('username').value = username;
            document.getElementById('email').value = email;
            document.getElementById('contact').value = contact;
            document.getElementById('address').value = address;
        }
        
    	 // Show password modal when button is clicked
	    passwordBtn.onclick = function () {
	        passwordModal.style.display = "block";
	    }

        // Close details modal
        editspan.onclick = function () {
        	editModal.style.display = "none";
        }
        
     	// Close password modal
	    closePasswordModal.onclick = function () {
	        passwordModal.style.display = "none";
	    }

        // Close modal if user clicks outside
        window.onclick = function (event) {
            if (event.target == editModal) {
            	editModal.style.display = "none";
            } else if (event.target == passwordModal) {
	            passwordModal.style.display = "none";
	        }
        }
        

        function validateForm() {
        	
        	document.getElementById("modalError").innerText = "";
        	
	        var name = document.getElementById("name").value;
	        var email = document.getElementById("email").value;
	        var contact = document.getElementById("contact").value;
	        var address = document.getElementById("address").value;
	
	        if (name.length < 2 || name.length > 50 || !/^[A-Za-z\s]+$/.test(name)) {
            document.getElementById("modalError").innerText = "Please enter a valid name (letters and spaces only, 2-50 characters).";
            return false;
        	}

	        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	        if (!emailPattern.test(email)) {
	        	document.getElementById("modalError").innerText = "Please enter a valid email address.";
	            return false;
	        }
	        
	        if (!/^\d{10}$/.test(contact)) {
	        	document.getElementById("modalError").innerText = "Please enter a valid 10-digit mobile number.";
	            return false;
	        }	
	     
	        if (address.length < 5 || address.length > 100) {
	        	document.getElementById("modalError").innerText = "Please enter a valid address (5-100 characters).";
	            return false;
	        }	
	        
	        return true;
	    }
        
        // validate password
        function validatePassword() {
            
            document.getElementById("passwordError").innerText = "";

            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (newPassword !== confirmPassword) {
                document.getElementById("passwordError").innerText = "New Password and Confirm New Password do not match.";
                return false;
            }

            return true;
        }
        
        function showAlert() {
            const urlParams = new URLSearchParams(window.location.search);
            const passwordUpdate = urlParams.get('password_update');

            if (passwordUpdate === 'error') {
            	alert('An error occurred while updating the password.');
            }
        }
 
        window.onload = showAlert;
    </script>  
</body>
</html>
