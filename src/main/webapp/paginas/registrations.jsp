<%@page import="java.text.SimpleDateFormat" %>
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
    <link href="main.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <title>Registrations</title>

</head>
<body>

<div class="board">
    <!-- SIDE BAR -->


    <%@ include file="SideBarMenu.jsp" %>

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
                <% String search = Objects.requireNonNullElse(request.getParameter("search"), ""); %>
                <form action="registrations.jsp" method="get">
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
                <h2>Inscrições</h2>
                <div>

                </div>
            </div>


            <jsp:include page="displayMessageIfExists.jsp"/>

            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>Student details</th>
                        <th>Curso</th>
                        <th>Data</th>
                        <th>Status</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%

                        Statement stmt = null;
                        ResultSet rs = null;

                        try {

                            stmt = conn.createStatement();

                            String sqlQuery =
                                    "SELECT SE.Id, " +
                                            "U.Name AS StudentName, " +
                                            "U.Email, " +
                                            "U.AvatarUrl, " +
                                            "C.Name AS Course, " +
                                            "ES.Name AS Status, " +
                                            "SE.EnrollmentsStatusId, " +
                                            "SE.CreatedAt " +
                                            "FROM StudentEnrollments SE " +
                                            "JOIN Users U ON SE.StudentId = U.Id " +
                                            "JOIN Courses C ON SE.CourseId = C.Id " +
                                            "JOIN EnrollmentsStatus ES ON SE.EnrollmentsStatusId = ES.Id " +
                                            "WHERE 1=1 " +
                                            "AND SE.IsDeleted = false ";

                            switch (loggedUser.profileId) {
                                case Constants.STUDENT:
                                    sqlQuery += " AND SE.StudentId=" + loggedUser.id;
                                    break;
                                case Constants.INSTRUCTOR:
                                    sqlQuery += " AND C.CreatorId=" + loggedUser.id;
                                    break;
                            }


                            if (!search.isEmpty()) {
                                sqlQuery += " AND (U.Name LIKE '%" + search
                                        + "%' OR C.Name LIKE '%" + search
                                        + "%' OR ES.Name LIKE '%" + search
                                        + "%' OR U.Email LIKE '%" + search + "%') ";
                            }

                            sqlQuery += getOrderBy("SE") + getQueryLimit(10);

                            rs = stmt.executeQuery(sqlQuery);

                            while (rs.next()) {

                    %>

                    <tr>
                        <td class="td-line">
                            <div class="avatar">
                                <img src="Img/<%= rs.getString("AvatarUrl") %>">
                            </div>
                            <div>
                                <%= rs.getString("StudentName") %>
                                <p class="blackOpacity mt5 smallText"><%= rs.getString("Email") %>
                                </p>
                            </div>
                        </td>
                        <td><%= rs.getString("Course") %>
                        </td>
                        <td><%= rs.getString("CreatedAt") %>
                        </td>
                        <td><span
                                data-status="<%= rs.getString("EnrollmentsStatusId") %>"><%= rs.getString("Status") %></span>
                        </td>
                        <td>
                            <div class="table-actions">
                                <% if (loggedUser.profileId != Constants.STUDENT) { %>
                                <a href="HandlerRegistrationApprove.jsp?id=<%= rs.getString("Id") %>">
                                    <div class="tooltip">
                                        <i class="fas fa-check-double green-text"></i>
                                        <span class="tooltipText">Aceitar inscrição do aluno</span>
                                    </div>
                                </a>
                                <% } %>

                                <a href="HandlerRegistrationRefuse.jsp?id=<%= rs.getString("Id") %>">
                                    <div class="tooltip">
                                        <i class="fas fa-times red-text" style="font-size: 22px"></i>
                                        <span class="tooltipText">Recusar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fa fa-info-circle"></i>
                                        <span class="tooltipText">Informações da inscrição.</span>
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>

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

                    </tbody>
                </table>
            </div>


        </div>

    </main>
</div>
</body>
</html>