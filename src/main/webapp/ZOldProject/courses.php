<?php
include_once 'Utils.php';
include 'ShowErrorDetails.php';
require_once 'CourseService.php';
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
    <title>Courses</title>
</head>
<body>

<?php include 'course-modal-add.php' ?>

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

                <!-- CIRCULAR AVATAR -->
                <?php include_once 'circularAvatar.php' ?>

            </div>
        </div>

        <!-- MAIN BODY -->
        <div class="main-body">

            <!-- MAIN DESCRIPTION -->
            <div class="main-description">
                <h2>Cursos</h2>

                <!-- OPTIONS -->
                <div>
                    <button onclick="toggleModalAddCourse()"><i class="fas fa-plus"></i> ADICIONAR</button>
                    <button class="more-option-btn" onclick="toggleMoreOption()">MAIS OPÇÕES</button>
                    <div class="more-option" id="more-option">
                        <p>Mais opções</p>
                        <hr>

                    </div>
                </div>
            </div>

            <!-- DISPLAY SERVER MESSAGES -->
            <?php include 'displayMessageIfExists.php' ?>

            <!-- COURSES ITEMS -->
            <div class="cards-container">

                <?php
                $courseService = new CourseService();

                $courses = $courseService->getAll();

                foreach ($courses as $course) {
                    $teacher = $course->getCreator()->name;
                    $category = $course->getCategory()->name;

                    echo <<<HTML
                        <div class="course-card transition-scale">
                            <a href="course-detail.php?id=$course->id">
                                <div class="course-avatar">
                                    <img alt="" class="img-cover" src="$course->imageUrl">
                                </div>
            
                                <div class="content-title">
                                    <p class="bold mb5">$course->name</p>
                                    <p class="blackOpacity smallText mb10"><i class="fas fa-user-tie"></i> $teacher </p>
                                    <div class="span-label blackBlue-color"><p>$category</p></div>
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

<script src="course.js"></script>

</body>
</html>