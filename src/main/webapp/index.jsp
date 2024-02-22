<%@page import="todoappproject.services.Aes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="todoappproject.dto.User"%>
<%@page import="todoappproject.dto.Task"%>
<%@page import="java.util.List"%>
<%@page import="todoappproject.dao.EntityFactory"%>
<%@ page contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HomePage</title>
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- navbar css and links start -->
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- navbar css and links end -->
<style type="text/css">
.alertify-notifier .ajs-message.ajs-success {
	color: color;
	background-color: black;
}
.form-footer{
	height: 100px;
	display: flex;
	justify-content:space-between;
	align-items: flex-start;
}
.form-footer a{
	text-decoration:none;
	width: 100%;
	height: 100%;
	display: flex;
}
.form-footer a button{
	width: 30%;
	height: 80%; 
	background-color: rgb(85, 26, 139);
	color: #fff;
	border: 2px solid rgb(85, 26, 139);
	outline: none;
	font-size: 15px;
	font-weight: 500;
	letter-spacing: 2px;
	border-radius: 10px;
	transition: background-color 0.5s;
}
button{
	padding:4px 10px;
	background-color: orangered;
	color: #fff;
	border: 2px solid orangered;
	outline: none;
	font-size: 15px;
	font-weight: 500;
	letter-spacing: 2px;
	border-radius: 10px;
	transition: background-color 0.5s;
}
.form-footer button:hover{
	color: rgb(85, 26, 139);
	background-color: #fff;
}
button:hover{
	color: orangered;
	background-color: #fff;
}
table{
	box-shadow:0px 0px 10px rgba(0, 0, 0, 0.1);
}
tr{
	color: rgba(29, 24, 24, 0.603);
	font-weight: 500;
	box-shadow:inset 0px 0px 10px rgba(0, 0, 0, 0.3);
}
th{
	padding:10px;
	box-shadow:0px 0px 1px rgba(0, 0, 0, 0.4);
}
td{
	padding:10px;
	box-shadow:0px 0px 2px rgba(0, 0, 0, 0.5);
}
body::-webkit-scrollbar{
	width:5px;
}
body::-webkit-scrollbar-track {
    box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}
body::-webkit-scrollbar-thumb {
    background-color: rgb(85, 26, 139);
    outline: 1px solid slategrey;
}

</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<% List<Task> tasks=new ArrayList(); %>
	<% if(session.getAttribute("user")!=null){ %>
	<% User user1 = (User)session.getAttribute("user"); %>
	<% tasks = EntityFactory.getAllTask(user1);%>
	<% } %>
	<div style="display: flex;justify-content: center;align-items: center;flex-direction: column;min-height: 80vh;margin-top: 70px;z-index: -1;">
	
	<table cellspacing="0" style="flex-basis: 70%;width: 70%;margin-bottom: 30px">
		<tr style="box-shadow: 0px 0px 0px #fff">
			<th colspan="6" style="box-shadow: 0px 0px 0px #fff"><h2 style="color: orangered;flex-basis: 10%;">Task Lists</h2></th>
		</tr>
		<tr style="color:rgb(85, 26, 139);box-shadow:inset 0px 0px 50px rgba(0, 0, 0, 0.3);background-color: #e2dede9d;">
			<th>Task Name</th>			
			<th>Task Description</th>			
			<th>Created Time</th>			
			<th>Status</th>			
			<th>Delete</th>			
			<th>Edit</th>			
		</tr>
		<% if(!tasks.isEmpty()){ %>
		<% for(Task task:tasks){ %>
		<tr style="text-align: center;">
			<td><%= task.getTaskName() %></td>
			<td><%= task.getTaskDescription() %></td>
			<td><%= task.getTaskCreatedTime() %></td>
			<td>
				<% if(task.getTaskStatus().equalsIgnoreCase("complete")){ %>
					<a href="updateTaskStatus?id=<%= Aes.encrypt(Integer.toString(task.getId()), "task-id")%>"><button>Complete</button></a>
				<% }else{ %>
					Completed
				<% } %>
			</td>
			<td><a href="delete-task?id=<%= Aes.encrypt(Integer.toString(task.getId()), "task-id")%>"><button>Delete</button></a></td>
			<td><a href="edit-task.jsp?id=<%= Aes.encrypt(Integer.toString(task.getId()), "task-id")%>"><button>Edit</button></a></td>
		</tr>
		<% } }%>
	</table>
	<!-- <div class="form-footer" style="flex-basis: 20%;display: flex;justify-content: space-between;align-items: center; width: 70%;">
		<a href="add-task.jsp"><button>Add Task</button></a>
		<a href="" style="justify-content: flex-end;"><button>Logout</button></a>
	</div> -->
	</div>
	
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<script>
	<% if(session.getAttribute("msg")!=null){ %>
        alertify.set('notifier','position', 'bottom-center');
        alertify.success('<%= session.getAttribute("msg")%>');
    <%}
	session.setAttribute("msg",null);
    %>
	<% if(request.getAttribute("msg")!=null){ %>
        alertify.set('notifier','position', 'bottom-center');
        alertify.success('<%= request.getAttribute("msg")%>');
    <%}
	request.setAttribute("msg",null);
    %>
    </script>
</body>
</html>
