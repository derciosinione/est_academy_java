<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="main.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <title>Registrations</title>

</head>
<body>

<div class="board">
    <!-- SIDE BAR -->
     <jsp:include page="SideBarMenu.jsp" />

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

            <div class="main-description">
                <h2>Inscrições</h2>
                <div>
                  
                </div>
            </div>

           
             <jsp:include page="displayMessageIfExists.jsp" />

            <div class="table-container">
            	  <table>
                    <thead>
                    <tr>
                        <th>Student details</th>
                        <th>Curso</th>
                        <th>Data</th>
                        <th>Status</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="td-line">
                            <div class="avatar">
                                <img src="../Img/studentavatar.jpg">
                            </div>
                            <div>
                                Dércio Sinione Derone
                                <p class="blackOpacity mt5 smallText">derciosinione@email.com</p>
                            </div>
                        </td>
                        <td>Informatica Movel</td>
                        <td>May 01, 2024</td>
                        <td><span data-status="pendente">Pendente</span></td>
                        <td>
                            <div class="table-actions">
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-check-double green-text"></i>
                                        <span class="tooltipText">Aceitar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-times red-text" style="font-size: 22px"></i>
                                        <span class="tooltipText">Recusar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fa fa-info-circle"></i>
                                        <span class="tooltipText">Informações da inscrição.</span>
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="td-line">
                            <div class="avatar">
                                <img src="https://media.istockphoto.com/id/1357723194/pt/foto/studio-portrait-of-a-serious-man-of-north-african-ethnicity.jpg?s=1024x1024&w=is&k=20&c=QLmjWPeZm6yZMSQZoo4bja-WSheJcleufT82h9GfjGY=">
                            </div>
                            <div>
                                Dércio Sinione Derone
                                <p class="blackOpacity mt5 smallText">derciosinione@email.com</p>
                            </div>
                        </td>
                        <td>Informatica Movel</td>
                        <td>May 11, 2024</td>
                        <td><span data-status="aprovado">Aprovado</span></td>
                        <td>
                            <div class="table-actions">
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-check-double green-text"></i>
                                        <span class="tooltipText">Aceitar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-times red-text" style="font-size: 22px"></i>
                                        <span class="tooltipText">Recusar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fa fa-info-circle"></i>
                                        <span class="tooltipText">Informações da inscrição.</span>
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="td-line">
                            <div class="avatar">
                                <img src="https://media.istockphoto.com/id/1424925129/pt/foto/portrait-of-a-young-man-on-a-pink-background.jpg?s=1024x1024&w=is&k=20&c=Qhxp8a8u5JNpiOTzb3EP3B2n3z67f7vVWDDlh08Zdes=">
                            </div>
                            <div>
                                Dércio Sinione Derone
                                <p class="blackOpacity mt5 smallText">derciosinione@email.com</p>
                            </div>
                        </td>
                        <td>Informatica Movel</td>
                        <td>May 11, 2024</td>
                        <td><span data-status="reprovado">Reprovado</span></td>
                        <td>
                            <div class="table-actions">
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-check-double green-text"></i>
                                        <span class="tooltipText">Aceitar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-times red-text" style="font-size: 22px"></i>
                                        <span class="tooltipText">Recusar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fa fa-info-circle"></i>
                                        <span class="tooltipText">Informações da inscrição.</span>
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="td-line">
                            <div class="avatar">
                                <img src="https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                            </div>
                            <div>
                                Ana Luisa Jose
                                <p class="blackOpacity mt5 smallText">analuisa@email.com</p>
                            </div>
                        </td>
                        <td>Introdução a Html5 e css</td>
                        <td>May 12, 2024</td>
                        <td><span data-status="pendente">Pendente</span></td>
                        <td>
                            <div class="table-actions">
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-check-double green-text"></i>
                                        <span class="tooltipText">Aceitar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fas fa-times red-text" style="font-size: 22px"></i>
                                        <span class="tooltipText">Recusar inscrição do aluno</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="tooltip">
                                        <i class="fa fa-info-circle"></i>
                                        <span class="tooltipText">Informações da inscrição.</span>
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>


        </div>

    </main>
</div>
</body>
</html>