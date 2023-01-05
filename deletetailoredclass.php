<?php
require_once('connection.php');
/** @var PDO $dbh Database connection */

if (isset($_POST['tailoredclass_ids']) && is_array($_POST['tailoredclass_ids'])) {
    $stmt_placeholders = implode(', ', array_fill(0, count($_POST['tailoredclass_ids']), '?'));
    $delete_course_stmt = $dbh->prepare("DELETE FROM `tailored_class` WHERE `id` IN ($stmt_placeholders)");

    $delete_course_stmt->execute($_POST['tailoredclass_ids']);
}

header('Location: ' . $_SERVER['HTTP_REFERER']);
