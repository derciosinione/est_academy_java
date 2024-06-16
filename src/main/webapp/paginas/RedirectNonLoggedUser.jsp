
<%

    // Include utility functions
    // Note: If Utils.appSessionStart(request) initializes the session, call it here if needed.
    // Example: Utils.appSessionStart(request);
    // Ensure the necessary methods are defined in your JSP if needed.

    // Determine the current file name
    String currentFileName = request.getRequestURI();
    currentFileName = currentFileName.substring(currentFileName.lastIndexOf("/") + 1);
    currentFileName = currentFileName.replace(".jsp", "").toLowerCase().trim();
    currentFileName = currentFileName.replace(".html", "");

    // Check if the user is logged in
    if (session.getAttribute("loggedUser") == null) {
        // Set session attributes for redirect
        session.setAttribute("redirect_url", request.getRequestURI());
        session.setAttribute("warning_message", "You need to log in to access the administrative panel");

        // Redirect to login page
        response.sendRedirect("login.jsp");
        return;  // Ensure the rest of the page does not execute
    }
%>
