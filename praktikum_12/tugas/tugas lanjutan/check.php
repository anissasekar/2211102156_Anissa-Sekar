<?php
session_start();

$username = $_POST['username'];
$password = $_POST['password'];

// Cek login sederhana
if ($username === 'changkyun' && $password === '2606') {
    $_SESSION['username'] = $username;
    header("Location: home.php");
} else {
    $_SESSION['error'] = "Username atau password salah!";
    header("Location: index.php");
}
