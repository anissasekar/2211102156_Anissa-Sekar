<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: index.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $umur = (int)$_POST['umur'];

    if ($umur >= 18) {
        header("Location: info_dewasa.php");
    } else {
        header("Location: info_remaja.php");
    }
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Cek Umur</title>
    <style>
        body {
            font-family: Arial;
            background: #f0f9ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            background: #3498db;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Cek Status Umur</h2>
    <form method="post">
        <input type="text" name="nama" placeholder="Nama Anda" required>
        <input type="number" name="umur" placeholder="Umur Anda" required>
        <button type="submit">Lanjutkan</button>
    </form>
</div>
</body>
</html>
