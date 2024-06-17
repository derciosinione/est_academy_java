
<%@ include file="UserModel.jsp" %>

<%
	UserModel loggedUser = new UserModel();
  		
  	boolean isLogged = session.getAttribute("isLogged") != null ? (boolean) session.getAttribute("isLogged") : false;
  	
  	if(isLogged){
  		loggedUser.profileId = (int) session.getAttribute("profileId");
  		loggedUser.name = (String) session.getAttribute("name");
  		loggedUser.email = (String) session.getAttribute("email");
  		loggedUser.profileName = (String) session.getAttribute("Admin");
  		loggedUser.avatarUrl = (String) session.getAttribute("avatarUrl");
  		loggedUser.profileName = (String) session.getAttribute("profileName");
  	}
%>