<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>
<%@ include file="Constants.jsp" %>

<%
    session.setAttribute("warning_message", null);

    List<String> messages = new ArrayList<>();

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String nif = request.getParameter("nif");
    String phoneNumber = request.getParameter("phoneNumber");
    String birthday = request.getParameter("birthDay");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String avatarUrl = "studentavatar.jpg";

    messages = userValidator(name, email, phoneNumber, nif);

    if (!isValidDateFormat(birthday))
        messages.add("A data de nascimento deve estar no formato yyyy/mm/dd");

    if (password.isEmpty())
        messages.add("A senha é obrigatório.");

    if (!password.equals(confirmPassword))
        messages.add("As senhas não são compactivies.");

    if (!messages.isEmpty()) {
        session.setAttribute("warning_message", messages);

        HashMap<String, String> formData = new HashMap<>();
        formData.put("name", name);
        formData.put("email", email);
        formData.put("nif", nif);
        formData.put("phoneNumber", phoneNumber);
        formData.put("password", password);
        formData.put("confirmPassword", confirmPassword);
        formData.put("birthday", birthday);

        session.setAttribute("form_data", formData);

        response.sendRedirect("signup.jsp");
        return;
    }

    try {

        String sql = "INSERT INTO Users (Name, Email, UserName, Nif, BirthDay, PhoneNumber, " +
                "ProfileId, AvatarUrl, PasswordHash, IsApproved, IsActive) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, false, true)";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, email);
        stmt.setString(4, nif);
        stmt.setString(5, birthday);
        stmt.setString(6, phoneNumber);
        stmt.setInt(7, Constants.STUDENT);
        stmt.setString(8, avatarUrl);
        stmt.setString(9, convertToMD5(password));

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add("Aluno criado com sucesso");
        } else messages.add("Não foi possivel criar a conta de aluno, tente novamente!");

        conn.commit();
        stmt.close();

        response.sendRedirect("waitingApprove.jsp");

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