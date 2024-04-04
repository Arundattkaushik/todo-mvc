<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/bootstrap.jsp"%>
<title>Add TODO</title>
</head>
<body>

<!-- Form to take input from user  -->
<div class="container">

		<form action="create-todo" method="post">
			<div class="mb-3">

				<label class="form-label pt-4">Title</label> <input type="text"
					class="form-control" name="noteTitle" required="required">

				<div class="mb-3">
					<label class="form-label pt-4">Content</label>
					<textarea rows="15" cols="" class="form-control" name="noteContent"></textarea>
				</div>
				<div class="row justify-content-end pr-3">
					<button type="submit" class="btn btn-primary">Create Todo</button>
				</div>
			</div>
		</form></body>
</html>