<?php

$messages = [];
$color = 'blue-color';

if (isset($_SESSION["success_message"])) {
    $messages = $_SESSION['success_message'];
    $color = 'green-color';
    unset($_SESSION['success_message']);
} else if (isset($_SESSION["warning_message"])) {
    $messages = $_SESSION['warning_message'];
    unset($_SESSION['warning_message']);
} else if (isset($_SESSION["error_message"])) {
    $messages = $_SESSION['error_message'];
    $color = "red-color";
    unset($_SESSION['error_message']);
}

if (empty($messages)) return;
?>

<div class="message-box <?php echo $color ?>">
    <i class="fas fa-times close-message-box" onclick="hideMessageBox()"></i>
    <section>
        <?php
        foreach ($messages as $message) echo "<p><b>*</b> $message </p>";
        ?>
    </section>
</div>

<script>
    function hideMessageBox() {
        let elements = document.getElementsByClassName("message-box");

        for (let i = 0; i < elements.length; i++) {
            let element = elements[i];
            element.style.display = "none";
        }
    }
</script>