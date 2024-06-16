<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="main.css" rel="stylesheet">
<!--    <link href="components.css" rel="stylesheet">-->
    <link href="settings.css" rel="stylesheet">
    <link href="components.css" rel="stylesheet">
    <title>Settings</title>
</head>
<body>

<div class="board">
    <!-- SIDE BAR -->
    <?php include_once 'SideBarMenu.php' ?>

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

                <!-- Circular avatar -->
                <?php include_once 'circularAvatar.php' ?>

            </div>
        </div>

        <div style="width: 91%; margin: 0 auto;">
            <?php include_once 'displayMessageIfExists.php'; ?>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <?php include_once 'settings-aside.php' ?>

            <section>

                <h3 class="mt15 ml15 mb15">Alterar Senha</h3>
                <div class="horizontal-line"></div>

                <div class="setting-container">

                    <form action="HandlerUpdateUserPassword.php" method="post">
                        <div class="input-box-row">
                            <label>
                                Senha atual
                                <input placeholder="****" type="password" name="currentPassword">
                            </label>

                            <label>
                                Senha nova
                                <input placeholder="****" type="password" name="newPassword">
                            </label>

                            <label>
                                Confirmar senha
                                <input placeholder="****" type="password" name="confirmPassword">
                            </label>
                        </div>

                        <input onclick="" onsubmit="" class="mt30 save-info-btn center" type="submit" value="SALVAR">
                    </form>

                </div>

            </section>

        </div>

    </main>
</div>
</body>
</html>