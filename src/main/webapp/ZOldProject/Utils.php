<?php
require_once "UserModel.php";
include_once 'RedirectNonLoggedUser.php';

/**
 * @return userModel|null
 */
function getLoggedUser()
{
    if(!isset($_SESSION['loggedUser'])){
        return null;
    }
    return unserialize($_SESSION['loggedUser']);
}

function app_session_start()
{
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
}

app_session_start();