<?php
session_start();
include "config.php";

if (!isset($_SESSION['ortu_anak'])) {
    header("Location: ortu_login.php");
    exit;
}

$anak = $_SESSION['ortu_anak'];
$id   = $anak['id_anak'];

/* Rekomendasi utama (klaster) */
$qRek = mysqli_query($conn,"
    SELECT rekomendasi 
    FROM rekomendasi_klaster 
    WHERE id_anak = '$id'
    LIMIT 1
");
$rekUtama = mysqli_fetch_assoc($qRek)['rekomendasi']
            ?? "Rekomendasi utama belum tersedia.";

/* Rekomendasi kegiatan rumah */
$qKegiatan = mysqli_query($conn,"
    SELECT ap.nama_aspek, np.nilai, ra.rekomendasi
    FROM nilai_perkembangan np
    JOIN aspek_perkembangan ap ON ap.id_aspek = np.id_aspek
    JOIN rekomendasi_aspek ra 
        ON ra.id_aspek = np.id_aspek
       AND ra.kategori = np.nilai
    WHERE np.id_anak = '$id'
    ORDER BY FIELD(np.nilai,'BM','KM','SM','K'), ap.id_aspek
");
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Dashboard Orang Tua</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins',sans-serif;
    background:#f3f7ff;
    margin:0;
}
.header{
    background:#1976D2;
    padding:18px 30px;
    color:white;
    font-size:22px;
    font-weight:600;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.logout{
    color:white;
    text-decoration:none;
    border:1px solid rgba(255,255,255,.6);
    padding:6px 14px;
    border-radius:10px;
    font-size:14px;
}

.container{
    width:90%;
    max-width:1100px;
    margin:30px auto;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
    gap:20px;
}

.card{
    background:white;
    padding:22px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

.card h4{
    margin:0;
    font-size:15px;
    color:#64748b;
}
.card p{
    margin:6px 0 0;
    font-size:18px;
    font-weight:600;
    color:#0f172a;
}

.badge{
    display:inline-block;
    padding:6px 14px;
    border-radius:12px;
    font-weight:600;
    color:white;
    font-size:14px;
}
.c1{ background:#42A5F5; }
.c2{ background:#66BB6A; }
.c3{ background:#FFB300; }
.c4{ background:#AB47BC; }

.section{
    margin-top:28px;
}
.section-title{
    font-size:18px;
    font-weight:600;
    color:#1976D2;
    margin-bottom:10px;
}

.rekom-box{
    background:#f8fbff;
    padding:18px 22px;
    border-radius:16px;
    border-left:6px solid #1976D2;
    line-height:1.7;
    color:#0f172a;
}

.list-rekom li{
    margin-bottom:8px;
}
</style>
</head>

<body>

<div class="header">
    Dashboard Orang Tua
    <a class="logout" href="ortu_logout.php">Logout</a>
</div>

<div class="container">

    <!-- INFO RINGKAS -->
    <div class="grid">
        <div class="card">
            <h4>Nama Anak</h4>
            <p><?= $anak['nama_anak'] ?></p>
        </div>

        <div class="card">
            <h4>Klaster Perkembangan</h4>
            <p>
                <span class="badge c<?= $anak['cluster'] ?>">
                    Klaster <?= $anak['cluster'] ?>
                </span>
            </p>
        </div>

        <div class="card">
            <h4>Nilai Total</h4>
            <p><?= number_format($anak['nilai_total'],2) ?></p>
        </div>
    </div>

    <!-- REKOMENDASI UTAMA -->
    <div class="section">
        <div class="section-title">📌 Rekomendasi Utama Anak</div>
        <div class="rekom-box">
            <?= nl2br($rekUtama) ?>
        </div>
    </div>

    <!-- REKOMENDASI KEGIATAN -->
    <div class="section">
        <div class="section-title">🏠 Rekomendasi Kegiatan di Rumah</div>
        <div class="rekom-box">
            <?php if(mysqli_num_rows($qKegiatan)>0){ ?>
                <ul class="list-rekom">
                <?php while($r=mysqli_fetch_assoc($qKegiatan)){ ?>
                    <li>
                        <b><?= $r['nama_aspek'] ?> (<?= $r['nilai'] ?>)</b> —
                        <?= $r['rekomendasi'] ?>
                    </li>
                <?php } ?>
                </ul>
            <?php } else { ?>
                Ananda menunjukkan perkembangan yang sangat baik.  
                Lanjutkan stimulasi positif secara konsisten di rumah 😊
            <?php } ?>
        </div>
    </div>

</div>

</body>
</html>
