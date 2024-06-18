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

    if (loggedUser.profileId != Constants.ADMIN) {
        messages.add("Esta funcionalidade só é permitido para Administradores");
        session.setAttribute("error_message", messages);
        response.sendRedirect("create-user.jsp");
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

        response.sendRedirect("create-user.jsp");
    }

    String avatarUrl;
    String redirectUrl;

    switch (profileId) {
        case Constants.STUDENT:
            redirectUrl = "students.jsp";
            avatarUrl = "studentavatar.jpg";
            break;
        default:
            redirectUrl = "users.jsp";
            avatarUrl = "docent-avatar1.jpg";
    }


    String password = nif.replaceAll("\\s", "");

    try {

        String sql = "INSERT INTO Users (Name, Email, UserName, Nif, BirthDay, PhoneNumber, " +
                "ProfileId, AvatarUrl, PasswordHash, IsApproved, IsActive) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, true)";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, email);
        stmt.setString(4, nif);
        stmt.setString(5, birthday);
        stmt.setString(6, phoneNumber);
        stmt.setInt(7, profileId);
        stmt.setString(8, avatarUrl);
        stmt.setString(9, convertToMD5(password));
        stmt.setBoolean(10, true);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            messages.add("Usuario criado com sucesso");
            session.setAttribute("success_message", messages);
        } else messages.add("Não foi possivel criar o usuario, tente novamente!");

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