<?php
session_start();
if (!isset($_SESSION['customer_id']) || $_SESSION['role'] != 'admin') { // Protect admin page
    header("Location: admin_login.php");
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Welcome, Admin <?php echo $_SESSION['Uname']; ?>!</h2>
    <p>You are logged in as an Admin.</p>

    <ul>
        <li><a href="manage_users.php">Manage Users</a></li>
        <li><a href="manage_sellers.php">Manage Sellers</a></li>
        <li><a href="manage_orders.php">Manage Orders</a></li>
        <li><a href="admin_logout.php">Logout</a></li>
    </ul>
</body>
</html>
