<?php
include_once 'Utils.php';
include 'ShowErrorDetails.php';
require_once 'UserService.php';

$service = new UserService();
?>

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
    <?php include_once 'SideBarMenu.php' ?>

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

                <!-- Circular avatar -->
                <?php include_once 'circularAvatar.php' ?>

            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <div class="main-description">
                <h2>Alunos</h2>
                <div>
                    <!--                    <button onclick=""><i class="fas fa-plus"></i> ADICIONAR</button>-->
                    <button class="more-option-btn" onclick="toggleMoreOption()">MAIS OPÇÕES</button>
                    <div class="more-option" id="more-option">
                        <p>Mais opções</p>
                        <hr>
                        <div>
                            <input id="situation1" name="situation" type="checkbox"> <label
                                for="situation1">Inativos</label>
                        </div>
                        <div>
                            <input id="situation2" name="situation" type="checkbox"> <label
                                for="situation2">Aprovados</label>
                        </div>

                        <div>
                            <input id="situation3" name="situation" type="checkbox"> <label for="situation3">Aguardando
                            aprovação</label>
                        </div>

                        <div class="mt10 more-option-buttons">
                            <button class="red-color" onclick="">Cancelar</button>
                            <button class="" onclick="">Aplicar filtro</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <?php include 'displayMessageIfExists.php' ?>

            <div class="cards-container">

                <?php

                $students = $service->getAllStudents();

                foreach ($students as $student) {
                    $approvedStatus = $student->getApprovedStatus();

                    $approvedStatusColor = $student->getIsApproved() ? 'green-color' : 'red-color';

                    echo <<<HTML
                 <div class="user-card">
                 <a href="students-detail.php?id=$student->id">
                                     <div class="background-image">
                        <img alt="" src="studentbg1.png">
                    </div>
                    
                    <div class="user-avatar">
                        <img alt="" class="img-cover" src="$student->avatarUrl">
                    </div>
                    
                    <div class="content-title">
                        <p class="bold">$student->name</p>
                        <p class="blackOpacity smallText"><i class="fas fa-book-reader"></i> $student->profileName</p>
                    </div>

                    <div class="content-description">
                        <p class="overflow-text"><i class="far fa-envelope"></i> $student->email</p>
                        <p><i class="fas fa-phone-alt"></i> $student->phoneNumber</p>
                        <span class="span-label $approvedStatusColor">$approvedStatus</span>
                    </div>
</a>
                </div>
HTML;
                }
                ?>

            </div>

        </div>

    </main>
</div>

<script src="main.js"></script>
</body>
</html>