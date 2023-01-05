<?php
/** @var PDO $dbh Database connection */

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['destination']) && !empty($_POST['subject']) && !empty($_POST['body'])) {
        header("Location: contactus.php?&error=" . urlencode('Email Successfully Sent!'));
    }
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Little Dreamer Music School - Contact Us</title>
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

<h1>Contact Us</h1>
<div class="center">
    <?php if (!empty($_GET['error'])): ?>
        <p class="error"><?= $_GET['error'] ?></p>
    <?php endif; ?>
        <form method="post">
            <p>
                <input type="text" name="destination" required class="email-form-control" value="contact_littledreamermusic@example.com" readonly  size="100">
            </p>
            <p>
                <textarea name="subject" placeholder="Write email subject here" required class="email-form-control" rows="4" cols="100"></textarea>
            </p>
            <p>
                <textarea name="body" placeholder="Write email contents here" required class="email-form-control" rows="4" cols="100"></textarea>
            </p>
            <p>
                <button type="submit">Send email</button>
            </p>
        </form>
    <p><a href="index.html">Back to Homepage</a></p>
</div>
<script src="scripts.js" type="application/javascript"></script>
</body>
</html>
