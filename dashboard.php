<?php 
include "config.php";

// ==========================
// 1. AMBIL DATA DARI DB
// ==========================

// Total Anak
$total_anak = mysqli_fetch_row(mysqli_query($conn, 
    "SELECT COUNT(*) FROM anak"
))[0];

// Jumlah kelas unik
$total_kelas = mysqli_fetch_row(mysqli_query($conn,
    "SELECT COUNT(DISTINCT kelas) FROM anak"
))[0];

// Jumlah klaster terakhir
$jumlah_klaster = mysqli_fetch_row(mysqli_query($conn,
    "SELECT MAX(cluster) FROM kmeans_hasil"
))[0];
if(!$jumlah_klaster) $jumlah_klaster = 0;

// 3 anak terbaru (untuk ringkasan)
$anak_ringkas = mysqli_query($conn,
    "SELECT anak.id_anak, anak.nama_anak, anak.kelas, anak.usia, 
            (SELECT cluster FROM kmeans_hasil 
             WHERE id_anak = anak.id_anak LIMIT 1) AS klaster
    FROM anak 
    ORDER BY anak.id_anak DESC 
    LIMIT 3
");
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard Guru - PAUD</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ----------- CSS TETAP PUNYAMU ----------- */
<?php /* tidak diubah */ ?>
:root{
    --bg: #eaf6ff;
    --primary:#1976D2;
    --text:#0f172a;
    --card:#ffffff;
    --muted:#64748b;
    --shadow:0 10px 25px rgba(0,0,0,0.07);
}
body{ margin:0; background:var(--bg); font-family:'Poppins'; overflow-x:hidden; }
.app{ display:grid; grid-template-columns:260px 1fr; min-height:100vh; transition:.3s; }
.sidebar{ background:white; padding:20px; box-shadow:4px 0 25px rgba(0,0,0,0.05); height:100vh; z-index:9999; }
.brand{ display:flex; gap:12px; margin-bottom:25px; }
.brand img{ width:48px; height:48px; border-radius:10px; object-fit:cover; }
.brand .title{ font-weight:700; font-size:18px; color:var(--primary); }
.menu{ display:flex; flex-direction:column; gap:6px; }
.menu a{ padding:10px 12px; border-radius:10px; text-decoration:none; font-weight:600; color:var(--text); display:flex; gap:10px; }
.menu a:hover{ background:#e3f2ff; color:var(--primary); }
.menu a.active{ background:#e0edff; color:var(--primary); }

.main{ padding:22px; overflow:auto; }
.topbar{ display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; }
.hamburger{ display:none; width:46px; height:46px; background:white; border-radius:12px; box-shadow:var(--shadow); border:none; justify-content:center; align-items:center; }
.search{ display:flex; align-items:center; gap:10px; padding:8px 14px; background:white; border-radius:12px; box-shadow:var(--shadow); }
.avatar{ width:42px; height:42px; border-radius:10px; object-fit:cover; }

.grid{ display:grid; grid-template-columns:repeat(3,1fr); gap:18px; }
.card{ background:white; padding:18px; border-radius:14px; box-shadow:var(--shadow); }
.card h3{ margin:0 0 8px; color:var(--primary); }
.card p{ margin:0; color:var(--muted); }

.list{ display:grid; gap:12px; margin-top:15px; }
.row{ background:white; padding:12px; border-radius:12px; display:flex; justify-content:space-between; box-shadow:var(--shadow); }

.overlay{ display:none; position:fixed; inset:0; background:rgba(0,0,0,0.45); opacity:0; pointer-events:none; transition:.25s; z-index:9000; }
.overlay.show{ opacity:1; pointer-events:auto; }

@media(max-width:900px){
    .app{ grid-template-columns:1fr; }
    .hamburger{ display:flex; }
    .sidebar{ position:fixed; top:0; left:-300px; width:260px; transition:.3s; }
    .sidebar.open{ left:0; }
    .grid{ grid-template-columns:1fr; }
    .search{ display:none; }
}
</style>
</head>

<body>

<div class="app">

    <!-- SIDEBAR -->
    <?php include "sidebar.php"; ?>

    <!-- MAIN -->
    <main class="main">

        <div class="topbar">
            <?php include "topbar.php"; ?>
        </div>

        <!-- DASHBOARD -->
        <section id="page-dashboard">

            <div class="grid">
                <div class="card">
                    <h3>Jumlah Anak</h3>
                    <p><b><?= $total_anak ?></b> anak</p>
                </div>

                <div class="card">
                    <h3>Jumlah Kelas</h3>
                    <p><b><?= $total_kelas ?></b> kelas aktif</p>
                </div>

                <div class="card">
                    <h3>Proses K-Means</h3>
                    <p><b><?= $jumlah_klaster ?></b> klaster terbaru</p>
                </div>
            </div>

            <div class="card" style="margin-top:20px;">
                <h3>Data Anak (Ringkasan)</h3>

                <div class="list">
                    <?php while($d = mysqli_fetch_assoc($anak_ringkas)){ ?>
                        <div class="row">
                            <span>
                                <b><?= $d['nama_anak'] ?></b><br>
                                <small><?= $d['kelas'] ?> • <?= $d['usia'] ?> th</small>
                            </span>
                            <span>Klaster <?= $d['klaster'] ?? "-" ?></span>
                        </div>
                    <?php } ?>
                </div>
            </div>

        </section>

    </main>
</div>

<div class="overlay" id="overlay"></div>

<script>
const btn = document.getElementById("btnHamb");
const sidebar = document.getElementById("sidebar");
const overlay = document.getElementById("overlay");

btn.addEventListener("click", () => {
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
