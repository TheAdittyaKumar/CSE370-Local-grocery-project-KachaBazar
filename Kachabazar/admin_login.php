<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <h2>Welcome to KachaBazar's Admin Login</h2>
    <form action="" method="POST">
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>
        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <br><br>
    <p>Do not have an account? Click below and register now.</p>
    <a href="admin_register.php">Register as Admin</a>
</body>
</html>

<?php
session_start();
$conn = mysqli_connect('localhost', 'root', '', 'kachabazarDB');

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $admin_query = "SELECT * FROM User WHERE Uemail='$email' AND Upassword='$password' AND admin=1";
    $admin_result = mysqli_query($conn, $admin_query);

    if (mysqli_num_rows($admin_result) == 1) {
        $row = mysqli_fetch_assoc($admin_result);
        $_SESSION['customer_id'] = $row['customer_id'];
        $_SESSION['Uname'] = $row['Uname'];
        $_SESSION['role'] = 'admin';
        header("Location: admin_dashboard.php");
        exit();
    } else {
        echo "Invalid Email or Password!";
    }
}
?>

