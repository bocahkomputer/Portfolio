<?php

require('connection.php');

/** @var PDO $dbh Database connection */

if (isset($_GET['id'])) {
    $tailoredclass_stmt = $dbh->prepare("SELECT * FROM `tailored_class` WHERE `id` = ?");
    if ($tailoredclass_stmt->execute([$_GET['id']]) && $tailoredclass_stmt->rowCount() > 0) {
        $tailoredclass = $tailoredclass_stmt->fetchObject();
    } else {
        header('Location: tailoredclass.php');
    }
} else {
    header('Location: tailoredclass.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Little Dreamer Music School - Tailored Class Details</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Tailored Class # <?= $_GET['id'] ?></h1>
<div class="center">
    <div class="row">
        <label for="id">Tailored Class ID</label>
        <p><?= $tailoredclass->id ?></p>
    </div>
    <div class="row">
        <label for="summary">Summary</label>
        <p><?= $tailoredclass->summary ?></p>
    </div>
    <div class="row">
        <label for="start_date">Start Date</label>
        <p><?= $tailoredclass->start_date ?></p>
    </div>
    <div class="row">
        <label for="end_date">End Date</label>
        <p><?= $tailoredclass->end_date ?></p>
    </div>
    <div class="row">
        <label for="quote">Quote($)</label>
        <p><?= $tailoredclass->quote ?></p>
    </div>
    <div class="row">
        <label for="otherInfo">Other Info</label>
        <p><?= $tailoredclass->otherInfo ?></p>
    </div>
    <div class="row center">
        <a href="tailoredclass.php">Cancel and back to Tailored Classes page</a>
    </div>
</div>
</body>
</html>
