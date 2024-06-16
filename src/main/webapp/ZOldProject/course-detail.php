<?php
include_once 'Utils.php';

include 'ShowErrorDetails.php';
require_once 'CourseService.php';

$courseService = new CourseService();

if (!isset($_GET["id"])) {
    $_SESSION['404_message'] = "Informe o identificado do curso";
    header("Location: 404.php");
    exit();
}

$courseId = $_GET["id"];

$course = $courseService->getById($courseId);

if (empty($course)) {
    $_SESSION['404_message'] = "Curso com identificador $courseId não encontrado.";
    header("Location: 404.php");
    return;
}

$name = $course->name;
$categoryId = $course->categoryId;
$price = $course->price;
$description = $course->description;
$maxStudent = $course->maxStudent;

if (isset($_SESSION['form_data'])) {
    $formData = $_SESSION['form_data'];
    $name = $formData['name'];
    $category = $formData['category'];
    $price = $formData['price'];
    $maxStudent = $formData['maxStudent'];
    $description = $formData['description'];
    unset($_SESSION['form_data']);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/quill@2.0.0-rc.4/dist/quill.core.css">
    <link href="course.css" rel="stylesheet">
    <title>Course</title>
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
                <!-- CIRCULAR AVATAR -->
                <?php include_once 'circularAvatar.php' ?>
            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <!-- MAIN DESCRIPTION -->
            <div class="main-description">
                <h3>Curso <i class="fab fa-discourse"></i> <span
                            class="blackOpacity"><?php echo "#" . $course->id . " - " . $course->name ?></span></h3>

                <!-- OPTIONS -->
                <div>
                    <button class="more-option-btn" onclick="toggleMoreOption()">MAIS OPÇÕES</button>
                    <div class="more-option" id="more-option">
                        <p>Mais opções</p>
                        <hr>
                        <a>Inscricoes</a>
                        <a>Desativar</a>
                    </div>
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <?php include 'displayMessageIfExists.php' ?>

            <!-- COURSE ITEM -->

            <form action="HandlerEditCourse.php?id=<?php echo $course->id ?>" method="post">
                <div class="course-detail">

                    <div class="input-box">
                        <label>
                            Nome
                            <input placeholder="Nome do Curso" type="text" name="name"
                                   value="<?php echo htmlspecialchars($name); ?>">
                        </label>

                        <label for="category">
                            Categoria
                            <select id="category" class="custom-select"  name="category">
                                <option value="0" selected>Escolha a categoria</option>
                                <option value="8" <?php if ($categoryId == 8) echo 'selected' ?>>Banco de Dados
                                </option>
                                <option value="10" <?php if ($categoryId == 10) echo 'selected' ?>>Ciência de
                                    Dados
                                </option>
                                <option value="11" <?php if ($categoryId == 11) echo 'selected' ?>>Cloud Computing
                                </option>
                                <option value="13" <?php if ($categoryId == 13) echo 'selected' ?>>Desenvolvimento
                                    de Aplicativos Móveis
                                </option>
                                <option value="7" <?php if ($categoryId == 7) echo 'selected' ?>>Desenvolvimento
                                    Web
                                </option>
                                <option value="1" <?php if ($categoryId == 1) echo 'selected' ?>>Diversos</option>
                                <option value="5" <?php if ($categoryId == 5) echo 'selected' ?>>Gestão</option>
                                <option value="2" <?php if ($categoryId == 2) echo 'selected' ?>>História</option>
                                <option value="6" <?php if ($categoryId == 6) echo 'selected' ?>>Matemática</option>
                                <option value="3" <?php if ($categoryId == 3) echo 'selected' ?>>Programação
                                </option>
                                <option value="4" <?php if ($categoryId == 4) echo 'selected' ?>>Robótica</option>
                                <option value="9" <?php if ($categoryId == 9) echo 'selected' ?>>Segurança da
                                    Informação
                                </option>
                                <option value="12" <?php if ($categoryId == 12) echo 'selected' ?>>Sistemas
                                    Operacionais
                                </option>
                            </select>
                        </label>

                        <label for="price">
                            Preço
                            <input type="number" step="0.5" min="0" name="price" id="price" placeholder="(€) Preço"
                                   value="<?php if ($price > 0) echo htmlspecialchars($price); ?>">
                        </label>

                        <label for="studentLimit">
                            Vagas
                            <input type="number" step="1" min="0" name="maxStudent" id="studentLimit"
                                   placeholder="Limite de alunos"
                                   value="<?php if ($maxStudent > 0) echo htmlspecialchars($maxStudent); ?>">
                        </label>

                    </div>

                    <section id="descriptionEditorBox">
                        <input type="hidden" id="descriptionContent" name="description"
                               value="<?php echo htmlspecialchars($description); ?>">
                        <div>
                            <div id="descriptionEditor"></div>
                        </div>
                    </section>

                    <div class="course-details-buttons mt20">
                        <input onclick="updateDescriptionContent()" onsubmit="updateDescriptionContent()" class="mb10"
                               type="submit" value="EDITAR">
                        <a href="HandlerDeleteCourse.php?id=<?php echo $course->id ?>">
                            <input class="red-color" onclick="hideModalAddCourse()" type="button" value="ELIMINAR">
                        </a>
                    </div>
                </div>
            </form>

        </div>

    </main>
</div>

<script src="course.js"></script>

<?php require 'textEditorElement.php' ?>

</body>
</html>