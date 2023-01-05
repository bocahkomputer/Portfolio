<?php

require('connection.php');

/** @var PDO $dbh Database connection */


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $stmt = $dbh->prepare("SELECT * FROM `user` WHERE `username` = ? AND `password` = ?");
        if ($stmt->execute([
                $_POST['username'],
                hash('sha256', $_POST['password'])
            ]) && $stmt->rowCount() == 1) {
            $row = $stmt->fetchObject();
            $_SESSION['id'] = $row->id;
            if (empty($_GET['referer'])) {
                header("Location: dashboard.html");
            } else {
                header("Location: " . $_GET['referer']);
            }
        } else {
            header("Location: login.php?".$_SERVER['QUERY_STRING']."&error=" . urlencode('Your username and/or password is incorrect. Please try again!'));
        }
        exit();
    } else {
        header("Location: login.php?".$_SERVER['QUERY_STRING']."&error=" . urlencode('Please enter both username and password to login!'));
        exit();
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Little Dreamer Music School - Login Page</title>
    <link rel="stylesheet" href="styles.css">
    <link href="vendor/aos/aos.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
<!-- ======= Header ======= -->
<header id="header" class="d-flex align-items-center">
  <div class="container d-flex align-items-center justify-content-between">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
      <img class="sidebar-card-illustration mb-2" src="img/logo.png" width="180px" alt="LDMS Logo">
    </a>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

    <nav id="navbar" class="navbar">
      <ul>
        <li><a class="nav-link scrollto active" href="index.html">Home</a></li>
        <li><a class="nav-link scrollto" href="contactus.php">Contact</a></li>
        <li><a class="nav-link scrollto" href="login.php">Log In</a></li>
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

  </div>
</header><!-- End Header -->
<h1>Please login</h1>
<div class="center">
    <?php if (!empty($_GET['error'])): ?>
        <p class="error"><?= $_GET['error'] ?></p>
    <?php endif; ?>

    <form method="post">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
