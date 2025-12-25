<?php
include "config.php";

// Ambil ID anak dari URL
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($id <= 0) {
    header("Location: dataanak.php");
    exit;
}

// Ambil data anak
$qAnak = mysqli_query($conn, "SELECT * FROM anak WHERE id_anak = $id");
$anak = mysqli_fetch_assoc($qAnak);

if (!$anak) {
    echo "<p>Data anak tidak ditemukan.</p>";
    exit;
}
?>
<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Detail Anak</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <style><?php include "style_dashboard_base.css"; ?></style>
</head>
<body>
<div class="app">

  <?php include "sidebar.php"; ?>

  <div class="main">
    <div class="topbar">
      <?php include "topbar.php"; ?>
    </div>

    <h2 style="color:#1976D2">👧 Detail <?= htmlspecialchars($anak['nama_anak']) ?></h2>

    <!-- Informasi Anak -->
    <div class="card">
      <p><strong>Nama:</strong> <?= htmlspecialchars($anak['nama_anak']) ?></p>
      <p><strong>Jenis Kelamin:</strong> <?= $anak['jenis_kelamin'] === 'L' ? 'Laki-laki' : 'Perempuan' ?></p>
      <p><strong>Usia:</strong> <?= htmlspecialchars($anak['usia']) ?> th</p>
      <p><strong>Kelas:</strong> <?= htmlspecialchars($anak['kelas']) ?></p>
    </div>

    <!-- Nilai Perkembangan -->
    <div class="card" style="margin-top:16px;">
      <h3>Nilai Perkembangan</h3>
      <?php
      $qNilai = mysqli_query($conn, "
        SELECT 
          ap.nama_aspek,
          np.nilai,
          np.tgl_input,
          g.nama_guru
        FROM nilai_perkembangan np
        LEFT JOIN aspek_perkembangan ap ON ap.id_aspek = np.id_aspek
        LEFT JOIN guru g ON g.id_guru = np.id_guru
        WHERE np.id_anak = $id
        ORDER BY np.tgl_input DESC, ap.id_aspek ASC
      ");

      if (mysqli_num_rows($qNilai) == 0) {
          echo "<p class='muted'>Belum ada penilaian perkembangan.</p>";
      } else {
          echo "<table style='width:100%; border-collapse:collapse;'>";
          echo "<tr>\n            <th style='text-align:left'>Aspek</th>\n            <th>Nilai</th>\n            <th>Tanggal</th>\n            <th>Guru</th>\n          </tr>";

          while ($r = mysqli_fetch_assoc($qNilai)) {
              echo "<tr>";
              echo "<td style='padding:8px 0'>" . htmlspecialchars($r['nama_aspek'] ?? '-') . "</td>";
              echo "<td style='text-align:center'>" . htmlspecialchars($r['nilai']) . "</td>";
              echo "<td style='text-align:center'>" . htmlspecialchars($r['tgl_input']) . "</td>";
              echo "<td style='text-align:center'>" . htmlspecialchars($r['nama_guru'] ?? '-') . "</td>";
              echo "</tr>";
          }
          echo "</table>";
      }
      ?>
    </div>

  </div>
</div>

<?php include "overlay_js.php"; ?>
</body>
</html>