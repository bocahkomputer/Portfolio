<?php
require_once('connection.php');
/** @var PDO $dbh Database connection */

$tailoredclass_stmt = $dbh->prepare("SELECT * FROM `tailored_class`");
?>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Little Dreamer Music School - Tailored Classes</title>

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
          <a class="collapse-item" href="addtailoredclass.php">Add New Tailored Class</a>
          <a class="collapse-item active" href="tailoredclass.php">View All Tailored Classes</a>
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

        <?php
        if ($tailoredclass_stmt->execute() && $tailoredclass_stmt->rowCount() > 0): ?>
        <form method="post" action="deletetailoredclass.php" id="courses-delete-form">
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Tailored Courses</h6><br>
                <input class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm pr-2" type="submit" value="Delete selected tailored class(es)" class="delete-all">
                <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm pr-2" href="addtailoredclass.php">Add Tailored Class</a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th style="text-align:center">Select</th>
                      <th style="text-align:center">ID</th>
                      <th style="text-align:center">Summary</th>
                      <th style="text-align:center">Start Date</th>
                      <th style="text-align:center">End Date</th>
                      <th style="text-align:center">Quote($)</th>
                      <th style="text-align:center">Other Info</th>
                      <th style="text-align:center">Student ID</th>
                      <th style="text-align:center">Actions</th>
                    </tr>
                    </tr>
                    </thead>
                    <tbody>
                    <?php while ($tailoredclass = $tailoredclass_stmt->fetchObject()): ?>
                      <tr>
                        <td style="text-align:center"><input type="checkbox" name="tailoredclass_ids[]" class="course-delete" value="<?php echo $tailoredclass->id; ?>"/></td>
                        <td style="text-align:center"><?= $tailoredclass->id ?></td>
                        <td style="text-align:center"><?= $tailoredclass->summary ?></td>
                        <td style="text-align:center"><?= $tailoredclass->start_date ?></td>
                        <td style="text-align:center"><?= $tailoredclass->end_date ?></td>
                        <td style="text-align:center"><?= $tailoredclass->quote ?></td>
                        <td style="text-align:center"><?= $tailoredclass->otherInfo ?></td>
                        <td style="text-align:center"><?= $tailoredclass->student_id ?></td>
                        <td style="text-align:center">
                          <a href="updatetailoredclass.php?id=<?= $tailoredclass->id ?>">Update</a> |
                          <a href="tailoredclass_details.php?id=<?= $tailoredclass->id ?>">Details</a>
                        </td>
                      </tr>
                    <?php endwhile; ?>
                    </tbody>
                  </table>
          </form>
        <?php else: ?>
          <p>Tailored Page Is Empty</p>
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
