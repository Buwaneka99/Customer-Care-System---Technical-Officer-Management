<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="./Styles/Nev_Bar.css">
<head>
<meta charset="UTF-8">

</head>
<body>
	<div class="side-nevi-bar">
	<ul class="side-ul">
		
		<li class="profile" ><a href="Technical_Officer.jsp">My profile</a></li>
		<li class="customer" ><a href="CustomerProblems">Customer Problems</a></li>
		<li class="agent" ><a href="AgentProblems">Agent Problems</a></li>
		<li class="adds" ><a href="Add_Summary.jsp">Add Summary</a></li>
		<li class="manages" ><a href="SummaryServlet?targetPage=manage">Manage Summary</a></li>
		<li class="problems" ><a href="SummaryServlet?targetPage=allSummary">Problem Summary</a></li>
		<li class="logout" >
			<button class="button" onclick="confirmLogout()" >Log Out</button>
		</li>
	</ul>
</div>

<script>
	function confirmLogout() {
		const confirmAction = confirm("Are you sure you want to log out?");
		if (confirmAction) {
			window.location.href = "Logout_Officer";
		}
	}
</script>
</body>
</html>