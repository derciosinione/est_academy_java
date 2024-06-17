<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <link rel="stylesheet" href="course-detail-web.css">

    <title>My Academy > Cursos</title>
</head>
<body>

<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
        <a class="navbar-brand" href="#">MyAcademy</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Início</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sobre.jsp">Sobre</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="cursos.jsp">Cursos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactos.jsp">Contactos</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto ">
                <li class="nav-item">
                    <a class="btn btn-primary" href=login.html>Login</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Hero -->
    <section class="course-intro">
        <div>
            <h2>Introdução à programação de computadores</h2>
            <p><strong>Aprenda a construir programas de computador de maneira fácil e rápida</strong></p>
            <p class="text-gray">Instrutor <i class="fas fa-angle-double-right"></i> Dercio Sinione Derone</p>

            <p class="star">
                <strong><em class="text-yellow">4.3</em></strong>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt">
                </i> 1234 estudantes
            </p>

            <div class="options display-flex">
                <span class="bg-green">Programação</span>
                <span class="bg-blue"><a href="criar-conta.html">Inscrever-se</a></span>
            </div>

            <div class="display-flex mt-3 text-gray">
                <p><i class="fas fa-clock"></i> Ultima atualização 12/05/2024</p>
                <p><i class="fas fa-globe-americas"></i> Português</p>
            </div>
        </div>

        <aside>
            <img src="Img/courses-3.jpg">
        </aside>
    </section>
</header>

<!-- Main Content -->
<main>
    <section class="course-overview">
        <div>
            <div>
                <h5>Descrição do Curso</h5>
                <p>O curso <b>"Introdução à Programação de Computadores"</b> é projetado para fornecer aos alunos uma
                    base sólida nos conceitos fundamentais da programação. Este curso é ideal para aqueles que têm pouca
                    ou nenhuma experiência prévia em programação e desejam desenvolver habilidades essenciais para criar
                    programas de computador eficazes.</p>
            </div>

            <div>
                <h5>Metodologia</h5>
                <p>O curso combina aulas teóricas com atividades práticas e projetos. Os alunos terão a oportunidade de
                    trabalhar em exercícios e projetos de programação para consolidar o aprendizado. A participação
                    ativa e a prática constante são incentivadas para garantir a compreensão dos conceitos e o
                    desenvolvimento de habilidades.</p>
            </div>

            <div>
                <h5>Público-Alvo</h5>
                <p>Este curso é destinado a estudantes, profissionais de diversas áreas e qualquer pessoa interessada em
                    aprender os fundamentos da programação. Não é necessário ter conhecimento prévio em programação.</p>
            </div>

            <div>
                <h5>Duração do Curso</h5>
                <p>O curso tem uma duração de 12 semanas, com 5 horas de aula por semana.</p>
            </div>

            <audio src="resources/audio.m4a" controls>Audio de Introdução</audio>

            <div class="video-frame">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/leBJc3VyZ5s?si=vfpEeA0F_1-EPAjN"
                        title="YouTube video player"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>

        <aside>
            <ul>
                <li><h5>Objetivos do Curso</h5></li>
                <li><i class="fas fa-chevron-right"></i>Compreender os princípios básicos da programação e como os
                    computadores processam informações.
                </li>
                <li><i class="fas fa-chevron-right"></i>Aprender a utilizar uma linguagem de programação popular, como
                    Python, para resolver problemas e automatizar tarefas.
                </li>
                <li><i class="fas fa-chevron-right"></i>Desenvolver habilidades de pensamento lógico e analítico para
                    escrever algoritmos eficientes.
                </li>
                <li><i class="fas fa-chevron-right"></i>Adquirir experiência prática na escrita, teste e depuração de
                    código.
                </li>
                <li><i class="fas fa-chevron-right"></i>Familiarizar-se com estruturas de dados básicas e conceitos de
                    controle de fluxo, como loops e condicionais.
                </li>
                <li><a href="criar-conta.html" class="btn btn-primary btn-lg">Inscrever-se</a></li>
            </ul>
        </aside>
    </section>


    <!-- Course Content -->
    <section class="our-courses mt-15">
        <h4>
            Cursos semelhantes
        </h4>

        <div class="course-cards">

            <div class="transition-scale">
                <a href="cursos-detalhes.html">
                    <div class="course-img">
                        <img src="Img/courses-1.jpg" alt="">
                    </div>
                    <div class="course-body">
                        <h6>Desenvolvimento Web</h6>
                        <span class="bg-yellow">Programação</span>
                    </div>
                </a>
            </div>

            <div class="transition-scale">
                <a href="cursos-detalhes.html">
                    <div class="course-img">
                        <img src="Img/courses-4.jpg" alt="">
                    </div>
                    <div class="course-body">
                        <h6>Introdução a Html5 e Css</h6>
                        <span class="bg-yellow">Programação</span>
                    </div>
                </a>
            </div>

            <div class="transition-scale">
                <a href="cursos-detalhes.html">
                    <div class="course-img">
                        <img src="Img/courses-3.jpg" alt="">
                    </div>
                    <div class="course-body">
                        <h6>Big Data</h6>
                        <span class="bg-blue">Ciência de Dados</span>
                    </div>
                </a>
            </div>

            <div class="transition-scale">
                <a href="cursos-detalhes.html">
                    <div class="course-img">
                        <img src="Img/courses-2.jpg" alt="">
                    </div>
                    <div class="course-body">
                        <h6>Logaritmo</h6>
                        <span class="bg-dark-blue">Matemática</span>
                    </div>
                </a>
            </div>
        </div>
    </section>

