<?php

require('connection.php');

/** @var PDO $dbh Database connection */

if (isset($_GET['id'])) {
    $course_stmt = $dbh->prepare("SELECT * FROM `course` WHERE `id` = ?");
    if ($course_stmt->execute([$_GET['id']]) && $course_stmt->rowCount() > 0) {
        $course = $course_stmt->fetchObject();
    } else {
        header('Location: courses.php');
    }
} else {
    header('Location: courses.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Little Dreamer Music School - Course Details</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Course # <?= $_GET['id'] ?></h1>
<div class="center">
    <div class="row">
        <label for="name">Course Name</label>
        <p><?= $course->name ?></p>
    </div>
    <div class="row">
        <label for="price">Price($)</label>
        <p>$<?= $course->price ?></p>
    </div>
    <?php
    $image_stmt = $dbh->prepare("SELECT * FROM `course_image` WHERE `course_id` = ?");
    if ($image_stmt->execute([$course->id]) && $image_stmt->rowCount() > 0) {
        $course_image = $image_stmt->fetchObject(); ?>
        <div class="row">
            <label for="image">Course Image</label>
            <p><img src="course_images/<?= $course_image->file_path ?>"/></p>
        </div>
    <?php } ?>
    <div class="row center">
        <a href="courses.php">Back to Courses page</a>
    </div>
</div>
</body>
</html>
