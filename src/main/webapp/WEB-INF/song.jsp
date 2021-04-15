<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Song</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<a href="/dashboard" class="text-right mb-5">Dashboard</a>
	<div class="container text-center">
		<h3 class="mb-3">Title: <c:out value="${song.title}"/></h3>
		<h3 class="mb-3">Artist: <c:out value="${song.artist}"/></h3>
		<h3 class="mb-3">Rating(1-10): <c:out value="${song.rating}"/></h3>
		<form action="/songs/delete/${song.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
	</div>
</body>
</html>