</main>

<!-- Footer Content -->
<footer class="bg-dark text-white">
    <section>
        <div class="company-description">
            <h5 class="text-uppercase mb-4 font-weight-bold">My Academy</h5>
            <p>Bem-vindo à My Academy, sua plataforma de cursos online. Nosso objetivo é fornecer educação de qualidade
                acessível a todos. Explore uma variedade de cursos e aprenda no seu próprio ritmo, com o suporte de
                especialistas dedicados em diversas áreas. Junte-se a nós e comece sua jornada de aprendizado hoje
                mesmo!</p>
        </div>

        <div>
            <h5 class="text-uppercase">Contato</h5>
            <p><i class="fa fa-map-marker-alt mr-2"></i> Rua Doutor Jaimes Lopes Dias, 22 1E</p>
            <p><i class="fa fa-phone-alt mr-2"></i> +351 923 342 982</p>
            <p><i class="far fa-envelope"></i> info@myacademy.com</p>
        </div>

        <div>
            <h5 class="text-uppercase">Links Uteis</h5>
            <ul>
                <li><a href="autores.html"><i class="fas fa-chevron-right"></i> Autores</a></li>
                <li><a href="sobre.jsp"><i class="fas fa-chevron-right"></i> Sobre</a></li>
                <li><a href="cursos.jsp"><i class="fas fa-chevron-right"></i> Cursos</a></li>
                <li><a href="contactos.jsp"><i class="fas fa-chevron-right"></i> Contacto</a></li>
                <li><a href="criar-conta.html"><i class="fas fa-chevron-right"></i> Criar Conta</a></li>
            </ul>
        </div>
    </section>

    <hr class="mb-4">

    <div class="copy-right">
        <div>
            <p>© 2024 All rights reserved by:<a href="#"><strong class="text-white"> MyAcademy</strong></a></p>
        </div>

        <div>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a></li>
                <li><a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a></li>
                <li><a href="https://www.linkedin.com/in/derciosimione" target="_blank"><i
                        class="fab fa-linkedin-in"></i></a></li>
                <li><a href="https://www.youtube.com/channel/UCquw3zsKMJH0IvS6zqyQJZw" target="_blank"><i
                        class="fab fa-youtube"></i></a></li>
            </ul>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>