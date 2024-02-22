<% if(session.getAttribute("user")!=null){ 
	response.sendRedirect("index.jsp");
}else{%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/register.css">
<!-- navbar css and links start -->
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- navbar css and links end -->
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
	<style type="text/css">
		 .alertify-notifier .ajs-message.ajs-success{
            color:color;
            background-color:black;
        }
	</style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	<div class="login-form" style="margin-top: 70px;">
	<form action="login" method="post" class="auth-form" style="gap:40px">
		<h4>Sign In</h4>
		<input class="txt" type="text" name="username" placeholder="Enter username" required> 
		<input class="txt" type="password" name="password" placeholder="Password" required> <input type="submit" value="Login">
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
<% } %>