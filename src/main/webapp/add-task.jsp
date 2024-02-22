<% if(session.getAttribute("user")!=null){ %>
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
form .form-footer{
	width: 70%;
	display: flex;
	justify-content:center;
	align-items: flex-start;
}
form .form-footer a{
	width: 100%;
	height: 100%;
}
form .form-footer a button{
	width: 90%;
	height: 90%; 
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
form .form-footer button:hover{
	color: orangered;
	background-color: #fff;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<div style="display: flex;margin-top: 70px;justify-content: space-evenly;align-items: center;flex-direction: column;min-height: 80vh;">
		<form action="add-task" method="post" style="padding:30px;height:280px;width:350px; display: flex;justify-content: space-between;align-items: center;flex-direction: column;gap:20px;box-shadow: 0px 0px 10px rgb(85, 26, 139);">
			<div class="form-header" style="flex-basis: 10%">
				<h2 style="color: rgb(85, 26, 139);">Add Task</h2>
			</div>
			<div class="form-body" style="flex-basis: 50%;width:100%; display: flex;justify-content: space-between;align-items: center;flex-direction: column;">
				<input type="text" name="task-name" placeholder="Enter task name" style="width: 90%;padding: 10px 20px;border: 2px solid rgba(29, 24, 24, 0.603);outline-color: rgb(85, 26, 139);">
				<input type="text" name="task-description" placeholder="Enter task description" style="width: 90%;padding: 10px 20px;border: 2px solid rgba(29, 24, 24, 0.603);outline-color: rgb(85, 26, 139);">
			</div>
			<div class="form-footer" style="flex-basis: 20%">
				<a><button type="submit">Add</button></a>
				<a href=""><button>Cancel</button></a>
			</div>
		</form>
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
<% }else{ %>
<% request.getRequestDispatcher("login.jsp").forward(request, response);
}%>

