<?php
session_start(); // Start the session
if (!isset($_SESSION['seller_id']) || $_SESSION['role'] != 'seller') { 
    header("Location: login.php");  // If the seller_id is not set or role is not seller go back to login page
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Seller Dashboard</title>
</head>
<body>
    <h2>Welcome, <?php echo $_SESSION['seller_name']; ?>!</h2>
    <p>You are logged in as a Seller.</p>
    <ul>
        <li><a href="manage_products.php">Add New Product / Manage Your Products</a></li>
        <li><a href="view_orders_seller.php">View Orders for Your Store</a></li>
        <li><a href="logout.php">Logout</a></li>
    </ul>
</body>
</html>
