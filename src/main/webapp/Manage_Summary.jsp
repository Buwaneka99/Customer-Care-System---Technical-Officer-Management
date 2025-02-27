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
		<title>Manage Problem Summary</title>
		
		<link rel="stylesheet" type="text/css" href="./Styles/Manage_Summary.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
			
	</head>
	<body>
		
		<jsp:include page="Nev_Bar.jsp" />
	
		<h1 class="h1-name">Manage summary of problems</h1>
		
		<table>
	    <tr>
	        <th>ID</th>
	        <th>Added Date</th>
	        <th>Type</th>
	        <th>Solved</th>
	        <th>To Be</th>
	        <th>Updated Date</th>
	        <th>Note</th>
	        <th>Action</th>
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
	            <td><button class="editSummary" type="submit">Edit note</button> <br> 
	            <br>
	            	<button class="deleteSummary" type="submit">Delete note</button></td>
	        </tr>
	    </c:forEach>
	</table>
	
	<div class="main-content" style="display: none;">
			<div class="second-content">
				<span class="close">&times;</span>
				<h2 class="h2-name" >Edit the summary of problems</h2>
				
				<form action="Edit_Summary" method="post">
					
					<label>Summary ID:</label>
					<input type="text" id="summaryId" name="id" readonly>
					
					<label>Date Of Summary added:</label>
					<input type="text" id="date" name="date" readonly>
					
					<label>Summary type:</label>
					<input type="text" id="type" name="type" readonly>
					
					<label>Solved problems count Email:</label>
					<input type="number" id="solved" name="solved" required>
					
					<label>Problems to be solve:</label>
					<input type="number" id="tobe" name="tobe" required>
					
					<label>Note:</label>
					<textarea id="note" name="note" rows="6" required></textarea>		
					
					<button class="edit" type="submit">Save changes</button>
					
				</form>
			</div>
		</div>
		
		<div id="deleteModal" class="delete-modal" >
		    <div class="delete-modal-content">
		        <span class="close">&times;</span>
		        <h2>Confirm Delete</h2>
		        <p>Are you sure you want to delete this summary?</p>
		        <form id="deleteForm" action="Delete_Summary" method="post">

		            <input type="hidden" id="summaryId" name="summaryId">
		            <div class="modal-buttons">
		                <button type="submit" class="delete-btn">Delete</button>
		                <button type="button" class="cancel-btn">Cancel</button>
		            </div>
		            
		        </form>
		    </div>
		</div>
		
		<script>
			
			// Get the modal and elements inside it
			const editModal = document.querySelector('.main-content');
			const deleteModal = document.getElementById("deleteModal");
			const closeModal = document.querySelector('.close');
			const editButton = document.querySelectorAll('.editSummary');
			const deleteButtons = document.querySelectorAll('.deleteSummary');
			
			// Get form fields inside the modal
			const modalId = document.getElementById('summaryId');
			const modalDate = document.getElementById('date');
			const modalType = document.getElementById('type');
			const modalSolved = document.getElementById('solved');
			const modalTobe = document.getElementById('tobe');
			const modalNote = document.getElementById('note');
	
			 // Delete modal elements
		    const deleteForm = document.getElementById("deleteForm");
		    const summaryIdInput = document.querySelector("#deleteModal input[name='summaryId']");
		    const deleteCloseModal = document.querySelector("#deleteModal .close");
		    const cancelDelete = document.querySelector("#deleteModal .cancel-btn");
			
			// Open modal and populate data
			editButton.forEach(button => {
			    button.addEventListener('click', function () {
			        const row = this.closest('tr'); // Get the parent row of the clicked button
	
			        // Fill modal fields with data from the selected row
			        modalId.value = row.cells[0].innerText;       // Summary ID
			        modalDate.value = row.cells[1].innerText; // Summary added date
			        modalType.value = row.cells[2].innerText;  // Summary type			        
			        modalSolved.value = row.cells[3].innerText; // Summary solved problems
			        modalTobe.value = row.cells[4].innerText; // Summary to be solved problems
			        modalNote.value = row.cells[6].innerText; // Summary note
	
			        // Open modal
			        editModal.style.display = 'block';
			    });
			});
	
			// Close modal
			closeModal.addEventListener('click', function () {
				editModal.style.display = 'none';
			});
	
			// Close modal if clicked outside
			window.addEventListener('click', function (event) {
			    if (event.target === editModal) {
			    	editModal.style.display = 'none';
			    }
			});
		
			// Open delete modal
		    deleteButtons.forEach(button => {
		        button.addEventListener('click', function () {
		            const row = this.closest('tr');
		            
		            const summaryId = row.cells[0].innerText; // Get ID
		            summaryIdInput.value = summaryId;

		            // Show delete modal
		            deleteModal.style.display = 'block';
		        });
		    });

		    // Close delete modal
		    deleteCloseModal.addEventListener('click', function () {
		        deleteModal.style.display = 'none';
		    });

		    cancelDelete.addEventListener('click', function () {
		        deleteModal.style.display = 'none';
		    });

		    window.addEventListener('click', function (event) {
		        if (event.target === deleteModal) {
		            deleteModal.style.display = 'none';
		        }
		    });
			
		</script>
		
		<script>
		    
		const urlParams = new URLSearchParams(window.location.search);

	    // Delete Success/Failure Alerts
	    if (urlParams.get('deleteSuccess') === 'true') {
	        alert('Summary deleted successfully!');
	    } else if (urlParams.get('deleteError') === 'true') {
	        alert('Failed to delete summary. Please try again.');
	    }

	    // Edit Success/Failure Alerts
	    if (urlParams.get('editSuccess') === 'true') {
	        alert('Summary edited successfully!');
	    } else if (urlParams.get('editError') === 'true') {
	        alert('Failed to edit summary. Please try again.');
	    }
		    
		</script>
		
	</body>
</html>