<?php 
include "config.php";
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Hasil Klaster</title>
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
    font-weight:600;
}
.badge{
    padding:6px 12px;
    border-radius:8px;
    font-weight:600;
    color:white;
}
.c1{ background:#42A5F5; }
.c2{ background:#66BB6A; }
.c3{ background:#FFB300; }
.c4{ background:#AB47BC; }

.card-info{
    background:white;
    padding:18px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
    margin-bottom:20px;
}
</style>
</head>

<body>
<div class="app">
<?php include "sidebar.php"; ?>

<div class="main">
<?php include "topbar.php"; ?>

<h2 style="color:#1976D2;">📁 Hasil Klaster K-Means</h2>

<div class="grid">
    <div class="card-info">
        <h3>Total Anak Terkelompok</h3>
        <p style="font-weight:600;">
            <?php
            $c = mysqli_fetch_row(mysqli_query($conn,"SELECT COUNT(*) FROM kmeans_hasil"));
            echo $c[0]." Anak";
            ?>
        </p>
    </div>

    <div class="card-info">
        <h3>Jumlah Klaster</h3>
        <p style="font-weight:600;">
            <?php
            $k = mysqli_fetch_row(mysqli_query($conn,"SELECT MAX(cluster) FROM kmeans_hasil"));
            echo $k[0]." Klaster";
            ?>
        </p>
    </div>
</div>

<div class="table-box">
<h3 style="color:#1976D2;">Daftar Hasil Klaster</h3>

<table>
<tr>
    <th>Nama Anak</th>
    <th>Klaster</th>
    <th>Nilai Total</th>
    <th>Rekomendasi</th>
</tr>

<?php
$q = mysqli_query($conn,"
    SELECT k.id_anak, a.nama_anak, k.cluster, k.nilai_total
    FROM kmeans_hasil k
    JOIN anak a ON a.id_anak = k.id_anak
    ORDER BY k.cluster ASC
");

while($d = mysqli_fetch_assoc($q)){

    // ambil 2 aspek dengan nilai TERKECIL
    $aspek = [];
    $qa = mysqli_query($conn,"
        SELECT ap.nama_aspek, AVG(np.nilai_angka) AS rata
        FROM nilai_perkembangan np
        JOIN aspek_perkembangan ap ON ap.id_aspek = np.id_aspek
        WHERE np.id_anak = '".$d['id_anak']."'
        GROUP BY np.id_aspek
        ORDER BY rata ASC
        LIMIT 2
    ");

    while($a = mysqli_fetch_assoc($qa)){
        $aspek[] = strtolower($a['nama_aspek']);
    }

    // bentuk kalimat rekomendasi
    $kalimat = "Ananda masuk klaster ".$d['cluster'].
               " dikarenakan nilai perkembangan ".
               implode(" dan ", $aspek).
               " masih perlu penguatan.";

    // simpan agar tidak hitung ulang
    mysqli_query($conn,"
        INSERT INTO rekomendasi_klaster (id_anak, rekomendasi)
        VALUES ('".$d['id_anak']."', '$kalimat')
        ON DUPLICATE KEY UPDATE rekomendasi='$kalimat'
    ");

    $badge = "c".$d['cluster'];
?>
<tr>
    <td><?= $d['nama_anak'] ?></td>
    <td><span class="badge <?= $badge ?>">Klaster <?= $d['cluster'] ?></span></td>
    <td><b><?= number_format($d['nilai_total'],2) ?></b></td>
    <td><?= $kalimat ?></td>
</tr>
<?php } ?>

</table>
</div>

</div>
</div>

<div class="overlay" id="overlay"></div>
<script>
const sidebar = document.getElementById("sidebar");
const overlay = document.getElementById("overlay");
const hamburger = document.getElementById("btnHamb");

hamburger.addEventListener("click", () => {
    sidebar.classList.toggle("open");
    overlay.classList.toggle("show");
});

overlay.addEventListener("click", () => {
    sidebar.classList.remove("open");
    overlay.classList.remove("show");
});
</script>
</body>
</html>
