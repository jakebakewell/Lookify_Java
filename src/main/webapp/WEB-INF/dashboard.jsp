<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<div class="d-flex justify-content-around">
		<a href="/songs/new">Add New Song</a>
		<a href="/search/topTen">Top Ten</a>
		<form action="/search" method="post">
			<input type="search" id="search-artist" name="search-artist" class="form-control">
			<input type="submit" value="Search Artists" class="btn btn-primary">
		</form>
	</div>
	<div class="text-center">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Title</th>
					<th>Rating</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${songs}" var="song">
	        	<tr class="table-info">
		            <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
		            <td><c:out value="${song.rating}"/></td>
		            <td><a href="/songs/delete/${song.id}">Delete</a></td>
	        	</tr>
	        	</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>