<?php

/** @var $dbh PDO */
/** @var $db_name string */

include("connection.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Little Dreamer Music School - Add New Tailored Class</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
      <img class="sidebar-card-illustration mb-2" src="img/logo2.png" width="180px" alt="LDMS Logo">
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item">
      <a class="nav-link" href="dashboard.html">
        <i class="fas fa-fw fa-home"></i>
        <span>Dashboard</span></a>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
         aria-expanded="true" aria-controls="collapseTwo">
        <i class="fas fa-fw fa-user"></i>
        <span>Students</span>
      </a>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Students:</h6>
          <a class="collapse-item" href="addstudents.php">Add New Student</a>
          <a class="collapse-item" href="students.php">View All Students</a>
        </div>
      </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
         aria-expanded="true" aria-controls="collapseUtilities">
        <i class="fas fa-fw fa-school"></i>
        <span>Courses</span>
      </a>
      <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
           data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Courses:</h6>
          <a class="collapse-item" href="addcourse.php">Add New Course</a>
          <a class="collapse-item" href="courses.php">View All Courses</a>
        </div>
      </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item active">
      <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
         aria-expanded="true" aria-controls="collapseUtilities2">
        <i class="fas fa-fw fa-music"></i>
        <span>Tailored Classes</span>
      </a>
      <div id="collapseUtilities2" class="collapse show" aria-labelledby="headingUtilities2"
           data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Tailored Classes:</h6>
          <a class="collapse-item active" href="addtailoredclass.php">Add New Tailored Class</a>
          <a class="collapse-item" href="tailoredclass.php">View All Tailored Classes</a>
        </div>
      </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
         aria-expanded="true" aria-controls="collapsePages">
        <i class="fas fa-fw fa-object-group"></i>
        <span>Categories</span>
      </a>
      <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Categories:</h6>
          <a class="collapse-item" href="addcategories.php">Add New Category</a>
          <a class="collapse-item" href="categories.php">View All Categories</a>
        </div>
      </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
  </ul>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

          <!-- Nav Item - Search Dropdown (Visible Only XS) -->
          <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                 aria-labelledby="searchDropdown">
              <form class="form-inline mr-auto w-100 navbar-search">
                <div class="input-group">
                  <input type="text" class="form-control bg-light border-0 small"
                         placeholder="Search for..." aria-label="Search"
                         aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                      <i class="fas fa-search fa-sm"></i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </li>

          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline text-gray-600 small">Welcome Admin</span>
              <img class="img-profile rounded-circle"
                   src="img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
              <a class="dropdown-item" href="login.php" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Logout
              </a>
            </div>
          </li>

        </ul>

      </nav>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- AdminBody -->
        <h1>Add A New Tailored Class</h1>

        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST)):
          foreach ($_POST as $fieldName => $fieldValue) {
            if (empty($fieldValue)) {
              echo ("'$fieldName' field is empty. Please fill it out before submitting. ");
              echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
              die();
            }
          }

          $query = "INSERT INTO `tailored_class`(`summary`,`start_date`,`end_date`,`quote`,`otherInfo`,`student_id`) VALUES (:summary, :start_date, :end_date, :quote, :otherInfo, :student_id)";
          $stmt = $dbh->prepare($query);

          $parameters = [
            'summary' => $_POST['summary'],
            'start_date' => $_POST['start_date'],
            'end_date' => $_POST['end_date'],
            'quote' => $_POST['quote'],
            'otherInfo' => $_POST['otherInfo'],
            'student_id' => $_POST['student_id']
          ];

          if ($stmt->execute($parameters)) {

            $newRecordId = $dbh->lastInsertId();

            $query = "SELECT * FROM `tailored_class` WHERE `id` = ?";
            $stmt = $dbh->prepare($query);
            if ($stmt->execute([$newRecordId])) {
              if ($stmt->rowCount() > 0) {
                $record = $stmt->fetchObject(); ?>
                <div class="center row">New tailored class has been registered.</div>
                <form method="post">
                  <div class="aligned-form">
                    <div class="form-group">
                      <label for="id">ID</label>
                      <input class="form-control" type="number" id="id" value="<?= $record->id ?>" disabled/>
                    </div>
                    <div class="form-group">
                      <label for="firstName">Summary</label>
                      <input class="form-control" type="text" id="summary" value="<?= $record->summary ?>"  disabled/>
                    </div>
                    <div class="form-group">
                      <label for="surname">Start Date</label>
                      <input class="form-control" type="text" id="start_date" value="<?= $record->start_date ?>" disabled/>
                    </div>
                    <div class="form-group">
                      <label for="address">End Date</label>
                      <input class="form-control" type="text" id="end_date" value="<?= $record->end_date ?>" disabled/>
                    </div>
                    <div class="form-group">
                      <label for="quote">Quote($)</label>
                      <input class="form-control" type="decimal" id="quote" value="<?= $record->quote ?>"  disabled/>
                    </div>
                    <div class="form-group">
                      <label for="dob">Other Info</label>
                      <input class="form-control" type="date" id="otherInfo" value="<?= $record->otherInfo ?>"  disabled/>
                    </div>
                    <div class="form-group">
                      <label for="email">Student ID</label>
                      <input class="form-control" type="text" id="student_id" value="<?= $record->student_id ?>" disabled/>
                    </div>
                  </div>
                </form>
                <div class="form-group>
                  <a href="tailoredclass.php">Back to Tailored Classes page</a>
                </div>
              <?php }
            } else {
              die($stmt->errorInfo()[2]);
            }
          } else {
            echo ($stmt->errorInfo()[2]);
            echo '<div class="center row"><button onclick="window.history.back()">Back to previous page</button></div>';
            die();
          }
        else:
          $query = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$db_name' AND TABLE_NAME='tailored_class'";
          $stmt = $dbh->prepare($query);
          $nextId = ($stmt->execute() || $stmt->rowCount() > 0) ? $stmt->fetchObject()->AUTO_INCREMENT : "Not available";
          ?>

          <form method="post">
            <div class="aligned-form">
              <div class="form-group">
                <label for="id">ID</label>
                <input class="form-control" type="number" id="id" value="<?= $nextId ?>" disabled/>
              </div>
              <div class="form-group" rows="4" cols="100">
                <label for="summary">Summary</label>
                <textarea class="form-control" type="text" id="summary" name="summary"></textarea>
              </div>
              <div class="form-group">
                <label for="start_date">Start Date</label>
                <input class="form-control" type="date" id="start_date" name="start_date"/>
              </div>
              <div class="form-group">
                <label for="end_date">End Date</label>
                <input class="form-control" type="date" id="end_date" name="end_date"/>
              </div>
              <div class="form-group">
                <label for="quote">Quote($)</label>
                <input class="form-control" type="decimal" id="quote" name="quote" min="0" max="9999999.99"/>
              </div>
              <div class="form-group" rows="4" cols="100">
                <label for="otherInfo">Other Info</label>
                <textarea class="form-control" type="text" id="otherInfo" name="otherInfo" ></textarea>
              </div>
              <div class="form-group">
                <label for="student_id">Student ID</label>
                <input class="form-control" type="number" id="student_id" name="student_id"/>
              </div>
            </div>
            <div class="form-group">
              <input class="btn btn-primary" type="submit" value="Add"/>
            </div>
            <div class="form-group">
              <a href="tailoredclass.php">Go back to Tailored Classes page</a>
            </div>
          </form>
        <?php endif; ?>
      </div>

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; LDMS 2022</span>
        </div>
      </div>
    </footer>
    <!-- End of Footer -->

  </div>
  <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.php">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="scripts.js" type="application/javascript"></script>
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>


<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>
<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
