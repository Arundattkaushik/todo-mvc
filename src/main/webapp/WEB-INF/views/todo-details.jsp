<%@page import="com.todo.services.Service"%>
<%@page import="com.todo.entities.TODO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo</title>
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

			<div class="mb-3">

				<label class="form-label pt-4">Title</label> 
				<input type="text" class="form-control" name="noteTitle" required="required" value="<%=todo.getNoteTitle() %>" disabled="disabled"> 

				<div class="mb-3">
					<label class="form-label pt-4">Note</label>
					<textarea rows="15" cols="" class="form-control" name="noteContent" disabled="disabled"><%=todo.getNoteContent() %></textarea>
				</div>
			</div>

	</div>

</body>
</html>