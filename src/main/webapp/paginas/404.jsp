<%

    if (session.getAttribute("404_message") != null) {
        String message = (String) session.getAttribute("404_message");
%>

<div style='margin: 0 auto; background-color: #1C344F; padding: 30px; border-radius: 10px; text-align: center; color: white;'>
    <h1>Elemento nao encontrado
        <h1>
            <br>
            <p><%= message %>
            </p>
</div>

<%
    session.removeAttribute("404_message");
} else { %>
<h1>Elemento nao encontrado<h1>
        <%
}
%>
