<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="../basedados/basedados.h" %>
<%@ include file="javaMd5.jsp" %>
<%@ include file="Constants.jsp" %>

<%

    session.setAttribute("warning_message", null);

    List<String> messages = new ArrayList<>();

    String userEmail = request.getParameter("email");
    String userPassword = request.getParameter("password");

    if (userEmail == null || userEmail.isEmpty() || userPassword == null || userPassword.isEmpty()) {
        messages.add("Email and password are required");
        session.setAttribute("warning_message", messages);
        response.sendRedirect("login.jsp");
        return;
    }

    String hashedPassword = getMD5(userPassword);

    Statement stmt = null;
    ResultSet rs = null;

    try {
        stmt = conn.createStatement();

        String sqlQuery = String.format(
                "SELECT u.*, p.Name AS ProfileName FROM Users u JOIN profiles p ON u.ProfileId = p.Id " +
                        "WHERE u.IsActive = 1 AND (u.Email='%s' OR u.Username='%s') AND u.PasswordHash='%s'",
                userEmail, userEmail, hashedPassword
        );

        rs = stmt.executeQuery(sqlQuery);

        if (!rs.next()) {
            messages.add("Invalid Credential");
            session.setAttribute("warning_message", messages);
            response.sendRedirect("login.jsp");
            return;
        }

        if (!rs.getBoolean("isApproved") && rs.getInt("profileId") == Constants.STUDENT) {

            if (session != null) session.invalidate();

            response.sendRedirect("waitingApprove.jsp");
            return;
        }

        session.setAttribute("isLogged", true);
        session.setAttribute("userId", rs.getInt("id"));
        session.setAttribute("name", rs.getString("name"));
        session.setAttribute("email", rs.getString("email"));
        session.setAttribute("username", rs.getString("username"));
        session.setAttribute("avatarUrl", rs.getString("avatarUrl"));
        session.setAttribute("profileId", rs.getInt("profileId"));
        session.setAttribute("profileName", rs.getString("profileName"));
        session.setAttribute("phoneNumber", rs.getString("phonenumber"));
        session.setAttribute("birthDay", rs.getDate("birthday").toString());
        session.setAttribute("nif", rs.getString("Nif"));
        session.setAttribute("isApproved", rs.getBoolean("IsApproved"));

        response.sendRedirect("dashboard.jsp");

    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

%>