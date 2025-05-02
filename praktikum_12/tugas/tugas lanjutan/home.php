<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f7f9fc;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #667eea;
            padding: 15px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            padding: 40px;
            text-align: center;
        }
        a.button {
            background: #764ba2;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            display: inline-block;
            margin: 10px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>Halo, <?php echo ucfirst($_SESSION['username']); ?>!</div>
        <a href="logout.php" style="color:white;">Logout</a>
    </div>
    <div class="container">
        <h2>Selamat Datang di Dashboard</h2>
        <p>Silakan pilih fitur di bawah ini:</p>
        <a href="umur.php" class="button">Cek Umur</a>
        <a href="logout.php" class="button" style="background: #e74c3c;">Logout</a>
    </div>
</body>
</html>
