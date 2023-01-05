<?php
require('connection.php');
/** @var PDO $dbh Database connection */
    $result = $dbh->prepare("SELECT * FROM `course` where name LIKE ?");
    $result->execute(["%" . $_GET['query'] . "%"]);
?>
<!DOCTYPE html>
<html>
<head>
    <title> Little Dreamer Music School - Courses</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Courses</h1>
<div class="center">
    <form action="searchcourse.php" method="GET">
        <input type="text" name="query" />
        <input type="submit" value="Search" />
    </form>
    <?php
        if ($result->rowCount() > 0): ?>
            <form method="post" action="deletecourse.php" id="courses-delete-form">
                <input type="submit" value="Delete selected course(s)" class="delete-all">
                <a href="addcourse.php">Add course</a>
                <table class="sortable">
                    <thead>
                    <tr>
                        <th style="text-align:center">Select</th>
                        <th style="text-align:center">ID</th>
                        <th style="text-align:center">Name</th>
                        <th style="text-align:center">Price</th>
                        <th style="text-align:center">Category ID</th>
                        <th style="text-align:center">Actions</th>

                    </tr>
                    </thead>
                    <tbody>
                    <?php while ($course = $result->fetchObject()): ?>
                        <tr>
                            <td style="text-align:center"><input type="checkbox" name="course_ids[]" class="course-delete" value="<?php echo $course->id; ?>"/></td>
                            <td style="text-align:center"><?= $course->id ?></td>
                            <td style="text-align:center"><?= $course->name ?></td>
                            <td style="text-align:center">$<?= $course->price ?></td>
                            <td style="text-align:center"><?= $course->category_id ?></td>
                            <td>
                                <a href="updatecourse.php?id=<?= $course->id ?>">Update</a>
                                <a href="course_details.php?id=<?= $course->id ?>">Details</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </form>
    <?php else: ?>
        <p>Your Search Generated No Results</p>
    <?php endif; ?>
    <p><a href="courses.php">Return to Courses Page</a></p>
</div>
<script src="scripts.js" type="application/javascript"></script>
<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
</body>
</html>


