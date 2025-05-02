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
    <title>Informasi Remaja</title>
    <style>
        body { font-family: sans-serif; background: #fffbe6; padding: 50px; text-align: center; }
        .card { background: white; padding: 30px; border-radius: 10px; display: inline-block; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        a { margin-top: 20px; display: inline-block; color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <div class="card">
        <h2>Anda Masih Remaja</h2>
        <p>Informasi ini cocok untuk pelajar dan anak muda.</p>
        <p>Contoh: tips belajar, manajemen waktu, dan pengembangan diri.</p>
        <a href="home.php">← Kembali ke Dashboard</a>
    </div>
</body>
</html>
