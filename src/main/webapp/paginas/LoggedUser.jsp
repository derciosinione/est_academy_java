<%@page import="java.util.Date" %>
<%@ include file="UserModel.jsp" %>

<%
    UserModel loggedUser = new UserModel();

    boolean isLogged = session.getAttribute("isLogged") != null && (boolean) session.getAttribute("isLogged");

    if (isLogged) {
        loggedUser.id = (int) session.getAttribute("userId");
        loggedUser.profileId = (int) session.getAttribute("profileId");
        loggedUser.name = (String) session.getAttribute("name");
        loggedUser.email = (String) session.getAttribute("email");
        loggedUser.username = (String) session.getAttribute("username");
        loggedUser.avatarUrl = (String) session.getAttribute("avatarUrl");
        loggedUser.profileName = (String) session.getAttribute("profileName");
        loggedUser.birthDay = (String) session.getAttribute("birthDay");
        loggedUser.phoneNumber = (String) session.getAttribute("phoneNumber");
        loggedUser.nif = (String) session.getAttribute("nif");
        loggedUser.isApproved = (boolean) session.getAttribute("isApproved");
    }
%>
