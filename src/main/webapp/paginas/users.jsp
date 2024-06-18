<%@page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <title>Usuários</title>
</head>
<body>

<div class="board">
    <!-- SIDE BAR -->
    <%@ include file="SideBarMenu.jsp" %>

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
                <% String search = Objects.requireNonNullElse(request.getParameter("search"), ""); %>
                <form action="users.jsp" method="get">
                    <div class="search-container">
                        <input placeholder="Search..." type="text" name="search" value="<%= search %>">
                        <button class="btn-icon" type="submit"><i class="fas fa-search"></i></button>
                    </div>
                </form>

                <%-- Circular avatar --%>
                <jsp:include page="circularAvatar.jsp"/>

            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <div class="main-description">
                <h2>Usuários</h2>

                <div>
                    <a href="create-user.jsp">
                        <button onclick=""><i class="fas fa-plus"></i> ADICIONAR</button>
                    </a>

                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <jsp:include page="displayMessageIfExists.jsp"/>

            <div class="cards-container">

                <%

                    Statement stmt = null;
                    ResultSet rs = null;

                    try {

                        stmt = conn.createStatement();

                        String sqlQuery = "SELECT "
                                + "u.Id, "
                                + "u.Name, "
                                + "u.Email, "
                                + "u.Username, "
                                + "u.NIF, "
                                + "u.ProfileId, "
                                + "p.Name AS 'Profile', "
                                + "u.PhoneNumber, "
                                + "u.BirthDay, "
                                + "u.AvatarUrl, "
                                + "u.IsApproved, "
                                + "u.CreatedAt "
                                + "FROM Users u "
                                + "JOIN Profiles p ON u.ProfileId = p.Id "
                                + "WHERE 1=1 "
                                + "AND NOT u.IsDeleted "
                                + "AND u.ProfileId IN (2,3) "
                                + "AND u.IsActive ";

                        if (!search.isEmpty()) {
                            sqlQuery += " AND (u.Name LIKE '%" + search + "%' OR u.Email LIKE '%" + search + "%')";
                        }

                        sqlQuery += getOrderBy("u") + getQueryLimit(10);

                        rs = stmt.executeQuery(sqlQuery);

                        while (rs.next()) {
                %>
                <div class="user-card pb10 auto-height">
                    <a href="user-detail.jsp?id=<%= rs.getInt("Id") %>">
                        <div class="background-image">
                            <img alt="" src="Img/studentbg1.png">
                        </div>

                        <div class="user-avatar">
                            <img alt="" class="img-cover" src="Img/<%= rs.getString("AvatarUrl") %>">
                        </div>

                        <div class="content-title">
                            <p class="bold"><%= rs.getString("Name") %>
                            </p>
                            <p class="blackOpacity smallText"><i
                                    class="fas fa-user-tie"></i> <%= rs.getString("Profile") %>
                            </p>
                        </div>

                        <div class="content-description">
                            <p class="overflow-text"><i class="far fa-envelope"></i> <%= rs.getString("Email") %>
                            </p>
                            <p><i class="fas fa-phone-alt"></i> <%= rs.getString("PhoneNumber") %>
                            </p>
                        </div>
                    </a>
                </div>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </div>

            <br>
            <br>
        </div>

    </main>
</div>

<script src="main.js"></script>
</body>
</html>