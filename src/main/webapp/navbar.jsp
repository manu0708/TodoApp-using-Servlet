<%@page import="todoappproject.dto.User"%>
<nav>
    <div class="logo">
        <a href="index.jsp"><strong><h1>Man<span>Music</span></h1></strong></a>
    </div>
    <div class="search">
        <form action="" method="post" class="nav-form">
            <input type="text" name="" id="inputSearch" placeholder="search songs here....">
            <i class="fa-solid fa-magnifying-glass"></i>
        </form>
    </div>
    <div class="nav-links">
        <ul>
            <li><a href="">Language</a></li>
            <li><a href="add-task.jsp">AddTask</a></li>
            <% if(session.getAttribute("user")==null){ %>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
            <% }else{ %>
            <li><a href=""><% User user=(User)session.getAttribute("user"); %><%= user.getUserName() %></a></li>
            <li><a href="logout">Logout</a></li>
            <% } %>
        </ul>
    </div>
    <div class="user-logo">
        <a href=""><i class="fa-solid fa-bell"></i></a>
        <div class="user-image" style="background-image: url('./images/user.jpg');"></div>
    </div>
</nav>

<script>
    let search=document.querySelector('.fa-solid').addEventListener('click',()=>{
        let form = document.querySelector('form').style;
        let search_box=document.querySelector('input');

            form.width="80%";
            form.borderRadius="25px";
            form.justifyContent="space-between";
            search_box.style.flexBasis="90%";
            search_box.style.width="100%";
            search_box.focus()

    });

</script>