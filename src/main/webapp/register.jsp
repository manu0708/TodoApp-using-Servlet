<% if(session.getAttribute("user")!=null){ 
	response.sendRedirect("index.jsp");
}else{%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="css/register.css">

<!-- navbar css and links start -->
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- navbar css and links end -->

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
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
	<form action="register" method="post" class="auth-form">
		<h4>Sign Up</h4>
		<input class="txt" type="text" name="username" placeholder="Enter Username" required>
		<input class="txt" type="text" name="email" placeholder="Enter email" pattern="[A-Za-z0-9\.]{8,}@{1}[A-Za-z0-9]+\.{1}[A-Za-z0-9]{2,3}" required>
		<input class="txt" id="pass" type="password" name="password" placeholder="Password" required>
	 	<input class="txt" type="text" name="mobileNumber" placeholder="Enter Mobile Number" pattern="[0-9]{10}" required>
	 	<input class="txt" type="date" name="dateOfBirth" required>
	 	<div class="gen">
	 		<input type="radio" id="male" name="gender" value="male">
	 		<label for="male">Male</label>
	 		<input type="radio" id="female" name="gender" value="female">
	 		<label for="female">Female</label>
	 	</div>
		<input type="submit" value="Register">
	</form>
	</div>
	<script type="text/javascript">
	var password = document.getElementById('pass');
	var conf = document.getElementById('conf');

	conf.addEventListener('mouseleave', () => {
	    if (password.value!=conf.value) {
	        alert("password does not match");
	        conf.focus();
	    }
	});
	</script>
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