<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<title>Admin dashboard</title>
</head>
<style>
a {
	text-decoration: none;
}

.problem:hover {
	border:4px solid #13ab3e;
	cursor: pointer;
}
.compliants{
width: 18rem;
}
</style>
<script>
    function redirectToProblemStatus(probId) {
        // Set the problem ID in the hidden input field
        document.getElementById("probIdInput").value = probId;
        // Submit the form
        document.getElementById("redirectForm").submit();
    }
</script>
<body>
	<div id="header">
		<%@ include file="nav.jsp"%>
	</div>
	<div class="m-auto compliants card border-light list-group vh-100 border-1">
			<h2 class="text-center card-header">All complaints</h2>
			<!-- Iterate over the list of problems and display each one -->
			<%
			List<com.example.mywebapp.Problems> problems = (List<com.example.mywebapp.Problems>) request.getAttribute("problems");
			if (problems != null) {
				for (com.example.mywebapp.Problems problem : problems) {
			%>
			<form id="redirectForm" action="/admin/viewcomplaint" method="post">
    			<input type="hidden" name="probId" id="probIdInput" value="">
			</form>

			<div class="problem card p-1 m-1 border-2 text-center" style="background-color: #d8f5a2;"
			    onclick="redirectToProblemStatus(<%= problem.getProbid() %>)">
			    <!-- Display problem title and description -->
			    <div class="h5"><%= problem.getProbtitle() != null ? problem.getProbtitle() : "" %></div>
			</div>


			<%
			}
			} else {
			out.println("No complaints found."); // Or handle the absence of complaints accordingly
			}
			%>
		</div>

</body>
</html>