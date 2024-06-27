<%@page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>
<%@ include file="LoggedUser.jsp" %>

<%
    session.setAttribute("error_message", null);

    List<String> messages = new ArrayList<>();

    if (!isLogged) {
        messages.add("Você precisa fazer login para acessar o painel administrativo");
        session.setAttribute("warning_message", messages);
        response.sendRedirect("login.jsp");
        return;
    }

    int registrationId = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("id"), "0"));

    if (registrationId == 0) {
        session.setAttribute("404_message", "Informe o identificado da inscrição");
        response.sendRedirect("404.jsp");
    }

    String redirectUrl = "registrations.jsp";

    try {

        String sql = "UPDATE StudentEnrollments SET IsDeleted=? WHERE id=?";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, 1);
        stmt.setInt(2, registrationId);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add(String.format("Inscrição %d elimnada com sucesso!", registrationId));
            session.setAttribute("success_message", messages);
        } else messages.add("Não foi possivel elimnada a inscrição, tente novamente!");

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