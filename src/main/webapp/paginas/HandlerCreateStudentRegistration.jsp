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
<%@ include file="EnrollmentsStatus.jsp" %>

<%
    session.setAttribute("error_message", null);

    List<String> messages = new ArrayList<>();

    int courseId = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("courseId"), "0"));

    if (courseId == 0) {
        session.setAttribute("404_message", "Informe o identificado do curso");
        response.sendRedirect("404.jsp");
        return;
    }

    if (!isLogged) {
        session.setAttribute("404_message", "Efetue login para inscrever-se no curso pretendido");
        response.sendRedirect("404.jsp");
        return;
    }

    try {

        String insertQuery = "INSERT INTO StudentEnrollments (StudentId, CourseId, EnrollmentsStatusId, IsDeleted, CreatedAt, UpdatedAt) "
                + "VALUES (?, ?, ?, FALSE, NOW(), NOW())";

        PreparedStatement stmt = conn.prepareStatement(insertQuery);

        stmt = conn.prepareStatement(insertQuery);
        stmt.setInt(1, loggedUser.id);
        stmt.setInt(2, courseId);
        stmt.setInt(3, EnrollmentsStatus.pending);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add("Aluno inscrito no curso com sucesso");
            session.setAttribute("success_message", messages);
        } else {
            session.setAttribute("404_message", "Não foi possivel inscrever o aluno no curso, tente novamente!");
            response.sendRedirect("404.jsp");
            return;
        }

        conn.commit();
        stmt.close();

        response.sendRedirect("registrations.jsp");

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