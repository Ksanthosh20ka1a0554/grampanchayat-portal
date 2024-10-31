<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #d8f5a2;">
  <a class="navbar-brand" href="#">
    <img src="../../Emblem_of_Andhra_Pradesh.svg" width="30" height="30" class="d-inline-block align-top" alt="">
    <span class="font-weight-bold h4">Gram Panchayat</span>
  </a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/admin">Admin login</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/login">User login</a>
      </li>
    </ul>
    <%if (session.getAttribute("userName")!=null){ %>
    
    <span class="d-flex flex-row">
      <h4>Welcome <%= session.getAttribute("userName") %></h4>
	  <a class="btn p-1 float-right" style="background: #13ab3e" href="/logout">Log out</a>
    </span>
    
    <%} %>
    
  </div>
 
</nav>
