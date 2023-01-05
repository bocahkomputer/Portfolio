<?php
require_once('connection.php');
/** @var PDO $dbh Database connection */

if (isset($_POST['student_ids']) && is_array($_POST['student_ids'])) {
    $stmt_placeholders = implode(', ', array_fill(0, count($_POST['student_ids']), '?'));
    $delete_course_stmt = $dbh->prepare("DELETE FROM `students` WHERE `id` IN ($stmt_placeholders)");

    $delete_course_stmt->execute($_POST['student_ids']);
}

header('Location: ' . $_SERVER['HTTP_REFERER']);