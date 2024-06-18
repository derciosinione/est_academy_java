<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../basedados/basedados.h" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="main.css" rel="stylesheet">
    <link href="settings.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <title>Settings</title>
</head>
<body>

<div class="board">
    <!-- SIDE BAR -->
    <%@ include file="SideBarMenu.jsp" %>

    <%

        String name = loggedUser.name;
        String username = loggedUser.username;
        String email = loggedUser.email;
        String nif = loggedUser.getNif();
        String phoneNumber = loggedUser.phoneNumber;
        String birthday = loggedUser.birthDay;

        HashMap<String, String> formData = (HashMap<String, String>) session.getAttribute("form_data");

        if (formData != null) {
            name = formData.get("name");
            username = formData.get("username");
            email = formData.get("email");
            nif = formData.get("nif");
            phoneNumber = formData.get("phoneNumber");
            birthday = formData.get("birthday");
            session.removeAttribute("form_data");
        }


    %>

    <!-- MAIN ELEMENT  -->
    <main>
        <!-- MAIN HEADER -->
        <div class="main-header">
            <div class="main-header-left">
                <div class="main-menu-option">
                    <i class="fas fa-bars menu-icon"></i>
                </div>
            </div>

            <div class="main-header-right">
                <div class="search-container">
                    <input placeholder="Search..." type="text">
                    <button class="btn-icon" type="submit"><i class="fas fa-search"></i></button>
                </div>

                <%-- Circular avatar --%>
                <jsp:include page="circularAvatar.jsp"/>

            </div>
        </div>

        <div style="width: 91%; margin: 0 auto;">
            <jsp:include page="displayMessageIfExists.jsp"/>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <jsp:include page="settings-aside.jsp"/>

            <section>
                <h3 class="mt15 ml15 mb15">Informações Pessoais</h3>
                <div class="horizontal-line"></div>

                <div class="setting-container">

                    <form action="HandlerUpdateUserInfo.jsp" method="post">
                        <div class="input-box">

                            <input placeholder="myacademy" type="hidden" name="id" value="<%= loggedUser.id %>">

                            <label>
                                Nome
                                <input placeholder="myacademy" type="text" name="name" value="<%= name %>">
                            </label>

                            <label>
                                Email
                                <input placeholder="myacademy@gmail.com" type="text" name="email" value="<%= email %>">
                            </label>

                            <label>
                                Username
                                <input placeholder="myacademy" type="text" name="username" value="<%= username %>">
                            </label>

                            <label>
                                NIF
                                <input placeholder="000 000 000" type="text" name="nif" value="<%= nif %>">
                            </label>

                            <label>
                                Contacto
                                <input placeholder="+351 925 365 214" type="text" name="phoneNumber"
                                       value="<%= phoneNumber %>">
                            </label>

                            <label>
                                Data de Nascimento
                                <input placeholder="YYYY-MM-DD" type="text" name="birthday" value="<%= birthday %>">
                            </label>
                        </div>
                        <input onclick="" onsubmit="" class="mt30 save-info-btn" type="submit" value="SALVAR">
                    </form>

                </div>

            </section>

        </div>

    </main>
</div>
</body>
</html>