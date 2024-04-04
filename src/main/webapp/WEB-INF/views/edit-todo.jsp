<%@page import="com.todo.services.Service"%>
<%@page import="com.todo.entities.TODO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo: Edit</title>
<link rel="stylesheet" href="css/style.css">
<%@include file="bootstrap.jsp"%>
<% 
int id = Integer.parseInt(request.getParameter("todo_id"));
TODO todo = Service.getTodo(id);
%>
</head>
<body>
<%@include file="go-home.jsp" %>

	<div class="container">

		<form action="edit-details?todo_id=<%=todo.getId() %>" method="post">
			<div class="mb-3">

				<label class="form-label pt-4">Title</label> 
				<input type="text" class="form-control" name="noteTitle" required="required" value="<%=todo.getNoteTitle() %>"> 

				<div class="mb-3">
					<label class="form-label pt-4">Content</label>
					<textarea rows="15" cols="" class="form-control" name="noteContent"><%=todo.getNoteContent()  %></textarea>
				</div>
				<div class="row justify-content-end pr-3">
					<button type="submit" class="btn btn-primary">Update Todo</button>
				</div>
			</div>
		</form>

	</div>

</body>
</html>