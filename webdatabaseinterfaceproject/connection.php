<?php
session_start();

$db_name = "fit2104_ass2";
$db_host = "localhost";
$db_username = "fit2104_ass2";
$db_passwd = "fit2104_ass2";
$dsn = "mysql:host=$db_host;dbname=$db_name";
$dbh = new PDO($dsn, $db_username, $db_passwd);

if (strpos($_SERVER['PHP_SELF'], '/login.php') === false) {
    if (empty($_SESSION['id'])) {
        header('Location: login.php?referer=' . urlencode($_SERVER['REQUEST_URI']));
    } else {
        $user_stmt = $dbh->prepare('SELECT * FROM `user` WHERE `id` = ?');

        if (!$user_stmt->execute([$_SESSION['id']]) || $user_stmt->rowCount() == 0) {
            session_destroy();
            header('Location: login.php?error=' . urlencode("Your user has been deleted"));
        }
    }
}

