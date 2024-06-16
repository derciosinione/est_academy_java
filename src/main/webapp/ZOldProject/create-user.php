<?php
session_start();

$messages = [];

if (isset($_SESSION["warning_message"])) {
    $messages = $_SESSION['warning_message'];
    unset($_SESSION['warning_message']);
}

$name = $email = $birthDay = $phoneNumber = $nif = $profileId = '';

if (isset($_SESSION['form_data'])) {
    $formData = $_SESSION['form_data'];
    $name = $formData['name'];
    $email = $formData['email'];
    $birthDay = $formData['birthDay'];
    $phoneNumber = $formData['phoneNumber'];
    $nif= $formData['nif'];
    $profileId = $formData['profileId'];
    unset($_SESSION['form_data']);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <title>Admin > Add User</title>
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
                <!-- Circular avatar -->
                <?php include_once 'circularAvatar.php' ?>
            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <div class="main-description">
                <h2>Adicionar Usuário</h2>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <?php include 'displayMessageIfExists.php' ?>

            <div class="user-registration-form">
                <form action="HandlerCreateUser.php" method="post">
                    <div class="input-box">
                        <label>
                            Nome
                            <input placeholder="myacademy" type="text" name="name" value="<?php echo htmlspecialchars($name); ?>">
                        </label>

                        <label>
                            Email
                            <input placeholder="myacademy@gmail.com" type="text" name="email" value="<?php echo htmlspecialchars($email); ?>">
                        </label>

                        <label>
                            NIF
                            <input placeholder="000 000 000" type="text" name="nif" value="<?php echo htmlspecialchars($nif); ?>">
                        </label>

                        <label>
                            Contacto
                            <input placeholder="+351 925 365 214" type="text" name="phoneNumber" value="<?php echo htmlspecialchars($phoneNumber); ?>">
                        </label>

                        <label for="profileId">
                            Perfil
                            <select id="profileId" class="custom-select" name="profileId">
                                <option value="0" selected>Escolha o perfil</option>
                                <option value="1" <?php if ($profileId == 1) echo 'selected' ?>>Estudante</option>
                                <option value="2" <?php if ($profileId == 2) echo 'selected' ?>>Docente</option>
                                <option value="3" <?php if ($profileId == 3) echo 'selected' ?>>Admin</option>
                            </select>
                        </label>

                        <label>
                            Data de Nascimento
                            <input placeholder="YYYY-MM-DD" type="text" name="birthDay" value="<?php echo htmlspecialchars($birthDay); ?>">
                        </label>
                    </div>
                    <input onclick="" onsubmit="" class="mt30 large-btn" type="submit" value="SALVAR">
                </form>
            </div>

        </div>

    </main>
</div>

<script src="main.js"></script>
</body>
</html>