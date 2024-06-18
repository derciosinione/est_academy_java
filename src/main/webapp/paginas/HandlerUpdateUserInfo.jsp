<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>

<%

    session.setAttribute("error_message", null);

    List<String> messages = new ArrayList<>();

    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String phoneNumber = request.getParameter("phoneNumber");
    String birthday = request.getParameter("birthday");
    String nif = request.getParameter("nif");


    if (name.isEmpty())
        messages.add("O nome é um campo obrigatorio");

    if (email.isEmpty())
        messages.add("O email é um campo obrigatorio");

    if (username.isEmpty())
        messages.add("O nome de usuário é um campo obrigatorio");

    if (!isValidDateFormat(birthday))
        messages.add("A data de nascimento deve estar no formato yyyy/mm/dd");

    if (!messages.isEmpty()) {
        session.setAttribute("error_message", messages);

        HashMap<String, String> formData = new HashMap<>();
        formData.put("name", name);
        formData.put("username", username);
        formData.put("email", email);
        formData.put("nif", nif);
        formData.put("phoneNumber", phoneNumber);
        formData.put("birthday", birthday);

        session.setAttribute("form_data", formData);

        response.sendRedirect("settings.jsp");
    }


    try {

        String sql = "UPDATE Users SET name=?, email=?, username=?, phoneNumber=?, birthday=?, nif=? WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, username);
        stmt.setString(4, phoneNumber);
        stmt.setString(5, birthday);
        stmt.setString(6, nif);
        stmt.setInt(7, id);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("username", username);
            session.setAttribute("phoneNumber", phoneNumber);
            session.setAttribute("birthDay", birthday);
            session.setAttribute("nif", nif);
            messages.add("Informações atualizadas com sucesso.");
            session.setAttribute("success_message", messages);
        } else messages.add("Falha ao atualizar as informações do usuário");

        conn.commit();
        stmt.close();

        response.sendRedirect("settings.jsp");

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