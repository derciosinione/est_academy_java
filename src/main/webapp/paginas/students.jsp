<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="user.css" rel="stylesheet">
    <title>Students</title>
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
                <h2>Alunos</h2>
                <div>
                  
                 </div>
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <jsp:include page="displayMessageIfExists.jsp" />

            <div class="cards-container">
            
             <div class="user-card">
                    <a href="students-detail.html">
                        <div class="background-image">
                            <img alt="" src="Img/studentbg1.png">
                        </div>

                        <div class="user-avatar">
                            <img alt="" class="img-cover"
                                 src="https://plus.unsplash.com/premium_photo-1664868839907-2309d69b1361?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                        </div>

                        <div class="content-title">
                            <p class="bold">Dercio Sinione Derone</p>
                            <p class="blackOpacity smallText"><i class="fas fa-book-reader"></i> Estudante</p>
                        </div>

                        <div class="content-description">
                            <p class="overflow-text"><i class="far fa-envelope"></i> derciosinione@gmail.com</p>
                            <p><i class="fas fa-phone-alt"></i> +351 912 856 254</p>
                            <span class="span-label green-color">Aprovado</span>
                        </div>
                    </a>
                </div>
             
            </div>

        </div>

    </main>
</div>

<script src="main.js"></script>
</body>
</html>