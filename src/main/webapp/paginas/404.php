<?php
session_start();

if (isset($_SESSION['404_message'])){
    $message = $_SESSION['404_message'];

    echo "<div style='margin: 0 auto; background-color: #1C344F; padding: 30px; border-radius: 10px; text-align: center; color: white;'>";
    echo "<h1>Elemento nao encontrado<h1>";
    echo "<br> <p>$message</p>";
    echo "</div>";
    unset($_SESSION['404_message']);
}
else
{
    echo "<h1>Elemento nao encontrado<h1>";
}
exit();