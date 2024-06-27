<%@page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>
<%@ include file="Constants.jsp" %>
<%@ include file="EnrollmentsStatus.jsp" %>
<%@ include file="LoggedUser.jsp" %>

<%
    session.setAttribute("error_message", null);

    List<String> messages = new ArrayList<>();


    int registrationId = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("id"), "0"));

    if (registrationId == 0) {
        session.setAttribute("404_message", "Informe o identificado da inscrição");
        response.sendRedirect("404.jsp");
    }

    String redirectUrl = "registrations.jsp";

    if (loggedUser.profileId == Constants.STUDENT) {
        messages.add("Esta funcionalidade só é permitido para Administradores e Docentes");
        session.setAttribute("error_message", messages);
        response.sendRedirect(redirectUrl);
        return;
    }

    try {

        String sql = "UPDATE StudentEnrollments SET EnrollmentsStatusId=? WHERE id=?";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, EnrollmentsStatus.refused);
        stmt.setInt(2, registrationId);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add(String.format("Inscrição %d recusada com sucesso!", registrationId));
            session.setAttribute("success_message", messages);
        } else messages.add("Não foi possivel recusar a inscrição, tente novamente!");

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