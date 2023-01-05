<?php
include("connection.php");
/** @var $dbh PDO */
if (!isset($_GET['id'])) {
    header("Location: tailoredclass.php");
    die();
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Little Dreamer Music School - Update Tailored Class #<?= $_GET['id'] ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Update Tailored Class #<?= $_GET['id'] ?></h1>
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
        $query = "UPDATE `tailored_class` SET `summary` = :summary,`start_date` = :start_date,`end_date` = :end_date, `quote` = :quote, `otherInfo` = :otherInfo, `student_id`= :student_id WHERE `id` = :id";
        $dsn = "mysql:host=localhost;dbname=fit2104_ass2";
        $dbh = new PDO($dsn,"fit2104_ass2","fit2104_ass2");
        $stmt = $dbh->prepare($query);

        $parameters = [
            'summary' => $_POST['summary'],
            'start_date' => $_POST['start_date'],
            'end_date' => $_POST['end_date'],
            'quote' => $_POST['quote'],
            'otherInfo' => $_POST['otherInfo'],
            'student_id' => $_POST['student_id'],
            'id' => $_GET['id']
        ];

        if ($stmt->execute($parameters)) {
            header("Location: tailoredclass.php");
        } else {
            echo ($stmt->errorInfo()[2]);
            echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
            die();
        }
    } else {
        $query = "SELECT * FROM `tailored_class` WHERE `id` = ?";
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
                        <div class="row" rows="4" cols="100">
                            <label for="summary">Summary</label>
                            <input type="text" id="summary" name="summary" value="<?= $record->summary ?>"/>
                        </div>
                        <div class="row">
                            <label for="start_date">Start Date</label>
                            <input type="date" id="start_date" name="start_date" value="<?= $record->start_date ?>"/>
                        </div>
                        <div class="row">
                            <label for="end_date">End Date</label>
                            <input type="date" id="end_date" name="end_date" value="<?= $record->end_date ?>"/>
                        </div>
                        <div class="row">
                            <label for="quote">Quote($)</label>
                            <input type="decimal" id="quote" name="quote" value="<?= $record->quote ?>" min="0" max="9999999.99"/>
                        </div>
                        <div class="row" rows="4" cols="100">
                            <label for="otherInfo">Other Info</label>
                            <input type="text" id="otherInfo" name="otherInfo" value="<?= $record->otherInfo ?>"/>
                        </div>
                        <div class="row">
                            <label for="student_id">Student ID</label>
                            <input type="number" id="student_id" name="student_id" value="<?= $record->student_id ?>"/>
                        </div>
                    </div>
                    <div class="row center">
                        <input type="submit" value="Update"/>
                    </div>
                    <div class="row center">
                        <a href="tailoredclass.php">Cancel and back to Tailored Classes page</a>
                    </div>
                </form>
            <?php } else {
                header("Location: tailoredclass.php");
            }
        } else {
            die(($stmt->errorInfo()[2]));
        }
    } ?>
</div>
</body>
</html>