<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <title>Login Modern</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            width: 300px;
            text-align: center;
        }
        input, button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            box-sizing: border-box;
        }
        input {
            background: #f2f2f2;
        }
        button {
            background-color: #667eea;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        .error { color: red; font-size: 14px; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Login</h2>
    <?php if (isset($_SESSION['error'])) { echo "<p class='error'>{$_SESSION['error']}</p>"; unset($_SESSION['error']); } ?>
    <form action="check.php" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Masuk</button>
    </form>
</div>
</body>
</html>
