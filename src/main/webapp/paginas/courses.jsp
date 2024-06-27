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
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/quill@2.0.0-rc.4/dist/quill.core.css">
    <link href="course.css" rel="stylesheet">
    <title>Courses</title>
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
                <%
                    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
                %>
                <form action="courses.jsp" method="get">
                    <div class="search-container">
                        <input placeholder="Search..." type="text" name="search"
                               value="<%=search%>">
                        <button class="btn-icon" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>

                <%-- Circular avatar --%>
                <jsp:include page="circularAvatar.jsp"/>

            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <!-- MAIN DESCRIPTION -->
            <div class="main-description">
                <h2>Cursos</h2>

                <!-- OPTIONS -->
                <div></div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <jsp:include page="displayMessageIfExists.jsp"/>


            <!-- COURSES ITEMS -->
            <div class="cards-container">

                <%
                    String courseDetailsUrl = loggedUser.profileId == Constants.STUDENT ? "cursos-detalhes.jsp" : "#";
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {

                        stmt = conn.createStatement();

                        String sqlQuery = "SELECT " + "    c.Id, " + "    c.Name, " + "    ct.Name AS Category, " + "    c.Price, "
                                + "    c.Description, " + "    c.MaxStudent, " + "    c.CreatorId, " + "    c.CategoryId, "
                                + "    u.Name AS CreatorName, " + "    c.ImageUrl, " + "    c.IsActive, " + "    c.CreatedAt "
                                + "FROM Courses c " + "JOIN Categories ct ON c.CategoryId = ct.Id " + "JOIN Users u ON c.CreatorId = u.Id "
                                + "WHERE 1=1 " + "AND !c.IsDeleted";

                        if (loggedUser.profileId == Constants.INSTRUCTOR) {
                            sqlQuery += " AND u.id=" + loggedUser.id + " ";
                        }

                        if (!search.isEmpty()) {
                            sqlQuery += " AND (c.Name LIKE '%" + search + "%' OR ct.Name LIKE '%" + search + "%')";
                        }

                        sqlQuery += getOrderBy("c") + getQueryLimit(10);

                        rs = stmt.executeQuery(sqlQuery);

                        while (rs.next()) {
                %>

                <div class="course-card transition-scale">
                    <a href="<%=courseDetailsUrl%>?id=<%=rs.getInt("Id")%>">
                        <div class="course-avatar">
                            <img alt="" class="img-cover"
                                 src="<%=rs.getString("ImageUrl")%>">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5"><%=rs.getString("Name")%>
                            </p>
                            <p class="blackOpacity smallText mb10">
                                <i class="fas fa-user-tie"></i>
                                <%=rs.getString("CreatorName")%>
                            </p>
                            <div class="span-label blackBlue-color">
                                <p><%=rs.getString("Category")%>
                                </p>
                            </div>
                        </div>
                    </a>
                </div>

                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null)
                            rs.close();
                        if (stmt != null)
                            stmt.close();
                        if (conn != null)
                            conn.close();
                    }
                %>

            </div>
        </div>

        <br>
    </main>
</div>

<script src="course.js"></script>

</body>
</html>