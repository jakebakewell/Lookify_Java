<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Song</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<a href="/dashboard" class="text-right mr-5">Dashboard</a>
	<div class="container text-center">
		<h1>New Song</h1>
		<form:form action="/dashboard" method="post" modelAttribute="song">
		    <p>
		        <form:label path="title">Title</form:label>
		        <form:errors path="title"/>
		        <form:input path="title"/>
		    </p>
		    <p>
		        <form:label path="artist">Artist</form:label>
		        <form:errors path="artist"/>
		        <form:input path="artist"/>
		    </p>
		    <p>
		        <form:label path="rating">Rating</form:label>
		        <form:errors path="rating"/>
		        <form:input path="rating"/>
		    </p>    
		    <input type="submit" value="Submit" class="btn btn-success mt-3"/>
		</form:form>
	</div>
</body>
</html>