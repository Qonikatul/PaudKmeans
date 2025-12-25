<?php 
include "config.php";
session_start();

if (isset($_POST['login'])) {
    $nama = mysqli_real_escape_string($conn, $_POST['nama_anak']);

    $q = mysqli_query($conn,"
        SELECT anak.*, kmeans_hasil.cluster, kmeans_hasil.nilai_total
        FROM anak
        LEFT JOIN kmeans_hasil ON kmeans_hasil.id_anak = anak.id_anak
        WHERE anak.nama_anak = '$nama'
        LIMIT 1
    ");

    if (mysqli_num_rows($q) > 0) {
        $_SESSION['ortu_anak'] = mysqli_fetch_assoc($q);
        header("Location: ortu_dashboard.php");
        exit;
    } else {
        $error = "Nama anak tidak ditemukan.";
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Orang Tua</title>

    <style>
        body{
            font-family:'Poppins',sans-serif;
            background:#f3f6fc;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }
        .box{
            background:white;
            padding:35px;
            border-radius:18px;
            width:360px;
            box-shadow:0 10px 30px rgba(0,0,0,0.10);
        }
        input{
            width:100%;
            padding:12px;
            border-radius:10px;
            border:1px solid #d6d6d6;
            margin-top:10px;
            font-size:15px;
        }
        button{
            margin-top:15px;
            width:100%;
            padding:12px;
            background:#1976D2;
            border:none;
            color:white;
            font-weight:600;
            border-radius:10px;
            cursor:pointer;
        }
        .error{ color:#d32f2f; margin-top:10px; }
    </style>
</head>

<body>
    <div class="box">
        <h2 style="text-align:center;color:#1976D2;margin-bottom:10px;">
            Login Orang Tua
        </h2>

        <form method="POST">
            <input type="text" name="nama_anak" placeholder="Masukkan Nama Anak" required>

            <button name="login">Masuk</button>

            <?php if(isset($error)){ ?>
                <div class="error"><?= $error ?></div>
            <?php } ?>
        </form>
    </div>
</body>
</html>
