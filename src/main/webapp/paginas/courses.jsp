<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/quill@2.0.0-rc.4/dist/quill.core.css">
    <link href="course.css" rel="stylesheet">
    <title>Courses</title>
</head>
<body>


<div class="board">
    <!-- SIDE BAR -->
       <%@ include file="SideBarMenu.jsp" %>

    <!-- MAIN ELEMENT  -->
    <main>
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

             <!-- MAIN DESCRIPTION -->
            <div class="main-description">
                <h2>Cursos</h2>

                <!-- OPTIONS -->
                <div>
                   
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
           <jsp:include page="displayMessageIfExists.jsp" />


      <!-- COURSES ITEMS -->
            <div class="cards-container">

           
                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-6.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">JavaScript Avançado</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Bruno Nunes</p>
                            <div class="span-label blackBlue-color"><p>Programação</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-4.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Gestão de Projetos com Agile</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Fernanda Lima</p>
                            <div class="span-label blackBlue-color"><p>Gestão</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-1.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Fotografia Digital</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Rafael Souza</p>
                            <div class="span-label blackBlue-color"><p>Fotografia</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-2.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Culinária Gourmet</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Letícia Gomes</p>
                            <div class="span-label blackBlue-color"><p>Gastronomia</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-5.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Introdução à Filosofia</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Marcos Oliveira</p>
                            <div class="span-label blackBlue-color"><p>Humanidades</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-3.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Técnicas de Pintura em Aquarela</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Bianca Ribeiro</p>
                            <div class="span-label blackBlue-color"><p>Arte</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-4.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Economia para Leigos</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Jorge Silva</p>
                            <div class="span-label blackBlue-color"><p>Economia</p></div>
                        </div>
                    </a>
                </div>

                <div class="course-card transition-scale">
                    <a href="#l">
                        <div class="course-avatar">
                            <img alt="" class="img-cover" src="Img/courses-6.jpg">
                        </div>
                        <div class="content-title">
                            <p class="bold mb5">Redação Criativa</p>
                            <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> Daniela Martins</p>
                            <div class="span-label blackBlue-color"><p>Literatura</p></div>
                        </div>
                    </a>
                </div>

            </div>
        </div>

        <br>
    </main>
</div>

<script src="course.js"></script>

</body>
</html>