<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%

    List<String> messages = null;

    String color = "blue-color";

    if (session.getAttribute("success_message") != null) {
        messages = (List<String>) session.getAttribute("success_message");
        color = "green-color";
        session.removeAttribute("success_message");
    } else if (session.getAttribute("warning_message") != null) {
        messages = (List<String>) session.getAttribute("warning_message");
        session.removeAttribute("warning_message");
    } else if (session.getAttribute("warning_message") != null) {
        messages = (List<String>) session.getAttribute("error_message");
        color = "red-color";
        session.removeAttribute("error_message");
    }

    if (messages != null) {

%>

<div class="message-box <%= color %>">
    <i class="fas fa-times close-message-box" onclick="hideMessageBox()"></i>
    <section>
        <%
            for (String message : messages) { %>
        <p><b>*</b> $message </p>
        <%}%>
    </section>
</div>

<script>
    function hideMessageBox() {
        let elements = document.getElementsByClassName("message-box");

        for (let i = 0; i < elements.length; i++) {
            let element = elements[i];
            element.style.display = "none";
        }
    }
</script>
<%}%>
 
 