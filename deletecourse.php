<?php
require_once('connection.php');
/** @var PDO $dbh Database connection */

if (isset($_POST['course_ids']) && is_array($_POST['course_ids'])) {
    $stmt_placeholders = implode(', ', array_fill(0, count($_POST['course_ids']), '?'));
    $delete_course_stmt = $dbh->prepare("DELETE FROM `course` WHERE `id` IN ($stmt_placeholders)");

    $delete_course_stmt->execute($_POST['course_ids']);
}

header('Location: ' . $_SERVER['HTTP_REFERER']);