<?php
session_start(); //Starts the session
session_unset(); //Removes all of the session variables
session_destroy(); //Ends the session
header("Location: login.php"); //go back to login page
exit();
?>
