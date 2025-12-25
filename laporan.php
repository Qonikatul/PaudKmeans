<?php
include "config.php";

// Filter kelas (opsional)
$kelas_filter = isset($_GET['kelas']) ? $_GET['kelas'] : '';

// Ambil daftar kelas untuk filter
$kelas_list = mysqli_query($conn, "SELECT DISTINCT kelas FROM anak ORDER BY kelas ASC");

// Ambil semua aspek
$aspek_list = mysqli_query($conn, "SELECT * FROM aspek_perkembangan ORDER BY id_aspek ASC");
$aspek_array = [];
while($ap = mysqli_fetch_assoc($aspek_list)){
    $aspek_array[$ap['id_aspek']] = $ap['nama_aspek'];
}

// Ambil data anak sesuai filter
$query = "SELECT * FROM anak " . ($kelas_filter ? "WHERE kelas='$kelas_filter'" : "") . " ORDER BY nama_anak ASC";
$anak_list = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Laporan Nilai Anak & Klaster</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<style>
<?php include "style_dashboard_base.css"; ?>

.table-box{
    background:white;
    padding:22px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
    overflow-x:auto;
}
table{
    width:100%;
    border-collapse:collapse;
}
table th, table td{
    border:1px solid #d1d5db;
    padding:8px 12px;
    text-align:center;
}
table th{
    background:#1976D2;
    color:white;
}
.filter-box{
    margin-bottom:20px;
    padding:12px;
    background:#f0f4ff;
    border-radius:10px;
}
.btn{
    padding:6px 12px;
    background:#1976D2;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}
.cluster-1{background:#FFDDC1;}
.cluster-2{background:#C1FFD7;}
.cluster-3{background:#C1D4FF;}
.cluster-4{background:#FFF1C1;}
/* Dropdown export */
#exportDropdown a:hover{background:#e0e0e0;}
</style>
</head>
<body>
<?php include "sidebar.php"; ?>
<div class="main">
<?php include "topbar.php"; ?>

<h2 style="color:#1976D2;">📋 Laporan Nilai Perkembangan Anak & Klaster</h2>

<div class="filter-box">
<form method="GET" style="display:inline-block; margin-right:10px;">
    <label>Pilih Kelas:</label>
    <select name="kelas">
        <option value="">-- Semua Kelas --</option>
        <?php while($k = mysqli_fetch_assoc($kelas_list)): ?>
            <option value="<?= $k['kelas'] ?>" <?= $kelas_filter==$k['kelas']?'selected':'' ?>><?= $k['kelas'] ?></option>
        <?php endwhile; ?>
    </select>
    <button class="btn">Filter</button>
</form>

<!-- Export Dropdown -->
<div style="display:inline-block; position:relative;">
    <button class="btn" id="exportBtn">📥 Export</button>
    <div id="exportDropdown" style="display:none; position:absolute; background:#fff; border:1px solid #d1d5db; border-radius:6px; top:36px; left:0; z-index:10;">
        <a href="export_laporan.php?format=excel&kelas=<?= $kelas_filter ?>" target="_blank" style="display:block; padding:8px;">Excel</a>
    </div>
</div>
</div>

<script>
document.getElementById('exportBtn').addEventListener('click', function(){
    var dropdown = document.getElementById('exportDropdown');
    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
});
document.addEventListener('click', function(e){
    if(!document.getElementById('exportBtn').contains(e.target) &&
       !document.getElementById('exportDropdown').contains(e.target)){
        document.getElementById('exportDropdown').style.display = 'none';
    }
});
</script>

<div class="table-box">
<table>
    <tr>
        <th>No</th>
        <th>Nama Anak</th>
        <th>Kelas</th>
        <?php foreach($aspek_array as $aspek_name): ?>
            <th><?= $aspek_name ?></th>
        <?php endforeach; ?>
        <th>Klaster</th>
    </tr>
    <?php
    $no = 1;
    while($a = mysqli_fetch_assoc($anak_list)):
    ?>
    <tr>
        <td><?= $no++ ?></td>
        <td><?= $a['nama_anak'] ?></td>
        <td><?= $a['kelas'] ?></td>
        <?php
        // Nilai tiap aspek
        foreach($aspek_array as $id_aspek => $nama_aspek){
            $res_nilai = mysqli_query($conn, "SELECT nilai FROM nilai_perkembangan WHERE id_anak=".$a['id_anak']." AND id_aspek=$id_aspek");
            $n = mysqli_fetch_assoc($res_nilai);
            echo "<td>".($n['nilai'] ?? "-")."</td>";
        }

        // Klaster dari kmeans_hasil
        $res_klaster = mysqli_query($conn, "SELECT cluster FROM kmeans_hasil WHERE id_anak=".$a['id_anak']);
        if($res_klaster && mysqli_num_rows($res_klaster) > 0){
            $kl = mysqli_fetch_assoc($res_klaster);
            $klaster = $kl['cluster'];
        } else {
            $klaster = '-';
        }
        $class = is_numeric($klaster) ? "cluster-$klaster" : "";
        echo "<td class='$class'>$klaster</td>";
        ?>
    </tr>
    <?php endwhile; ?>
</table>
</div>

</div>
<?php include "overlay_js.php"; ?>
</body>
</html>
