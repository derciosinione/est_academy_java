<%@page import="java.util.HashMap"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
         
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>
         
<% 
	HashMap<String, String> formData = (HashMap<String, String>) session.getAttribute("form_data");
	
	String name = "";
	int profileId = 0;
	String email = "";
	String nif = "";
	String phoneNumber = "";
	String birthday = "";

	if (formData != null) {
	    name = formData.get("name");
	    profileId = Integer.parseInt(formData.get("profileId"));
	    email = formData.get("email");
	    nif = formData.get("nif");
	    phoneNumber = formData.get("phoneNumber");
	    birthday = formData.get("birthday");
	    session.removeAttribute("form_data");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <title>Admin > Add User</title>
</head>
<body>

<div class="board">
    <!-- SIDE BAR -->
    <jsp:include page="SideBarMenu.jsp"/>

    <!-- MAIN ELEMENT  -->
    <main id="main">
        <!-- MAIN HEADER -->
        <div class="main-header">
            <div class="main-header-left">
                <div class="main-menu-option">
                    <i class="fas fa-bars menu-icon"></i>
                </div>
            </div>

            <div class="main-header-right">
                <!-- Circular avatar -->
                <jsp:include page="circularAvatar.jsp"/>
            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <div class="main-description">
                <h2>Adicionar Usuário</h2>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <jsp:include page="displayMessageIfExists.jsp"/>

            <div class="user-registration-form">
                <form action="HandlerCreateUser.jsp" method="post">
                    <div class="input-box">
                        <label>
                            Nome
                            <input placeholder="myacademy" type="text" name="name" value="<%= name %>">
                        </label>

                        <label>
                            Email
                            <input placeholder="myacademy@gmail.com" type="text" name="email" value="<%= email %>">
                        </label>

                        <label>
                            NIF
                            <input placeholder="000 000 000" type="text" name="nif" value="<%= nif %>">
                        </label>

                        <label>
                            Contacto
                            <input placeholder="+351 925 365 214" type="text" name="phoneNumber" value="<%= phoneNumber %>">
                        </label>

                        <label for="profileId">
                            Perfil
                            <select id="profileId" class="custom-select" name="profileId">
                                <option value="0" <%= profileId == 0 ? "selected" : "" %>>Escolha o perfil</option>
                                <option value="1" <%= profileId == 1 ? "selected" : "" %>>Estudante</option>
                                <option value="2" <%= profileId == 2 ? "selected" : "" %>>Docente</option>
                                <option value="3" <%= profileId == 3 ? "selected" : "" %>>Admin</option>
                            </select>
                        </label>

                        <label>
                            Data de Nascimento
                            <input placeholder="YYYY-MM-DD" type="text" name="birthDay" value="<%= birthday %>">
                        </label>
                    </div>
                    <input onclick="" onsubmit="" class="mt30 large-btn" type="submit" value="SALVAR">
                </form>
            </div>

        </div>

    </main>
</div>

<script src="main.js"></script>
</body>
</html>