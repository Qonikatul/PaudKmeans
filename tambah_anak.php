<?php
include "config.php";
if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $nama = mysqli_real_escape_string($conn, $_POST['nama_anak']);
    $jk = $_POST['jenis_kelamin'];
    $usia = (int)$_POST['usia'];
    $kelas = mysqli_real_escape_string($conn, $_POST['kelas']);
    mysqli_query($conn, "INSERT INTO anak (nama_anak, jenis_kelamin, usia, kelas) VALUES('$nama','$jk',$usia,'$kelas')");
    header("Location: dataanak.php");
    exit;
}
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Tambah Anak</title>
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
  <h2 style="color:#1976D2">➕ Tambah Anak</h2>
  <div class="card">
    <form method="POST">
      <label>Nama Anak</label><br>
      <input type="text" name="nama_anak" required style="width:100%;padding:10px;margin:8px 0;border-radius:8px;border:1px solid #e2e8f0">
      <div style="display:flex; gap:10px;">
        <div style="flex:1;">
          <label>Jenis Kelamin</label><br>
          <select name="jenis_kelamin" required style="width:100%;padding:10px;margin-top:8px;border-radius:8px;">
            <option value="L">Laki-laki</option>
            <option value="P">Perempuan</option>
          </select>
        </div>
        <div style="width:120px;">
          <label>Usia (th)</label><br>
          <input type="number" name="usia" min="1" max="10" required style="width:100%;padding:10px;margin-top:8px;border-radius:8px;">
        </div>
        <div style="width:120px;">
          <label>Kelas</label><br>
          <input type="text" name="kelas" placeholder="K1" required style="width:100%;padding:10px;margin-top:8px;border-radius:8px;">
        </div>
      </div>
      <div style="margin-top:12px;">
        <button type="submit" class="btn" style="background:#1976D2;color:#fff;padding:10px 16px;border-radius:10px;border:0;font-weight:700">Simpan</button>
        <a href="dataanak.php" style="margin-left:10px;text-decoration:none;color:#1976D2;font-weight:600">Batal</a>
      </div>
    </form>
  </div>
</main>
<?php include "overlay_js.php"; ?>
</body>
</html>
