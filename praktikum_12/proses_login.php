<?php session_start();
$user = "changkyun";
$pass = "2606";
if ($_POST['username'] == $user && $_POST['password'] == $pass) {
  $_SESSION['username'] = $user;
  header("Location: dashboard.php");
} else {
  echo "Login Gagal!";
}
?>