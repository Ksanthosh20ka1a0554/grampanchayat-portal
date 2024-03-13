<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Update status</title>
</head>

<body>
	<div id="header">
		<%@ include file="nav.jsp"%>
	</div>
	
	<div class="card m-auto mt-5 border-1 shadow-sm text-center" style="max-width: 25rem;background-color: #d8f5a2;">
		<div class="card-title h2">Update status</div>
		<div class="card-body">
			<h5 class="card-title">${problem.getProbtitle()}</h5>
			<p class="card-text">${problem.getProbdes()}</p>
			<h5 class="card-text text-danger">${problem.getProbstatus()}</h5>
		</div>
		<form id="redirectForm" action="/admin/updatenewstatus" method="post">
    			<input type="hidden" name="probid" id="probIdInput" value="${problem.getProbid()}">
    			Enter new status
    			<input type="text" name="probstatus" id="probStatusinput" value="">
    			<button class="btn btn-primary" type="submit">Submit</button>
			</form>
	</div>

</body>
</html>