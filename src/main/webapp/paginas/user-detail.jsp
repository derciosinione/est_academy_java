<%@page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="javaMd5.jsp" %>
<%@ include file="Constants.jsp" %>
<%@ include file="LoggedUser.jsp" %>
<%@ include file="../basedados/basedados.h" %>


<%
    int userId = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("id"), "0"));

    if (userId == 0) {
        session.setAttribute("404_message", "Informe o identificado do usuario");
        response.sendRedirect("404.jsp");
    }


    if (loggedUser.profileId != Constants.ADMIN) {
        session.setAttribute("error_message", null);
        List<String> messages = new ArrayList<>();
        messages.add("Esta funcionalidade só é permitido para Administradores");
        session.setAttribute("error_message", messages);
        response.sendRedirect("users.jsp");
    }

    String name = "";
    int profileId = 0;
    String email = "";
    String nif = "";
    String phoneNumber = "";
    String birthday = "";
    Boolean isApproved = false;

    Statement stmt = null;
    ResultSet rs = null;

    try {
        stmt = conn.createStatement();

        String sqlQuery =
                "SELECT " +
                        "u.Id, " +
                        "u.Name, " +
                        "u.Email, " +
                        "u.Username, " +
                        "u.NIF, " +
                        "u.ProfileId, " +
                        "p.Name AS Profile, " +
                        "u.PhoneNumber, " +
                        "u.BirthDay, " +
                        "u.AvatarUrl, " +
                        "u.IsApproved, " +
                        "u.CreatedAt " +
                        "FROM Users u " +
                        "JOIN Profiles p ON u.ProfileId = p.Id " +
                        "WHERE 1=1 " +
                        "AND !u.IsDeleted " +
                        "AND u.IsActive " +
                        "AND u.Id=" + userId;

        rs = stmt.executeQuery(sqlQuery);

        if (!rs.next()) {
            session.setAttribute("404_message", "Usuário não encontrado");
            response.sendRedirect("404.jsp");
            return;
        }

        name = rs.getString("name");
        profileId = rs.getInt("profileId");
        email = rs.getString("email");
        nif = Objects.requireNonNullElse(rs.getString("Nif"), "");
        phoneNumber = rs.getString("phonenumber");
        birthday = rs.getDate("birthday").toString();
        isApproved = rs.getBoolean("IsApproved");

    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
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
    <title>Admin > User Detail</title>
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
                <%-- Circular avatar --%>
                <jsp:include page="circularAvatar.jsp"/>
            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <div class="main-description">
                <h2>Detalhes de Usuário</h2>

                <div>
                    <% if (profileId == Constants.STUDENT && !isApproved) { %>
                    <a href="HandlerAdmitUser.jsp?id=<%= userId %>">
                        <button onclick="">ADMITIR</button>
                    </a>
                    <% } %>

                    <a href="HandlerDeleteUser.jsp?id=<%= userId %>">
                        <button onclick="" class="red-color">ELIMINAR</button>
                    </a>
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <jsp:include page="displayMessageIfExists.jsp"/>

            <div class="user-registration-form">
                <form action="HandlerEditUser.jsp?id=<%= userId %>" method="post">
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
                            <input placeholder="+351 925 365 214" type="text" name="phoneNumber"
                                   value="<%= phoneNumber %>">
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