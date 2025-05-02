<!DOCTYPE html>
<html>
<head>
    <title>Cek Umur - PHP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #83a4d4, #b6fbff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            text-align: center;
            width: 300px;
        }
        input, button {
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        button {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        .result {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Cek Status Umur</h2>
    <form method="POST" action="">
        <input type="text" name="nama" placeholder="Masukkan Nama" required>
        <input type="number" name="umur" placeholder="Masukkan Umur" required>
        <button type="submit">Cek Sekarang</button>
    </form>

    <?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $nama = htmlspecialchars($_POST['nama']);
        $umur = (int)$_POST['umur'];

        echo "<div class='result'>Halo, <strong>$nama</strong><br>";

        if ($umur >= 18) {
            echo "Status: <span style='color: green;'>Dewasa</span>";
        } else {
            echo "Status: <span style='color: orange;'>Belum Dewasa</span>";
        }

        echo "</div>";
    }
    ?>
</div>
</body>
</html>
