<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <title>Usuários</title>
</head>
<body>

<div class="board">
	<!-- SIDE BAR -->
	   <%@ include file="SideBarMenu.jsp" %>

    <!-- MAIN ELEMENT  -->
    <main id="main">
        <!-- MAIN HEADER -->
        <div class="main-header">
            <div class="main-header-left">
                <div class="main-menu-option">
                    <i class="fas fa-bars menu-icon"></i>
                </div>
            </div>

            <div class="main-header-right">
                <div class="search-container">
                    <input placeholder="Search..." type="text">
                    <button class="btn-icon" type="submit"><i class="fas fa-search"></i></button>
                </div>

               <%-- Circular avatar --%>
                <jsp:include page="circularAvatar.jsp" />

            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <div class="main-description">
                <h2>Usuários</h2>

                <div>
                    <a href="create-user.jsp"><button onclick=""><i class="fas fa-plus"></i> ADICIONAR</button></a>
                    
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
           <jsp:include page="displayMessageIfExists.jsp" />

            <div class="cards-container">

                     
                      <div class="user-card pb10 auto-height">

                    <div class="background-image">
                        <img alt="" src="Img/studentbg1.png">
                    </div>

                    <div class="user-avatar">
                        <img alt="" class="img-cover" src="Img/docent-avatar1.jpg">
                    </div>

                    <div class="content-title">
                        <p class="bold">Dercio Derone</p>
                        <p class="blackOpacity smallText"><i class="fas fa-user-tie"></i> Docente</p>
                    </div>

                    <div class="content-description">
                        <p class="overflow-text"><i class="far fa-envelope"></i> dsderone23@gmail.com</p>
                        <p><i class="fas fa-phone-alt"></i> +351 923 923 726</p>
                    </div>

                </div>

            </div>

        </div>

    </main>
</div>

<script src="main.js"></script>
</body>
</html>