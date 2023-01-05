<?php

require('connection.php');

/** @var PDO $dbh Database connection */

if (isset($_GET['id'])) {
    $category_stmt = $dbh->prepare("SELECT * FROM `category` WHERE `id` = ?");
    if ($category_stmt->execute([$_GET['id']]) && $category_stmt->rowCount() > 0) {
        $category = $category_stmt->fetchObject();
    } else {
        header('Location: categories.php');
    }
} else {
    header('Location: categories.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Little Dreamer Music School - Course Category Details</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Course Category # <?= $_GET['id'] ?></h1>
<div class="center">
    <div class="row">
        <label for="name">Course Category Name</label>
        <p><?= $category->name ?></p>
    </div>
    <div class="row center">
        <a href="categories.php">Cancel and back to Course Categories page</a>
    </div>
</div>
</body>
</html>
