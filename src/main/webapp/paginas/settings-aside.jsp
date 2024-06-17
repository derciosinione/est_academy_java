<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Constants.jsp" %>
<%@ include file="LoggedUser.jsp" %>


<%
	String currentFileName = request.getServletPath().toLowerCase().replace(".jsp", "").replace("/paginas/", "");
%>


<div class="setting-aside">
    <div class="user-avatar">
        <img class="img-cover" src="<%= loggedUser.avatarUrl %>" alt="">
    </div>
    <div class="pl20 pr20 mt15 pb10">
        <h3><%= loggedUser.name %></h3>
        <p class="blackOpacity mt5 smallText"><i class="fas fa-id-card"></i> <%= loggedUser.profileName %></p>
    </div>

    <div class="horizontal-line"></div>
    <nav>
        <ul>
            <li <% if (currentFileName.equals("settings")) {%> class="active-settings-menu" <%} %>>
            	<a href="settings.jsp">Conta</a>
           	</li>
            <li <% if (currentFileName.equals("settings-change-password")) {%> class="active-settings-menu" <%} %>>
          	  <a href="settings-change-password.jsp">Senha</a>
            </li>
            
          
            <%
            	if (loggedUser.profileId != Constants.ADMIN){
            %>
                <li><a href="#">Usários</a></li>
                <li><a href="#">Categorias</a></li>
                <li><a href="#">Estados</a></li>
            <% } %>
        </ul>
    </nav>

</div>