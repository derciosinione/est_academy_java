<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%

    Boolean isLogged = (Boolean) session.getAttribute("isLogged");
    isLogged = isLogged != null;

    if (isLogged) {
        out.println("You are logged in");
        response.sendRedirect("dashboard.jsp");
        return;
    }

    List<String> messages = (List<String>) session.getAttribute("error_message");
    session.removeAttribute("error_message");
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
          name="viewport">
    <meta content="ie=edge" http-equiv="X-UA-Compatible">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="login.css" rel="stylesheet">
    <title>Login</title>
</head>
<body>

<div class="login-container">
    <div class="content">
        <nav>
            <a href="index.jsp"><span class="my-logo">My<span>Academy</span></span></a>
            <span>Don’t have an account? <a href="signup.jsp">Sign up!</a></span>
        </nav>

        <section>
            <form action="HandlerLogin.jsp" method="post">
                <h1>Welcome Back</h1>
                <p class="fz18">Login into your account</p>

                <% if (messages != null && !messages.isEmpty()) { %>
                <div class="message-warning blue-color">
                    <% for (String message : messages) { %>
                    <p><b>*</b> <%= message %>
                    </p>
                    <% } %>
                </div>
                <% } %>

                <div class="inputs">
                    <input type="text" placeholder="Email ou username" id="email" name="email">
                    <div class="password-div">
                        <input id="password" name="password" placeholder="Password" type="password">
                        <span class="toggle-password" onclick="togglePasswordVisibility()"><i
                                class="fas fa-eye blackOpacity"></i></span>
                    </div>

                    <input type="submit" value="Login">
                </div>
            </form>
        </section>
    </div>

    <div class="bgImg">
        <img alt="" src="Img/loginImg.png">
    </div>

    <script src="login.js"></script>
</div>
</body>
</html>