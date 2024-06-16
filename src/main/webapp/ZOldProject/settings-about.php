<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="main.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/quill@2.0.0-rc.4/dist/quill.core.css">
    <link href="settings.css" rel="stylesheet">
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

        <!-- MAIN BODY -->
        <div class="main-body">

            <?php include_once 'settings-aside.php' ?>

            <section>
                <h3 class="mt15 ml15 mb15">Sobre Mim</h3>
                <div class="horizontal-line"></div>

                    <section id="descriptionEditorBox" class="setting-container">
                        <input type="hidden" id="descriptionContent" name="description">
                        <label>Descrição</label>
                        <div class="mt10">
                            <div id="descriptionEditor"></div>
                        </div>
                        <input onclick="" onsubmit="" class="mt30 save-info-btn center" type="submit" value="SALVAR">
                    </section>
            </section>
        </div>
    </main>
</div>

<?php require 'textEditorElement.php' ?>

</body>
</html>