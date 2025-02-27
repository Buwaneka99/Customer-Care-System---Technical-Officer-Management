<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<!DOCTYPE html>
<html>
	<head>
		
		<!--Retrieve message from URL parameters -->
		<%
		    String message = request.getParameter("message");
			if ("password-change".equals(message)){
		%>
				<script>alert("You have change passowrd successfully! Please log in with your new password.");</script>
		<%
			}else if ("logout".equals(message)) {
		%>
		        <script>alert("You have successfully logged out.");</script>
		<%
		    } else if ("please_login".equals(message)) {
		%>
		        <script>alert("Please log in first.");</script>
		<%
		    } 
		%>
			
		<meta charset="UTF-8">
		<title>Technical Officer Login</title>
		
		<link rel="stylesheet" type="text/css" href="./Styles/T_Login.css">
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide|Abril+Fatface|Poppins|Fjalla+One|Trirong">
		
	</head>
	
	<body>
		
		<h1 class="h1-name" >Customer Care System</h1>
		<h2 class="h2-name" >Technical Officer</h2>
		
		<div class="login-form">
			
	        <c:if test="${not empty errorMessage}">
	            <p class="error">${errorMessage}</p>
	        </c:if>
			<h2 class="h2-login">Login</h2>
			
			<form method="post" action="login_T_Officer">
			
				<label class="email" for="email" >User Email</label>
				<input type="email" id="email" name="email"  placeholder="example@gmail.com" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
				<i class='bx bxs-user icon-white'></i>
				
				
				<label class="password" for="password" >Password</label>
				<input type="password" id="password" name="password" placeholder="Password" required>
				<i class='bx bxs-lock-alt icon-white'></i>
				
				
				<label class="remember-me" for="remember-me">
          			<input type="checkbox" id="remember-me" name="remember-me">Remember me
          		</label>
          
          		<p id="frogot" >
          			<a href="forgot_password.jsp">Forgot your password</a>
          		</p>
			
				<button id="login-button" name="submit_button" type="submit">Login</button>
			
			</form>
		</div>
		
	</body>
</html>