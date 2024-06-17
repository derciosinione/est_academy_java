<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="LoggedUser.jsp" %>


<%
    if (isLogged) {
%>

<a href="account-profile.php">
    <div class="avatar">
        <img alt="" src="<%= loggedUser.avatarUrl %>">
    </div>
</a>

<% } %>

