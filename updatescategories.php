<?php
include("connection.php");
/** @var $dbh PDO */

if (!isset($_GET['id'])) {
    header("Location: categories.php");
    die();
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <title>Update Categories #<?= $_GET['id'] ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Update Categories #<?= $_GET['id'] ?></h1>
<div class="center">
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST)) {
        foreach ($_POST as $fieldName => $fieldValue) {
            if (empty($fieldValue)) {
                echo ("'$fieldName' field is empty. Please fix the issue try again. ");
                echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
                die();
            }
        }
        $query = "UPDATE `category` SET `name` = :name WHERE `id` = :id";
        $dsn = "mysql:host=localhost;dbname=fit2104_ass2";
        $dbh = new PDO($dsn,"fit2104_ass2","fit2104_ass2");
        $stmt = $dbh->prepare($query);


        $parameters = [
            'name' => $_POST['name'],
            'id' => $_GET['id']
        ];

        if ($stmt->execute($parameters)) {
            header("Location: categories.php");
        } else {
            echo ($stmt->errorInfo()[2]);
            echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
            die();
        }
    } else {
        $query = "SELECT * FROM `category` WHERE `id` = ?";
        $dsn = "mysql:host=localhost;dbname=fit2104_ass2";
        $dbh = new PDO($dsn,"fit2104_ass2","fit2104_ass2");
        $stmt = $dbh->prepare($query);
        if ($stmt->execute([$_GET['id']])) {
            if ($stmt->rowCount() > 0) {
                $record = $stmt->fetchObject(); ?>
                <form method="post">
                    <div class="aligned-form">
                        <div class="row">
                            <label for="id">ID</label>
                            <input type="number" id="id" value="<?= $record->id ?>" disabled/>
                        </div>
                        <div class="row">
                            <label for="name">Category Name</label>
                            <input type="text" id="name" name="name" value="<?= $record->name ?>"/>
                        </div>
                        <div class="row center">
                            <input type="submit" value="Update"/>
                        </div>
                        <div class="row center">
                            <a href="categories.php">Cancel and back to Categories page</a>
                        </div>
                </form>
            <?php } else {
                header("Location: categories.php");
            }
        } else {
            die($stmt->errorInfo()[2]);
        }
    } ?>
</div>
</body>
</html>