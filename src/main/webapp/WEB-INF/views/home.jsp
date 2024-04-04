<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.todo.services.Service"%>
<%@page import="com.todo.entities.TODO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo: Home</title>
<%@include file="bootstrap.jsp"%>
<link rel="stylesheet" href="css/style.css">

<%
List<TODO> todos = Service.getAllTodo();
%>
</head>
<body>
	<div class="container">
		<h1 class="text-center mt-2">Welcome to TODO Manager</h1>
		<div class="row mt-3">
			<div class="col-md-2 text-center">
				<ul class="list-group">
					<li class="list-group-item active" aria-current="true">Menu</li>
					<a class="list-group-item" href="add-todo">Add TODO</a>
					<a class="list-group-item" href="todo-list">List TODO</a>
				</ul>
			</div>
			
			<div class="col-md-10 text-center">
			
				<h3>Todo List</h3>

				<%
				if (!todos.isEmpty()) {
				%>
				<div class="container text-center">
					<p>
						<%
						for (TODO todo : todos) {
						%>
					
					<div class="pl-5 text-left">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="img/notepad.png"
										class="img-fluid rounded-start pl-4 pt-4"
										alt="this image is copyrighted and all image credit goes to flaticon.com">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">
											<a href="todo-details?todo_id=<%=todo.getId()%>"><%=todo.getNoteTitle()%></a>
										</h5>

										<!-- Applied ellipse on card content -->
										<span class="d-inline-block text-truncate"
											style="max-width: 280px;"> <%=todo.getNoteContent()%></span>

										<p class="card-text">
											<small class="text-body-secondary">Created on: <%=todo.getCreateDate()%></small>
											<br>
											<small class="text-body-secondary"><% if(todo.getLastUpdatedDate()==null)
											{
											%>
												Updated on: NA
											<%
											}
											else{
											%>
											   Updated on: <%=todo.getLastUpdatedDate().compareTo(todo.getCreateDate()) %> Day ago 
											<%
											}
											%></small>
										</p>
										<a class="btn btn-danger"
											href="delete-todo?todo_id=<%=todo.getId()%>">Delete</a> 
											<a class="btn btn-primary ml-1"
											href="edit-todo?todo_id=<%=todo.getId()%>">Edit</a>
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
				} else {
				%>
				<p>Empty List</p>
				<%
				}
				%>
			</div>
		
		
		
		</div>
	</div>
</body>
</html>