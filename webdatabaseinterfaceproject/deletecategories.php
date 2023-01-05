<?php
require_once('connection.php');
/** @var PDO $dbh Database connection */

if (isset($_POST['categories_ids']) && is_array($_POST['categories_ids'])) {
    $stmt_placeholders = implode(', ', array_fill(0, count($_POST['categories_ids']), '?'));
    $delete_categories_stmt = $dbh->prepare("DELETE FROM `category` WHERE `id` IN ($stmt_placeholders)");

    $delete_categories_stmt->execute($_POST['categories_ids']);
}

header('Location: ' . $_SERVER['HTTP_REFERER']);
