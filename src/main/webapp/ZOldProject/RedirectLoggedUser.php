<?php
session_start();

if(isset($_SESSION['loggedUser'])) {
    header("Location: dashboard.php");
    exit();
}