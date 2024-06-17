<%@ page import="java.util.*" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
          name="viewport">
    <meta content="ie=edge" http-equiv="X-UA-Compatible">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="login.css" rel="stylesheet">
    <title>Sign Up</title>

</head>
<body>

<div class="login-container">

    <div class="bgImg">
        <img alt="" src="Img/signupImg.png">
    </div>
    <div class="content">
        <nav>
            <a href="index.jsp"><span class="my-logo">My<span>Academy</span></span></a>
            <span>have an account? <a href="login.jsp">Sign in!</a></span>
        </nav>

        <section>
            <form action="HandlerCreateStudent.jsp" method="post">
                <h1 class="fz27">Get Started With My Academy </h1>
                <p class="fz18 blackOpacity">Getting started is easy</p>

                <%--                <!-- Messages -->--%>
                <%--                <% if (messages != null && !messages.isEmpty()) { %>--%>
                <%--                <div class="message-warning blue-color">--%>
                <%--                    <% for (String message : messages) { %>--%>
                <%--                    <p><b>*</b> <%= message %> </p>--%>
                <%--                    <% } %>--%>
                <%--                </div>--%>
                <%--                <% } %>--%>

                <div class="inputs">
                    <input id="name" name="name" placeholder="Nome Completo" type="text" value="">
                    <input id="email" name="email" placeholder="Email" type="email" value="">
                    <input id="phoneNumber" name="phoneNumber" placeholder="Contacto" type="text" value="">
                    <input id="nif" name="nif" placeholder="NIF" type="text" value="">
                    <input id="birthDay" name="birthDay" type="date" value="">
                    <div class="password-div">
                        <input id="password" name="password" placeholder="Password" type="password" value="">
                        <span class="toggle-password" onclick="togglePasswordVisibility()"><i
                                class="fas fa-eye blackOpacity"></i></span>
                    </div>

                    <div class="password-div">
                        <input id="confirm-password" name="confirmPassword" placeholder="Confirmar Password"
                               type="password">
                        <span class="toggle-password" onclick="toggleConfirmPasswordVisibility()"><i
                                class="fas fa-eye blackOpacity"></i></span>
                    </div>

                    <input type="submit" value="Criar Conta">
                </div>
            </form>


        </section>
    </div>


    <script src="login.js"></script>
</div>
</body>
</html>