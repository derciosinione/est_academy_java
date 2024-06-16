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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <title>Admin</title>
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
                <h2>Administradores</h2>

                <div>
                    <a href="create-user.php"><button onclick=""><i class="fas fa-plus"></i> ADICIONAR</button></a>
                    <button class="more-option-btn" onclick="toggleMoreOption()">MAIS OPÇÕES</button>
                    <div class="more-option" id="more-option">
                        <p>Mais opções</p>
                        <hr>
                    </div>
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <?php include 'displayMessageIfExists.php' ?>

            <div class="cards-container">

                <?php

                $users = $service->getAllAdmin();

                foreach ($users as $user) {
                    $approvedStatus = $user->getApprovedStatus();

                    $approvedStatusColor = $user->getIsApproved() ? 'green-color' : 'red-color';

                    echo <<<HTML
                    <div class="user-card pb10 auto-height">
                        <a href="user-detail.php?id=$user->id">
                            <div class="background-image">
                                <img alt="" src="studentbg1.png">
                            </div>
    
                            <div class="user-avatar">
                                <img alt="" class="img-cover" src="$user->avatarUrl">
                            </div>
    
                            <div class="content-title">
                                <p class="bold">$user->name</p>
                                <p class="blackOpacity smallText"><i class="fas fa-user-tie"></i> $user->profileName</p>
                            </div>
    
                            <div class="content-description">
                                <p class="overflow-text"><i class="far fa-envelope"></i> $user->email</p>
                                <p><i class="fas fa-phone-alt"></i> $user->phoneNumber</p>
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