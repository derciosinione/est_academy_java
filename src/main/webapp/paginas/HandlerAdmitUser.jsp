<%@page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>
<%@ include file="Constants.jsp" %>
<%@ include file="LoggedUser.jsp" %>

<%
    session.setAttribute("error_message", null);

    List<String> messages = new ArrayList<>();


    int userId = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("id"), "0"));

    if (userId == 0) {
        session.setAttribute("404_message", "Informe o identificado do usuario");
        response.sendRedirect("404.jsp");
    }

    String redirectUrl = "user-detail.jsp?id=" + userId;

    if (loggedUser.profileId != Constants.ADMIN) {
        messages.add("Esta funcionalidade só é permitido para Administradores");
        session.setAttribute("error_message", messages);
        response.sendRedirect(redirectUrl);
    }


    try {

        String sql = "UPDATE users SET IsActive=true, IsApproved=true WHERE id=?";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add("Usuario admitido com sucesso");
            session.setAttribute("success_message", messages);
        } else messages.add("Não foi possivel admitir o usuario, tente novamente!");

        conn.commit();
        stmt.close();

        response.sendRedirect(redirectUrl);

    } catch (Exception e) {
        messages.add("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }

%>