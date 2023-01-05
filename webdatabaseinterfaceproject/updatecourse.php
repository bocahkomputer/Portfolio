<?php
include("connection.php");
/** @var $dbh PDO */

if (!isset($_GET['id'])) {
    header("Location: courses.php");
    die();
}
?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <title>Update Course #<?= $_GET['id'] ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Update Course #<?= $_GET['id'] ?></h1>
<div class="center">
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $phpFileUploadErrors = array(
        0 => 'There is no error, the file uploaded with success',
        1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
        2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
        3 => 'The uploaded file was only partially uploaded',
        4 => 'No file was uploaded',
        6 => 'Missing a temporary folder',
        7 => 'Failed to write file to disk.',
        8 => 'A PHP extension stopped the file upload.',
    );

    $allowedMIME = array(
        'image/jpeg',
        'image/jpg',
        'image/png',
        'image/gif'
    );}
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST)) {
        $query = "UPDATE `course` SET `name` = :name,`price` = :price,`category_id` = :category_id WHERE `id` = :id";
        $dsn = "mysql:host=localhost;dbname=fit2104_ass2";
        $dbh = new PDO($dsn, "fit2104_ass2", "fit2104_ass2");
        $stmt = $dbh->prepare($query);

        $parameters = [
            'name' => $_POST['name'],
            'price' => $_POST['price'],
            'category_id' => $_POST['category_id'],
            'id' => $_GET['id']
        ];

        if ($stmt->execute($parameters)) {
            header("Location: courses.php");
        } else {
            echo($stmt->errorInfo()[2]);
            echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
            die();
        }

        $image_stmt = $dbh->prepare("INSERT INTO `course_image`(`course_id`, `file_path`) VALUES (:course_id, :filename)");
        $dsn = "mysql:host=localhost;dbname=fit2104_ass2";
        $dbh = new PDO($dsn, "fit2104_ass2", "fit2104_ass2");
        $stmt = $dbh->prepare($image_stmt);

        $parameters = [
            'course_id' => $_GET['course_id'],
            'filename' => $_GET['file_path']
        ];

        if ($stmt->execute($parameters)) {
            header("Location: courses.php");
        } else {
            echo($stmt->errorInfo()[2]);
            echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
            die();
        }

    } else {
        $query = "SELECT * FROM `course` WHERE `id` = ?";
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
                            <label for="name">Course Name</label>
                            <input type="text" id="name" name="name" value="<?= $record->name ?>"/>
                        </div>
                        <div class="row">
                            <label for="price">Price($)</label>
                            <input type="decimal" id="price" name="price" value="<?= $record->price ?>" min="0" max="9999999.99"/>
                        </div>
                        <div class="row">
                            <label for="category_id">Category ID</label>
                            <input type="number" id="category_id" name="category_id" value="<?= $record->category_id ?>"/>
                        </div>
                        <div class="row">
                            <label for="image">Course Image</label>
                            <input type="file" id="image" name="image" onchange="image_checker(event)"/>
                        </div>
                    </div>
                    <div class="row center">
                        <input type="submit" value="Update"/>
                    </div>
                    <div class="row center">
                        <a href="courses.php">Cancel and back to Courses page</a>
                    </div>
                </form>
            <?php } else {
                header("Location: courses.php");
            }
        } else {
            die(($stmt->errorInfo()[2]));
        }
    } ?>
</div>
<script>
    function image_checker(event) {
        let file_is_valid = true;

        let file = event.target.files[0];

        let size = file.size;
        if (size > 2000000) {
            file_is_valid = false;
            event.target.setCustomValidity("File is too big! The size must be smaller than 2MB");
        }

        let filetype = file.type;
        if (!(['image/jpeg', 'image/png', 'image/gif'].includes(filetype))) {
            file_is_valid = false;
            event.target.setCustomValidity("File must be JPEG, PNG or GIF formatted images");
        }

        if (file_is_valid) {
            event.target.setCustomValidity("");
        }
    }
</script>
</body>
</html>
