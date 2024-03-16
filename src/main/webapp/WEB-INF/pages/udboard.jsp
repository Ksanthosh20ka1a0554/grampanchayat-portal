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
<title>User Dashboard</title>
</head>
<style>
a {
	text-decoration: none;
}

.problem:hover {
	border:4px solid #13ab3e;
	cursor: pointer;
}

.col-3{
height: 100vh !important;
}

@media (max-width:480px) {
.col-3{
width:100%;
height:auto !important;
margin-bottom:10px;
}
.col-9{
width:100%;

}

.d-flex{
flex-direction: column;

}



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
	<div class="row d-flex mt-1">
		<div class="col-3 compliants card border-light list-group border-1">
			<h2 class="text-center card-header">Your complaints</h2>
			<!-- Iterate over the list of problems and display each one -->
			<%
			List<com.example.mywebapp.Problems> problems = (List<com.example.mywebapp.Problems>) request.getAttribute("problems");
			if (problems != null) {
				for (com.example.mywebapp.Problems problem : problems) {
			%>
			<form id="redirectForm" action="/problemstatus" method="post">
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

		<div class="col-9" style="border-left: 2px solid #636363;">

			<h2 class="text-center">Create complaint</h2>
			<div class="card border-0" style="background: #d8f5a2;">
				<section class="card">
					<div class="card-header" style="background: #d8f5a2;">
						<ul class="nav nav-tabs card-header-tabs" id="myTab"
							role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="posts-tab" data-toggle="tab" href="#posts" role="tab"
								aria-controls="posts" aria-selected="true">Make a Complaint</a>
							</li>
						</ul>
					</div>
					<div class="card-body">
						<form action="registercomplaint" method="post">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="posts"
									role="tabpanel" aria-labelledby="posts-tab">
									<div class="form-group row">

										<div class="col-12">
											<input id="text" name="probtitle"
												placeholder="Enter Title here"
												class="form-control mb-2 here" required="required"
												type="text">
										</div>
									</div>
									<div class="form-group">
										<label class="sr-only" for="message">post</label>
										<textarea name="probdes" class="form-control" id="message"
											rows="3" placeholder="Explian your problem..."></textarea>
									</div>

								</div>
							</div>
							<div class="text-right">
								<button type="submit" class="mt-2 btn"
									style="background: #13ab3e">Submit</button>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>