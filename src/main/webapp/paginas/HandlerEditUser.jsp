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
        return;
    }

    String redirectUrl = "user-detail.jsp?id=" + userId;

    if (loggedUser.profileId != Constants.ADMIN) {
        messages.add("Esta funcionalidade só é permitido para Administradores");
        session.setAttribute("error_message", messages);
        response.sendRedirect(redirectUrl);
        return;
    }

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String nif = request.getParameter("nif");
    String phoneNumber = request.getParameter("phoneNumber");
    String birthday = request.getParameter("birthDay");
    int profileId = Integer.parseInt(request.getParameter("profileId"));

    messages = userValidator(name, email, phoneNumber, nif);

    if (!isValidDateFormat(birthday))
        messages.add("A data de nascimento deve estar no formato yyyy/mm/dd");

    if (profileId <= 0)
        messages.add("Informe o perfil do usuario.");

    if (!messages.isEmpty()) {
        session.setAttribute("error_message", messages);

        HashMap<String, String> formData = new HashMap<>();
        formData.put("name", name);
        formData.put("profileId", Integer.toString(profileId));
        formData.put("email", email);
        formData.put("nif", nif);
        formData.put("phoneNumber", phoneNumber);
        formData.put("birthday", birthday);

        session.setAttribute("form_data", formData);

        response.sendRedirect(redirectUrl);
        return;
    }

    switch (profileId) {
        case Constants.STUDENT:
            redirectUrl = "students.jsp";
            break;
        default:
            redirectUrl = "users.jsp";
    }


    try {

        String sql = "UPDATE users SET name=?, email=?, nif=?, phoneNumber=?, birthday=?, profileId=? WHERE id=?";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, nif);
        stmt.setString(4, phoneNumber);
        stmt.setString(5, birthday);
        stmt.setInt(6, profileId);
        stmt.setInt(7, userId);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add("Usuario atualiazado com sucesso");
            session.setAttribute("success_message", messages);
        } else messages.add("Não foi possivel atualizar o usuario, tente novamente!");

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