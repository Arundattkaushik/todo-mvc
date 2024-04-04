<%@page import="com.todo.services.Service"%>
<%@page import="com.todo.entities.TODO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="bootstrap.jsp"%>
<% 
List<TODO> todos = Service.getAllTodo();
%>

<title>Quick Notes: All Notes</title>
</head>
<body>

	<% 
	if(!todos.isEmpty())
	{
	%>
	<div class="container text-center">
		<h2>All Notes</h2>
		<p>
			<%
			  for(TODO todo: todos)
			  {
			%>
		
			<div class="pl-5 text-left">
				<div class="card mb-3" style="max-width: 540px;">
			<div class="row g-0">
				<div class="col-md-4">
					<img src="img/notepad.png" class="img-fluid rounded-start pl-4 pt-4" alt="this image is copyrighted and all image credit goes to flaticon.com">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title"><a href="todo-details.jsp?todo_id=<%=todo.getId() %>"><%=todo.getNoteTitle() %></a> </h5>
						
						<!-- Applied ellipse on card content -->
						<span class="d-inline-block text-truncate" style="max-width: 280px;"> <%=todo.getNoteContent()  %></span>
						
						<p class="card-text">
						<small class="text-body-secondary">Created on <%=todo.getCreateDate() %></small>
						</p>
						<a class="btn btn-danger" href="delete-todo?todo_id=<%=todo.getId() %>" >Delete</a>
						<a class="btn btn-primary ml-1" href="edit-todo?todo_id=<%=todo.getId()%>">Edit</a>
					</div>
				</div>
			</div>
		</div>
			
			</div>

	    <%
			  }
		%>

	</div>
	<%
	}
	else{
	%>
	<p>Empty List</p>	
	<%	
	}
	%>

</body>
</html>