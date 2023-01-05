<?php
include("connection.php");
/** @var $dbh PDO */
if (!isset($_GET['id'])) {
    header("Location: students.php");
    die();
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Update Students #<?= $_GET['id'] ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Update Students #<?= $_GET['id'] ?></h1>
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
        $query = "UPDATE `students` SET `firstName` = :firstName,`surname` = :surname,`address` = :address, `phone` = :phone, `dob` = :dob, `email`= :email, `subscribe` = :subscribe WHERE `id` = :id";
        $dsn = "mysql:host=localhost;dbname=fit2104_ass2";
        $dbh = new PDO($dsn,"fit2104_ass2","fit2104_ass2");
        $stmt = $dbh->prepare($query);

        $parameters = [
            'firstName' => $_POST['firstName'],
            'surname' => $_POST['surname'],
            'address' => $_POST['address'],
            'phone' => $_POST['phone'],
            'dob' => $_POST['dob'],
            'email' => $_POST['email'],
            'subscribe' => $_POST['subscribe'],
            'id' => $_GET['id']
        ];

        if ($stmt->execute($parameters)) {
            header("Location: students.php");
        } else {
            echo ($stmt->errorInfo()[2]);
            echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
            die();
        }
    } else {
        $query = "SELECT * FROM `students` WHERE `id` = ?";
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
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" name="firstName" value="<?= $record->firstName ?>"/>
                        </div>
                        <div class="row">
                            <label for="surname">Surname</label>
                            <input type="text" id="surname" name="surname" value="<?= $record->surname ?>"/>
                        </div>
                        <div class="row">
                            <label for="address">Address</label>
                            <input type="text" id="address" name="address" value="<?= $record->address ?>"/>
                        </div>
                        <div class="row">
                            <label for="phone">Phone(+61)</label>
                            <input type="number" id="phone" name="phone" value="<?= $record->phone ?>"/>
                        </div>
                        <div class="row">
                            <label for="dob">DOB</label>
                            <input type="date" id="dob" name="dob" value="<?= $record->dob ?>"/>
                        </div>
                        <div class="row">
                            <label for="email">Email</label>
                            <input type="text" id="email" name="email" value="<?= $record->email ?>"/>
                        </div>
                        <div class="row">
                            <label for="subscribe">Subscribe</label>
                            <input type="text" id="subscribe" name="subscribe" value="<?= $record->subscribe ?>"/>
                        </div>
                    </div>
                    <div class="row center">
                        <input type="submit" value="Update"/>
                    </div>
                    <div class="row center">
                        <a href="students.php">Cancel and back to Students page</a>
                    </div>
                </form>
            <?php } else {
                header("Location: students.php");
            }
        } else {
            die(($stmt->errorInfo()[2]));
        }
    } ?>
</div>
</body>
</html>
