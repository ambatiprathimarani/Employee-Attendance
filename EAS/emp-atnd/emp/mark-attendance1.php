<?php 
session_start();
error_reporting(0);
require_once('include/config.php');
if(strlen($_SESSION["Empid"])==0) {   
    header('location:index.php');
} else {
    // Allowed IP addresses
    $allowed_ips = ['10.99.101.95', '10.99.101.54','10.96.25.183'];
    $ipaddress = $_SERVER['REMOTE_ADDR'] == '::1' ? '127.0.0.1' : $_SERVER['REMOTE_ADDR'];

    // Check-out logic
    if(isset($_POST['checkout'])) {
        if (in_array($ipaddress, $allowed_ips)) {
            $empid = $_SESSION['id'];
            $checkouttime = date('Y-m-d H:i:s', time());
            $cdate = date('Y-m-d');
            $sql = "UPDATE tblattendance SET checkOutTime=:checkouttime WHERE date(checkInTime)=:cdate AND empId=:empid";
            $query = $dbh->prepare($sql);
            $query->bindParam(':checkouttime', $checkouttime, PDO::PARAM_STR);
            $query->bindParam(':empid', $empid, PDO::PARAM_STR);
            $query->bindParam(':cdate', $cdate, PDO::PARAM_STR);
            $query->execute();

            echo "<script>alert('Attendance checkout Successfully');</script>";
            echo "<script>window.location.href='mark-attendance.php'</script>";
        } else {
            echo "<script>alert('Check-out can only be done from approved IP addresses.');</script>";
            echo "<script>window.location.href='mark-attendance.php'</script>";
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Employee Attendance System</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <?php include 'include/header.php'; ?>
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <?php include 'include/sidebar.php'; ?>
    <main class="app-content">
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <h2 align="center">Mark Today's Attendance</h2>
            <hr />

<?php 
$cdate = date('Y-m-d');
$empid = $_SESSION['id'];
$sql = "SELECT id, checkInTime, checkInIP, checkOutTime FROM tblattendance WHERE empId=:empid AND date(checkInTime)=:cdate";
$query = $dbh->prepare($sql);
$query->bindParam(':empid', $empid, PDO::PARAM_STR);
$query->bindParam(':cdate', $cdate, PDO::PARAM_STR);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);

if ($query->rowCount() == 0) { 
    if (in_array($ipaddress, $allowed_ips)) { ?>

            <form class="row" method="post" action="thank-you.php">
                <div class="form-group col-md-6">
                    <label class="control-label">IP Address</label>
                    <input type="text" name="ipaddress" id="ipaddress" class="form-control" value="<?php echo $ipaddress; ?>" readonly autocomplete="off">
                </div>
                <div class="form-group col-md-6">
                    <label class="control-label">Check-In Time (Current Time)</label>
                    <input class="form-control" type="text" name="checkintime" id="checkintime" value="<?php echo date('d-m-Y H:i:s', time()); ?>" autocomplete="off">
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label">Remark (If any)</label>
                    <textarea name="remark" id="remark" placeholder="Enter Remark (If any)" class="form-control" autocomplete="off"></textarea> 
                </div>
                <div class="form-group col-md-4 align-self-end">
                    <input type="submit" name="Submit" id="Submit" class="btn btn-primary" value="Submit">
                </div>
            </form>

    <?php } else { ?>
        <div align="center">
            <h1 style="color:red;">Check-in can only be done from approved IP addresses.</h1>
        </div>
    <?php }
} else { ?>
    <!-- Display attendance record if already checked in -->
    <div align="center">
        <img src="../img/attendance.png">
        <h1 style="color:blue; padding-top:1%;">Today's attendance already marked.</h1>
        <hr />
        <table class="table table-hover table-bordered">
            <?php foreach ($results as $result) { ?>
                <tr>
                    <th>Check-In IP</th>
                    <td><?php echo $result->checkInIP; ?></td>
                </tr>
                <tr>
                    <th>Check-In Time</th>
                    <td><?php echo date("d-m-Y H:i:s", strtotime($result->checkInTime)); ?></td>
                </tr>
                <?php if ($result->checkOutTime != '') { ?>
                <tr>
                    <th>Check-Out Time</th>
                    <td><?php echo date("d-m-Y H:i:s", strtotime($result->checkOutTime)); ?></td>
                </tr>
                <?php } ?>
            <?php } ?>
        </table>

        <?php if (!$result->checkOutTime && in_array($ipaddress, $allowed_ips)) { ?>
            <form method="post">
                <input type="submit" name="checkout" value="Checkout" class="btn btn-danger btn-lg">
            </form>
        <?php } else if (!$result->checkOutTime) { ?>
            <h3 style="color:red;">Check-out can only be done from approved IP addresses.</h3>
        <?php } ?>
    </div>
<?php } ?>
          </div>
        </div>
      </div>
    </main>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/plugins/pace.min.js"></script>
  </body>
</html>
<?php } ?>
