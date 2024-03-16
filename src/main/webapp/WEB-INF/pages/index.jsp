<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Gram Panchayat</title>
</head>
<style>
	.login_btn {
			background: #13ab3e !important;
			color: white !important;
			
			margin:20px;
		}
		.login_btn:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.logo{
		width:25%;
		}
		@media (max-width:480px) { 
		.logo{
		
		width:50%;
		}
		
		
		 }
		
</style>
<body>
	<div id="header">
        <!-- Include the navigation bar -->
        <%@ include file="nav.jsp" %>
    </div>
    <div class="text-center m-auto">
    <h1 style="color:#13ab3e;">Welcome to Our panchayat</h1>
    <h4 style="color:#13ab3e;">Please file your omplaints in this portal</h4>
    <div class="text-center">
    <img class="logo" src="https://upload.wikimedia.org/wikipedia/en/thumb/3/37/Emblem_of_Andhra_Pradesh.svg/1200px-Emblem_of_Andhra_Pradesh.svg.png" class="brand_logo" alt="Logo" style="margin-top:20px; margin-bottom:20px">
    
    </div>
    <div class="text-center">
    <a href="/login" class="m-auto btn login_btn">Login</a>
    <a href="/signup" class="m-auto btn login_btn">Sign up</a>
    </div>
    </div>
    
    
    
</body>
</html>