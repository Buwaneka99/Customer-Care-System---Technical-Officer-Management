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
<title>All_Problem_Summary</title>

<link rel="stylesheet" href="./Styles/All_Problem_Summary.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">

<body>
<jsp:include page="Nev_Bar.jsp" />
	
		<h1 class="h1-name">Manage_summary</h1>
		
		<table>
	    <tr>
	        <th>ID</th>
	        <th>Added Date</th>
	        <th>Type</th>
	        <th>Solved</th>
	        <th>To Be</th>
	        <th>Updated Date</th>
	        <th>Note</th>
	    </tr>
	    <c:forEach var="sum" items="${summary_Details}">
	        <tr>
	            <td>${sum.id}</td>
	            <td>${sum.addedDate}</td> 
	            <td>${sum.type}</td>
	            <td>${sum.solved}</td>
	            <td>${sum.tobe}</td>
	            <td>${sum.updatedDate}</td> 
	            <td>${sum.note}</td> 
	        </tr>
	    </c:forEach>
	</table>
</body>
</html>