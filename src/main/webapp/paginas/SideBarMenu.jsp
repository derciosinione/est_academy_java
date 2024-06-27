<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ include file="Constants.jsp" %>
<%@ include file="LoggedUser.jsp" %>

<%
    if (!isLogged) {

        List<String> messages = new ArrayList<>();
        messages.add("Você precisa fazer login");

        session.setAttribute("warning_message", messages);

        response.sendRedirect("login.jsp");

        return;
    }


    if (!loggedUser.isApproved && loggedUser.profileId == Constants.STUDENT) {
        response.sendRedirect("waitingApprove.jsp");
        return;
    }

    String currentFileName = request.getServletPath().toLowerCase().replace(".jsp", "").replace("/paginas/", "");

    ArrayList<String> activeSettingsPages = new ArrayList<>(
            Arrays.asList("settings", "account-profile", "settings-change-password", "settings-about"));

    boolean isActive = activeSettingsPages.contains(currentFileName);
%>


<!-- SIDE BAR -->
<aside>
    <!-- SIDE BAR HEADER -->
    <div class="sidebar-header">
        <a href="index.jsp"><span>My<span>Academy</span></span></a>
    </div>


    <!-- SIDE BAR MENU -->
    <div class="sidebar-menu">
        <ul <%if (currentFileName.equals("dashboard")) {%>
                class="active-sidebar-menu" <%}%>>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="dashboard.jsp"> <i class="fas fa-chart-line"></i>
                <span>Dashboard</span>
            </a></li>
        </ul>

        <ul <%if (currentFileName.equals("registrations")) {%>
                class="active-sidebar-menu" <%}%>>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="registrations.jsp"> <i
                    class="fas fa-clipboard-list"></i> <span>Inscrições</span>
            </a></li>
        </ul>

        <ul
                <%if (currentFileName.equals("courses") || currentFileName.equals("course-detail") || currentFileName.equals("student-course-details")) {%>
                class="active-sidebar-menu" <%}%>>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="courses.jsp"> <i
                    class="fas fa-chalkboard-teacher"></i> <span>Cursos</span>
            </a></li>
        </ul>

        <%
            if (loggedUser.profileId != Constants.STUDENT) {
        %>

        <ul <%if (currentFileName.equals("students")) {%>
                class="active-sidebar-menu" <%}%>>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="students.jsp"> <i class="fas fa-user-graduate"></i>
                <span>Alunos</span>
            </a></li>
        </ul>

        <%
            if (loggedUser.profileId != Constants.INSTRUCTOR) {
        %>

        <ul
                <%if (currentFileName.equals("users") || currentFileName.equals("create-user") || currentFileName.equals("user-detail")) {%>
                class="active-sidebar-menu" <%}%>>

            <div class="active-sidebar-menu-line"></div>
            <li><a href="users.jsp"> <i class="fas fa-user-shield"></i>
                <span>Usuários</span>
            </a></li>
        </ul>

        <%
                }
            }
        %>


        <%-- <ul <?php if (in_array($currentFileName, $activeSettingsPages)) echo 'class="active-sidebar-menu"' ?>> --%>
        <ul <%=isActive ? "class=\"active-sidebar-menu\"" : ""%>>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="settings.jsp"> <i class="fas fa-cogs"></i> <span>Settings</span>
            </a></li>
        </ul>

        <ul>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="HandlerLogout.jsp"> <i
                    class="fas fa-sign-out-alt"></i> <span>Logout</span>
            </a></li>
        </ul>

        <div class="sidebar-my-profile">
            <div class="avatar">
                <img alt="" src="<%=loggedUser.avatarUrl%>">
            </div>

            <div class="user-information">
                <p class="blackOpacity smallText"><%=loggedUser.profileName%>
                </p>
                <p class="bold blackText"><%=loggedUser.name%>
                </p>
                <a href="settings.jsp">
                    <button>Ver Perfil</button>
                </a>
            </div>
        </div>
    </div>
</aside>