<?php include "config.php"; ?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Registrasi Guru</title>
<link rel="stylesheet" href="registrasi.css">
</head>
<body>

<div class="container">
    <div class="card">

        <h2>Registrasi Guru</h2>
        <p class="sub">Buat akun untuk mengakses sistem</p>

        <form action="proses_registrasi.php" method="POST">
            <div class="form-group">
                <label>Nama Lengkap</label>
                <input type="text" name="nama_guru" placeholder="Masukkan nama" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Buat username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Buat password" required>
            </div>

            <button class="btn">Daftar</button>
        </form>

        <p class="regis-text">
            Sudah punya akun? <a href="loginguru.php">Login</a>
        </p>

    </div>
</div>

</body>
</html>
