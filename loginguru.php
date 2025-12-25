<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Guru - Sistem PAUD</title>
    <link rel="stylesheet" href="login.css">
</head>

<body>

<div class="container">

    <div class="card">

        <h2>Login Guru</h2>
        <p class="sub">Masukkan username dan password Anda</p>

        <form action="proses_login.php" method="POST">

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required placeholder="Masukkan username">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required placeholder="Masukkan password">
            </div>

            <button type="submit" class="btn">Masuk</button>

            <p class="regis-text">
                Belum punya akun? 
                <a href="registrasiguru.php">Registrasi di sini</a>
            </p>

        </form>

    </div>
</div>

</body>
</html>
