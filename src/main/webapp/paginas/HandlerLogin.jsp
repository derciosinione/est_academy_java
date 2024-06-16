<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%

    session.setAttribute("warning_message", null);

    List<String> messages = new ArrayList<>();

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
        messages.add("Email and password are required");
        session.setAttribute("warning_message", messages);
        response.sendRedirect("login.jsp");
        return;
    }

    session.setAttribute("isLogged", true);
    session.setAttribute("userId", 1);
    session.setAttribute("name", "dsderone");
    session.setAttribute("username", "dsderone");
    session.setAttribute("avatarUrl", "Img/studentavatar.jpg");
    session.setAttribute("profileId", 3);
    session.setAttribute("profileName", "Admin");
    session.setAttribute("email", "derciosinione@gmail.com");

    response.sendRedirect("dashboard.jsp");
%>