<?php
session_start();

if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];

    if ($username !== 'admin') {
        header('Location: ../search.html');
        exit();
    }

    if ($username == 'admin') {
        header('Location: ../admin/index.html');
        exit();
    }
} else {
    header('Location: ../login.html');
    exit();
}

?>
