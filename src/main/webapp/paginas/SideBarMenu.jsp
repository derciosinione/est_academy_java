<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ include file="Constants.jsp" %>
<%@ include file="UserModel.jsp" %>

<%
	String currentFileName = request.getServletPath().toLowerCase().replace(".jsp", "").replace("/paginas/", "");
   	
   	ArrayList<String> activeSettingsPages = new ArrayList<>(Arrays.asList("settings", "account-profile", "settings-change-password", "settings-about"));

  	UserModel loggedUser = new UserModel();
  	
  	boolean isActive = activeSettingsPages.contains(currentFileName);
  	
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


<!-- SIDE BAR -->
<aside>
    <!-- SIDE BAR HEADER -->
    <div class="sidebar-header">
        <a href="index.php"><span>My<span>Academy</span></span></a>
    </div>


    <!-- SIDE BAR MENU -->
    <div class="sidebar-menu">
        <ul <% if (currentFileName.equals("dashboard")) {%> class="active-sidebar-menu" <%} %> >
            <div class="active-sidebar-menu-line"></div>
            <li>
                <a href="dashboard.jsp">
                    <i class="fas fa-chart-line"></i>
                    <span>Dashboard</span>
                </a>
            </li>
        </ul>

        <ul <% if (currentFileName.equals("registrations")) {%> class="active-sidebar-menu" <%} %> >
            <div class="active-sidebar-menu-line"></div>
            <li>
                <a href="registrations.jsp">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Inscrições</span>
                </a>
            </li>
        </ul>

         <ul <% if (currentFileName.equals("courses") || currentFileName.equals("course-detail")) {%> class="active-sidebar-menu" <%} %> >
            <div class="active-sidebar-menu-line"></div>
            <li>
                <a href="courses.php">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <span>Cursos</span>
                </a>
            </li>
        </ul>

        <% if (loggedUser.profileId != Constants.STUDENT) { %>
        
       <ul <% if (currentFileName.equals("students")) {%> class="active-sidebar-menu" <%} %> >
                <div class="active-sidebar-menu-line"></div>
                <li>
                    <a href="students.jsp">
                        <i class="fas fa-user-graduate"></i>
                        <span>Alunos</span>
                    </a>
                </li>
            </ul>

               <ul <% if (currentFileName.equals("instructors")) {%> class="active-sidebar-menu" <%} %> >
                 <div class="active-sidebar-menu-line"></div>
                <li>
                    <a href="instructors.php">
                        <i class="fas fa-user-tie"></i>
                        <span>Docentes</span>
                    </a>
                </li>
            </ul>

       
                <% if (loggedUser.profileId != Constants.INSTRUCTOR) { %>
              
               <ul <% if (currentFileName.equals("admin") || currentFileName.equals("create-user") || currentFileName.equals("user-detail")) {%> class="active-sidebar-menu" <%} %> >
               
                    <div class="active-sidebar-menu-line"></div>
                    <li>
                        <a href="admin.php">
                            <i class="fas fa-user-shield"></i>
                            <span>Admin</span>
                        </a>
                    </li>
                </ul>

        <%     }
        } %>
       
      

      <%-- <ul <?php if (in_array($currentFileName, $activeSettingsPages)) echo 'class="active-sidebar-menu"' ?>> --%>  
        <ul <%= isActive ? "class=\"active-sidebar-menu\"" : "" %>>
            <div class="active-sidebar-menu-line"></div>
            <li><a href="settings.php">
                    <i class="fas fa-cogs"></i>
                    <span>Settings</span>
                </a>
            </li>
        </ul>

        <ul>
            <div class="active-sidebar-menu-line"></div>
            <li>
                <a href="HandlerLogout.jsp">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>

        <div class="sidebar-my-profile">
            <div class="avatar">
                <img alt=""
                     src="<%= loggedUser.avatarUrl %>">
            </div>
           
            <div class="user-information">
                <p class="blackOpacity smallText"><%= loggedUser.profileName %></p>
                <p class="bold blackText"><%= loggedUser.name %></p>
                <a href="settings.php">
                    <button>Ver Perfil</button>
                </a>
            </div>
        </div>
    </div>
</aside>