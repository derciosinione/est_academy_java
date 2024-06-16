<?php

$loggedUser =  "";
if (isset($_SESSION['loggedUser'])) {
    $loggedUser = unserialize($_SESSION['loggedUser']);

    echo <<<HTML
        <a href="account-profile.php">
            <div class="avatar">
                <img alt="" src="$loggedUser->avatarUrl">
            </div> 
        </a>
HTML;

}