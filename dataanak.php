<?php include "config.php"; ?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Anak</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
<?php include "style_dashboard_base.css"; ?>

.table-box{
    background:white;
    padding:20px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}
table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}
th,td{
    padding:12px;
    border-bottom:1px solid #e5e7eb;
}
th{
    text-align:left;
    color:#1976D2;
    font-size:15px;
}
td{
    font-size:14px;
    color:#0f172a;
}
.btn-add{
    background:#1976D2;
    color:white;
    padding:10px 16px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
}
</style>
</head>

<body>

<div class="app">

    <?php include "sidebar.php"; ?>

    <div class="main">

        <div class="topbar">
            <?php include "topbar.php"; ?>
        </div>

        <h2 style="color:#1976D2;">🧒 Data Anak</h2>

        <a href="tambah_anak.php" class="btn-add">+ Tambah Anak</a>

        <div class="table-box">
            <table>
                <tr>
                    <th>Nama</th>
                    <th>Jenis Kelamin</th>
                    <th>Usia</th>
                    <th>Kelas</th>
                    <th>Aksi</th>
                </tr>

                <?php
                $q = mysqli_query($conn, "SELECT * FROM anak ORDER BY id_anak DESC");
                while($d = mysqli_fetch_assoc($q)){
                ?>
                <tr>
                    <td><?= $d['nama_anak'] ?></td>
                    <td><?= $d['jenis_kelamin']=='L'?'Laki-laki':'Perempuan' ?></td>
                    <td><?= $d['usia'] ?> th</td>
                    <td><?= $d['kelas'] ?></td>
                    <td>
                        <a href="detailanak.php?id=<?= $d['id_anak'] ?>" style="margin-right:12px;font-size:20px;">👁️</a>
                        <a href="edit_anak.php?id=<?= $d['id_anak'] ?>" style="margin-right:12px;font-size:20px;">✏️</a>
                        <a href="hapus_anak.php?id=<?= $d['id_anak'] ?>" onclick="return confirm('Hapus anak ini?')" style="font-size:20px;">🗑️</a>
                    </td>
                </tr>
                <?php } ?>

            </table>
        </div>

    </div>
</div>
<?php include "overlay_js.php"; ?>
</body>
</html>
